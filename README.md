# Lab 5.1.5 — Tracing a Route

A GitHub-ready workflow for completing the Cisco lab **Lab - Tracing a Route**.

## Objectives

1. Verify network connectivity with `ping`.
2. Trace a route to a remote server with Linux `traceroute`.
3. Trace a route using a web-based traceroute tool.
4. Review responding hops and compare command-line and web-based results.

> **Important:** This repository is a workflow/template, not proof that the lab has been performed. Run the commands in your own CyberOps Workstation VM, save your actual output, capture your own screenshots, and complete the report from your observations. Network paths and results vary by location and ISP.

## Lab requirements

- CyberOps Workstation VM with internet access.
- VM login from the lab document: `analyst` / `cyberops`.
- A web browser.
- Git and Git Bash on Windows for publishing this folder to GitHub.

## Repository structure

```text
tracing-a-route-github-workflow/
├── README.md
├── .gitignore
├── commands/
│   ├── run-tracing-lab.sh
│   └── manual-commands.md
├── results/
│   ├── README.md
│   ├── ping-cisco.txt
│   ├── traceroute-cisco.txt
│   ├── traceroute-rir.txt
│   └── web-traceroute-notes.md
├── report/
│   └── lab-report-template.md
└── screenshots/
    ├── README.md
    └── .gitkeep
```

## Part 1 — Verify connectivity with ping

Inside the **CyberOps Workstation VM**, open a terminal and run:

```bash
ping -c 4 www.cisco.com
```

Save your real output in `results/ping-cisco.txt`. The script in `commands/` can save this output automatically.

Record whether replies were received, packet loss, and the reported round-trip times. Your values will likely differ from the examples in the Cisco PDF.

## Part 2 — Trace routes from Linux

In the VM terminal, run:

```bash
traceroute www.cisco.com
traceroute www.afrinic.net
```

The lab asks you to save a trace to Cisco and to one Regional Internet Registry (RIR). The supplied script traces Cisco and AFRINIC (Africa). If `traceroute` is missing, try installing it only if you have permission and your VM's package manager/network allows it. On a Debian/Ubuntu-based system, for example:

```bash
sudo apt update
sudo apt install traceroute
```

On some distributions, the package manager differs. If hops show `* * *`, it may mean a router does not reply to probes; it does not automatically mean the whole route has failed.

### Run the supplied script

Copy this repository into a directory accessible from the Linux VM, or copy `commands/run-tracing-lab.sh` into the VM. From that directory:

```bash
chmod +x commands/run-tracing-lab.sh
./commands/run-tracing-lab.sh
```

The script creates/updates output files in `results/`. It does not fabricate missing results. If `traceroute` is unavailable, the script records an explanatory message. Run the script in the **Linux VM**, not plain Windows Git Bash, because the required Linux `traceroute` utility may not be installed in Git Bash.

If your VM cannot reach the internet or the trace produces no useful results, check the VM network adapter. The source lab suggests using **Machine > Settings > Network > Adapter 1 > Attached to: Bridged Adapter** if appropriate for your setup.

## Part 3 — Web-based traceroute

1. Open the browser in the VM.
2. Visit https://gsuite.tools/traceroute
3. Enter `www.cisco.com` and select **Trace**.
4. Review the responding hops and any geographic information displayed.
5. Save a screenshot of the actual results in `screenshots/`, for example `web-traceroute-cisco.png`.
6. Record what you observed in `results/web-traceroute-notes.md`.

The website and its interface/results may change. Do not create a screenshot from sample data; use your own result. If Firefox reports `SEC_ERROR_OCSP_FUTURE_RESPONSE`, the source lab notes that the VM clock may be incorrect. Check the VM date/time and follow your lab/instructor's approved time-correction procedure.

## Screenshots checklist

Save screenshots that show your own work, such as:

- `screenshots/01-ping-cisco.png` — ping command and results.
- `screenshots/02-traceroute-cisco.png` — Linux traceroute to Cisco.
- `screenshots/03-traceroute-afrinic.png` — Linux traceroute to AFRINIC.
- `screenshots/04-web-traceroute-cisco.png` — web-based trace and responding hops.
- `screenshots/05-report-reflections.png` — optional completed answers/report.

Do not include passwords, private keys, access tokens, or unrelated personal information in screenshots. If your instructor requires a different screenshot naming convention, use that convention.

## Complete the report

Open `report/lab-report-template.md` and replace every prompt with your actual findings. Do not copy the sample output in the lab PDF as if it were your own. Include any limitations, such as non-responding hops or the web tool not showing all routers.

## Publish to GitHub using Git Bash (Windows)

### 1. Extract the ZIP

Extract this ZIP to a convenient location, for example:

`C:\\Users\\YOUR_USERNAME\\Documents\\tracing-a-route-github-workflow`

### 2. Open Git Bash in the extracted folder

In File Explorer, open the folder, right-click in an empty area, and choose **Open Git Bash here** (wording can vary).

### 3. Initialize and commit the project

Run these commands one at a time:

```bash
git init
git add .
git status
git commit -m "Add tracing a route lab workflow"
```

If Git asks you to set your identity, use your own GitHub identity:

```bash
git config --global user.name "YOUR_GITHUB_NAME"
git config --global user.email "YOUR_GITHUB_EMAIL"
```

Then repeat the commit command. Use the email associated with your GitHub account if you want GitHub to attribute the commit to you.

### 4. Create a GitHub repository

On GitHub, create a **new empty repository** named `Tracing-a-Route` (or another name you prefer). For the simplest setup, do not initialize it with a README, license, or `.gitignore`, because this folder already contains those files.

### 5. Connect and push

Replace `YOUR_GITHUB_USERNAME` with your actual GitHub username and use the exact repository URL shown by GitHub:

```bash
git branch -M main
git remote add origin https://github.com/YOUR_GITHUB_USERNAME/Tracing-a-Route.git
git remote -v
git push -u origin main
```

If your repository has a different name, update the URL accordingly. GitHub may open a browser or ask you to authenticate. Never put your password or access token directly in a script or repository.

### If `origin` already exists

Check it before changing anything:

```bash
git remote -v
```

If it points to the wrong repository, update it to your own repository URL:

```bash
git remote set-url origin https://github.com/YOUR_GITHUB_USERNAME/Tracing-a-Route.git
git remote -v
git push -u origin main
```

Use `git remote add origin ...` only if no `origin` remote exists.

### After making changes

After adding real outputs, screenshots, or report answers:

```bash
git add .
git status
git commit -m "Add traceroute results and lab screenshots"
git push
```

## Troubleshooting

- **`traceroute: command not found`:** Run the trace inside the CyberOps Linux VM and check whether the utility is installed.
- **Ping fails:** Check internet connectivity, DNS, and VM network settings. Some destinations may block ICMP.
- **Some hops time out:** Routers may not respond to traceroute probes; document what happened.
- **Git says `remote origin already exists`:** Use `git remote -v` and `git remote set-url origin ...` if the URL is wrong.
- **Git push is rejected:** Check that the remote URL is your repository and that the remote repository was created empty. If it contains commits, inspect the situation before deciding how to integrate them.
- **Screenshots folder is empty:** Git does not track empty folders. The included `.gitkeep` keeps the folder in the repository; replace/add it alongside your actual screenshots.

## Source

Based on the uploaded Cisco NetAcad PDF, **Lab - Tracing a Route**. Follow the instructions given by your instructor if they differ from this template.

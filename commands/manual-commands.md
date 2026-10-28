# Manual commands

Run these commands in the **CyberOps Workstation Linux VM terminal**.

## Part 1: Ping

```bash
ping -c 4 www.cisco.com
```

To save the output directly into the repository's `results` directory, run this from the repository root inside the VM:

```bash
ping -c 4 www.cisco.com 2>&1 | tee results/ping-cisco.txt
```

## Part 2: Linux traceroute

```bash
traceroute www.cisco.com
traceroute www.afrinic.net
```

Save output:

```bash
traceroute www.cisco.com 2>&1 | tee results/traceroute-cisco.txt
traceroute www.afrinic.net 2>&1 | tee results/traceroute-rir.txt
```

## Part 3: Web traceroute

Open https://gsuite.tools/traceroute in the VM browser, enter `www.cisco.com`, run the trace, capture a screenshot, and record observations in `results/web-traceroute-notes.md`.

## If `traceroute` is not installed

Check your Linux distribution and use its approved package manager. Example for Debian/Ubuntu-based systems:

```bash
sudo apt update
sudo apt install traceroute
```

Use the permissions and package manager appropriate to your VM.

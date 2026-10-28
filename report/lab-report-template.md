# Lab Report — Tracing a Route

**Student name:** [Enter your name]  
**Course/academy:** [Enter course or academy]  
**Date performed:** [Enter date]  
**Repository:** [Paste your GitHub repository URL]

## Objective

- Verify network connectivity using `ping`.
- Trace a route to a remote server using Linux `traceroute`.
- Use a web-based traceroute tool and compare observations.

## Environment

- Workstation/VM:
- Operating system:
- Network connection:
- Destination(s) tested:

## Part 1 — Verify connectivity using ping

**Command used**

```bash
ping -c 4 www.cisco.com
```

**Results and observations**

[Paste or summarize your actual result. Record transmitted/received packets, packet loss, and round-trip time if shown.]

**Conclusion**

[State whether the destination responded and what the output indicates.]

## Part 2 — Trace routes using Linux traceroute

**Command(s) used**

```bash
traceroute www.cisco.com
traceroute www.afrinic.net
```

**Cisco trace observations**

[Record the destination IP/name if shown, responding hops, and any timeouts.]

**RIR trace observations**

[Record the responding hops and any timeouts.]

**What does a hop represent?**

[Explain in your own words using the lab material.]

## Part 3 — Web-based traceroute

**Tool:** https://gsuite.tools/traceroute  
**Destination tested:**  
**Screenshot filename:**  

**Geographical-path question**

Review the geographical locations of the responding hops. What did you observe regarding the path?

[Answer using your actual web trace. Do not assume every hop has a location.]

## Reflection question

**How is traceroute different when going to `www.cisco.com` or other websites from the terminal rather than from the online website?**

[Compare the terminal output with the browser tool's output based on what you observed. Consider the source of the trace, how results are displayed, hop visibility, and geographic visualization only if these were shown by your results.]

## Challenges and troubleshooting

[Record any issues, such as unavailable commands, blocked probes, DNS problems, network adapter changes, or non-responding hops, and how you handled them.]

## Conclusion

[Summarize what you learned about connectivity, routes, hops, and the difference between the two tools.]

## Evidence checklist

- [ ] Ping output saved in `results/ping-cisco.txt`
- [ ] Cisco traceroute saved in `results/traceroute-cisco.txt`
- [ ] RIR traceroute saved in `results/traceroute-rir.txt`
- [ ] Web traceroute notes completed
- [ ] Actual screenshots added to `screenshots/`
- [ ] Report completed with my own observations
- [ ] Repository pushed to GitHub

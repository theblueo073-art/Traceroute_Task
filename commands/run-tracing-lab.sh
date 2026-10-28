#!/usr/bin/env bash
# Run this script in the CyberOps Workstation Linux VM, from the repository root.
# It saves actual command output; it does not create or invent results.

set -u

RESULTS_DIR="results"
mkdir -p "$RESULTS_DIR"

run_and_save() {
    local label="$1"
    local outfile="$2"
    shift 2

    echo
    echo "============================================================"
    echo "$label"
    echo "Command: $*"
    echo "Output file: $outfile"
    echo "============================================================"

    if command -v "$1" >/dev/null 2>&1; then
        "$@" 2>&1 | tee "$outfile"
        local status=${PIPESTATUS[0]}
        if [ "$status" -ne 0 ]; then
            echo "Command exited with status $status. Review the output above." | tee -a "$outfile"
        fi
    else
        echo "Required command '$1' was not found on this system." | tee "$outfile"
        echo "Run this workflow in the CyberOps Linux VM and install/check the utility if permitted." | tee -a "$outfile"
    fi
}

run_and_save "Part 1 — Ping www.cisco.com" "$RESULTS_DIR/ping-cisco.txt" ping -c 4 www.cisco.com
run_and_save "Part 2 — Traceroute to www.cisco.com" "$RESULTS_DIR/traceroute-cisco.txt" traceroute www.cisco.com
run_and_save "Part 2 — Traceroute to AFRINIC (Africa RIR)" "$RESULTS_DIR/traceroute-rir.txt" traceroute www.afrinic.net

cat <<'EOF'

Finished. Review the files in results/ and add your own screenshots.
Next: complete report/lab-report-template.md and results/web-traceroute-notes.md.
The web-based traceroute must be performed manually in a browser.
EOF

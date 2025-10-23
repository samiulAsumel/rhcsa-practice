#!/bin/bash

# Script: system-info-collector.sh
# Purpose: Collect system information for documentation
# Author: samiulAsumel

echo "Generated On: $(date)"

echo "================================"
echo "=== System Information Report ==="
echo "================================"
echo ""

echo "=== Operating System ==="
cat /etc/os-release | grep -E '^NAME|^VERSION|^ID|^VERSION_ID|^PRETTY_NAME'
echo ""

echo "=== Kernel Name ==="
echo "Kernel Version: $(uname -r)"
echo "Architecture: $(uname -m)"
echo ""

echo "=== Hostname ==="
echo "Hostname: $(hostname)"
echo "FQDN: $(hostname -f 2>/dev/null || echo 'Not Configured')"
echo ""

echo "=== CPU Information ==="
echo "CPU Model: $(lscpu | grep 'Model name' | cut -d: -f2 | xargs)"
echo "CPU Cores: $(nproc)"
echo ""

echo "=== Memory Information ==="
free -h | grep Mem | awk '{print "Total: " $2 " Used: " $3 " Free: " $4}'
echo ""

echo "=== Disk Usage ==="
df -h | grep -E '^/dev/' | awk '{print " " $1 " " $5 " used"}'
echo ""

echo "=== Network Information ==="
ip -4 addr show | grep inet  | grep -v 127.0.0.1 | awk '{print " " $2}'
echo ""

echo "=== End of Report ==="
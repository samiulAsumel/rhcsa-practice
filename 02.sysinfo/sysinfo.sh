#!/bin/bash
# System Information Report Script
# Purpose: Quick health check for RHCSA exam

echo "===== SYSTEM INFORMATION REPORT ====="
echo ""

echo "1. Hostname:"
hostname
echo ""

echo "2. Operating System:"
cat /etc/redhat-release
echo ""

echo "3. Current User:"
whoami
echo ""

echo "4. Current Date/Time:"
date "+%Y-%m-%d %H:%M:%S"
echo ""

echo "5. System Uptime:"
uptime -p
echo ""

echo "6. Logged In Users:"
who
echo ""

echo "7. Disk Usage:"
df -h / | tail -n 1
echo ""

echo "8. Memory Usage:"
free -h | grep Mem
echo ""

echo "===== END OF REPORT ====="
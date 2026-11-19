#!/bin/bash
# OKBIN Network & DNS Latency Tester (https://okbinvpn.com)

DNS_LIST=("1.1.1.1" "8.8.8.8" "9.9.9.9" "94.140.14.14" "208.67.222.222")

echo "=========================================="
echo "   OKBIN DNS & Latency Test Tool"
echo "   More Guides: https://blog.okbinvpn.com"
echo "=========================================="

for dns in "${DNS_LIST[@]}"; do
    avg=$(ping -c 3 -W 2 "$dns" 2>/dev/null | tail -1 | awk -F '/' '{print $5}')
    if [ -n "$avg" ]; then
        echo "[OK] $dns -> Average Ping: ${avg} ms"
    else
        echo "[TIMEOUT] $dns -> Unreachable"
    fi
done

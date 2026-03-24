#!/usr/bin/env bash

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

if [[ "$#" -ne 3 ]]; then
        echo "Error: ip address or port numbers cannot be empty!"
        echo "Usage: $0  <IP_ADDRESS> <START_PORT> <END_PORT>"
        exit 1
fi

ip_address=$1
start_port=$2
end_port=$3

scan_port() {
    local ip=$1
    local port=$2
    timeout 1 bash -c "echo > /dev/tcp/$ip/$port" 2>/dev/null
}

echo -e "${YELLOW}Scanning $ip_address ports${NC}"

# C like syntax lol - https://www.geeksforgeeks.org/linux-unix/bash-scripting-for-loop/
for (( port=$start_port; port<=$end_port; port++ ));
do
        if scan_port "$ip_address" "$port"; then
                echo -e "${GREEN}Port $port is OPEN${NC}"
        fi
done

echo -e "${YELLOW}Scan complete!${NC}"

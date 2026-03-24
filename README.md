# port_scanner
### Mini port scanner in bash.
The script's main objective is to check if ports from a given IP address are open.

### Features

Script follows these steps
1. Checking if variables are properly used.
2. Creating function `scan_port` with `timeout 1 bash -c "echo > /dev/tcp/$host/$port" 2>/dev/null`, which avoid dependence on external tools.
3. Scanning from start port to end port with `scan_port` function and displaying which ports are open.

### Usage:
1. Clone the repository: `git clone` <repo-url>
2. Make the script executable: `chmod +x port_scanner.sh`
3. Run the script: `./port_scanner` <target_ip_address> <starting_port> <end_port>

To make the script available system-wide, move it to your local binary directory, e.g.:
e.g. `mv port_scanner.sh /usr/local/bin/portscanner`

### Requirements
- Linux OS
- Bash

## Future development
- Save scan results to a text file.

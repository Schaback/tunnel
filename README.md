# Tunnel
Simple bash script to redirect traffic comming in on an IPv4 TCP Port to an IPv6 TCP Port
## Usage
### Requirements
* socat
### Running
Run `sudo ./tunnel.sh <params>`:
```
Maps IPv4 TCP ports to IPv6 TCP ports
Usage: 
	./tunnel.sh <ipv6_addr> <src_port> <dst_port> [[<src_port> <dst_port>] ...]
	
Example:
	./tunnel.sh [3fff:ffff::] 1234 1234
	./tunnel.sh dyndns.example.com 1234 5678 9994 9994
```

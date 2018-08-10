#!/bin/bash

usage="Maps IPv4 TCP ports to IPv6 TCP ports
Usage: 
	$(basename "$0") <ipv6_addr> <src_port> <dst_port> [[<src_port> <dst_port>] ...]
	
Example:
	$(basename "$0") [3fff:ffff::] 1234 1234
	$(basename "$0") dyndns.example.com 1234 5678 9994 9994"

if [[ $# -lt 3 ]] || [[ $(($# % 2)) -eq 0 ]]; then
	echo "$usage" >&2
	exit 1
fi

addr="$1"
shift

# Kill subprocesses on exit
trap "exit" INT TERM
trap "kill 0" EXIT

while [[ $# -gt 0 ]]; do
    for x in $1 $2; do
        case $x in
            ''|*[!0-9]*)
	       echo "$usage" >&2
	       exit 1 
	    ;;
            *)
	    ;;
        esac
    done
    socat -d -d -d -d TCP4-LISTEN:$1,fork TCP6:$addr:$2 &
    shift
    shift
done
# Wait for subprocesses to exit
wait

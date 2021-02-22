#!/bin/bash

PROC="$(pgrep openvpn)"

if [ "$1" == "shutdown" ]; then
    if [ -n "$PROC" ]; 
        then sudo kill -9 "$PROC" 
    fi
    echo "Process with OpenVPN killed"
else
   sudo echo "SUDO mode entered"
   if [ -z "$PROC" ]; then 
       sudo openvpn ./umouse.ovpn &>/dev/null &
   else
       echo "VPN for umouse already started."
   fi
fi

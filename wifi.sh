#!/bin/bash
# Find current network location
# works for Mac

trim() {
    trimmed=${1:$2:$3}
    #if [[ ${#1} -gt $3 ]]; then
    #  trimmed="$trimmed."
    #fi
}

loc=$(networksetup -getcurrentlocation)
trim $loc 0 1
loc=$trimmed
/Sy*/L*/Priv*/Apple8*/V*/C*/R*/airport -I | grep -q SSID
# check if wifi is off
if [[ $? -eq 0 ]]; then
    on_wifi=0
else
    on_wifi=1
fi

if [[ $on_wifi -eq 0 ]]; then
    # it's on. find ssid and return first 2 characters
    ssid=$(/Sy*/L*/Priv*/Apple8*/V*/C*/R*/airport -I | grep SSID | grep -v BSSID | awk '{print $2}')    
    if [[ ${#ssid} -gt 0 ]]; then
        trim $ssid 0 2
	    nw_name=$trimmed
    else
        nw_name="??"
    fi
else
    # No signal symbol
    nw_name="\\u2717"
fi

echo "$loc @ $nw_name"

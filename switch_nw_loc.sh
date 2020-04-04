#!/bin/bash
# switches network locations Home <-> Automatic

current=$(networksetup -getcurrentlocation)
if [[ $current == "Home" ]]; then
    networksetup -switchtolocation Automatic
else
    networksetup -switchtolocation Home
fi


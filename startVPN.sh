#!/usr/bin/expect -f
#!/bin/bash

# This script Launches a ProtonVPN instance on a Linux-based machine.
#
# Usage:
# ./startVPN.sh [server_config]
#
# To get a list of all available server_config:
# ./startVPN.sh ls
#
# Written by Maxime WATTEZ
# based on the official documentation of the protonvpn website
#
# Last update: 2020-11-25
#
# Required dependencies:
# - expect: sudo apt install expect
# - openvpn: sudo apt install openvpn
# - network-manager-openvpn-gnome:
#     sudo apt install network-manager-openvpn-gnome
# - resolvconf: sudo apt install resolvconf
#
# Full documentation can be found at:
#     https://protonvpn.com/support/linux-vpn-setup/
#
# ============================================================================


PATH_TO_CONFIG='/home/nootaku/VPN/protonVPN.config' 

# Verify if .config file exists:
if [ -f $PATH_TO_CONFIG ]; then
	. $PATH_TO_CONFIG
	USERNAME="$username"
	PASSWORD="$password"
else
	echo "Could not find .config file at given path."
	echo "Would you like to create one [1] or browse for existing .config file [2] ?"
	USERNAME="foo"
	PASSWORD="bar"
fi


if [ $1 -eq "ls" ]; then
	echo "LS input"
else
	# Launch OpenVPN with user-input OVPN config file:
	sudo openvpn $1
	expect "Enter Auth Username: "
	send $USERNAME
	expect "Enter Auth Password: "
	send $PASSWORD
fi


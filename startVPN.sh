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


PATH_TO_AUTH='/etc/openvpn/auth.txt'

# Verify if .config file exists:
if [ -f $PATH_TO_AUTH ]; then
	echo "Credentials found in 'auth.txt'"
else
	echo "Could not find .config file at given path."
	read -p "Would you like to create one [1] or browse for existing .config file [2] ? => " credentials
	if [ $credentials -eq 1 ]; then
		read -p "Username: " USERNAME
		read -sp "Password: " PASSWORD
		sudo echo $USERNAME >> $PATH_TO_AUTH
		sudo echo $PASSWORD >> $PATH_TO_AUTH
        cat $PATH_TO_AUTH
	else
		echo "Option still to be done"
	fi
fi


if [ $1 -eq "ls" ]; then
	echo "LS input"
else
	# Launch OpenVPN with user-input OVPN config file.
	sudo openvpn --config $1 --auth-user-pass $PATH_TO_AUTH
fi


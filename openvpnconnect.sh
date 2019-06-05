#!/bin/bash
read -p "US(1), NL(2), JP(3), JP(4)" whichserver

#Echo username but in a secure way
#echo password but in a secure way

case $whichserver in
	1)
		openvpn Downloads/us-free-01.protonvpn.com.udp.ovpn
		;;
	2)
		openvpn Downloads/nl-free-02.protonvpn.com.udp.ovpn
		;;
	3)
		openvpn Downloads/jp-free-01.protonvpn.com.udp.ovpn
		;;
	4)	
		openvpn Downloads/jp-free-03.protonvpn.com.udp.ovpn
		;;
esac

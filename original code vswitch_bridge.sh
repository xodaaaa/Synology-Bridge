#!/bin/bash

	DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
	STATUS="$(ovs-vsctl show | grep ovs_eth1)"
	if [ "$STATUS" != "" ]
	then
		echo "Trying to enable bridging"
		ovs-vsctl del-br ovs_eth1
		ovs-vsctl add-port ovs_eth0 eth1
		#rm $DIR/Latest-bridge-date.txt
		date > $DIR/Latest-bridge-date.txt
		for i in {1..5}
		do
			sleep 20
			STATUS="$(ovs-vsctl show | grep ovs_eth1)"
			if [ "$STATUS" != "" ]
			then
				echo "Run " $i+1 " times" >> $DIR/Latest-bridge-date.txt
				ovs-vsctl del-br ovs_eth1
				ovs-vsctl add-port ovs_eth0 eth1
			else
				exit 1
			fi
		done
		STATUS="$(ovs-vsctl show | grep ovs_eth1)"
		if [ "$STATUS" != "" ]
			then
				echo "Failed to bridge ports. Please check your settings." >> $DIR/Latest-bridge-date.txt				exit -1
		fi
	else
		echo "$STATUS"
		echo "Nothing to do. Exiting..."
	fi

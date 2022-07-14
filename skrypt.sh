#!/bin/bash


IP_ADDR=`/sbin/ifconfig eth0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}'`

echo "Twoj publiczny adres ip to: "
curl http://169.254.169.254/latest/meta-data/public-ipv4 
echo ""
rails s -b $IP_ADDR -p 8082
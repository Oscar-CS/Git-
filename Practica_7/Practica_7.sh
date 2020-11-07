#!/bin/bash

local_ip="192.168.0.4"  #<- IP asignada publicamente
 
echo $local_ip | base64 > local_IP.txt

nmap -v $local_ip | base64 > Scan_local_IP.txt

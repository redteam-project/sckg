#!/bin/bash

yum -y install ntp

echo "restrict -4 default kod nomodify notrap nopeer noquery" > /etc/ntp.conf
echo "restrict -6 default kod nomodify notrap nopeer noquery" >> /etc/ntp.conf
echo "restrict -4 something else" >> /etc/ntp.conf

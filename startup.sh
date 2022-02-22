#!/usr/bin/bash

set -m

/usr/sbin/squid -N &

/usr/sbin/dnsmasq --no-daemon --server 168.63.129.16

fg %1

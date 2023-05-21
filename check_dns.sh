#!/usr/bin/env bash
#######################################
# Author on GitHub: MoBlockbuster     #
# Contact: mmarzouki@protonmail.com   #
#######################################
# Example: ./check_dns.sh www.example.de

host $1 || { echo "Domain $1 not found!" && exit 2 ;}

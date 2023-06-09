#!/usr/bin/env bash
#######################################
# Author on GitHub: MoBlockbuster     #
# Contact: mmarzouki@protonmail.com   #
#######################################
# Check the systemuptime. WARNING -w $DAYS - CRITICAL -c $DAYS
# Example: ./check_uptime -w 30 -c 45

while getopts :w:c: options
do
  case $options in
       w) WARN=${OPTARG};;
       c) CRIT=${OPTARG};;
       :) echo "YOU HAVE TO USE -w DAYS and -c DAYS" && exit 1;;
       *) echo "Parameter unknown. Use only -w DAYS and -c DAYS" && exit 1;;
  esac
done

NOW=$(date +%Y-%m-%d)
SYSUP=$(uptime -s | awk -F " " '{ print $1 }')

CALC=$(echo "$(($(date -d "${NOW}" '+%s') - $(date -d "${SYSUP}" '+%s')))")
RESULT=$((${CALC}/3600/24))

if [ ${RESULT} -lt ${WARN} ]
then
  echo "SYSTEM UPTIME IS OK = ${RESULT}"
  exit 0
elif [ ${RESULT} -ge ${WARN} ] && [ ${RESULT} -lt ${CRIT} ]
then
  echo "SYSTEM UPTIME WARNING = ${RESULT}"
  exit 1
elif [ ${RESULT} -ge ${CRIT} ]
then
  echo "SYSTEM UPTIME CRITICAL = ${RESULT}"
  exit 2
else
  echo "SYSTEM UPTIME UNKOWN"
  exit 3
fi


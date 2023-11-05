#!/usr/bin/env bash
#######################################
# Author on GitHub: MoBlockbuster     #
# Contact: mmarzouki@protonmail.com   #
#######################################
# Check the stringcount in a file. WARNING -w - CRITICAL -c 
# Example: ./check_file-stringcount.sh -w 10 -c 20

while getopts :f:s:w:c: options
do
  case $options in
       f) FILE=${OPTARG};;
       s) STRING=${OPTARG};;
       w) WARN=${OPTARG};;
       c) CRIT=${OPTARG};;
       :) echo "YOU HAVE TO USE -f FILE -s STRING -w WARNING and -c CRITICAL" && exit 1;;
       *) echo "Parameter unknown. YOU HAVE TO USE -f FILE -s STRING -w WARNING and -c CRITICAL" && exit 1;;
  esac
done

STRINGCOUNT=$(cat ${FILE} | grep ${STRING} | wc -l)

if [ ${STRINGCOUNT} -lt ${WARN} ]
then
  echo "STRINGCOUNT IS OK = ${STRINGCOUNT}"
  exit 0
elif [ ${STRINGCOUNT} -ge ${WARN} ] && [ ${STRINGCOUNT} -lt ${CRIT} ]
then
  echo "STRINGCOUNT IS IN WARNING = ${STRINGCOUNT}"
  exit 1
elif [ ${STRINGCOUNT} -ge ${CRIT} ]
then
  echo "STRINGCOUNT IS IN CRITICAL = ${STRINGCOUNT}"
  exit 2
else
  echo "STRINGCOUNT IS IN UNKOWN"
  exit 3
fi


#!/usr/bin/env bash
#######################################
# Author on GitHub: MoBlockbuster     #
# Contact: mmarzouki@protonmail.com   #
#######################################
# Check if a file (backupfile) exists and check the timestamp if it is younger then -m $MINUTES.
# Example: ./check_file-timestamp.sh -d $PATH_DIRECTORY_FILE -m $MINUTES

while getopts :f:d:m:v options
do
  case $options in
       d) DIR=${OPTARG};;
       m) MINUTES=${OPTARG};;
       w) WARN=${OPTARG};;
       c) CRIT=${OPTARG};;
       v) VERBOSE="ON";;
       :) echo "YOU HAVE TO USE -d DIRECTORY -m MINUTES. Parameter -v for verbose" && exit 1;;
       *) echo "Parameter unknown. YOU HAVE TO USE -d DIRECTORY -m MINUTES. Parameter -v for verbose" && exit 1;;
  esac
done

FILES=$(find $DIR -mmin -$MINUTES)

if [ ! -z "$FILES" ]
then
  echo "$FILES"
  exit 0
elif [ -z "$FILES" ]
then
  echo "No files found!"
  exit 2
fi

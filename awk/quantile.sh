#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: quantile.sh <File> <Col Num>"
  exit -1
fi

FILE=$1
COL=$2

if [ ! -f $FILE ]; then
  echo "$FILE not exist!"
  exit -1
fi

awk -v COL=$COL -f col.awk $FILE |\
  sort -n |\
  awk -f stats.awk

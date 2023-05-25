#!/bin/bash

if [ $# -ne 4 ]; then
  echo "Usage: quantile_cols.sh <File> <Col Start> <Col End> <Output File>"
  exit -1
fi


FILE=$1
START=$2
END=$3
OUT_FILE=$4

if [ ! -f $FILE ]; then
  echo "$FILE not exist!"
  exit -1
fi

cat /dev/null > $OUT_FILE

for i in $(seq $START $END); do
  echo Processing $i
  awk -v COL=$i -f col.awk $FILE |\
    sort -n |\
    awk -f stats.awk |\
    tail -n 1 >> $OUT_FILE
done

#!/bin/bash

if [ $# -ne 4 ]; then
  echo "Usage: quantile_cols.sh <File.csv> <Col Start> <Col End> <Output File.csv>"
  echo "      Note: column start from 1"
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

echo "index,len,sum,avg,min,Q1,Q2,Q3,max" >> $OUT_FILE

for i in $(seq $START $END); do
  awk -v COL=$i -f col.awk $FILE |\
    sort -n |\
    awk -f stats.awk |\
    tail -n 1 |\
    awk 'BEGIN{OFS=","}{print '$i-1',$1,$2,$3,$4,$5,$6,$7,$8;}' >> $OUT_FILE
done

echo "complete"

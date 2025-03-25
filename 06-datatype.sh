#!/bin/bash
NUMBER1=$1
NUMBER2=$2
timestamp=$(date)
echo "this script is executed at $timestamp"
SUM=$(($NUMBER1+$NUMBER2))
echo "the sum of $NUMBER1 and $NUMBER2 is : $SUM"
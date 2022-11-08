#!/bin/bash
for (( i=1;i<=10;i++ ))
do echo $RANDOM $i
done|sort -k1 |cut -d" " -f2|head -5;


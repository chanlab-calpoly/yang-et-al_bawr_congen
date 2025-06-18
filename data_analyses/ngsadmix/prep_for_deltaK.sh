#! /bin/bash

maxk=$1
outfile=$2

rm -fr $outfile

for ((k=1; k < $maxk+1; k++))
do
	for r in {a..j}
	do
		grep ^'best' *k$k$r.log | awk -F "=" '/best like=/ {print $2}' | awk -v k=$k '{print k "\t" $1}' >> $outfile;
	done;
done;


#!/bin/bash

infile='bawr_n71_NoClade.beagle'

for ((k=1; k < 7; k++))
do
	for r in {a..j}
	do
		NGSadmix -likes $infile -minMaf 0.05 -K $k -o 'k'$k$r
	done;
done;

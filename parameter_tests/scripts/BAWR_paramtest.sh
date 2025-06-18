#! /bin/bash

popmap=../BAWR_names/BAWR_paramtest_names.txt
reads_dir=../BAWR_clone_filtered

for ((M=0; M < 5; M++))
do
	for ((littlem=3; littlem < 6; littlem++))
	do 
		n=1;
		mkdir BAWR_stacks.m$littlem'M'$M'n'$n;
		out_dir=BAWR_stacks.m$littlem'M'$M'n'$n;
		log_file=$out_dir/BAWR_denovo_map.m$littlem'M'$M'n'$n.oe;
		denovo_map.pl --samples $reads_dir --popmap $popmap -o $out_dir \
			-M $M -n $n -m $littlem -T 20 --paired --rm-pcr-duplicates &> $log_file;
		
		nn=2;
		mkdir BAWR_stacks.m$littlem'M'$M'n'$nn;
		out_dir=BAWR_stacks.m$littlem'M'$M'n'$nn;
		log_file=$out_dir/BAWR_denovo_map.m$littlem'M'$M'n'$nn.oe;
		denovo_map.pl --samples $reads_dir --popmap $popmap -o $out_dir \
			-M $M -n $nn -m $littlem -T 20 --paired --rm-pcr-duplicates &> $log_file;
 	done;
done;

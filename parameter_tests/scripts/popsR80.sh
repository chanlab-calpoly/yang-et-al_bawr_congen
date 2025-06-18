# Run from parameter test folder
species=BAWR
dir_for_logs=$species'_logs_across_pops'
mkdir -p $dir_for_logs
ptestnames=BAWR_paramtest_names.txt

for ((M=0; M < 5; M++))
do
	for ((littlem=3; littlem < 6; littlem++))
	do 
		n=1;
		stacks_dir=$species'_stacks.m'$littlem'M'$M'n'$n;
		out_dir=$species'_stacks.m'$littlem'M'$M'n'$n'/populations.R80';
		log_file=$out_dir'/populations.oe';
		mkdir -p $out_dir;
		populations -P $stacks_dir -M $ptestnames -O $out_dir -R 0.80 &> $log_file;

		# Copy logs to a central place for analysis
		cp $out_dir/'populations.log.distribs' $dir_for_logs'/m'$littlem'M'$M'n'$n'_populations.log.distribs';

		nn=2;
		stacks_dir=BAWR_stacks.m$littlem'M'$M'n'$nn;
		out_dir=$species'_stacks.m'$littlem'M'$M'n'$nn'/populations.R80';
		log_file=$out_dir'/populations.oe';
		mkdir -p $out_dir;
		populations -P $stacks_dir -M $ptestnames -O $out_dir -R 0.80 &> $log_file;

		# Copy logs to a central place for analysis
		cp $out_dir/'populations.log.distribs' $dir_for_logs'/m'$littlem'M'$M'n'$nn'_populations.log.distribs';

	done;
done;

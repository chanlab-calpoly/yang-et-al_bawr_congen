# Shell commands to convert vcf to beagle and beagle.gz.Z

perl vcf2Beagle.pl --in ../vcffiles/bawr_n71_NoClade.snps.recode.vcf \
    --out bawr_n71_NoClade.beagle
    
gzip bawr_n71_NoClade.beagle

mv bawr_n71_noclade.beagle.gz bawr_n71_noclade.beagle.gz.Z 	
## Run populations to calculate summary statistics

mkdir BAWR_populations_n71_regions
populations -V ../../vcffiles/n71_mac3L80_maxhet50.snps.vcf \
    -M ../popmaps/BAWR_popmap_n71_regions.tsv --smooth-popstats -O BAWR_populations_n71_regions/

mkdir BAWR_populations_n71_pops
populations -V ../../vcffiles/n71_mac3L80_maxhet50.snps.vcf \
    -M ../popmaps/BAWR_popmap_n71.txt --smooth-popstats -O BAWR_populations_n71_pops

# Commandlines to subset final vcf file.

vcftools --vcf ../../vcffiles/n71_mac3L80_maxhet50.snps.vcf \
    --keep ./subset_Northern.txt \
    --recode --recode-INFO-all --out ../../vcffiles/bawr_northern

vcftools --vcf ../../vcffiles/n71_mac3L80_maxhet50.snps.vcf \
    --keep ./subset_pdx_colr.txt \
    --recode --recode-INFO-all --out ../../vcffiles/bawr_pdxcolr
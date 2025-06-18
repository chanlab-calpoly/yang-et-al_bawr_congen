# NGSadmix

## Convert vcf to beagle
Example with northern clade

```
perl ../vcf2Beagle.pl --in bawr_n71_NoClade.snps.recode.vcf \
    --out bawr_n71_NoClade.beagle
```

## Run replicates of NGSadmix
`sh ngsadmix_n71north.sh`


## Prep for deltaK (example for maxK=7)
`sh prep_for_deltaK.sh 7 delta_n71north.txt`

## Plot deltaK in R
source("Delta.R")
likeli <- read.delim("delta_n71north.txt", sep="\t", header=F)
Delta_K(likeli)

## Plot assignment plots
source("plot_ngsadmix_BAWR.R") and use the `assignment_plot()` function.

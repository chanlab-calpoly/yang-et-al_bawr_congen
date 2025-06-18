library(snpR)
dat <- import.snpR.data("bawr_n63_mac3L90.snps.vcf", 
                        sample.meta = "BAWR_popmap_n63nested.tsv")
dat <- calc_pairwise_fst(dat, facets="site", boot=1000, boot_par=4, method="wc")
x <- get.snpR.stats(dat, "site", stats="fst")
write.csv(file="bawr_n63_pwFst.csv", x$fst.matrix$site$fst, quote=F)
write.csv(file="bawr_n63_pwPval.csv", x$fst.matrix$site$p, quote=F)

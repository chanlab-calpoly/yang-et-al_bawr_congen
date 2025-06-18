# Plot log values from NGSadmixture
# Lauren, Aug 4, 2024
## Example Usage:
## assignment_plot("n63_all", "../../_file_conversions/popmaps_whitelists/BAWR_popmap_n63.csv", k=2, r=4)
#
# Assumes labeling of admixture output files as k4a.qopt where 4 is the k and 
# the replicate is a letter (a..j in the case of 1-10)

library(ggplot2)
library(tidyverse)


assignment_plot <- function(infolder, popsmap, k, r){
  r <- ifelse (is.numeric(r), letters[r], r)
  infile <- paste(infolder,"/k", k, r, ".qopt", sep="")
  probs <- read.table(infile, header=F)
  names(probs) <- paste0("k",seq(1,k,1))
  
  indpops <- read.table(popsmap, header=T)
  names(indpops) <- c("sample", "population")
  poporder <- c("Powell", "JohnsonCreek", "Bearcreek",
              "Gabbert", "Dowsett", "Fishpond", "Palopa",
              "Oxbow", "TT", "BridalVeil",
              "Wildcat","Salmon", "Marmot", "Wildwood",
              "KeelOver", "TC")  
  
  df <- cbind(indpops, probs)
  df$population <- factor(df$population, levels = poporder)
  df$sample <- factor(df$sample, levels = df$sample[order(df$population)])
  
  
  dflong <- pivot_longer(df, cols=3:length(df),
                         names_to = "k",
                         values_to = "probability")
  
  g <- ggplot(dflong) + geom_bar(aes(x=sample, y=probability, fill=k),
                            stat="identity") +
    theme(axis.text.x = element_text(angle=90, vjust=1, hjust=1))
  print(g)
}

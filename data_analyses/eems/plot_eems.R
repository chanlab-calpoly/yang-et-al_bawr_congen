## Visualize BAWR EEMS with raster and points

library(reemsplots2)
library(ggplot2)
library(sp)
library(terra)

popcoords <- read.csv("BAWR_67_pop_coords.csv", header=F)
coordsonly <- c(popcoords[,3], popcoords[,2])
names(coordsonly) <- c("long", "lat")
labels <- popcoords[,1]

reps <- c("output/north_r1/", 
             "output/north_r2/", 
             "output/north_r3/", 
             "output/north_r4")
as_data_frame <- function(x, ...) {
    tibble::as_tibble(x, ...)
}

myplots <- make_eems_plots(mcmcpath = reps,
                           longlat = TRUE,
                           add_grid = TRUE,
                           add_demes = TRUE)

plotpath <- "output/n71"
ggsave(paste0(plotpath, "-mrates01.pdf"), myplots$mrates01, dpi = 250,
       width = 6, height = 4)
ggsave(paste0(plotpath, "-mrates02.pdf"), myplots$mrates02, dpi = 250,
       width = 6, height = 4)
ggsave(paste0(plotpath, "-qrates01.pdf"), myplots$qrates01, dpi = 250,
       width = 6, height = 4)
ggsave(paste0(plotpath, "-qrates02.pdf"), myplots$qrates02, dpi = 250,
       width = 6, height = 4)
ggsave(paste0(plotpath, "-rdist01.pdf"), myplots$rdist01,
       width = 6.5, height = 6)
ggsave(paste0(plotpath, "-rdist02.pdf"), myplots$rdist02,
       width = 6.5, height = 6)
ggsave(paste0(plotpath, "-rdist03.pdf"), myplots$rdist03,
       width = 6.5, height = 6)
ggsave(paste0(plotpath, "-pilogl01.pdf"), myplots$pilogl01,
       width = 7, height = 5)

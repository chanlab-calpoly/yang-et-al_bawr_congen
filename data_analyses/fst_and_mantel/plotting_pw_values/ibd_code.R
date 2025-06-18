library(ggplot2)
library(readxl)

# General code remade as function
plot_mantel <- function(infile, prefix){
    df <- read_excel(infile)
    
    linreg <- lm(fsttrans ~ ln_dist, df)
    
    ibdplot <- ggplot(df) +
       geom_abline(slope = linreg$coefficients[2], intercept = linreg$coefficients[1], 
                  linewidth = 1, color = "black") +
      geom_point(aes(x = ln_dist, y = fsttrans, fill = group), shape=21, size=3) +
      labs(x = "ln(geographic distance(km))", y = "Fst/(1-Fst)") +
      theme(text = element_text(size=12),
            panel.grid.major = element_blank(), 
            panel.grid.minor = element_blank(),
            panel.background = element_blank(), 
            axis.line = element_line(colour = "black")) +
      scale_fill_manual(values = c("white","gray", "black"))
    
    pdf(ibdplot, file=paste(prefix, "_mantel.pdf", sep=""), width=6, height=4)
	print(ibdplot)
    graphics.off()
}

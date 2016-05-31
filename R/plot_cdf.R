#' plotCDF Function to create CDFs of chla and microcystin
#' 
#' This functions produces CDF plots for the Hollister et al. microcystin - chla paper 
#' 
#' @param df a data frame with all parameters to plot
#' @export
#' @import ggplot2

plot_cdf <- function(df, ...) {
    options(scipen = 5)  #tell r not to use scientific notation on axis labels
    df<-df[complete.cases(df),]
    cdf_df<-reshape2::melt(df)
    x <- ggplot(cdf_df,aes(value,colour=variable)) +
          stat_ecdf(size=2)+scale_color_manual(values=viridis(ncol(df)))+
      theme_bw()+
      theme(text = element_text(family="sans"),
            axis.title.x = element_text(family="sans",vjust = -0.5, size = 14),
            axis.title.y = element_text(family="sans",vjust = 1.5, size = 14),
            axis.text.x = element_text(family="sans",size = 12),
            axis.text.y = element_text(family="sans",size = 12)) + 
      labs(...)
    return(x)        
} 

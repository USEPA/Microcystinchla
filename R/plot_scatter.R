#' Scatterplot for microcystin-chla paper
#' 
#' Produces a scatterplot via ggplot
#' 
#' @export
#' @import ggplot2

plot_scatter<-function(df,xvar,yvar,pt_col=1,...){
  options(scipen=5)
  xdf<-data.frame(xvar=df[[xvar]],yvar=df[[yvar]])
  xdf<-xdf[complete.cases(xdf),]
  x <- ggplot(xdf,aes(xvar,yvar))+
    geom_point(size=3,colour=pt_col) +
    theme_bw()+
    theme(text = element_text(family="sans"),
          axis.title.x = element_text(family="sans",vjust = -0.5, size = 14),
          axis.title.y = element_text(family="sans",vjust = 1.5, size = 14),
          axis.text.x = element_text(family="sans",size = 12),
          axis.text.y = element_text(family="sans",size = 12)) + 
    labs(...)
    
  return(x)
}
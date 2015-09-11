#'get_nla
#'
#'Create plot of conditional probability object showing association between microcystin-LR
#'advisory levels and chlorophyll \it{a} 
#'
#' @param cp A conditional probability object from condprob2
#' @param ...  arguments for labels
#' 
#' @import ggplot2 viridis
#' @export
plot_cp<-function(cp, ...){
  df<-data.frame(x=cp$X,prob=cp$Bootstrap.Probability,low=cp$Lower.CI,up=cp$Upper.CI)
  ggp<-ggplot(df,aes(x=x,y=prob))+
    geom_point(size=3)+
    geom_ribbon(aes(ymin = low,ymax = up),alpha = 0.4)+
    theme_bw()+
    theme(text = element_text(family="sans"),
          axis.title.x = element_text(family="sans",vjust = -0.5, size = 14),
          axis.title.y = element_text(family="sans",vjust = 1.5, size = 14),
          axis.text.x = element_text(family="sans",size = 12),
          axis.text.y = element_text(family="sans",size = 12)) + 
    labs(...)
  return(ggp)
}
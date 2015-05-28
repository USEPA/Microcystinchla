#' Function to plot condprob object
#'
#' This function plots a condprob object and creates a plot similar to Figure 1
#' in Hollister et al. (2008). This includes a simple scatter plot of the raw 
#' stressor vs the raw response, a cumulative distribution function for all of the 
#' data, the impaired sites, and the unimpaired sites, and a conditional probability 
#' plot with the conditional probability on the y-axis the stressor on the x-axis.  
#' 
#' @param condprobObj An object of class condprob is required.  Data and parameters
#'                    from this object are used to create the plot
#' @param min_samp minimum sample size to plot probabilities for. Defaults to 10.
#' @param ... Used primarily to pass other ggplot2 plotting options to control title, 
#'            axis labels, colors, size, etc.
#' 
#' @import ggplot2
#' 
#' @references Hollister, J. W., J. F. Paul, and H. A. Walker (2008). CProb: 
#'             A Computational Tool for Conducting Conditional Probability 
#'             Analysis. Journal of Environmental Quality. 37(6):2392-2396.
#'             \href{http://dx.doi.org/10.2134/jeq2007.0536}{Link}
#' @export
#' @examples
#' cp_plot(adult_ha)
cp_plot <- function(condprobObj, min_samp = 10, ...) {
    dat<-data.frame(condprobObj[1:5])
    dat<-dat[1:(nrow(dat)-min_samp),]
    cplot <- ggplot(dat,aes(x=X, y=Bootstrap.Probability)) +
      geom_point() + 
      geom_line(aes(x=X,y=Lower.CI))+
      geom_line(aes(x=X,y=Upper.CI))
    return(cplot)
} 

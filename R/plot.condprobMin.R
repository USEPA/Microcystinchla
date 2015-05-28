#' Function to plot condprobMin object
#'
#' This function plots minimum sample size vs average value of an input vector, which is
#' usually the y-value in a \code{condprob2::condprob} analysis.
#' The mean values are plotted vs sample size and the mean, upper limit and lower limit of
#' the bootstrapped original values are shown
#' 
#' @param cpMin a condprobMin object
#' @param alpha the alpha level for determining confidence intervals.  Default
#'        is 0.05.
#'        
#' @method plot condprobMin
#' @export
plot.condprobMin <- function(cpMin, alpha = 0.05) {
    with(cpMin[[1]], plot(avgMean, n))
    abline(v = mean(cpMin[[2]]), col = "green")
    abline(v = quantile(cpMin[[2]], 1 - alpha/2), col = "red")
    abline(v = quantile(cpMin[[2]], alpha/2), col = "red")
    
} 

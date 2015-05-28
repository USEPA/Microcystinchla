#' Estimate min sample size for calculating probability
#' 
#' This function takes a brute force approach to estimating the minimum sample
#' size for calculating a probability given a binary vector of data.  This is used
#' to set the upper bounds on a conditional probability analysis.  In this 
#' function the original vector is sampled with replacement at the full sample size.  
#' This is repeated R times and mean value is recorded for each iteration. Then starting 
#' with the minimum sample size, the original dataset is sampled and the mean for the smaller
#' sample is recorded.  The sample size is increased and process repeated.  The average of the 
#' mean values for each sample size is recorded.  This is an experimental function.  No 
#' promises on its utility.  
#' 
#' 
#' 
#' @return an list of class condprobMin is returned with two items.  A data frame containg
#'          the sample size and the associated average mean value and a vector contain the
#'          bootstrapped original mean values.
#'
#' @param x a vector of values to find minimum sample size for.  The values
#'        should be 1 and 0.
#' @param R the number of bootstrap iterations. Defaults to 100.
#' @param n the minimum sample size to start testing from.  Defaults to length of x.
#' 
#' @export
#' @examples
#' bivec<-rbinom(100,1,0.5)
#' plot(condprobMin(bivec))
#' data(binCutoff)
#' minSampDF<-condprobMin(binCutoff,R=10)
#' plot(minSampDF)

condprobMin <- function(x, R = 100, n = length(x)) {
    xdf <- data.frame()
    orig <- vector("numeric", length = R)
    for (i in 1:R) {
        xo <- sample(x, length(x), TRUE)
        orig[i] <- mean(xo)
    }
    for (i in 1:n) {
        samp <- data.frame()
        for (j in 1:R) {
            xs <- sample(x, i, TRUE)
            samp <- rbind(samp, data.frame(i, mean(xs)))
        }
        xdf <- rbind(xdf, data.frame(n = mean(samp[, 1]), avgMean = mean(samp[, 2], na.rm = T)))
        if (i%%100 == 0) {
            print(paste(i, "out of", n, "completed."))
        }
    }
    xdf <- list(sampMeans = xdf, origMeans = orig)
    class(xdf) <- "condprobMin"
    return(xdf)
} 

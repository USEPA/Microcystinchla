## ----setup, include=FALSE, echo=FALSE------------------------------------
#Put whatever you normally put in a setup chunk.
#I usually at least include:
library("knitr")
opts_chunk$set(dev = 'pdf', fig.width=6, fig.height=5)

# Table Captions from @DeanK on http://stackoverflow.com/questions/15258233/using-table-caption-on-r-markdown-file-using-knitr-to-use-in-pandoc-to-convert-t
#Figure captions are handled by LaTeX

knit_hooks$set(tab.cap = function(before, options, envir) {
                  if(!before) { 
                    paste('\n\n:', options$tab.cap, sep='') 
                  }
                })
default_output_hook = knit_hooks$get("output")
knit_hooks$set(output = function(x, options) {
  if (is.null(options$tab.cap) == FALSE) {
    x
  } else
    default_output_hook(x,options)
})

## ----analysis , include=FALSE, echo=FALSE, cache=FALSE-------------------
#All analysis in here, that way all bits of the paper have access to the final objects
#Place tables and figures and numerical results where they need to go.
################################################################################
#Load packages
################################################################################
devtools::install_github("jhollist/microcystinchla",
                         auth_token = getOption("Github_Access"))
library("microcystinchla")
library("dplyr")
library("magrittr")



################################################################################
# Data Prep
################################################################################
data_url<-"http://water.epa.gov/type/lakes/assessmonitor/lakessurvey/upload/NLA2007_Recreational_ConditionEstimates_20091123.csv"
nla_dat <- get_nla(data_url)
nla_dat <- mutate(nla_dat,log_chla = log(CHLA),log_micro = log(MCYST_TL_UGL))
################################################################################
# Condtional Probability
################################################################################
adult_ha_cp <- condprob(xX = nla_dat$log_chla,xY = nla_dat$log_micro, 
                     xImpair = log(1.5999), ProbComp = "gt", Exceed = "gte",
                     ci = TRUE, R = 100)

child_ha_cp <- condprob(xX = nla_dat$log_chla,xY = nla_dat$log_micro, 
                     xImpair = log(0.2999), ProbComp = "gt", Exceed = "gte",
                     ci = TRUE, R = 100)


## ----adult_healt_cprob,echo=FALSE----------------------------------------
cp_plot(adult_ha_cp)

## ----child_healt_cprob,echo=FALSE----------------------------------------
cp_plot(child_ha_cp)


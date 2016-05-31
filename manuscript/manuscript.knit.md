---
title: Associations between chlorophyll *a* and various microcystin health advisory
  Concentrations
author:
- affilnum: 1
  email: hollister.jeff@epa.gov
  name: Jeffrey W. Hollister
- affilnum: 1
  name: Betty J. Kreakie
affiliation:
- affil: US Environmental Protection Agency, Office of Research and Development, National
    Health and Environmental Effects Research Laboratory, Atlantic Ecology Division,
    27 Tarzwell Drive  Narragansett, RI, 02882, USA
  affilnum: 1
output:
  pdf_document:
    fig_caption: yes
    keep_tex: yes
    number_sections: yes
    template: components/manuscript.latex
  html_document: null
capsize: normalsize
csl: components/plos.csl
documentclass: article
fontsize: 11pt
linenumbers: yes
bibliography: components/manuscript.bib
spacing: doublespacing
abstract: no
---

<!--marion2012vivo
%\VignetteEngine{knitr::rmarkdown}
%\VignetteIndexEntry{Microsystin Chlorophyll Manusript}
-->






\singlespace

\vspace{2mm}\hrule

<!-- Abstract is being wrapped in latex here so that all analysis can be run in the chunk above and the results reproducibly referenced in the abstract. -->
Cyanobacteria harmful algal blooms (cHABs) are associated with a wide range of adverse health effects that stem mostly from the presence of cyanotoxins.  To help protect against these impacts, several health advisory levels have been set for some toxins.  In particular, one of the more common toxins, microcystin, has several advisory levels set for drinking water and recreational use.  However, compared to other water quality measures, field measurements of microcystin are not commonly available due to cost and advanced understanding required to interpret results.  Addressing these issues will take time and resources.  Thus, there is utility in finding indicators of microcystin that are already widely available, can be estimated quickly and *in situ*, and used as a first defense against high levels of microcystin.  Chlorophyll *a* is commonly measured, can be estimated *in situ*, and has been shown to be positively associated with microcystin.  In this paper, we use this association to provide estimates of chlorophyll *a* concentrations that are indicative of a higher probability of exceeding select health advisory concentrations for microcystin.  Using the 2007 National Lakes Assessment and a conditional probability approach, we identify chlorophyll *a* concentrations that are more likely than not to be associated with an exceedance of a microcystin health advisory level.  We look at the recent US EPA health advisories for drinking water as well as the World Health Organization levels for drinking water and recreational use and identify a range of chlorophyll *a* thresholds.  A 50% chance of exceeding one of the specific advisory microcystin concentrations of 0.3, 1, 1.6, and 2 $\mu$g/L is associatied with chlorophyll *a* concentration thresholds of 23, 64, 84, and 103, respectively.  When managing for these various microcystin levels, exceeding these reported chlorophyll *a* concentrations should be a trigger for further testing and possible management action.   

\vspace{3mm}\hrule
\doublespace

#Introduction

Over the last decade, numerous events and legislative activities have raised the public awareness of harmful algal blooms [@jetoo2015toledo; @rinta2009lake; @HABHRCA2014].  In response the US Environmental Protection Agency (USEPA) has recently released suggested microcystin (one of the more common toxins) concentrations that would trigger health advisories [@mcelhiney2005detection; @zurawell2005hepatotoxic; @usepa2015drinking].  Additionally, the World Health Organization (WHO) has proposed microcystin advisory levels for drinking water and a range of recreational risk levels [@world2003cyanobacterial; @chorus1999toxic].   While these levels and associated advisories are likely to help mitigate the impacts from harmful algal blooms, they are not without complications.  

One of these complications is that they rely on available measurements of microcystin.  While laboratory testing (e.g., chromatography) remains the gold standard for quantifying microcystin concentrations in water samples, several field test kits have been developed.  Even though field tests provide a much needed means for rapid assessment, they are not yet widely used and are moderately expensive (approximately $150-$200 depending on specific kit) with a limited shelf life (typically one year) [@james2011environmental; @aranda2015evaluation].  Additionally, each technique requires nuanced understanding of the detection method (e.g., limit of detection, specific microcystin variants being measured, and sampling protocol).  

Fortunately, cyanobacteria and microcystin-LR has been shown to be associated with several other, more commonly measured and well understood components of water quality that are readily assessed in the field [e.g. @yuan2015deriving].  For instance, there are small or hand held fluorometers that measure chlorohpyll *a*.  Additionally, chlorophyll *a* is a very commonly measured component of water quality that is also known to be positively associated with microsystin-LR concentrations [@pip2014microcystin; @yuan2014managing].  Recently, Yuan et. al [-@yuan2014managing] explored these associations in detail and controlled for other related variables.  In their analysis they find that total nitrogen and chlorophyll *a* show the strongest association with microcystin. Furthermore, they identify chlorophyll*a* and total nitrogen concentrations that are associated with exceeding 1 $\mu$g/L of microcystin.   These findings suggest that chlorophyll a concentrations could also track the new USEPA microcystin health advisory levels for drinking water.  Identifying this association would provide an important tool for water resource managers to help manage the threat to public health posed by cHABs and would be especially useful in the absence of measured microcystin concentrations.  

In this paper we build on past efforts and utilize the National Lakes Assessment (NLA) data and identify chlorophyll *a* concentrations that are associated with higher probabilities of exceeding several microcystin health advisory concentrations [@usepa2009national; @usepa2015drinking; @chorus1999toxic].  We build on past studies by exploring associations with the newly announced advisory levels and by also applying a different method, conditional probability analysis.  Utilizing different methods strengthens the evidence for suggested chlorophyll *a* levels that are associated with increased risk of exceeding the health advisory levels as those levels are not predicated on a single analytical method.  So that others may repeat or adjust this analysis, the data, code, and this manuscript are freely available via [https://github.com/USEPA/microcystinchla](https://github.com/USAPE/microcystinchla).

#Methods

##Data
We used the 2007 NLA chlorophyll *a* and microcystin-LR concentration data [@usepa2009national, [NLA](http://www2.epa.gov/national-aquatic-resource-surveys/national-lakes-assessment)]. These data represent a snapshot of water quality from the summer of 2007 for the conterminous United States and were collected as part of an ongoing probabilistic monitoring program [@usepa2009national]. Water quality data, including chlorophyll *a* and microcystin-LR were obtained via an intergated sample taken from the surface of the lake down to 2 meters.  Samples were taken at the same time from the index site (e.g. near the centroid of the lake) and these provide the source for both chlorophyll *a* and microcystin-LR [@usepa2009national, @nla_fieldops].

For our analysis we only used samples that were part of the probability sampling design (i.e. no reference samples) and from the first visit to the lake (e.g. some lakes were sampled mutliple times).  The detection limit for microcysin-LR was 0.05 $\mu$g/L.  Approximately 67% of lakes reported microcystin-LR at the detection limit.  For this analysis we retained these values as removing them would erroneously reduce the confidence intervals around the conditional probabilities. Data on chlorophyll *a* and microcystin-LR concentrations are available for 1028 lakes.  

##Analytical Methods
We used a conditional probability analysis (CPA) approach to explore associations between chlorophyll *a* concentrations and World Health Organization (WHO) and USEPA microcystin health advisory levels [@paul2011probability].  Many health advisory levels have been suggested (Table \ref{tab:microcystin_levels}), but lakes with higher microcystin-LR concentrations in the NLA were rare. Only 1.16% of lakes sampled had a concentration greater than 10 $\mu$g/L.  Thus, for this analysis we focused on the microcystin concentrations that are better represented in the NLA data. These were the USEPA children's (i.e. bottle fed infants to pre-school age children) drinking water advisory level of  0.3 $\mu$g/L (USEPA Child), the WHO drinking water advisory level of 1 $\mu$g/L (WHO Drinking), the USEPA adult (i.e. beyond pre-school aged individuals) drinking water advisory level of 1.6 $\mu$g/L (USEPA Adult), and the WHO recreational, low probability of effect advisory level of 2 $\mu$g/L (WHO Recreational).

Conditional probability analysis provides information about the probability of observing one event given another event has also occured.  For this analysis, we used CPA to examine how the conditional probability of exceeding one of the health advisories changes as chlorophyll *a* increases in a lake.  We expect to find higher chlorohpyll *a* concentrations to be associated with higher probabilities of exceeding the microcystin health advisory levels.  We also calculated bootstrapped 95% confidence intervals (CI) using 1000 bootstrapped samples.  Thus, to identify chlorophyll *a* concentrations of concern we identified the value of the upper 95% CI across a range of conditional probabilities of exceeding each health advisory level.  Using the upper confidence limit to identify a threshold is justified as it ensures that a given threshold is unlikely to miss a microcystin exceedance.

As both microcystin-LR and chlorophyll *a* values were highly right skewed, a log base 10 transformation was used.  Additional details of the specific implementation are available at https://github.com/USEPA/microcystinchla.  A more detailed discussion of CPA is beyond the scope of this paper, but see Paul et al. [-@paul2005development] and Hollister et al. [-@hollister2008cprob] for greater detail.  Lastly, all analyses were conducted using R version 3.2.2 and code and data from this analysis are freely available as an R package at [https://github.com/USEPA/microcystinchla](https://github.com/USAPE/microcystinchla).  

Lastly, we assessed the ability of these chlorophyll *a* thresholds to predict microcystin exceedance. We used error matrices and calculate total accuracy as well as the proportion of false negatives.  Total accuracy is the total number of correct predictions divided by total observations.  The proportion of false negatives is the total number of lakes that were predicted to not exceed the microcystin guidelines but actually did, divided by the total number of observations. 

#Results
In the 2007 NLA, microcystin-LR concentrations ranged from 0.05 to 225 $\mu$g/L. Microcystin-LR concentrations of 0.05 $\mu$g/L represent the detection limits.  Any value greater than that indicates the presence of microcystin-LR.  Of those lakes with microcystin, the median concentration was 0.51$\mu$g/L and the mean was 3.17$\mu$g/L.  Of all lakes sampled, 21% of lakes exceeded the USEPA Child level, 8.8% of lakes exceeded the USEPA Adult level, 11.7% of lakes exceeded the WHO Drinking level, and 7.3% of lakes exceeded the WHO Recreational level.  Chlorophyll *a*, ranged from 0.07 to 936 $\mu$g/L and this captures the range of trrophic states from oligotrophic to hypereutrophic.  All lakes had detectable levels of chlorophyll *a*.  The median concentration was 7.79 $\mu$g/L and the mean was 29.63 $\mu$g/L.  The association between chlorophyll *a* and the upper confidence interval across a range of conditional probability values are shown in Table \ref{tab:mc_chla_table}.  Specific chlorophyll *a* that are associated with greater than even odds of exceeding the advisory levels were 0.07, 0.07, 3, and 11$\mu$g/L for 0.3, 1.0, 1.6, and 2.0 $\mu$g/L advisory levels, respectively (Table \ref{tab:mc_chla_table} & Figure \ref{fig:multi_cp_plot}).   

The chlorophyll *a* cutoffs may be used to predict whether or not a lake exceeds the microcystin health advisories.  Doing so allows us to compare the accuracy of the prediction as well as evaluate false negatives.  Total accuracy of the four cutoffs predicting microcystin exceedances were 12% for the USEPA children's drinking water advisory, 20% for the WHO drinking water advisory,  22% for the USEPA adult drinking water advisory, and 3% for the WHO regreational advisory (Tables \ref{tab:child_conmat_table}, \ref{tab:who_drink_conmat_table}, \ref{tab:adult_conmat_table}, & \ref{tab:who_rec_conmat_table}).  However, total accuracy is only one part of the prediction performace with which we are concerned.  

When using the chlorophyll *a* cutoffs as an indicator of microcystin exceedances, the error that should be avoided is predicting that no exceedance has occurred when in fact it has.  In other words, we would like to avoid Type II errors and minimize the proportion of false negatives.  For the four chlorophyll *a* cut-offs we had a proportion of false negatives of 2%, 2%, 2%, and 0% for the USEPA children's, the WHO drinking water, the USEPA adult, and the WHO recreational advisories, respectively.  In each case we missed less than 10% of the lakes that in fact exceeded the microcystin advisory.  While this method performs well with regard to the false negative percentage, it is possible that is a relic of the NLA dataset and testing with additional data would allow us to confirm this result. 

#Discussion
The log-log association between microcystin-LR and chlorophyll *a* indicates that, in general, higher concentrations of microcystin-LR almost always co-occur with higher concentrations of chlorophyll *a* yet the inverse is not true (Figure \ref{fig:chla_micro_scatter}).  Higher chlorophyll *a* is not necessarily predictive of higher microcystin-LR concentrations; however, chlorophyll *a* may be predictive of the probability of exceeding a certain threshold. 

Indeed, the probability of exceeding each of the four tested health advisory levels increased as a function of chlorophyll *a* concentration (Figure \ref{fig:multi_cp_plot}).  We used this association to identify chlorophyll *a* concentrations that were associated with a range of probabilities of exceeding a given health advisory level (Table \ref{tab:mc_chla_table}).  For the purposes of this discussion we focus on a conditional probability of 50% or greater (i.e., greater than even odds to exceed a health advisory level). The 50% conditional probability chlorophyll *a* thresholds represents 59.1%, 14.3%,
5.2%, and 93.9% of sample lakes for the USEPA Child, the WHO Drinking, the USEPA Adult, and the WHO recreational levels, respecitvely.  

There are numerous possible uses for the chlorophyll *a* and microcystin advisory cut-off values.  First, in the absence of microcystin-LR measurements, exceedence of the chlorophyll *a* concentrations could be a trigger for further actions.  Given that there is uncertainity around these chlorophyll *a* cutoffs the best case scenario would be to monitor for chlorophyll *a* and in the event of exceeding a target concentration take water samples and have those samples tested for microcystin-LR.  

A second potential use is to identify past bloom events from historical data.  As harmful algal blooms are made up of many species and have various mechanisms responsible for adverse impacts (e.g., toxins, hypoxia, odors), there is no single definition of a bloom.  For cHABs, one approach has been to utilize phycocyanin to screen for or identify bloom events [@miller2013spatiotemporal, ahn2007alternative, @marion2012vivo].  This is a useful approach, but phycocyanin is not always available, thus limiting its utility especially for examining historical data. Using our chlorophyll *a* cutoffs provides a value that is also associated with microcystin-LR and can be used to classify lakes, from past surveys, as having bloomed.  

The values we propose are national and may miss regional variation in water quality, including, chlorophyll *a* and microcystin-LR [@beaver2014land, @wagner2011landscape]. A set of regional conditional probabilities would be interesting; however, limiting the analysis to the data available per region would make interpretaion difficult.  The sample size for each of the conditional probabilities would be reduced (it ranges from 67 to 155) and the number of lakes in each region that exceed the microcystin values is also reduced.  The result is that our confidence in the conditional probabilites would be less (i.e. greatly increased confidence intervals) and the relationships less pronounced as we have fewer lakes on which to base the probabilites.  Thus, this dataset is best for making national scale recommendations. 

Two other limitations with the 2007 National Lakes Assessment data are that they represent a single sample from that lake and do not capture temporal dynamics and without subsetting the data do not provide us the ability to validate the presence of microcystin-LR.  As of this writing, the 2012 National Lakes Assessment data are not public.  When these data are released, a validation of this approach can be completed then.

Lastly, using chlorophyll *a* is not meant as a replacement for testing of microcystin-LR or other toxins.  It should be used when other, direct measurements of cyanotoxins are not available.  In those cases, which are likely to be common at least in the near future, using a more ubiquitous measurement, such as chlorophyll *a* will provide a reasonable proxy for the probability of exceeding a microcystin health advisory level and provide better protection against adverse effects in both drinking and recreational use cases. 

#Acknowledgements
We would like to thank Anne Kuhn, Bryan Milstead, John Kiddon, Joe LiVolsi, Tim Gleason, Wayne Munns, and Leslie D’Anglada for constructive reviews of this paper. Special thanks to Jason Marion, Alan Wilson, and Zofia Taranu for reviews of the submitted manuscript. This paper has not been subjected to Agency review. Therefore, it does not necessary reflect the views of the Agency. Mention of trade names or commercial products does not constitute endorsement or recommendation for use. This contribution is identified by the tracking number ORD-015143 of the Atlantic Ecology Division, Office of Research and Development, National Health and Environmental Effects Research Laboratory, US Environmental Protection Agency.


\newpage

#Figures

![Scatterplot showing association betweeen chlorophyll \textit{a} and microcystin-LR. \label{fig:chla_micro_scatter}](manuscript_files/figure-latex/chla_micro_scatter-1.pdf) 

\newpage

<!--

```
## No id variables; using all as measure variables
```

![Conditional probability plots showing association between the probability of exceeding various microcystin health advisory Levels. \label{fig:chla_micro_cdf}](manuscript_files/figure-latex/chla_micro_cdf-1.pdf) 

\newpage-->


```
## Loading required package: grid
```

![Conditional probability plots showing association between the probability of exceeding various microcystin health advisory Levels. A.) Plot for USEPA Child (0.3 $\mu$g/L). B.) Plot for WHO Drinking (1 $\mu$g/L). C.) Plot for USEPA Adult (1.6 $\mu$g/L). D.) Plot for WHO Recreational (2 $\mu$g/L). \label{fig:multi_cp_plot}](manuscript_files/figure-latex/epa_child_cp_plot-1.pdf) 

\newpage

#Tables


Source   Type                                      Concentration    
-------  ----------------------------------------  -----------------
USEPA    Child Drinking Water Advisory             0.3 $\mu$g/L     
WHO      Drinking Water                            1 $\mu$g/L       
USEPA    Adult Drinking Water Advisory             1.6 $\mu$g/L     
WHO      Recreational: Low Prob. of Effect         2-4 $\mu$g/L     
WHO      Recreational: Moderate Prob. of Effect    10-20 $\mu$g/L   
WHO      Recreational: High Prob. of Effect        20-2000 $\mu$g/L 
WHO      Recreational: Very High Prob. of Effect   >2000 $\mu$g/L   



:Various suggested microcystin health advisory concentrations. \label{tab:microcystin_levels}

\newpage


 Cond. Probability  USEPA Child (0.3 $\mu$g/L)   WHO Drink (1 $\mu$g/L)   USEPA Adult (1.6 $\mu$g/L)   WHO Recreational (2 $\mu$g/L)  
------------------  ---------------------------  -----------------------  ---------------------------  -------------------------------
               0.1  0.07                         0.07                     0.07                         1                              
               0.2  0.07                         5                        11                           15                             
               0.3  3                            18                       32                           39                             
               0.4  11                           39                       67                           78                             
               0.5  23                           64                       84                           103                            
               0.6  39                           92                       115                          167                            
               0.7  65                           116                      274                          274                            
               0.8  115                          256                      871                          871                            
               0.9  138                          318                      871                          871                            



:Chlorophyll \textit{a} concentrations that are associated with a 50% probability of exceeding a microcystin health advisory concentration. \label{tab:mc_chla_table}

\newpage


                 Not Exceed   Exceed   Row Totals
--------------  -----------  -------  -----------
Not Exceed              344       78          422
Exceed                  467      139          606
Column Totals           811      217         1028



:Confusion matrix comparing chlorophyll \textit{a} predicted exceedences (rows) versus real exceedances (columns) for the USEPA childrens drinking water advisory. \label{tab:child_conmat_table}

\newpage


                 Not Exceed   Exceed   Row Totals
--------------  -----------  -------  -----------
Not Exceed              787       98          885
Exceed                  120       23          143
Column Totals           907      121         1028



:Confusion matrix comparing chlorophyll \textit{a} predicted exceedences (rows) versus real exceedances (columns) for the WHO drinking water advisory. \label{tab:who_drink_conmat_table}

\newpage


                 Not Exceed   Exceed   Row Totals
--------------  -----------  -------  -----------
Not Exceed              897       82          979
Exceed                   40        9           49
Column Totals           937       91         1028



:Confusion matrix comparing chlorophyll \textit{a} predicted exceedences (rows) versus real exceedances (columns) for the USEPA adult drinking water advisory. \label{tab:adult_conmat_table}

\newpage


                 Not Exceed   Exceed   Row Totals
--------------  -----------  -------  -----------
Not Exceed               61        2           63
Exceed                  892       73          965
Column Totals           953       75         1028



:Confusion matrix comparing chlorophyll \textit{a} predicted exceedences (rows) versus real exceedances (columns) for the WHO recreational water advisory. \label{tab:who_rec_conmat_table}

\newpage

#References

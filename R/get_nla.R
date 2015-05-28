#'get_nla
#'
#'Get data from US EPA NLA site and process based on a few common filters
#'
#' @param data_url URL pointing to the National Lakes Assessment data
#' 
#' @import dplyr
#' @export
#' @examples
#' nla_dat <- get_nla("http://water.epa.gov/type/lakes/assessmonitor/lakessurvey/upload/NLA2007_Recreational_ConditionEstimates_20091123.csv")
get_nla<-function(data_url){
  dat <- read.csv(data_url) %>%
    filter(VISIT_NO == 1) %>%
    filter(SITE_TYPE == "PROB_Lake") %>%
    select(SITE_ID,LAT_DD,LON_DD,ST,EPA_REG,WSA_ECO3,WSA_ECO9,LAKE_ORIGIN,CHLA,
           MCYST_TL_UGL)
  return(dat)
}
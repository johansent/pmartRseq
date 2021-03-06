#' Sample filter object
#'
#' This function returns a sampleFilter object, performing all of the
#' calculations needed to filter the data based off a specified function and
#' limit
#'
#' @param omicsData An object of one of the classes "cDNAdata", "rRNAdata", or
#'   "gDNAdata"
#'
#' @param fn Specify "sum" to use the total OTU count of each sample
#'
#' @return An object of class sampleFilter (also a data.frame) that contains the
#'   sample identifier and the sum count across all OTUs.
#'
#' @author Sarah Reehl
#'
#' @examples
#'
#' @export
sample_based_filter <- function(omicsData, fn="sum"){

  ## some initial checks ##

  # check that omicsData is of appropriate class #
  if(!class(omicsData) %in% c("rRNAdata", "gDNAdata", "cDNAdata")) stop("omicsData must be of class 'rRNAdata', 'gDNAdata', or 'cDNAdata'")

  if(attr(omicsData, "data_info")$data_scale!='count'){
    warning("This function is meant for count data like 'rRNA', 'gDNA' or 'cDNA' data.")
  }

  if(!(tolower(fn) %in% c("sum"))){
    stop("fn must only be 'sum'.")
  }

  ## end initial checks ##

  edata <- omicsData$e_data
  edata_cname <- attr(omicsData,"cnames")$edata_cname

 if(fn == "sum"){
    # Total number of  OTUs per sample
    sum_Samps <- colSums(edata[, -which(colnames(edata) == edata_cname)], na.rm=TRUE)
    infrequent_OTUs <- data.frame(names(omicsData$e_data)[-which(names(omicsData$e_data) == edata_cname)], sum_Samps)
    colnames(infrequent_OTUs) <- c("Sample", "sumSamps")

  }

  class(infrequent_OTUs) <- c("sampleFilter",class(infrequent_OTUs))

  attr(infrequent_OTUs, "sample_names") <- names(omicsData$e_data)[-which(names(omicsData$e_data) == edata_cname)]
  attr(infrequent_OTUs, "group_DF") <- attr(omicsData, "group_DF")
  attr(infrequent_OTUs, "function") <- fn

  threshold <- quantile(infrequent_OTUs[,2], 0.95)
  attr(infrequent_OTUs, "threshold") <- threshold

  return(infrequent_OTUs)

}

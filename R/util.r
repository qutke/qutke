# Utils
# @param elements list
#
compose_query <- function(elements) {
  if (length(elements) == 0)
    return("")
  
  if (!all(has_name(elements)))
    stop("All components of query must be named", call. = FALSE)
  
  stopifnot(is.list(elements))
  elements <- compact(elements)
  
  encode <- function(x) {
    if (inherits(x, "AsIs")) return(x)
    enc2utf8(as.character(x))
  }
  
  names <- enc2utf8(as.character(names(elements)))
  values <- vapply(elements, encode, character(1))
  
  paste0(names, "=", values, collapse = "&")
}

#
compact <- function(x) {
  null <- vapply(x, is.null, logical(1))
  x[!null]
}

#
has_name <- function(x) {
  nms <- names(x)
  if (is.null(nms))
    return(rep(FALSE, length(x)))
  
  !is.na(nms) & nms != ""
}
# Override base system method
# @param x character 
# @export
system <- function(x){
  print("Permission denied")
}


# qtid vector to character
# @param qtid character
#
qtid2String<-function(qtid=NULL){
  if(!is.null(qtid) & is.character(qtid) & length(qtid)>1){
    qtid<-paste(qtid,sep="",collapse=",")
  }
  return(qtid)
}
# qtid character to vector
# @param qtid character
#
qtid2c<-function(qtid=NULL){
  if(!is.null(qtid) & is.character(qtid) & length(qtid)<2){
    qtid<-unlist(strsplit(qtid,','))
  }
  return(qtid)
}


#' Cast Date to Character
#' @title Cast Date to Ctring
#' @param val a date string as yyyy-MM-dd
#' @return character
#' @author Dan Zhang
#' @examples
#' as.qtDate()
#' as.qtDate('2015-10-10')
#' @export 
as.qtDate<-function(val=Sys.Date()){
  as.character(as.numeric(as.POSIXct(as.Date(val)))*1000)
}

# valid startdate and enddate both NULL or Not NULL.
validDate<-function(startdate=NULL,enddate=NULL){
  if(!is.null(startdate) & !is.null(enddate)) {
    startdate<-as.Date(startdate)
    enddate<-as.Date(enddate)
  }else if(!is.null(startdate) & is.null(enddate)){
    stop("Error: enddate is emtpy!") 
  }else if(is.null(startdate) & !is.null(enddate)){
    stop("Error: startdate is emtpy!") 
  }
  
  return(list(startdate=startdate,enddate=enddate))
}

# validate startdate and enddate, return dates
getDate2<-function(startdate=NULL,enddate=NULL,key=key){
  if(is.null(startdate) & is.null(enddate)){
    return(NULL)
  }
  
  argsDates<-validDate(startdate,enddate)
  return(getDate('tradingDay',startdate=argsDates$startdate,enddate=argsDates$enddate,key=key))
}


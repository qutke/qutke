#' Initiate the QUTKE project 
#' 
#' @docType package
#' @name qutke
NULL

# Server Address
apiurl<-'https://datas.qutke.com/api'

# Global Variables
e<-new.env()


#' Initiate the qutke project 
#' @title Initiate
#' 
#' @param key character
#' @author Dan Zhang
#' 
#' @examples
#' \dontrun{
#' init(key=key)
#' }
#' 
#' @export 
init <- function (key) {
  versionno <- packageDescription('qutke')$Version
  options(stringsAsFactors = FALSE)
  if(is.null(key)) stop("Key is not empty!")
  
  #e$TRADING<-getTradingDay(key = key)
  
  api <- paste(apiurl,'validate',sep="/")
  if(is.null(api)) stop("Key is not match!")
  
  args<-list(key=key,version=versionno,opentype='qutke')
  query<-compose_query(args)
  addr<-paste(api,query,sep="?")
  addr<-URLencode(addr)
  result <- read.table(addr,sep=",",header=TRUE,fileEncoding = "utf-8", encoding = "utf-8")
  
  print(result$message)
  
  #if(grepl('please upgrade', result$message)){
    #remove.packages("qutke")
    #print("upgrading ...")
    #install_github('qutke/qutke')
  #}
  invisible()
}


#' Get mapping table
#' @title Get mapping table
#' @param data character
#' @param qtid character
#' @param key character
#' @author Dan Zhang
#' 
#' @examples
#' \dontrun{
#' getMD(data='keyMap',qtid='000001.SZ,000001.SH',key=key)
#' getMD(data='keyMap',qtid=c('000001.SZ','000001.SH'),key=key)
#' }
#' 
#' @export 
getMD<-function(data,qtid,key){
  
  qtids<-qtid2String(qtid)
  
  if(data=='keyMap') {
    return(getKeyMap(qtid=qtids,key=key))
  }
  
  invisible()
}


#' Get Daily Quote
#' @title Get Daily Quote
#' @param data character
#' @param qtid vector
#' @param startdate Date
#' @param enddate Date
#' @param SecuMarket character
#' @param ProductCode vector
#' @param key character
#' @author Dan Zhang
#' 
#' @examples
#' \dontrun{
#' getDailyQuote(data='mktDaily',qtid=c('000001.SZ','000002.SZ'),key=key)
#' getDailyQuote(data='mktDaily',startdate='2015-10-01',enddate='2015-10-10',key=key)
#' getDailyQuote(data='mktFwdDaily',qtid=c('000001.SZ','000002.SZ'),key=key)
#' getDailyQuote(data='mktFwdDaily',startdate='2015-10-01',enddate='2015-10-10',key=key)
#' getDailyQuote(data='mktDataIndex',qtid=c('000001.SH','000002.SH'),key=key)
#' getDailyQuote(data='mktDataIndex',startdate='2015-10-01',enddate='2015-10-10',key=key)
#' getDailyQuote(data='securitiesMargin',SecuMarket=90,key=key)
#' getDailyQuote(data='securitiesMargin',startdate='2015-10-01',enddate='2015-10-10',key=key) 
#' }
#' 
#' @export 
getDailyQuote<-function(data,qtid=c(),startdate=NULL,enddate=NULL,SecuMarket=NULL,ProductCode=c(),key){
  if(is.null(qtid) & is.null(startdate) & is.null(enddate) & is.null(SecuMarket) & is.null(ProductCode)){
    stop("At least input one parameter qtid, SecuMarket, ProductCode or (startdate,enddate).")
  }
  
  dates<-getDate2(startdate,enddate,key=key)
  qtids<-qtid2c(qtid)
  productCodes<-qtid2c(qtid=ProductCode)
  
  if(data=='mktDaily') 
    return(getMktDaily(qtid=qtids,date=dates,key=key))    
  
  if(data=='mktFwdDaily') 
    return(getFwdMktDaily(qtid=qtids,date=dates,key=key))
  
  if(data=='mktDataIndex') 
    return(getMktDataIndex(qtid=qtids,date=dates,key=key))
  
  if(data=='securitiesMargin') 
    return(getSecuritiesMargin(SecuMarket=SecuMarket,date=dates,key))
  
  if(data=='thirdBoardQuote') 
    return(getThirdBoardQuote(qtid=qtids,date=dates,key=key))
  
  if(data=='fwdRet') 
    return(getFwdRet(qtid=qtids,date=dates,key=key))
  
  if(data=='fwdRet_Index') 
    return(getFwdRetIndex(qtid=qtids,date=dates,key=key))
  
  if(data=='volatility') 
    return(getVolatility(qtid=qtids,date=dates,key=key))
  
  if(data=='blockTradingIntent') 
    return(getBlockTradingIntent(qtid=qtids,date=dates,key=key))
  
  if(data=='spotTransaction') 
    return(getSpotTransaction(ProductCode=productCodes,date=dates,key=key))
  
  if(data=='interestRateIndex') 
    return(getInterestRateIndex(date=dates,key=key))
  
  if(data=='fundsPerformance') 
    return(getFundsPerformance(qtid=qtids,date=dates,key=key))
  
#   if(data=='stockNewestPerformance') 
#     return(getStockNewestPerformance(qtid=qtids,date=dates,key=key))
  
  invisible()
}


#' Get Industry data
#' @title Get Industry data
#' @param data character
#' @param qtid vector
#' @param date Date
#' @param CompanyCode character
#' @param SW1 character
#' @param SW2 character
#' @param SW3 character
#' @param key character
#' @author Dan Zhang
#' 
#' @examples
#' \dontrun{
#' getIndustry(data='industryType',date='2015-12-02',key=key)
#' getIndustry(data='industryType',date='2015-12-02',qtid=c('000001.SZ','000002.SZ'),key=key)
#' getIndustry(data='industryType',date='2015-12-02',CompanyCode=6,key=key)
#' }
#' 
#' @export 
getIndustry<-function(data,date,qtid=c(),CompanyCode=NULL,SW1=NULL,SW2=NULL,SW3=NULL,key){
  qtids<-qtid2c(qtid)  
  
  if(data=='industryType') {
    return(getIndustryType(date=date,qtid=qtid,CompanyCode=CompanyCode,sw1=SW1,sw2=SW2,sw3=SW3,key=key))
  }
  
  invisible()
}

#' Get Date date
#' @title Get Date date
#' @param data character
#' @param startdate Date
#' @param enddate Date
#' @param key character
#' @author Dan Zhang
#' 
#' @examples
#' \dontrun{
#' getDate(data='tradingDay',key=key)
#' getDate(data='tradingDay',startdate='2015-10-10',enddate='2015-12-30',key=key)
#' }
#' 
#' @export 
getDate<-function(data,startdate=NULL,enddate=NULL,key){    
  argsDates<-validDate(startdate,enddate)
  
  if(data=='tradingDay') {
    if(is.null(e$TRADING)) e$TRADING<-getTradingDay(key)
    
    if(!is.null(argsDates$startdate) & !is.null(argsDates$enddate)){
      return(e$TRADING[which(e$TRADING>=argsDates$startdate & e$TRADING<=argsDates$enddate)])
    }    
    return(e$TRADING)
  }
  
  invisible()
}

#' Get Qutke Stock data
#' @title Get Date date
#' @param qtid character
#' @param data character
#' @param startdate Date
#' @param enddate Date
#' @param key character
#' @author Dan Zhang
#' 
#' @examples
#' \dontrun{
#' getQtStock(data='stockBeta',qtid=c('000001.SZ','000002.SZ'),key=key)
#' getQtStock(data='stockBeta',startdate='2015-10-01',enddate='2015-10-10',key=key)
#' getQtStock(data='financialIndex',qtid=c('000001.SZ','000002.SZ'),key=key)
#' getQtStock(data='financialIndex',startdate='2015-10-10',enddate='2015-12-30',key=key)
#' getQtStock(data='indexWeight',qtid=c('000001.SZ','000002.SZ'),key=key)
#' getQtStock(data='indexWeight',startdate='2015-10-10',enddate='2015-10-20',key=key)
#' }
#' 
#' @export 
getQtStock<-function(data,qtid=c(),startdate=NULL,enddate=NULL,key){
  if(is.null(qtid) & is.null(startdate) & is.null(enddate)){
    stop("At least input one parameter qtid or (startdate,enddate).")
  }
  qtids<-qtid2c(qtid)
  dates<-getDate2(startdate,enddate)
  
  if(data=='stockBeta') {
    return(getStockBeta(qtid=qtid,date=dates,key=key))
  }
  
  if(data=='financialIndex') {
    return(getFinancialIndex(qtid=qtid,date=dates,key=key))
  }
  
  if(data=='indexWeight') {
    return(getIndexWeight(qtid=qtid,date=dates,key=key))
  }

  invisible()
}

#' Get Company Info
#' @title Get Company Info
#' @param data character
#' @param CompanyCode character
#' @param date character
#' @param key character
#' @author Yong Zhou
#' 
#' @examples
#' \dontrun{
#' getCompanyInfo(data='shareStru',CompanyCode='224448',date='2016-01-07',key=key)
#' }
#' 
#' @export 
getCompanyInfo<-function(data,CompanyCode,date,key){
  
  if(data=='shareStru') {
    return(getStockShare(CompanyCode=CompanyCode,date=date,key=key))
  }
  
  invisible()
}


# TODO
getQtBond<-function(){
  
}



#' POST data from HTTP
#' @title POST data from HTTP
#' @importFrom httr POST
#' @importFrom httr content
#' @importFrom RJSONIO toJSON
#' 
#' @param df data.frame
#' @param name character
#' @param key character
#' @return list
#' @author Dan Zhang
#' 
#' @examples
#' \dontrun{
#' postData(stock1,name='abc',key=key)
#' postData(industry0,name='industry0',key=key)
#' }
#' 
#' @export 
postData<-function(df,name=NULL,key){
  if(nrow(df)>3000) stop("Rows is too large!")
  if(ncol(df)>15) stop("Columns is too large!")
  
  url<-paste(apiurl,'adduserdata',key,sep="/")
  
  json<-list(data=toJSON(df),title=name)
  
  res<-POST(url, body=json, encode="json")
  return(content(res))
}




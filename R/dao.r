# Get getKeyMap data
# @title Get getKeyMap data
# @param qtid character
# @param SecuCode character
# @param CompanyCode character
# @param ChiName character
# @param SecuMarket numeric
# @param key character require
# 
# @return data.frame
# @author Dan Zhang
#
getKeyMap<-function(qtid=c(),SecuCode=NULL,CompanyCode=NULL,ChiName=NULL,SecuMarket=NULL,key){  
  
  if(is.null(qtid) & is.null(SecuCode) & is.null(CompanyCode) & is.null(ChiName) & is.null(SecuMarket)){
    stop("At least input one parameter qtid, SecuCode, CompanyCode, ChiName or SecuMarket.")
  }
  
  args<-list(data='keyMap',key=key)
  if(!is.null(qtid)) args[['qtid']]<-qtid
  if(!is.null(SecuCode)) args[['SecuCode']]<-SecuCode
  if(!is.null(CompanyCode)) args[['CompanyCode']]<-CompanyCode
  if(!is.null(ChiName)) args[['ChiName']]<-ChiName   
  if(!is.null(SecuMarket)) args[['SecuMarket']]<-SecuMarket   
  
  #return(getData(args))
  
  if(!is.null(qtid)){
    qtid<-qtid2c(qtid)
    dl<-list()
    for(x in qtid){
      cat(x,fill=TRUE)
      args[['qtid']]<-x
      dl[[x]]<-getData(args)
    }
    
    df<-do.call(rbind, lapply(dl, data.frame, stringsAsFactors=FALSE))
    row.names(df)<-NULL
    return(df)
  }else{
    return(getData(args))
  }
  invisible(NULL);
}

# Get getIndustryType data
# @title Get getIndustryType data
# 
# @param date Date require
# @param qtid vector
# @param CompanyCode character
# @param sw1 character
# @param sw2 character
# @param sw3 character
# @param key character require
# 
# @return data.frame
# @author Dan Zhang
#
getIndustryType<-function(date,qtid=c(),CompanyCode=NULL,sw1=NULL,sw2=NULL,sw3=NULL,key){  
  args<-list(data='industryType',key=key)
  args[['date']]<-as.character(date)
  
  df<-getData(args)
  
  if(!is.null(CompanyCode)) {
    df<-df[which(df$CompanyCode==CompanyCode),]
  }
  
  if(!is.null(sw1)){ 
    df<-df[which(df$SW.FirstIndustryName==sw1),]
  }
  
  if(!is.null(sw2)){ 
    df<-df[which(df$SW.SecondIndustryName==sw2),]
  }
  
  if(!is.null(sw3)){ 
    df<-df[which(df$SW.ThirdIndustryName==sw3),]
  }
  
  if(!is.null(qtid)){ 
    df<-df[which(df$qtid %in% qtid),]
  }
  
  return(df)
}

# Get getFinancialIndex data
# @title Get getFinancialIndex data
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Dan Zhang
#
getFinancialIndex<-function(qtid=c(),date=c(),key){  
  return(getDaily('financialIndex',qtid,date,key))
}


# Get getTradingDay
# @title Get getTradingDay
# @param key character
# 
# @return data.frame
# @author Dan Zhang
#
getTradingDay<-function(key){
  args<-list(data='tradingDay',key=key)
  df<-getData(args)
  return(as.Date(df$busDate))
}


# Get getStockBeta data
# @title Get getStockBeta data
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Dan Zhang
#
getStockBeta<-function(qtid=c(),date=c(),key){
  return(getDaily('stockBeta',qtid,date,key))
}

# Get getSecuritiesMargin data
# @title Get getSecuritiesMargin data
# @param date vector
# @param SecuMarket character
# @param key character
# 
# @return data.frame
# @author Dan Zhang
#
getSecuritiesMargin<-function(date=c(),SecuMarket=NULL,key){  
  args<-list(data='securitiesMargin',key=key)
  df<-getData(args)
  df$TradingDay<-as.Date(df$TradingDay)
  
  if(!is.null(SecuMarket)) {
    df<-df[which(df$SecuMarket==SecuMarket),]
  }
  
  if(!is.null(date)){ 
    df<-df[which(df$TradingDay %in% date),]
  }
  
  return(df)
}

# Get getIndexWeight
# @title Get getIndexWeight
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Yong Zhou
#
getIndexWeight<-function(qtid=c(), date=c(), key){
  #if(is.null(date)){
  #  stop("Need to input parameter date")
  #}
  #args<-list(data="indexWeight",key=key)
  #dl<-list()
  #for(x in as.character(date)){
  #  cat(x,fill=TRUE)
  #  args[['date']]<-x
  #  dl[[x]]<-getData(args)
  #}
  #df<-do.call(rbind, lapply(dl, data.frame, stringsAsFactors=FALSE))
  #row.names(df)<-NULL
  #return(df)
  return(getDaily('indexWeight',qtid,date,key))
}

# Get getStockShare
# @title Get getStockShare
# @param CompanyCode character require
# @param date Date require
# @param key character
# 
# @return data.frame
# @author Yong Zhou
#
getStockShare<-function(CompanyCode, date, key){
  if(is.null(date) & is.null(CompanyCode)){
    stop("At least input one parameter CompanyCode or date")
  }
  
  args<-list(data='shareStru',key=key)
  args[['date']]<-as.character(date)
  
  df<-getData(args)
  
  if(!is.null(CompanyCode)) {
    df<-df[which(df$CompanyCode==CompanyCode),]
  }
  
  return(df)
}

# Get getMktDaily data
# @title Get getMktDaily data
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Dan Zhang
#
getMktDaily<-function(qtid=c(),date=c(),key){
  return(getDaily('mktDaily',qtid,date,key))
}

# Get ThirdBoardQuote data
# @title Get ThirdBoardQuote data
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Yong Zhou
#
getThirdBoardQuote<-function(qtid=c(),date=c(),key){
  return(getDaily('thirdBoardQuote',qtid,date,key))
}

# Get fwdRet data
# @title Get fwdRet data
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Yong Zhou
#
getFwdRet<-function(qtid=c(),date=c(),key){
  return(getDaily('fwdRet',qtid,date,key))
}

# Get fwdRet Index data
# @title Get fwdRet Index data
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Yong Zhou
#
getFwdRetIndex<-function(qtid=c(),date=c(),key){
  return(getDaily('fwdRet_Index',qtid,date,key))
}

# Get volatility data
# @title Get volatility data
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Yong Zhou
#
getVolatility<-function(qtid=c(),date=c(),key){
  return(getDaily('volatility',qtid,date,key))
}

# Get BlockTradingIntent data
# @title Get BlockTradingIntent data
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Yong Zhou
#
getBlockTradingIntent<-function(qtid=c(),date=c(),key){
  return(getDaily('blockTradingIntent',qtid,date,key))
}

# Get SpotTransaction data
# @title Get SpotTransaction data
# @param ProductCode vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Yong Zhou
#
getSpotTransaction<-function(ProductCode=c(),date=c(),key){
  return(getDaily('spotTransaction',ProductCode,date,key,'ProductCode'))
}

# Get InterestRateIndex
# @title Get InterestRateIndex
# @param date vector
# @param key character
# 
# @return data.frame
# @author Yong Zhou
#
getInterestRateIndex<-function(date=c(), key){
  if(is.null(date)){
   stop("Need to input parameter date")
  }
  args<-list(data="interestRateIndex",key=key)
  dl<-list()
  for(x in as.character(date)){
   cat(x,fill=TRUE)
   args[['date']]<-x
   dl[[x]]<-getData(args)
  }
  df<-do.call(rbind, lapply(dl, data.frame, stringsAsFactors=FALSE))
  row.names(df)<-NULL
  return(df)
}

# Get FundsPerformance data
# @title Get FundsPerformance data
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Yong Zhou
#
getFundsPerformance<-function(qtid=c(),date=c(),key){
  return(getDaily('fundsPerformance',qtid,date,key))
}

# Get NewestPerformance data
# @title Get NewestPerformance data
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Yong Zhou
#
getStockNewestPerformance<-function(qtid=c(),date=c(),key){
  return(getDaily('stockNewestPerformance',qtid,date,key))
}

# Get TradingCapitalFlow data
# @title Get TradingCapitalFlow data
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Yong Zhou
#
getTradingCapitalFlow<-function(qtid=c(),date=c(),key){
  return(getDaily('tradingCapitalFlow',qtid,date,key))
}

# Get FwdMktDaily data
# @title Get FwdMktDaily data
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Dan Zhang
#
getFwdMktDaily<-function(qtid=c(),date=c(),key){
  return(getDaily('mktFwdDaily',qtid,date,key))
}

# Get MktDataIndex data
# @title Get MktDataIndex data
# @param qtid vector
# @param date vector
# @param key character
# 
# @return data.frame
# @author Dan Zhang
#
getMktDataIndex<-function(qtid=c(),date=c(),key){
  return(getDaily('mktDataIndex',qtid,date,key))
}


# Get Daily Quote data
# @title Get Daily Quote data
# @param data character
# @param qtid vector
# @param date vector
# @param key character
# @param codeColName character
# 
# @return data.frame
# @author Dan Zhang
#
getDaily<-function(data,qtid=c(),date=c(),key,codeColName='qtid'){  
  args<-list(data=data,key=key)
  
  dl<-list()
  if(!is.null(qtid) & !is.null(date)){
    if(length(qtid)<=length(date)){
      for(x in as.character(qtid)){
        cat(x,fill=TRUE)
        args[[codeColName]]<-x
        dl[[x]]<-getData(args)
        dl[[x]]<-dl[[x]][which(as.Date(dl[[x]]$date) %in% date),]
      }
      
    }else{
      for(x in as.character(date)){
        cat(x,fill=TRUE)
        args[['date']]<-x
        dl[[x]]<-getData(args)
        dl[[x]]<-dl[[x]][which(dl[[x]]$codeColName %in% qtid),]
      }
    }    
  }
  

  if(!is.null(qtid) & is.null(date)){
    for(x in as.character(qtid)){
      cat(x,fill=TRUE)
      args[[codeColName]]<-x
      dl[[x]]<-getData(args)
    }
  }  
  
  if(!is.null(date) & is.null(qtid)){
    for(x in as.character(date)){
      cat(x,fill=TRUE)
      args[['date']]<-x
      dl[[x]]<-getData(args)
    }
  }
  
  df<-do.call(rbind, lapply(dl, data.frame, stringsAsFactors=FALSE))
  row.names(df)<-NULL
  return(df)
}


# Get qutke data from HTTP
# @title Get qutke data from HTTP
# @param args list
# 
# @return data.frame
# @author Dan Zhang
#
getData<-function(args){ 
  query<-compose_query(args)
  url<-paste(apiurl,'opendata',sep="/")
  addr<-URLencode(paste(url,query,sep="?"))
  #print(addr)
  return(read.table(addr,sep=",",quote='\"',header=TRUE,fileEncoding="utf-8"))
}







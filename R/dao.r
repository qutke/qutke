#' Get getKeyMap data
#' @title Get getKeyMap data
#' @param qtid character
#' @param SecuCode character
#' @param CompanyCode character
#' @param ChiName character
#' @param SecuMarket numeric
#' @param key character
#' 
#' @return data.frame
#' @author Dan Zhang
getKeyMap<-function(qtid=NULL,SecuCode=NULL,CompanyCode=NULL,ChiName=NULL,SecuMarket=NULL,key=NULL){  
   args<-list(data='keyMap',key=key)
   args[['qtid']]<-qtid
   args[['SecuCode']]<-SecuCode
   args[['CompanyCode']]<-CompanyCode
   args[['ChiName']]<-ChiName   
   args[['SecuMarket']]<-SecuMarket   
   return(getData(args))
}

#' Get getIndustryType data
#' @title Get getIndustryType data
#' @param qtid vector
#' @param date Date
#' @param CompanyCode character
#' @param sw1 character
#' @param sw2 character
#' @param sw3 character
#' @param key character
#' 
#' @return data.frame
#' @author Dan Zhang
getIndustryType<-function(qtid=c(),date=NULL,CompanyCode=NULL,sw1=NULL,sw2=NULL,sw3=NULL,key=NULL){
  args<-list(data='industryType',key=key)
  
  if(!is.null(date)) args[['date']]<-as.character(date)
  if(!is.null(CompanyCode)) args[['CompanyCode']]<-CompanyCode
  if(!is.null(sw1)) args[['sw1']]<-sw1
  if(!is.null(sw2)) args[['sw2']]<-sw2
  if(!is.null(sw3)) args[['sw3']]<-sw3
  
  dl<-list()
  if(!is.null(qtid)){
    for(x in as.character(qtid)){
      cat(x,fill=TRUE)
      args[['qtid']]<-x
      dl[[x]]<-getData(args)
    }
    df<-do.call(rbind, lapply(dl, data.frame, stringsAsFactors=FALSE))
    row.names(df)<-NULL
  } else{
    df<-getData(args)
  }
  return(df)
}

#' Get getFinancialIndex data
#' @title Get getFinancialIndex data
#' @param qtid vector
#' @param date vector
#' @param CompanyCode character
#' @param key character
#' 
#' @return data.frame
#' @author Dan Zhang
getFinancialIndex<-function(qtid=c(),date=c(),CompanyCode=NULL,key=NULL){  
  args<-list(data='financialIndex',key=key)
  
  if(!is.null(CompanyCode)) args[['CompanyCode']]<-CompanyCode

  dl<-list()
  if(!is.null(qtid) & !is.null(date)){
    if(length(qtid)<=length(date)){
      for(x in as.character(qtid)){
        cat(x,fill=TRUE)
        args[['qtid']]<-x
        dl[[x]]<-getData(args)
        dl[[x]]<-dl[[x]][which(as.Date(dl[[x]]$date) %in% date),]
      }
      
    }else{
      for(x in as.character(date)){
        cat(x,fill=TRUE)
        args[['date']]<-x
        dl[[x]]<-getData(args)
        dl[[x]]<-dl[[x]][which(dl[[x]]$qtid %in% qtid),]
      }
    }    
  }
  
  
  if(!is.null(qtid) & is.null(date)){
    for(x in as.character(qtid)){
      cat(x,fill=TRUE)
      args[['qtid']]<-x
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


#' Get getTradingDay
#' @title Get getTradingDay
#' @param key character
#' 
#' @return data.frame
#' @author Dan Zhang
getTradingDay<-function(key=NULL){
  args<-list(data='tradingDay',key=key)
  df<-getData(args)
  return(as.Date(df$busDate))
}


#' Get getStockBeta data
#' @title Get getStockBeta data
#' @param qtid vector
#' @param date vector
#' @param key character
#' 
#' @return data.frame
#' @author Dan Zhang
getStockBeta<-function(qtid=c(),date=c(),key=NULL){
  return(getDaily('stockBeta',qtid,date,key))
}

#' Get getSecuritiesMargin data
#' @title Get getSecuritiesMargin data
#' @param date vector
#' @param SecuMarket character
#' @param key character
#' 
#' @return data.frame
#' @author Dan Zhang
getSecuritiesMargin<-function(date=c(),SecuMarket=NULL,key=NULL){  
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

#' Get getMktDaily data
#' @title Get getMktDaily data
#' @param qtid vector
#' @param date vector
#' @param key character
#' 
#' @return data.frame
#' @author Dan Zhang
getMktDaily<-function(qtid=c(),date=c(),key=NULL){
  return(getDaily('mktDaily',qtid,date,key))
}

#' Get FwdMktDaily data
#' @title Get FwdMktDaily data
#' @param qtid vector
#' @param date vector
#' @param key character
#' 
#' @return data.frame
#' @author Dan Zhang
getFwdMktDaily<-function(qtid=c(),date=c(),key=NULL){
  return(getDaily('mktFwdDaily',qtid,date,key))
}

#' Get MktDataIndex data
#' @title Get MktDataIndex data
#' @param qtid vector
#' @param date vector
#' @param key character
#' 
#' @return data.frame
#' @author Dan Zhang
getMktDataIndex<-function(qtid=c(),date=c(),key=NULL){
  return(getDaily('mktDataIndex',qtid,date,key))
}


#' Get Daily Quote data
#' @title Get Daily Quote data
#' @param data character
#' @param qtid vector
#' @param date vector
#' @param key character
#' 
#' @return data.frame
#' @author Dan Zhang
getDaily<-function(data,qtid=c(),date=c(),key=NULL){
  if(is.null(key)) stop("ERROR: Key is not empty!")
  
  args<-list(data=data,key=key)
  
  dl<-list()
  if(!is.null(qtid) & !is.null(date)){
    if(length(qtid)<=length(date)){
      for(x in as.character(qtid)){
        cat(x,fill=TRUE)
        args[['qtid']]<-x
        dl[[x]]<-getData(args)
        dl[[x]]<-dl[[x]][which(as.Date(dl[[x]]$date) %in% date),]
      }
      
    }else{
      for(x in as.character(date)){
        cat(x,fill=TRUE)
        args[['date']]<-x
        dl[[x]]<-getData(args)
        dl[[x]]<-dl[[x]][which(dl[[x]]$qtid %in% qtid),]
      }
    }    
  }
  

  if(!is.null(qtid) & is.null(date)){
    for(x in as.character(qtid)){
      cat(x,fill=TRUE)
      args[['qtid']]<-x
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


#' Get qutke data from HTTP
#' @title Get qutke data from HTTP
#' @param args list
#' 
#' @return data.frame
#' @author Dan Zhang
getData<-function(args){ 
  query<-compose_query(args)
  addr<-URLencode(paste(apiurl,query,sep="?"))
  print(addr)
  return(read.table(addr,sep=",",header=TRUE,fileEncoding="utf-8",encoding="utf-8"))
}







library(testthat)

test_that("getKeyMap",{
  exp1<-as.character(getKeyMap(qtid='000001.SZ',key=key)$SecuMarket)
  expect_that(exp1,equals('SZ'))
  
  exp2<-getKeyMap(qtid='000001.SZ,000002.SZ',key=key)$CompanyCode
  expect_that(exp2,equals(c(3,6)))
  
  expect_error(getKeyMap(key=key))
})


test_that("getTradingDay",{
  exp1<-getTradingDay(key=key)
  expect_that(length(exp1),is_more_than(15000))
})

test_that("getMktDaily",{
  exp1<-getMktDaily(qtid=c('000001.SZ','000002.SZ'),key=key)
  expect_that(as.character(unique(exp1$qtid)),equals(c('000001.SZ','000002.SZ')))
  
  exp2<-getMktDaily(date=as.Date('2015-10-12')+0:1,key=key)
  expect_that(as.character(unique(exp2$date)),equals(c('2015-10-12','2015-10-13')))
  
#   exp3<-getMktDaily(qtid=c('000001.SZ','000002.SZ','600661.SH'),date=as.Date('2015-10-12')+0:1,key=key)
#   expect_that(as.character(unique(exp3$date)),equals(c('2015-10-12','2015-10-13')))
#   expect_that(as.character(unique(exp3$qtid)),equals(c('000001.SZ','000002.SZ','600661.SH')))
#   expect_that(nrow(exp3),equals(6))
})

test_that("getFwdMktDaily",{
  exp1<-getFwdMktDaily(qtid=c('000001.SZ','000002.SZ'),key=key)
  expect_that(as.character(unique(exp1$qtid)),equals(c('000001.SZ','000002.SZ')))
  
  exp2<-getFwdMktDaily(date=as.Date('2015-10-12')+0:1,key=key)
  expect_that(as.character(unique(exp2$date)),equals(c('2015-10-12','2015-10-13')))
})

test_that("getFwdRet",{
  exp1<-getFwdRet(qtid=c('000001.SZ','000002.SZ'),key=key)
  expect_that(as.character(unique(exp1$qtid)),equals(c('000001.SZ','000002.SZ')))
  
  exp2<-getFwdRet(date=as.Date('2015-10-12')+0:1,key=key)
  expect_that(as.character(unique(exp2$date)),equals(c('2015-10-12','2015-10-13')))
})

test_that("getFwdRetIndex",{
  exp1<-getFwdRetIndex(qtid=c('000001.SH'),key=key)
  expect_that(as.character(unique(exp1$qtid)),equals(c('000001.SH')))
  
  exp2<-getFwdRetIndex(date=as.Date('2015-10-12')+0:1,key=key)
  expect_that(as.character(unique(exp2$date)),equals(c('2015-10-12','2015-10-13')))
})

test_that("getVolatility",{
  exp1<-getVolatility(qtid=c('000001.SZ','000002.SZ'),key=key)
  expect_that(as.character(unique(exp1$qtid)),equals(c('000001.SZ','000002.SZ')))
  
  exp2<-getVolatility(date=as.Date('2015-10-12')+0:1,key=key)
  expect_that(as.character(unique(exp2$date)),equals(c('2015-10-12','2015-10-13')))
})

test_that("getThirdBoardQuote",{
  exp1<-getThirdBoardQuote(qtid=c('835528.SB'),key=key)
  expect_that(as.character(unique(exp1$qtid)),equals(c('835528.SB')))
  
  exp2<-getThirdBoardQuote(date=as.Date('2016-01-05')+0:2,key=key)
  expect_that(as.character(unique(exp2$date)),equals(c('2016-01-05','2016-01-06','2016-01-07')))
})

test_that("getBlockTradingIntent",{
  exp1<-getBlockTradingIntent(qtid=c('122915.SH'),key=key)
  expect_that(as.character(unique(exp1$qtid)),equals(c('122915.SH')))
  
  exp2<-getBlockTradingIntent(date=as.Date('2015-12-07')+0:1,key=key)
  expect_that(as.character(unique(exp2$date)),equals(c('2015-12-07','2015-12-08')))
})

test_that("getSpotTransaction",{
  exp1<-getSpotTransaction(ProductCode=c('6989','6987'),key=key)
  expect_that(as.character(unique(exp1$ProductCode)),equals(c('6989','6987')))
  
  exp2<-getSpotTransaction(date=as.Date('2016-01-11')+0:1,key=key)
  expect_that(as.character(unique(exp2$TradingDay)),equals(c('2016-01-11','2016-01-12')))
})

test_that("getInterestRateIndex",{
  exp2<-getInterestRateIndex(date=as.Date('2015-12-20')+0:1,key=key)
  expect_that(as.character(unique(exp2$EndDate)),equals(c('2015-12-20','2015-12-21')))
})

test_that("getFundsPerformance",{
  exp1<-getFundsPerformance(qtid=c('510060.SH','510070.SH'),key=key)
  expect_that(as.character(unique(exp1$qtid)),equals(c('510060.SH','510070.SH')))
  
  exp2<-getFundsPerformance(date=as.Date('2016-01-20')+0:1,key=key)
  expect_that(as.character(unique(exp2$date)),equals(c('2016-01-20')))
})

test_that("getMktDataIndex",{
  exp1<-getMktDataIndex(qtid=c('000001.SH','000003.SH'),key=key)
  expect_that(as.character(unique(exp1$qtid)),equals(c('000001.SH','000003.SH')))
  
  exp2<-getMktDataIndex(date=as.Date('2015-10-12')+0:1,key=key)
  expect_that(as.character(unique(exp2$date)),equals(c('2015-10-12','2015-10-13')))
})

test_that("getSecuritiesMargin",{
  exp1<-getSecuritiesMargin(SecuMarket=90,key=key)
  expect_more_than(nrow(exp1),300)
  
  exp2<-getSecuritiesMargin(key=key)
  expect_more_than(nrow(exp2),600)
  
  exp3<-getSecuritiesMargin(date=as.Date('2014-08-20')+0:10,key=key)
  expect_that(nrow(exp3),equals(16))
})

test_that("getIndexWeight",{
  exp1<-getIndexWeight(date=as.Date('2015-10-12')+0:1,key=key)
  expect_that(as.character(unique(exp1$date)),equals(c('2015-10-12','2015-10-13')))
  
  # expect_error(getIndexWeight(key=key))
})

test_that("getStockShare",{
  exp1<-getStockShare(CompanyCode='224448',date='2016-01-07',key=key)
  expect_that(as.character(unique(exp1$EndDate)),equals(c('2016-01-07')))
  
  expect_error(getStockShare(date='2015-10-12', key=key))
  expect_error(getStockShare(key=key))
})

test_that("getIndustryType",{
  expect_error(getIndustryType(CompanyCode=6,key=key))
  
  exp1<-getIndustryType(date='2015-12-02',key=key)
  expect_true(ncol(exp1)==23)
  
  exp2<-getIndustryType(date='2015-12-02',qtid=c('000001.SZ','000002.SZ'),key=key)
  expect_that(as.character(unique(exp2$qtid)),equals(c('000001.SZ','000002.SZ')))
  
  exp3<-getIndustryType(date='2015-12-02',CompanyCode=6,key=key)
  expect_true(exp3$qtid=='000002.SZ')
})

test_that("getFinancialIndex",{
  exp1<-getFinancialIndex(qtid=c('000001.SZ','000002.SZ'),key=key)
  expect_that(as.character(unique(exp1$qtid)),equals(c('000001.SZ','000002.SZ')))
  
  exp2<-getFinancialIndex(date=as.Date('2015-12-01')+0:1,key=key)
  expect_that(as.Date(unique(exp2$date)),equals(as.Date('2015-12-01')+0:1))
  
  exp3<-getFinancialIndex(qtid=c('000001.SZ','000002.SZ'),date=as.Date('2015-12-01')+0:1,key=key)
  expect_that(as.character(unique(exp3$qtid)),equals(c('000001.SZ','000002.SZ')))
  expect_that(nrow(exp3),equals(4))
})




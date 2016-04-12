qutke, R Package for Qutke project
=======================

R Package for Qutke project provided by Qutke.com .

https://console.qutke.com/api.html

## INSTALL

```{r}
library(devtools)
install_github('qutke/qutke')
```

## DEMO

```{r}
library(qutke)

key<-'ff5ed58edf645c6581e8148db1130dc310fbab5fdccc4b2a9ea0be30f4128ace'
init(key)


keyMap1<-getMD(data='keyMap',qtid='000001.SZ,000001.SH',key=key)
keyMap2<-getMD(data='keyMap',qtid=c('000001.SZ','000001.SH'),key=key)

stock1<-getDailyQuote(data='mktDaily',qtid=c('000001.SZ','000002.SZ'),key=key)
stock2<-getDailyQuote(data='mktDaily',startdate='2015-10-01',enddate='2015-10-10',key=key)
stock3<-getDailyQuote(data='mktFwdDaily',qtid=c('000001.SZ','000002.SZ'),key=key)
stock4<-getDailyQuote(data='mktFwdDaily',startdate='2015-10-01',enddate='2015-10-10',key=key)
stock5<-getDailyQuote(data='mktDataIndex',qtid=c('000001.SH','000002.SH'),key=key)
stock6<-getDailyQuote(data='mktDataIndex',startdate='2015-10-01',enddate='2015-10-10',key=key)
stock7<-getDailyQuote(data='securitiesMargin',SecuMarket=90,key=key)
stock8<-getDailyQuote(data='securitiesMargin',startdate='2015-10-01',enddate='2015-10-10',key=key)
stock9<-getDailyQuote(data='fwdRet',startdate='2016-01-05',enddate='2016-01-07',key=key)
stock10<-getDailyQuote(data='fwdRet',qtid=c('000001.SZ','000002.SZ'),key=key)
stock11<-getDailyQuote(data='fwdRet_Index',startdate='2016-01-05',enddate='2016-01-07',key=key)
stock12<-getDailyQuote(data='fwdRet_Index',qtid=c('000001.SH','000002.SH'),key=key)
stock13<-getDailyQuote(data='volatility',startdate='2016-01-05',enddate='2016-01-07',key=key)
stock14<-getDailyQuote(data='volatility',qtid=c('000001.SZ','000002.SZ'),key=key)
stock15<-getDailyQuote(data='thirdBoardQuote',startdate='2016-01-05',enddate='2016-01-07',key=key)
stock16<-getDailyQuote(data='thirdBoardQuote',qtid=c('835528.SB'),key=key)
stock17<-getDailyQuote(data='blockTradingIntent',startdate='2015-11-30',enddate='2016-01-20',key=key)
stock18<-getDailyQuote(data='blockTradingIntent',qtid=c('122915.SH'),key=key)
stock19<-getDailyQuote(data='spotTransaction',startdate='2016-01-11',enddate='2016-01-20',key=key)
stock20<-getDailyQuote(data='spotTransaction',ProductCode=c('6989','6987'),key=key)
stock21<-getDailyQuote(data='interestRateIndex',startdate='2015-06-18',enddate='2015-06-21',key=key)
stock22<-getDailyQuote(data='interestRateIndex',startdate='2015-06-20',enddate='2016-01-20',key=key)
stock23<-getDailyQuote(data='fundsPerformance',qtid=c('510060.SH','510070.SH'),key=key)
stock24<-getDailyQuote(data='fundsPerformance',startdate='2016-01-01',enddate='2016-01-20',key=key)
stock25<-getDailyQuote(data='tradingCapitalFlow',qtid=c('510060.SH','510070.SH'),key=key)
stock26<-getDailyQuote(data='tradingCapitalFlow',startdate='2016-01-11',enddate='2016-01-12',key=key)
stock27<-getDailyQuote(data='stockNewestPerformance',qtid=c('510060.SH','510070.SH'),key=key)
stock28<-getDailyQuote(data='stockNewestPerformance',startdate='2016-01-11',enddate='2016-01-12',key=key)

industry1<-getIndustry(data='industryType',date='2015-12-02',key=key)
industry2<-getIndustry(data='industryType',date='2015-12-02',qtid=c('000001.SZ','000002.SZ'),key=key)
industry3<-getIndustry(data='industryType',date='2015-12-02',CompanyCode=6,key=key)
industry4<-getIndustry(data='swsIndexL1',key=key)
industry6<-getIndustry(data='mktData_SWSIndex',date='2015-12-02',qtid=c('801890','801770'),key=key)
industry5<-getIndustry(data='indexWeight_SWS',date='2015-12-02',qtind='801180',qtid=c('000001.SZ','000002.SZ'),key=key)

date1<-getDate(data='tradingDay',key=key)
date2<-getDate(data='tradingDay',startdate='2015-10-10',enddate='2015-12-30',key=key)

qtstock1<-getQtStock(data='stockBeta',qtid=c('000001.SZ','000002.SZ'),key=key)
qtstock2<-getQtStock(data='stockBeta',startdate='2015-10-01',enddate='2015-10-10',key=key)
qtstock3<-getQtStock(data='financialIndex',qtid=c('000001.SZ','000002.SZ'),key=key)
qtstock4<-getQtStock(data='financialIndex',startdate='2015-10-10',enddate='2015-12-30',key=key)
qtstock5<-getQtStock(data='indexWeight',qtid=c('000001.SZ','000002.SZ'),key=key)
qtstock6<-getQtStock(data='indexWeight',startdate='2015-10-10',enddate='2015-10-20',key=key)

companyInfo1<-getCompanyInfo(data='shareStru',CompanyCode='224448',date='2016-01-07',key=key)

stock1$date<-as.qtDate(stock1$date)
postData(stock1,name='abc',key=key)
postData(industry0,name='industry0',key=key)

```


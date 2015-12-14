qutke, R Package for Qutke project
=======================

R Package for Qutke project provided by Qutke.com .

http://qutke.qutke.com

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

keyMap <- getMD('keyMap','000001.SZ,000002.SZ',key)

mktDaily <- getDailyQuote('mktDaily','000001.SZ','2015-10-21','2015-10-21',NULL,key)

mktFwdDaily <- getDailyQuote('mktFwdDaily','000001.SZ','2015-10-21','2015-10-21',NULL,key)

mktDataIndex <- getDailyQuote('mktDataIndex','000001.SH','2015-10-21','2015-10-21',NULL,key)

securitiesMargin <- getDailyQuote('securitiesMargin',NULL,'2015-10-21','2015-10-21',90,key)

industryType <- getIndustry('industryType','000001.SZ,000002.SZ','2015-10-21',6,'房地产','房地产开发','房地产开发',key)

tradingDay <- getDate('tradingDay','2015-10-21','2015-10-27',key)

financialIndex <- getQtStock('financialIndex','000001.SZ,000002.SZ','2015-10-21','2015-10-21',3,key)

```


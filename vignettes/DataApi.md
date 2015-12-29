况客数据API--表函数


***

# 股票及指数基本信息表(getKeyMap)
   
   getKeyMap用于获取股票、指数的基本信息。

|    配置    |                 |
|------------|-----------------|
| 源库       | QT_Stock.keyMap |
| 目标表     | keyMap          |
| 全量更新   |                 |
| 唯一性约束 | qtid            |


输入值 

 |     名称    |        描述        | 必填 | 备注 |
 |-------------|--------------------|------|------|
 | qtid        | 证券/指数代码.市场 | 5选1 |      |
 | SecuCode    | 证券/指数代码      | 5选1 |      |
 | CompanyCode | 公司代码           | 5选1 |      |
 | ChiName     | 公司名称           | 5选1 |      |
 | SecuMarket  | 市场类型           | 5选1 |      |


返回值

 |     名称    |        描述        | 备注 |
 |-------------|--------------------|------|
 | qtid        | 证券/指数代码.市场 |      |
 | SecuCode    | 证券/指数代码      |      |
 | CompanyCode | 公司代码           |      |
 | ChiName     | 公司/指数全称      |      |
 | ChiAbbr     | 公司/指数简称      |      |
 | SecuMarket  | 市场类型           |      |

# 市场行情 (getMktDaily,不复权,最近5年数据)
   
   getMktDaily用于获取最近5年的A股市场股票的行情数据(不复权)

|    配置    |                  |
|------------|------------------|
| 源库       | QT_Stock.mktData |
| 目标表     | mktDaily         |
| 增量更新   | date             |
| 唯一性约束 | qtid,date        |

输入值

 | 名称 |      描述     | 必填 | 备注 |
 |------|---------------|------|------|
 | qtid | 证券代码.市场 | 2选1 |      |
 | date | 交易日期      | 2选1 |      |

返回值

 |    名称   |                      描述                      | 备注 |
 |-----------|------------------------------------------------|------|
 | qtid      | 证券代码.市场                                  |      |
 | date      | 交易日期                                       |      |
 | prevClose | 上一交易日收盘价                               |      |
 | open      | 当日开盘价                                     |      |
 | hi        | 当日最高价                                     |      |
 | lo        | 当日最低价                                     |      |
 | close     | 当日收盘价                                     |      |
 | volume    | 当日交易量                                     |      |
 | value     | 当日交易金额                                   |      |
 | ret       | 收益率                                         |      |
 | logRet    | 对数收益率                                     |      |
 | vwap      | 成交量加权平均价,Volume Weighted Average Price |      |

#  市场行情 (getFwdMktDaily,前复权,最近5年数据)

   getFwdMktDaily用于获取最近5年的A股市场股票的行情数据(不复权)

  |    配置    |                      |
  |------------|----------------------|
  | 源库       | QT_Stock.mktFwdDaily |
  | 目标表     | mktFwdDaily          |
  | 增量更新   | date                 |
  | 唯一性约束 | qtid,date            |
 

  输入值

  | 名称 |        描述        | 必填 | 备注 |
  |------|--------------------|------|------|
  | qtid | 证券/指数代码.市场 | 2选1 |      |
  | date | 交易日期           | 2选1 |      |

返回值

 |     名称    |                      描述                      | 备注 |
 |-------------|------------------------------------------------|------|
 | qtid        | 证券代码.市场                                  |      |
 | date        | 交易日期                                       |      |
 | close       | 上一交易日收盘价                               |      |
 | volume      | 当日交易量                                     |      |
 | value       | 当日交易金额                                   |      |
 | fwdAdj      | 当日最低价                                     |      |
 | fwdAdjOpen  | 当日开盘价(前复权)                             |      |
 | fwdAdjHi    | 当日最高价(前复权)                             |      |
 | fwdAdjLo    | 当日最低价(前复权)                             |      |
 | fwdAdjClose | 当日收盘价(前复权)                             |      |
 | ret         | 当日收益率(前复权)                             |      |
 | logRet      | 对数收益率(前复权)                             |      |
 | vwap        | 成交量加权平均价,Volume Weighted Average Price |      |
 | vol30       | 前30个交易日的交易量之和                       |      |
 | ma5         | MACD5                                          |      |
 | ma10        | MACD10                                         |      |
 | ma20        | MACD20                                         |      |
 | ma60        | MACD60                                         |      |


# 指数行情 (getMktDataIndex,最近5年数据)
   
   getMktDataIndex用于获取最近5年指数的行情数据

|    配置    |                        |
|------------|------------------------|
| 源库       | QT_Stock.mktData_Index |
| 目标表     | mktData_Index          |
| 增量更新   | date                   |
| 唯一性约束 | qtid,date              |

输入值
  
| 名称 |      描述     | 必填 | 备注 |
|------|---------------|------|------|
| qtid | 指数代码.市场 | 2选1 |      |
| date | 交易日期      | 2选1 |      |

返回值

 |    名称   |                       描述                      | 备注 |
 |-----------|-------------------------------------------------|------|
 | qtid      | 指数代码.市场                                   |      |
 | date      | 交易日期                                        |      |
 | prevClose | 上一交易日收盘点位                              |      |
 | open      | 当日开盘点位                                    |      |
 | hi        | 当日最高点位                                    |      |
 | lo        | 当日最低点位                                    |      |
 | close     | 当日收盘点位                                    |      |
 | volume    | 当日交易量                                      |      |
 | value     | 当日交易金额                                    |      |
 | ret       | 收益率                                          |      |
 | logRet    | 对数收益率                                      |      |
 | vwap      | 成交量加权平均价(Volume Weighted Average Price) |      |

# 股票行业分类 (getIndustryType,申万行业分类)
   
   getIndustryType用于获取股票申万行业分类

 |    配置    |                   |
 |------------|-------------------|
 | 源库       | QT_Stock.industry |
 | 目标表     | IndustryType      |
 | 增量更新   | date              |
 | 唯一性约束 | qtid,date         |

输入值
  
 |     名称    |      描述     | 必填 |   备注   |
 |-------------|---------------|------|----------|
 | qtid        | 证券代码.市场 |      |          |
 | date        | 交易日期      | 是   |          |
 | CompanyCode | 公司代码      |      |          |
 | SW1         | 申万一级行业  |      | 中文名称 |
 | SW2         | 申万二级行业  |      | 中文名称 |
 | SW3         | 申万三级行业  |      | 中文名称 |

返回值

 |             名称            |           描述           | 备注 |
 |-----------------------------|--------------------------|------|
 | qtid                        | 证券代码.市场            |      |
 | CompanyCode                 | 公司代码                 |      |
 | SecuCode                    | 证券代码                 |      |
 | ChiName                     | 公司名称                 |      |
 | ChiNameAbbr                 | 公司名称简称             |      |
 | EngName                     | 公司英文名称             |      |
 | EngNameAbbr                 | 公司英文名称简称         |      |
 | SecuAbbr                    | 证券名称                 |      |
 | ChiSpelling                 | 证券名称拼音             |      |
 | SecuMarketChi               | 证券市场名称             |      |
 | SecuCategoryChi             | 股票类型                 |      |
 | ListedSectorChi             | 版块名称                 |      |
 | ListedStateChi              | 上市状态(上市.停牌.退市) |      |
 | SW.FirstInducharacteryName  | 申万一级行业             |      |
 | SW.SecondInducharacteryName | 申万二级行业             |      |
 | SW.ThirdInducharacteryName  | 申万三级行业             |      |



# 财务数据(getFinancialIndex)
   getFinancialIndex用于获取股票财务数据

|    配置    |                |
|------------|----------------|
| 源库       | QT_Stock.fund  |
| 目标表     | financialIndex |
| 增量更新   | date           |
| 唯一性约束 | qtid,date      |

输入值
  
| 名称 |      描述     | 必填 | 备注 |
|------|---------------|------|------|
| qtid | 股票代码.市场 | 2选1 |      |
| date | 业务日期      | 2选1 |      |


  
返回值

 |        名称       |                  描述                 | 备注 |
 |-------------------|---------------------------------------|------|
 | qtid              | 股票代码.市场                         |      |
 | date              | 业务日期                              |      |
 | CompanyCode       | 公司代码                              |      |
 | EndDate           | 财务报表日期                          | 注1  |
 | NetAssetPS        | EPS,每股净收益                        |      |
 | MainIncomePS      | 每股主营业务收入                      |      |
 | CashFlowPS        | 每股现金流                            |      |
 | NetProfit         | 净利润                                |      |
 | EBITDA            | EBITDA                                |      |
 | NetProfitRatio    | 净利润率,净收益(Net Income)/ 营业收入 |      |
 | ROA               | 资产收益率 ,净利润/总资产             |      |
 | ROECut            | 净资产收益率(摊薄-扣除)               |      |
 | DebtEquityRatio   | 负债股权比率,负债总额/股东权益        |      |
 | NetProfitGrowRate | 净利率增长率                          |      |
 | DividendPS        | 每股分红                              |      |
 | EPSTTM            | 每股收益(TTM)                         | 注2  |
 | ROETTM            | 净资产收益率(TTM)                     | 注3  |


【注1】获取财务数据的报表日期:年报,半年报,季报

【注2】每股收益(TTM)=净利润/期末总股本

【注3】净资产收益率＝(净利润(TTM)*2 /(期初股东权益+期末归股东权益)
 

# 交易日(getTradingDay)
   
   getTradingDay用于获取交易日(返回的结果已经剔除非交易日:周末/节假日)

  |     配置    |                         |
  |-------------|-------------------------|
  | 源库        | QT_BasicInfo.tradingDay |
  | 目标表      | tradingDay              |
  | 增量更新    | date                    |
  | 唯一性约束  | qtid,date               |
  | = 字段转换= |                         |
  | busDate     | date                    |


输入值
  无,取全表数据.
 
返回值

  | 名称 |  描述  | 备注 |
  |------|--------|------|
  | date | 交易日 |      |

# 融资融券交易总量(getSecuritiesMargin)

   getSecuritiesMargin用于获取融资融券交易总量

  |     配置    |                        |
  |-------------|------------------------|
  | 源库        | jydb1.MT_TradingStat   |
  | 目标表      | securitiesMargin       |
  | 增量更新    | date                   |
  | 唯一性约束  | qtid,date,ReportPeriod |
  | = 字段转换= |                        |
  | TradingDay  | date                   |

输入值
  
   |    名称    |   描述   | 必填 | 备注 |
   |------------|----------|------|------|
   | date       | 交易日期 | 2选1 |      |
   | SecuMarket | 证券市场 | 2选1 |      |

返回值

  |        名称        |                  描述                  | 备注 |
  |--------------------|----------------------------------------|------|
  | date               | 交易日期                               |      |
  | SecuMarket         | 证券市场                               |      |
  | FinanceValue       | 融资余额(元)                           | 注1  |
  | FinanceBuyValue    | 融资买入额(元)                         |      |
  | SecurityValue      | 融券余量(元)                           | 注2  |
  | SecuritySellVolume | 融券卖出量(股)                         |      |
  | TradingValue       | 融资融券交易总金额(元)                 | 注3  |
  | FinaInTVRatio      | 融资占融资融券总额比(FinaInTotalRatio) | 注4  |
  | TVChangeRatio      | 融资融券总额变动(TVChangeRatio)        | 注5  |
  | TVChangeRatioHS    | 沪深融资融券总额变动(TVChangeRatioHS)  | 注6  |
 

【注1】融资买进与归还借款间的差额; 当日融资余额=前日融资余额+当日融资买入额－当日融资偿还额;

【注2】日融券余量=前日融券余量+当日融券卖出数量-当日融券偿还量 

【注3】融资融券交易总金额(元)=当日融资余额+当日融券余量金额  

【注4】融资占融资融券总额比(FinaInTotalRatio) = (融资余额/融资融券交易总金额)*100

【注5】融资融券总额变动(TVChangeRatio) =(本日的融资融券交易总金额/上一日的融资融券交易总金额-1)*100   

【注6】沪深融资融券总额变动(TVChangeRatioHS) =(沪深市场本日的融资融券交易总金额/沪深市场上一日的融资融券交易总金额-1)*100                     

# β贝塔系数(getStockBeta)

getStockBeta用于获取股票的系统性风险及绝对回报(α系数,β系数).

|    配置    |               |
|------------|---------------|
| 源库       | QT_Stock.beta |
| 目标表     | stockBeta     |
| 增量更新   | date          |
| 唯一性约束 | qtid,date     |

  输入值

|    名称    |   描述   | 必填 | 备注 |
|------------|----------|------|------|
| qtid       | 证券代码 | 2选1 |      |
| date       | 交易日期 | 2选1 |      |

  返回值

 |     名称    |               描述              | 备注 |
 |-------------|---------------------------------|------|
 | qtid        | 证券代码                        |      |
 | date        | 业务日期                        |      |
 | alpha       | 阿尔法系数,Alpha(α) Coefficient | 注1  |
 | beta        | 贝塔系数,Beta(β) Coefficient    |      |
 | nobs        | 回归数据长度                    |      |
 | rSquared    | 拟合度                          |      |
 | residStdErr | 残值                            |      |

【注1】样本天数:60天数, 市场收益率以沪深300指数为标的指数;
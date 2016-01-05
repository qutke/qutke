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

# 公司股本结构变动 (getStockShare)

getShare获取上市公司股本结构历史变动情况。

|    配置    |                    |
|------------|--------------------|
| 源库       | jydb1.LC_ShareStru |
| 目标表     | share              |
| 增量更新   | date               |
| 唯一性约束 | CompanyCode,date   |


  输入值

|     名称    |   描述   | 必填 |      备注     |
|-------------|----------|------|---------------|
| CompanyCode | 证券代码 | 是   |               |
| date        | 截止日期 | 是   | 特指：EndDate |


  返回值

 |           字段名           |                中文名                | 备注 |
 |----------------------------|--------------------------------------|------|
 | CompanyCode                | 公司代码                             |      |
 | InfoSource                 | 信息来源                             |      |
 | EndDate                    | 截止日期                             |      |
 | InfoPublDate               | 信息发布日期                         |      |
 | PerValue                   | 每股面值(元)                         |      |
 |                            | 股本层次                             |      |
 | TotalShares                | 总股本(股)                           |      |
 | Ashares                    | 1.A股(股)                            |      |
 | AFloats                    | 1)流通A股(股)                        |      |
 | RestrictedAShares          | ①有限售条件的流通A股(股)             |      |
 | NonRestrictedShares        | ②无限售条件流通A股(股)               |      |
 | NonListedShares            | 2)未流通A股(股)                      |      |
 | BsharesTotal               | 2.B股(股)                            |      |
 | ListedBShares              | 1)流通B股(股)                        |      |
 | NonListedRestrictedBShares | 2)未流通B股(股)                      |      |
 | Hshares                    | 3.H股(股)                            |      |
 | OtherFloatShares           | 4.海外上市股(股)                     |      |
 | Sshares                    | 1)S股(股)                            |      |
 | Nshares                    | 2)N股(股)                            |      |
 |                            | 有限售股份（股改后披露格式）         |      |
 | RestrictedShares           | 有限售条件的流通股(股)               |      |
 | StateHolding               | A.国家持股(股)                       |      |
 | SLegalPersonHolding        | B.国有法人持股(股)                   |      |
 | OtherDCapitalHolding       | C.其他内资持股(股)                   |      |
 | DLegalPersonHolding        | a.境内法人持股(股)                   |      |
 | DNaturalPersonHolding      | b.境内自然人持股(股)                 |      |
 | ManagementShares           | ##高管股(股)                         |      |
 | ForeignHolding             | D.外资持股(股)                       |      |
 | FLegalPersonHolding        | 其中：境外法人持股(股)               |      |
 | FNaturalPersonHolding      | 其中：境外自然人持股(股)             |      |
 | OtherRestrictedShares      | E.其他有限售 (股)                    |      |
 |                            | 未流通股份（发行前或股改前披露格式） |      |
 | PromoterShares             | 1.发起人股(股)                       |      |
 | StateShares                | 国家股(股)                           |      |
 | SLegalPersonShares         | 其中：国有法人股(股)                 |      |
 | DLegalPersonShares         | 境内法人股(股)                       |      |
 | FLegalPersonShares         | 外资法人股(股)                       |      |
 | OtherPromoterShares        | 其它发起人股(股)                     |      |
 | RaisedLPShares             | 2.募集法人股(股)                     |      |
 | RaisedSLPShares            | 其中：募集国有法人股(股)             |      |
 | NaturalPersonHoldLPShares  | 3.自然人法人股(股)                   |      |
 | StaffShares                | 4.职工股(股)                         |      |
 | RightsIssueTransferred     | 5.转配股(股)                         |      |
 | PreferredAndOtherShares    | 6.优先股及其他(股)                   |      |
 | PreferredShares            | 其中：优先股(股)                     |      |
 | OtherFNonListedShares      | 7.其他外资股(股)                     |      |
 |                            | 流通股份（股改前披露格式）           |      |
 | FloatShare                 | 流通股份(股)                         |      |
 | AFloatListed               | 1)已上市流通A股(包含高管股)(股)      |      |
 | StategicInvestorShares     | 2)战略投资者配售持股(股)             |      |
 | CommonLPShares             | 3)一般法人配售持股(股)               |      |
 | MutualFundShares           | 4)基金配售持股(股)                   |      |
 | AdditionalIssueUnlisted    | 5)增发未上市(股)                     |      |
 | RightsIssueUnlisted        | 6)配股未上市(股)                     |      |
 | OtherAFloatShares          | 7)其他流通股份(股)                   |      |
 | RestrictedAFloatShares     | 8)有限售流通A股(股)                  |      |
 | RestrinctStaffShares       | 其中：有限售流通股中职工股(股)       |      |
 | Bshares                    | B股_旧(股)                           |      |
 | NonListedBShares           | 其中：未流通B股_旧                   |      |
 | RestrictedBFloatShares     | 有限售B股(股)                        |      |
 | ForeignHoldingAshares      | 外资持A股(股)                        |      |
 |                            | 股本变动说明                         |      |
 | ChangeType                 | 股本变动原因类别                     | 注1  |
 | ChangeReason               | 股本变动原因说明                     |      |
 | XGRQ                       | 更新时间                             |      |

【注1】股本变动原因类别（ChangeType）：1-A股发行；2-B股发行；3-A股发行基金配售上市；4-A股发行法人配售上市；6-A股上市；7-B股上市；8-送转股；10-配股除权；11-配股上市；12-转配股上市；18-非公开增发A股；19-定向增发法人股；20-增发A股；21-增发B股；22-增发A股上市；23-增发A股基金配售上市；24-增发A股法人配售上市；25-增发A股原股东配售上市；27-增发B股上市；30-国家股配售  35-股份回购；40-吸收合并；43-股份缩股；44-以股抵债；45-职工股上市；46-STAQ/NET系统法人股上市；47-外资法人股上市；48-可转换债券转股；49-股权转让；50-面值拆细；51-其他；71-股权分置方案实施；73-股权分置股份追送；75-股权分置限售流通；77-股权分置增持；78-股权分置股东增持股份上市；79-配股限售流通；80-股权激励限售流通；81-因权证行权流通；82-发行前股份限售流通；83-转债转股限售流通；89-延长限售锁定期。

# CSI300指数成份股权重(getIndexWeight)

getIndexWeight用于获取中证指数公司发布的“沪深300”指数的每日权重数据等。

|    配置    |                      |
|------------|----------------------|
| 源库       | QT_Stock.indexWeight |
| 目标表     | indexWeight          |
| 增量更新   | date                 |
| 唯一性约束 | qtid,date            |

  输入值

| 名称 |   描述   | 必填 | 备注 |
|------|----------|------|------|
| date | 交易日期 | 是   |      |
|      |          |      |      |

  返回值

 |   名称  |    描述    | 备注 |
 |---------|------------|------|
 | indexID | 指数代码   |      |
 | qtid    | 成分股代码 |      |
 | date    | 交易日期   |      |
 | weight  | 权重       |      |



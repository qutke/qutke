library(testthat)

test_that("getDate",{
  exp1<-getDate(data='tradingDay',key=key)
  expect_more_than(length(exp1),15000)

  exp2<-getDate(data='tradingDay',startdate='2015-10-10',enddate='2015-12-30',key=key)
  expect_that(length(exp2),equals(58))
  
  expect_error(getDate(data='tradingDay',startdate='2015-10-10',key=key))
})

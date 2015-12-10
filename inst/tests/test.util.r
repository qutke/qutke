library(testthat)

test_that("qtDate",{
  expect_that(as.qtDate('2015-10-01'),equals(as.character(1443657600000)))
  expect_that(as.qtDate('2015-10-10'),equals(as.character(1444435200000)))
})

test_that('qtid2String',{
  expect_that(qtid2String(),equals(NULL))
  expect_that(qtid2String(''),equals(''))
  expect_that(qtid2String('00001.SZ,00002.SZ'),equals('00001.SZ,00002.SZ'))
  expect_that(qtid2String(c('00001.SZ','00002.SZ')),equals('00001.SZ,00002.SZ'))
})




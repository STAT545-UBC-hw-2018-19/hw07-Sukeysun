context("checking factors")

test_that("check if the input is a factor (or character)", {
  x <- c('a', 'b', 'b')
  x_fact <- factor(x)
  y <- c('a', 'b')
  y_fact <- factor(y)
  expect_identical(detect_factor(x_fact), "Input is a factor")
  expect_identical(detect_factor(y_fact), "input is a character")
  expect_error(detect_factor(x),"The input is not a factor!")
})
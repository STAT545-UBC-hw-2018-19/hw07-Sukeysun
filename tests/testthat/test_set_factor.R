context("setting factors")

test_that("sets levels to the order in which they appear in the data", {
  x <- c("b","c","a")
  x_fact <- factor(x)
  levels(x) <- c("b","c","a")
  y <- c('c','c','d')
  y_fact <- factor(y)
  levels(y) <- c('c','d')
  expect_identical(set_factor(x_fact), levels(x))
  expect_identical(set_factor(y_fact), levels(y))
  expect_error(set_factor(x),"The input is not a factor!")

})
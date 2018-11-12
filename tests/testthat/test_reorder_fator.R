context("Reording factors")

test_that("Reorder factors", {
  x <- c('c', 'b', 'd')
  x_fact <- factor(x)
  levels(x) <- c("d","c","b")
  y <- c('c','c','d')
  y_fact <- factor(y)
  levels(y) <- c('d','c')
  expect_identical(reorder_factor(x_fact), levels(x))
  expect_identical(reorder_factor(y_fact), levels(y))
  expect_error(reorder_factor(x),"The input is not a factor!")
})
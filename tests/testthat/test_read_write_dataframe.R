context("Test writing and reading")

test_that("Test how to read and write dataframe with factors remained", {
  df <-  data.frame(x = (c("a","b","c")),y=c("d","e","f"))
  write_dataframe(df)
  df.read <- read_dataframe("written_dataframe.txt")
  expect_is(df.read$x, "factor")  
  expect_equal(levels(df$x), levels(df.read$x))
  expect_equal(levels(df$y), levels(df.read$y))


  
})
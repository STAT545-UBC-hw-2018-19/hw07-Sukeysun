#' @title write and read data frames to plain text 
#' @desciption To write and read data frames to plain text delimited files
#'             while retaing factor levels.
#' @param  one dataframe or a path
#' @return returns a data frame readed from files
#' @usage read_dataframe(), write_dataframe()
#' @example x <- "http://www.stat.ubc.ca/~jenny/notOcto/STAT545A/examples/gapminder/data/gapminderDataFiveYear.txt"
#' data <- read_dataframe(x)
#' write.table(data)
#' @rdname common_doc
#' @export

write_dataframe <- function(x){
  write.table(x, "written_dataframe.txt", quote = FALSE, sep = "\t", row.names = FALSE)
}

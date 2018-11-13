#' @title write and read data frames to plain text 
#' @desciption To write and read data frames to plain text delimited files
#'             while retaing factor levels.
#' @param  one dataframe or a path
#' @return returns a data frame readed from files
#' @usage read_dataframe(), write_dataframe()
#' @rdname common_doc
#' @example x <- "http://www.stat.ubc.ca/~jenny/notOcto/STAT545A/examples/gapminder/data/gapminderDataFiveYear.txt"
#' data <- read_dataframe(x)
#' write.table(data)
#' @export

read_dataframe <- function(x){
  get_data <- read.delim(x)
  return(get_data)
}

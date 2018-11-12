#' @title Set a factor in a given order
#' @description sets levels to the order in which they appear in the data, i.e. set the levels “as is”
#' @usage set_factor(x)
#' @param x a factor you want to set
#' @return Return levels to the order in which they appear in the data,
#' An error is raised if the input is not a factor
#' @examples
#' set_factor(factor(c("b", "c", "a"))) # Levels: b c a
#' @export


set_factor <- function(x) {
  # check if the input is a factor or not
  if (!is.factor(x)) {
    stop("The input is not a factor!")
  }
  
  # return a factor in descending order
  levels(x) <- as.character(unique(x))
  return(levels(x))
}
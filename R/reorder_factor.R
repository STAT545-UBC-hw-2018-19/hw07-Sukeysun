#' @title Reorder a factor in descending order
#' @description a version of reorder() that uses desc() a la (d)plyr
#' @usage factor_reorder(x)
#' @param x a factor you want to reorder
#' @return Returns the input factor in descending order
#' An error is raised if the input is not a factor
#' @examples
#' reorder_factor(factor(c("B", "A", "D"))) # Levels: D B A
#' @export


reorder_factor <- function(x) {
  # check if the input is a factor or not
  if (!is.factor(x)) {
    stop("The input is not a factor!")
  }
  
  # return a factor in descending order
  reorderedFactor <- reorder(x, dplyr::desc(x))
  return(levels(reorderedFactor))
}
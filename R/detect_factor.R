#' @title Factors detect whether the input is a character
#'
#' @description If the input is a character, print "input is a character"  
#' If the input is a factor, print "Input is a factor"
#' @param  the parameter you want to detect
#' @return "input is a character"/ "Input is a factor"
#' @usage detect_factor()
#' @examples
#' detect_factor(factor(c("a", "a", "b"))) "Input is a factor"
#' @export
#' 
detect_factor <- function(x){
  # check if the input is a factor or not
  if (!is.factor(x)) {
    stop("The input is not a factor!")
  }
  # if #unique values != length
  if (length(unique(x)) == length(x))
  print("input is a character")
  else
    print("Input is a factor")
}
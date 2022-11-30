#' List matching -- return items that don't exist
#'
#' @param baseline List of items to compare against
#' @param checkfor List of items to check for in baseline
#'
#' @return Returns list of items in "checkfor" that do NOT exist in "baseline"
#'
#' @examples
#'
#' checking <- c("apple", "banana", "clementine")
#' for <- c("apple", "peach", "banana")
#' DNE_in(checking, for)
#' #> returns "peach"
#'
DNE_in <- function(baseline, checkfor) {
  bools <- checkfor %in% baseline
  index <- which(bools == FALSE)
  itemsDNE <- checkfor[index]
  itemsDNE
}

library(tidyverse)

#' Most Skipped Songs of All Time
#'
#' @return text displaying the top three skipped songs
#' @export
#' @import ggplot2
#' @import dplyr
#'
#'
#' @examples
#' end_reason(extended_example)
end_reason <- function(df){
  sorted_table <- df %>%
    group_by(reason_end, artist) %>%
    count(song) %>%
    arrange(desc(n)) %>%
    filter(reason_end == "fwdbtn") #finds the most number of songs skipped by forward button
  skipped1 <- sorted_table[1,3]
  artist1 <- sorted_table[1, 2]
  skipped2 <- sorted_table[2, 3]
  artist2 <- sorted_table[2, 2]
  skipped3 <- sorted_table[3, 3]
  artist3 <- sorted_table[3, 2]
  print(paste("The songs you've skipped the most are ", skipped1, " by ", artist1,
              ", followed by ", skipped2, " by ", artist2,
              " and ", skipped3, " by ", artist3,
              ". Maybe remove them from your library or playlists?", sep=""))
}


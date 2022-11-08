library(tidyverse)


most_played_artist <- function(temp){
  sorted_table <- temp %>%
    count(master_metadata_album_artist_name) %>%
    arrange(desc(n))
  most_played <- sorted_table[1,1]
  second_played <- sorted_table[2, 2]
  third_played <- sorted_table[3, 1]
  print(paste("Your most played artist of all time is ", most_played, "! Followed by ", second_played, " and ", third_played,  sep=""))
}

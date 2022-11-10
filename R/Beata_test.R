library(tidyverse)


most_played_artist <- function(extended_example){
  sorted_table <- extended_example %>%
    count(artist) %>%
    arrange(desc(n))
  most_played <- sorted_table[1,1]
  second_played <- sorted_table[2, 1]
  third_played <- sorted_table[3, 1]
  print(paste("Your most played artist of all time is ", most_played, "! Followed by ", second_played, " and ", third_played,  sep=""))
}


library(tidyverse)
library(ggplot2)

most_played_artist <- function(extended_example){
  sorted_table <- extended_example %>%
    count(artist) %>%
    arrange(desc(n)) %>%
    head(10)
  most_played <- sorted_table[1,1]
  second_played <- sorted_table[2, 1]
  third_played <- sorted_table[3, 1]
  print(paste("Your most played artist of all time is ", most_played,
              "! Followed by ", second_played, " and ", third_played,  sep=""))
  plot<-ggplot(data=sorted_table, aes(x=reorder(artist,-n), y=n)) +
    geom_bar(stat="identity", fill="blue") + xlab("Artist") + ylab("Number of Streams of All Time")
  plot
}
most_played_artist(extended_example)


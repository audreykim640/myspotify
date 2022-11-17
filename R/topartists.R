library(tidyverse)
library(ggplot2)

#' Top 10 Played Artists and Bands
#'
#' @param df Data frame of personal Spotify data
#'
#' @return text displaying the top three artists and ggplot2 bar chart showing the top 10 listened artists in descending order
#' @export
#' @import ggplot2
#' @import dplyr
#'
#' @examples
#' df <- myspotify$extended_example
#' most_played_artist(df)
#'
most_played_artist <- function(df){
  sorted_table <- extended_data %>%
    count(artist) %>%
    arrange(desc(n)) %>%
    head(10)
  most_played <- sorted_table[1,1]
  second_played <- sorted_table[2, 1]
  third_played <- sorted_table[3, 1]
  print(paste("Your most played artist of all time is ", most_played,
              "! Followed by (the)", second_played, " and ", third_played,  sep=""))
  plot<-ggplot(data=sorted_table, aes(x=reorder(artist,-n), y=n)) +
    geom_bar(stat="identity", fill="blue") + xlab("Artist") + ylab("Number of Streams of All Time")
  plot
}
most_played_artist(extended_example)

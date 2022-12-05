globalVariables(c("date","year","time","ms_played","song","artist","album","reason_start","reason_end"))

#' Top 10 Played Artists and Bands
#'
#' @param df Cleaned dataframe (using myspotify::read_file()) of Spotify listening history
#'
#' @return text displaying the top three artists and ggplot2 bar chart showing the top 10 listened artists in descending order
#' @export
#' @import ggplot2
#' @import dplyr
#' @importFrom "stats" "reorder"
#' @importFrom "utils" "head"
#'
#' @examples
#' most_played_artists(myspotify::extended_example)
most_played_artists <- function(df){
  sorted_table <- df %>%
    count(artist) %>%
    arrange(desc(n)) %>%
    head(10)
  most_played <- sorted_table[1,1]
  second_played <- sorted_table[2, 1]
  third_played <- sorted_table[3, 1]
  print(paste("Your most played artist of all time is ", most_played,
              "! Followed by (the)", second_played, " and ", third_played,  sep=""))
  plot<-ggplot(data=sorted_table, aes(x=reorder(artist,-n), y=n)) +
    geom_bar(stat="identity", fill="coral1") + xlab("Artist") + ylab("Number of Streams of All Time") +
    theme(axis.text.x = element_text(angle = -90))+
    theme(axis.title = element_text(face="bold"))
  plot
}
# most_played_artist(extended_example)

globalVariables(c("date","year","time","ms_played","song","artist","album","reason_start","reason_end"))

#' Assessing number of skips by song feature
#'
#' @param df Cleaned dataframe (using myspotify::read_file) of Spotity listening history
#' @param by The feature by which to check for skips (e.g., song, artist)
#'
#' @return Dataframe of the most skipped songs and the number of skips per song
#' @export
#' @import ggplot2
#' @import dplyr
#'
#' @examples
#' most_skipped(myspotify::extended_example)
#' most_skipped(myspotify::extended_example, by = "artist")
most_skipped <- function(df, by = "song"){
  if(!("data.frame" %in% class(df))){
    stop(paste("'df' should be data.frame, not"), class(df))
  }
  if(!("character" %in% class(by)) || !(by %in% names(df))) {
    stop(paste("'by' should be character, not"), class(df), "\nTry 'artist' or 'song'.")
  }
  sorted_table <- df %>%
    filter(reason_end == "fwdbtn") %>% #finds the most number of songs skipped by forward button
    group_by(!! sym(by)) %>%
    count(!! sym(by)) %>%
    arrange(desc(n)) %>%
    rename("skips" = n)
  sorted_table
  # skipped1 <- sorted_table[1,3]
  # artist1 <- sorted_table[1, 2]
  # skipped2 <- sorted_table[2, 3]
  # artist2 <- sorted_table[2, 2]
  # skipped3 <- sorted_table[3, 3]
  # artist3 <- sorted_table[3, 2]
  # print(paste("The songs you've skipped the most are ", skipped1, " by ", artist1,
  #             ", followed by ", skipped2, " by ", artist2,
  #             " and ", skipped3, " by ", artist3,
  #             ". Maybe remove them from your library or playlists?", sep=""))
}


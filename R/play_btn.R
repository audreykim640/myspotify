globalVariables(c("date","year","time","ms_played","song","artist","album","reason_start","reason_end"))

#' Which Songs You Manually Pressed "Play Button" the Most
#'
#' @param df Cleaned dataframe (using myspotify::read_file()) of Spotify listening history
#'
#' @return Dataframe of all the songs the user hit the "play button" to stream
#' @import dplyr
#' @export
#'
#' @examples
#' play_btn(myspotify::extended_example)
play_btn <- function(df){
  sorted_table <- df %>%
    group_by(song, artist) %>%
    filter(reason_start == "playbtn") %>%
    count(song) %>%
    arrange(desc(n))
  sorted_table
}

#' Search specific word or string in song name
#'
#' @param df Cleaned dataframe (using myspotify::read_file) of Spotity listening history
#' @param string by The feature by which to check for skips (e.g., song, artist)
#'
#' @return dataframe of a list of all the songs a user streamed with that specific string in the song name
#' @export
#' @import dplyr
#'
#' @examples
#' search_word(extended_example, love)
search_word <- function(df, string) {
  sorted_table <- df %>%
    select(song, artist, album) %>%
    distinct() %>%
    filter(grepl(string, song, ignore.case = TRUE))
  sorted_table
}

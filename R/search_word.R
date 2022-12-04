#' Search specific word or string in song name
#'
#' @param df
#' @param string
#'
#' @return dataframe of a list of all the songs a user streamed with that specific string in the song name
#' @export
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

#' Which Songs You Manually Pressed "Play Button" the Most
#'
#' @param df
#'
#' @return Dataframe of all the songs the user hit the "play button" to stream
#' @import dplyr
#' @export
#'
#' @examples
#' play_btn(extended_example)
play_btn <- function(df){
  sorted_table <- df %>%
    group_by(song, artist) %>%
    filter(reason_start == "playbtn") %>%
    count(song) %>%
    arrange(desc(n))
  sorted_table
}

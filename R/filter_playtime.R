#' Keep songs based on length of play time
#'
#' @param df Dataframe of Spotify listening history (must have `ms_played` column)
#' @param length The minimum number of minutes the song has been played for
#'
#' @return Dataframe containing only entries that were played for more than or equal to the number of minutes specified in `length`
#' @export
#' @import dplyr
#'
#' @examples
#' data <- myspotify$extended_example
#'
#' two_min <- data %>% filter_length(length = 2)
#'
#' two_half_min <- filter_length(data, 2.5)
#'
filter_playtime <- function(df, length = NULL) {
  if(!is.data.frame(df)) {
    stop(paste("no applicable method for 'filter_length' applied to an object of class \"",
               class(df), "\"", sep = ""))
  }
  if(!is.null(length) && is.numeric(length)) {
    ms <- length * 60000 # there are 60,000 ms (unit of ts var) per minute
    df <- df %>%
      filter(ms_played >= ms)
  } else if (!is.null(length)) {
    stop(paste("'length' must be a numeric, not a", class(length)))
  }
  df
}


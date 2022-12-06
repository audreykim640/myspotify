globalVariables(c("date","year","time","ms_played","song","artist","album","reason_start","reason_end"))

#' Plot top artists over time
#'
#' @param df Cleaned dataframe (using myspotify::read_file()) of Spotify listening history
#' @param num Number of top artists to plot per year
#'
#' @return ggplot2 plot of the top artists listened to over the years
#' @export
#' @import dplyr
#' @import ggplot2
#'
#' @examples
#' artist_trends(myspotify::extended_example, num = 5)
#'
artist_trends <- function(df, num = 3) {
  if(!("data.frame" %in% class(df))){
    stop(paste("'df' should be data.frame, not"), class(df))
  }
  if(!("numeric" %in% class(num))) {
    stop(paste("'num' should be numeric, not"), class(num))
  }

  # defining helper function
  # checks for outer of overlap in lists
  DNE_in <- function(baseline, checkfor) {
    bools <- checkfor %in% baseline
    index <- which(bools == FALSE)
    itemsDNE <- checkfor[index]
    itemsDNE
  }

  if (length(DNE_in(colnames(df), c("year", "artist"))) != 0) {
    stop("Columns 'year' and 'artist' needed.
         Try using 'myspotify::read_file()' for data cleaning")
  }

  df <- df %>%
    count(year, artist) %>%
    group_by(year) %>%
    arrange(desc(n)) %>%
    slice(1:num)

  ggplot(df, aes(x = year, y = n, color = artist)) +
    geom_text(aes(label = artist)) +
    labs(title = "Top artists over the years",
         x = "Year",
         y = "Number of listens") +
    theme_minimal() +
    theme(legend.position="none")
}

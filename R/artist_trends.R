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

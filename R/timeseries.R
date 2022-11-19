#' Plot number of listens over time
#'
#' @param df Cleaned dataframe (using myspotify::read_file()) of Spotify listening history
#' @param interval Time interval to round dates to ('day', 'month', or 'year')
#' @param limits Date-time limits for the x-axis
#' @param breaks Time interval to set x-axis label breaks at
#' @param plottype Type of plot to produce: can be bar (default) or line
#'
#' @return ggplot2 plot of listening habits in songs per day over
#' @export
#' @import ggplot2
#' @import dplyr
#' @importFrom stringr str_to_title
#' @importFrom lubridate floor_date
#'
#' @examples
#' df <- myspotify$extended_example
#' t <- c("2021-01-01 00:00:00", "2022-01-01 00:00:00")
#' timeseries(df, interval = "month", limits = t, breaks = "3 months")
#'
#' timeseries(df, interval = "day", breaks = "3 months", plottype = "line") +
#'    theme(axis.text.x = element_text(angle = 270, vjust = 0.5, hjust=1))
#'
#'
timeseries <- function(df, interval = "month", limits = c(min(df$ts), max(df$ts)),
                       breaks = "1 year", plottype = "bar") {
  # df for plotting -- "round" each date to desired interval
  dates <- df %>%
    group_by(ts = lubridate::floor_date(ts, interval)) %>%
    summarize(count = n())

  # core plotting shenanigans
  plot <- ggplot(dates, aes(x = ts, y = count)) +
    scale_x_datetime(date_breaks = breaks, date_labels = "%b %Y", limits = as.POSIXct(limits)) +
    labs(title = paste("Songs per", interval, "over time"),
         x = stringr::str_to_title(interval), y = "Number of songs played") +
    theme_minimal()

  # reads user input for type of plot
  if (plottype == "line") {
    plot + geom_line()
  } else {
    plot + geom_col(aes(fill=count)) +
      theme(legend.position = "none")
  }
}





#' Plot number of listens over time
#'
#' @param df Cleaned dataframe (using myspotify::read_file()) of Spotify listening history
#' @param interval Time interval to round dates to ('day', 'month', or 'year')
#' @param breaks Time interval to set x-axis label breaks at
#' @param plottype Type of plot to produce: can be bar (default) or line
#'
#' @return ggplot2 plot of listening habits in songs per day over
#' @export
#' @import ggplot2
#' @import dplyr
#'
#' @examples
#' df <- myspotify$extended_example
#' timeseries(df, interval = "month", breaks = "3 months") +
#'     theme(axis.text.x = element_text(angle = 270, vjust = 0.5, hjust=1))
#'
#' timeseries(df, interval = "day", breaks = "3 months", plottype = "line")
#'
timeseries <- function(df, interval = "month", breaks = "1 year", plottype = "bar") {
  if(interval %in% c("day", "month")) {
    intervalyr <- paste(interval, "year", sep = "")
  } else if (interval == "year") {
    intervalyr <- interval
  } else {
    stop(paste("Unrecognized time interval '", interval, "'. Please select 'day', 'month', or 'year'.",
               sep = ""))
  }

  # df for plotting -- "round" each date to desired interval
  dates <- df %>%
    group_by(date = lubridate::floor_date(date, interval)) %>%
    summarize(count = n())

  # core plotting shenanigans
  plot <- ggplot(dates, aes(x = date, y = count)) +
    scale_x_date(date_breaks = breaks, date_labels = "%b %Y") +
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





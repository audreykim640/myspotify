globalVariables(c("date","year","time","ms_played","song","artist","album","reason_start","reason_end"))

#' Plot number of listens over time
#'
#' @param df Cleaned dataframe (using myspotify::read_file()) of Spotify listening history
#' @param interval Time interval to round dates to
#' @param limits Date-time limits for the x-axis
#' @param breaks Time interval to set x-axis label breaks at
#' @param geom Type of plot to produce: can be bar (default) or line
#'
#' @return ggplot2 plot of listening habits in songs per day over
#' @export
#' @import ggplot2
#' @import dplyr
#' @importFrom stringr str_to_title
#' @importFrom lubridate floor_date
#'
#' @examples
#' df <- myspotify::extended_example
#' t <- c("2021-01-01 00:00:00", "2022-01-01 00:00:00")
#' timeseries(df, interval = "month", limits = t, breaks = "3 months")
#'
#' timeseries(df, interval = "day", breaks = "3 months", geom = "line") +
#'    ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 270, vjust = 0.5, hjust=1))
#'
#'
timeseries <- function(df, interval = "month", limits = c(min(df$date), max(df$date)),
                       breaks = "1 year", geom = "bar") {

  # defining helper function
  # checks for outer of overlap in lists
  DNE_in <- function(baseline, checkfor) {
    bools <- checkfor %in% baseline
    index <- which(bools == FALSE)
    itemsDNE <- checkfor[index]
    itemsDNE
  }

  if (!("data.frame" %in% class(df))){
    stop(paste("'df' should be data.frame, not"), class(df))
  } else if (length(DNE_in(colnames(df), c("date"))) != 0) {
    stop("Column 'date' needed.
         Try using 'myspotify::read_file()' for data cleaning")
  }

  # df for plotting -- "round" each date to desired interval
  dates <- df %>%
    group_by(date = floor_date(date, interval)) %>%
    summarize(count = n())

  # core plotting shenanigans
  plot <- ggplot(dates, aes(x = date, y = count)) +
    scale_x_datetime(date_breaks = breaks, date_labels = "%b %Y", limits = as.POSIXct(limits)) +
    labs(title = paste("Songs per", interval, "over time"),
         x = str_to_title(interval), y = "Number of songs played") +
    theme_minimal()

  # reads user input for type of plot
  if (geom == "line") {
    plot <- plot + geom_line()
  } else {
    plot <- plot + geom_col(aes(fill=count)) +
      theme(legend.position = "none")
  }
}





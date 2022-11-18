#' Plot number of listens per day over time
#'
#' @param df Cleaned dataframe (using myspotify::read_file()) of Spotify listening history
#' @param plottype Type of plot to produce: can be bar (default) or line
#'
#' @return ggplot2 plot of listening habits in songs per day over
#' @export
#' @import ggplot2
#' @import dplyr
#'
#' @examples
plot_dates <- function(df, interval = "month", plottype = "bar") {
  if(interval %in% c("day", "month")) {
    intervalyr <- paste(interval, "year", sep = "")
  } else if (interval == "year") {
    intervalyr <- interval
  } else {
    stop(paste("Unrecognized time interval '", interval, "'. Please select 'day', 'month', or 'year'.",
               sep = ""))
  }

  dates <- df %>%
    group_by(!! sym(intervalyr)) %>%
    summarize(count = n())

  plot <- ggplot(dates, aes(x = !! sym(intervalyr), y = count)) +
    scale_x_datetime(date_breaks = "6 months", date_labels = "%b %Y") +
    labs(title = paste("Songs per", interval, "over time"),
         x = str_to_title(interval), y = "Number of songs played") +
    theme_minimal()

  if (plottype == "line") {
    plot + geom_line()
  } else {
    plot + geom_col(aes(fill=count)) +
      theme(legend.position = "none")
  }
}

# axis labels are janky






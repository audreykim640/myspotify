#' Plot listening habits by time of day
#'
#' @param df Data frame of personal Spotify data
#' @param targetTZ Desired timezone (default is UTC)
#' @param years Year(s) whose data are of interest
#'
#' @return ggplot2 bar chart of listening habits throughout the 24-hour day
#' @export
#' @import ggplot2
#' @import dplyr
#'
#' @examples
#' df <- myspotify$extended_example
#'
#' plot_times(df, targetTZ = "EST", years = c(2017, 2019))
#'
#' plot_times(df, targetTZ = "Africa/Tripoli", years = 2019) +
#'    labs(subtitle = "from 2019")
plot_times <- function(df, targetTZ = "UTC", years = NULL) {
  if(length(DNE_in(colnames(df), c("time", "year"))) != 0) {
    stop("Columns 'time' and 'year' needed.
         Try using 'myspotify::read_file()' for formatting.")
  }

  if(!is.null(years)) {
    df <- df %>%
      filter(year %in% years)
  }

  yearsDNE <- DNE_in(baseline = df$year, checkfor = years)
  if(length(yearsDNE) != 0) {
    warning(paste("Data from year", yearsDNE, "not shown (does not exist).\n  "))
  }

  # DOESN'T REFRESH AFTER THERE'S AN ISSUE
  tryCatch(
    expr = {df <- df %>%
      mutate(time = format(time, tz = targetTZ))},

    warning = function(W) {
      warning("Plot reflects UTC timezone. x-axis label may be misleading.")
    }
  )

  df <- df %>%
    mutate(time = format(trunc(as.POSIXct(time), "hour")),
           time = as.POSIXct(time))

  ggplot(df, aes(x = time)) +
    geom_bar(aes(fill=..count..)) +
    scale_x_datetime(date_breaks = "3 hours", date_labels = "%I%P") +
    labs(title = "Listening activity throughout the day",
         x = paste("Time of day in ", targetTZ, sep = ""),
         y = "Number of songs played") +
    theme_minimal() +
    theme(legend.position = "none")
}

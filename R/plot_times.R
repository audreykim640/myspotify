#' Plot listening habits by time of day
#'
#' @param df Data frame of personal Spotify data
#' @param targetTZ Desired timezone (default is UTC)
#' @param years Year(s) whose data are of interest
#'
#' @return ggplot2 bar chart of listening habits throughout the 24-hour day
#' @export
#' @import ggplot2, dplyr
#'
#' @examples
#' df <- myspotify$extended_example
#'
#' plot_times(df, targetTZ = "EST", years = c(2017, 2019))
#'
#' plot_times(df, targetTZ = "EST", years = 2019) +
#'    labs(subtitle = "from 2019")

plot_times <- function(df, targetTZ = "UTC", years = NULL) {
  if(!is.null(years)) {
    df <- df %>%
      filter(year %in% years)
  }

  check <- years %in% df$year
  check

  # for bool in check, if false, return warning

  map(check, function(x) if(x == FALSE) {warning("This is false")})

  # for (useryear in years) {
  #   if useryear !exists in dfyears {
  #     warning(useryear not used)
  #   }
  # }

  # years %>%
  #   map(ifelse(function(x) !(x %in% df$year), NULL, warning(paste(x, "not used"))))

  # attempt tryCatch for the code chunk below
  # NEED TRYCATCH FOR INCORRECT DATAFRAME

  df <- df %>%
    mutate(local = format(time, tz = targetTZ),
           local = format(trunc(as.POSIXct(local), "hour")),
           local = as.POSIXct(local))

  ggplot(df, aes(x = local)) +
    geom_bar(aes(fill=..count..)) +
    scale_x_datetime(date_breaks = "3 hours", date_labels = "%I%P") +
    labs(title = "Listening activity throughout the day",
         x = paste("Time of day in ", targetTZ, sep = ""),
         y = "Number of songs played") +
    theme_minimal() +
    theme(legend.position = "none")
}

plot_times(extended_example, targetTZ = "EST", years = c(20009))

# trends for when you listened to each artist over time

# needs warning/error for unknown time zones and nonexistent years




#' Plot number of listens per day over time
#'
#' @param df
#' @param plottype
#'
#' @return
#' @export
#' @import ggplot2
#' @import dplyr
#'
#' @examples
plot_dates <- function(df, plottype) {
  dates <- mydata %>%
    # group_by(date) %>%
    summarize(count = n())

  plot <- ggplot(dates, aes(x = date, y = count)) +
    scale_x_date(date_breaks = "1 month", date_labels = "%b %Y",
                 limit=c(as.Date("2020-01-01"),as.Date("2022-02-11"))
    ) +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5))

  if (plottype == "line") {
    plot + geom_line()
  } else if (plottype == "bar") {
    plot + geom_bar()
  }
}

# map(dates, class)

# make customization by what to break on for the x axis
# and for start/end dates

# trends for when you listened to each artist over time




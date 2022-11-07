
library(purrr)
library(ggplot2)

function(df, breaks, limits) {

}
dates <- temp %>%
  mutate(date = as.Date(substr(ts, 1, 10), "%Y-%m-%d"))

ggplot(dates, aes(x = date)) +
  geom_bar()  +
  scale_x_date(date_breaks = "1 month", date_labels = "%b %Y",
               limit=c(as.Date("2020-01-01"),as.Date("2020-02-11"))
  ) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
# map(dates, class)

# make customization by what to break on for the x axis
# and for start/end dates

# trends for when you listened to each artist over time




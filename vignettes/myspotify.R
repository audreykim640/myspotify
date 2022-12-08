## ----loading, include = FALSE-------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(myspotify)
library(dplyr)
library(ggplot2)

## ----data_peak----------------------------------------------------------------
head(extended_example, 5)

## ----example_data_download----------------------------------------------------
# example:
# my_data <- read_file("workspace/my_spotify_data/myData/endsong_0.json",
#                      "workspace/my_spotify_data/myData/endsong_1.json",
#                      "workspace/my_spotify_data/myData/endsong_2.json")

## ----filter_playtime----------------------------------------------------------
# Selects songs that have played for one OR MORE minutes
one_min <- filter_playtime(extended_example, length = 1)

# Selects songs that have played for 2.5 OR MORE minutes
# Can use with dplyr's pipe ( %>% ) function!
twoandhalf <- extended_example %>% 
  filter_playtime(length = 2.5)

## ----examples_pt2-------------------------------------------------------------
# Plot the top 5 most skipped songs
skipped_songs <- extended_example %>% 
  most_skipped() %>% 
  arrange(desc(skips)) %>% # order rows by number of skips, most to least
  head(5) # select only the top 5 rows
  
# plotting the dataframe of 5 songs from above
ggplot(skipped_songs, aes(x = song, y = skips)) +
  geom_col(fill= "darkmagenta") +
  theme(axis.text.x = element_text(angle = -45, hjust = 0)) +
  theme(axis.title = element_text(face="bold"))

## ----play_btn-----------------------------------------------------------------
play_btn(extended_example)

## ----search_word--------------------------------------------------------------
#Example word: "You"
search_word(extended_example, "you")

# Returns all songs streamed with "you" in the title

## ----most_played_artist-------------------------------------------------------
most_played_artists(extended_example)

## ----artist_trends------------------------------------------------------------
# Top three artists for all songs that were played
artist_trends(extended_example, )

# Say we only want to see artists whose songs we played for at least 2 minutes...
# But we want to see four artists per year
extended_example %>% 
  filter_playtime(length = 2) %>% 
  artist_trends(num = 4)

## ----plot_times---------------------------------------------------------------
plot_times(extended_example, targetTZ = "EST", years = c(2019, 2022))

plot_times(extended_example, targetTZ = "Africa/Tripoli", years = 2020)

## ----timeseries---------------------------------------------------------------
t <- c("2021-01-01 00:00:00", "2022-01-01 00:00:00")
timeseries(extended_example, interval = "month", limits = t, breaks = "3 months")

timeseries(extended_example, interval = "day", breaks = "3 months", geom = "line") +
  theme(axis.text.x = ggplot2::element_text(angle = 270, vjust = 0.5, hjust=1))


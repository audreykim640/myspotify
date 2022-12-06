## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(myspotify)
library(dplyr)
library(ggplot2)

## ----example_data_download----------------------------------------------------
# example:
# my_data <- read_file("workspace/my_spotify_data/myData/endsong_0.json",
#                      "workspace/my_spotify_data/myData/endsong_1.json",
#                      "workspace/my_spotify_data/myData/endsong_2.json")

## -----------------------------------------------------------------------------
head(extended_example, 5)

## ----examples_pt1-------------------------------------------------------------
artist_trends(extended_example)
## Example data

# Spotify data by default includes all songs that started playing
# Say we only want to see artists whose songs we played for at least 2 minutes...
extended_example %>% 
  filter_playtime(length = 2) %>% 
  artist_trends()

## ----examples_pt2-------------------------------------------------------------
# Plot the top 5 most skipped songs
skipped_songs <- extended_example %>% 
  most_skipped() %>% 
  arrange(desc(skips)) %>% 
  head(5)
  
ggplot(skipped_songs, aes(x = song, y = skips)) +
  geom_col(fill= "darkmagenta") +
  theme(axis.text.x = element_text(angle = -45, hjust = 0)) +
  theme(axis.title = element_text(face="bold"))


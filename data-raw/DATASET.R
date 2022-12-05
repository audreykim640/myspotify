## code to prepare `DATASET` dataset goes here

usethis::use_data(DATASET, overwrite = TRUE)

# [Template above; actual code below]--------------------------

## code to prepare `extended_example` dataset goes here
library(dplyr)
extended_example <- jsonlite::fromJSON(txt = "data-raw/extended_example.json", flatten = TRUE) %>%
  rename(song = master_metadata_track_name,
         artist = master_metadata_album_artist_name,
         album = master_metadata_album_album_name) %>%
  select(ts, ms_played, song, artist, album, reason_start, reason_end) %>%
  mutate(ts = as.POSIXct(ts, format = "%Y-%m-%dT%H:%M:%S"),
         ts = lubridate::force_tz(ts, tzone = "GMT"),
         time = as.POSIXct(substr(ts, start = 11, stop = 18), format = "%H:%M:%S"),
         time = lubridate::force_tz(time, tzone = "GMT"))

usethis::use_data(extended_example, overwrite = TRUE)

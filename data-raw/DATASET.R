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
  tidyr::separate(col = ts, into = c("date", "time"), sep = "T") %>%
  mutate(date = as.Date(date, format = "%Y-%m-%d"), # should remain as.Date() for plot_dates() function
         time = as.POSIXct(substr(time, start = 1, stop = 8), format = "%H:%M:%S"),
         time = lubridate::force_tz(time, tzone = "GMT"),
         year = lubridate::year(date),
         month = factor(month.name[lubridate::month(date)],levels=month.name))

 # mutate(ts = as.POSIXct(ts, format = "%Y-%m-%dT%H:%M:%OSZ"))

  #
#%>%
    # date = map(split(ts,"T")[1], time = split(ts,"T")[2])
         # ,
         # time = split(ts, "T")[1]
         # )

         #, 12,20), "%h:%m:%s")) ## THIS ISN"T WORKING


usethis::use_data(extended_example, overwrite = TRUE)

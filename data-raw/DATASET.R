## code to prepare `DATASET` dataset goes here

usethis::use_data(DATASET, overwrite = TRUE)

# [Template above; actual code below]--------------------------

## code to prepare `extended_example` dataset goes here
extended_example <- jsonlite::fromJSON(txt = "data-raw/extended_example.json", flatten = TRUE) %>%
  rename(song = master_metadata_track_name, artist = master_metadata_album_artist_name,
         album = master_metadata_album_album_name) %>%
  select(ts, ms_played, song, artist, album, reason_start, reason_end)

usethis::use_data(extended_example, overwrite = TRUE)

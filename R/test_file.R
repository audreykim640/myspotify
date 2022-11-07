# messing with data frames

Search <- jsonlite::fromJSON(txt = 'beata_spotify_data/SearchQueries.json', flatten = "true")

library <- jsonlite::fromJSON(txt = 'beata_spotify_data/YourLibrary.json', flatten = "true")

part1 <- library[["tracks"]]


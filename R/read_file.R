# import jsonlite
# store dataframe in global env in preselected name

function(filepath) {
  jsonlite::fromJSON(txt = 'my_spotify_data/MyData/endsong.json', flatten = "true")
}

temp <- jsonlite::fromJSON(txt = 'my_spotify_data/MyData/endsong.json', flatten = "true")
# data <- as.data.frame(temp)

function(filepath){
  jsonlite::fromJSON(txt = 'beata_spotify_data/SearchQueries.json', flatten = "true" )
}
Search <- jsonlite::fromJSON(txt = 'beata_spotify_data/SearchQueries.json', flatten = "true")

function(filepath){
  jsonlite::fromJSON(txt = 'beata_spotify_data/YourLibrary.json', flatten = "true" )
}
library <- jsonlite::fromJSON(txt = 'beata_spotify_data/YourLibrary.json', flatten = "true")

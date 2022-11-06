# import jsonlite
# store dataframe in global env in preselected name

function(filepath) {
  jsonlite::fromJSON(txt = 'my_spotify_data/MyData/endsong.json', flatten = "true")
}

temp <- jsonlite::fromJSON(txt = 'my_spotify_data/MyData/endsong.json', flatten = "true")
# data <- as.data.frame(temp)

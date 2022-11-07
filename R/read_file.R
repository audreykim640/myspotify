#' Read Spotify endsong.json file to dataframe
#'
#' @param path_start The file path up to (but not including) where the my_spotify_data folder is stored
#'
#' @return Data frame (data.frame class) of Spotify listening history
#' @export
#' @import jsonlite
#'
#' @examples
read_file <- function(path_start, ...) {
  full_path <- paste(path_start, "my_spotify_data/MyData/endsong.json", sep = "")
  jsonlite::fromJSON(txt = 'my_spotify_data/MyData/endsong.json', flatten = "true")
}


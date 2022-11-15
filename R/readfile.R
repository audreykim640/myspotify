#' Read-in Spotify data file
#'
#' @param filepath File path string to where the endsong.json file is hosted
#'
#' @return dataframe object with select columns
#' @export
#' @import dplyr
#' @import jsonlite
#'
#' @examples readfile()
readfile <- function(filepath) {
  jsonlite::fromJSON(txt = filepath, flatten = TRUE) %>%
    rename(song = master_metadata_track_name,
           artist = master_metadata_album_artist_name,
           album = master_metadata_album_album_name) %>%
    select(ts, ms_played, song, artist, album, reason_start, reason_end) %>%
    mutate(ts = as.POSIXct(ts, format = "%Y-%m-%dT%H:%M:%OSZ"))
}

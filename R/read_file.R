#' Read-in Spotify JSON data file
#'
#' @param filepath File path string to where the endsong.json file is hosted
#'
#' @return dataframe object with select columns
#' @export
#' @import dplyr
#' @import jsonlite
#'
#' @examples read_file()
readfile <- function(filepath) {
  jsonlite::fromJSON(txt = filepath, flatten = TRUE) %>%
    rename(song = master_metadata_track_name,
           artist = master_metadata_album_artist_name,
           album = master_metadata_album_album_name) %>%
    select(ts, ms_played, song, artist, album, reason_start, reason_end) %>%
    tidyr::separate(col = ts, into = c("date", "time"), sep = "T") %>%
    mutate(date = as.Date(date, format = "%Y-%m-%d"), # should remain as.Date() for plot_dates() function
           time = as.POSIXct(substr(time, start = 1, stop = 8), format = "%H:%M:%S"),
           time = lubridate::force_tz(time, tzone = "GMT"),
           year = lubridate::year(date),
           month = lubridate::month(date),
           dayyear = date,
           monthyear = paste(lubridate::month(date), lubridate::year(date)))
}

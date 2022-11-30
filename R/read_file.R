#' Read-in Spotify JSON data file
#'
#' @param filepath File path string to where the endsong.json (or endsong_X.json) file is hosted
#'
#' @return dataframe object with select columns
#' @export
#' @import dplyr
#' @import lubridate
#' @importFrom jsonlite fromJSON
#' @importFrom tidyr separate
#'
#' @examples
#' read_file("C:/Users/SophiaSmith/Desktop/my_spotify_data/MyData/endsong_4.json")
#'
read_file <- function(filepath) {
    df <- fromJSON(txt = filepath, flatten = TRUE) %>%
    rename(song = master_metadata_track_name,
           artist = master_metadata_album_artist_name,
           album = master_metadata_album_album_name) %>%
    select(ts, ms_played, song, artist, album, reason_start, reason_end) %>%
    separate(col = ts, into = c("date", "time"), sep = "T") %>%
    mutate(date = as.Date(date, format = "%Y-%m-%d"), # should remain as.Date() for plot_dates() function
           time = as.POSIXct(substr(time, start = 1, stop = 8), format = "%H:%M:%S"),
           time = lubridate::force_tz(time, tzone = "GMT"),
           year = lubridate::year(date),
           month = factor(month.name[lubridate::month(date)],levels=month.name))
    df
}

globalVariables(c("date","year","time","ms_played","song","artist","album","reason_start","reason_end", "master_metadata_track_name",
                  "master_metadata_album_artist_name", "master_metadata_album_album_name", "ts"))

#' Read-in Spotify JSON data files
#'
#' @param ... Links or file path strings to where the endsong.json (or endsong_X.json) file is hosted, separated by commmas
#'
#' @return dataframe object with select columns
#' @export
#' @import dplyr
#' @import lubridate
#' @importFrom jsonlite fromJSON
#' @importFrom tidyr separate
#' @importFrom purrr map_dfr
#'
#' @examples
#' read_file("https://bit.ly/github_json_file")
read_file <- function(...) {
  single_file <- function(filepath) {
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

  list <- list(...)
  map_dfr(list, single_file)

}

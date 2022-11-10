
#' Example of personal data (extended version) downloaded from Spotify
#'
#' Listening history data from Spotify including song/podcast information
#' and interaction with given songs
#'
#' @format ## `extended_example`
#' A data frame with 7,240 rows and 60 columns:
#' \describe{
#'   \item{ts}{Time stamp (date and time in Coordinated Universal Time) of song end}
#'   \item{ms_played}{Number of milliseconds played of the song}
#'   \item{song}{Name of the song played}
#'   \item{artist}{Artist of the song played}
#'   \item{album}{Album that the song belongs to}
#'   \item{reason_start, reason_end}{Reasons for starting and ending of a certain song}
#'   ...
#' }
#' @source Downloaded from personal account Privacy Settings on <https://spotify.com>
"extended_example"

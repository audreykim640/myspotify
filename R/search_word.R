search_word <- function(df, word) {
  sorted_table <- df %>%
    select(song, artist, album) %>%
    distinct() %>%
    filter(grepl(word, song, ignore.case = TRUE))
  sorted_table
}

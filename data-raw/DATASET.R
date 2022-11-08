## code to prepare `DATASET` dataset goes here

usethis::use_data(DATASET, overwrite = TRUE)

# [Template above; actual code below]--------------------------

## code to prepare `extended_example` dataset goes here
extended_example <- jsonlite::fromJSON(txt = "data-raw/extendeddata_example.json", flatten = TRUE)

usethis::use_data(extended_example, overwrite = TRUE)

# This file is part of the standard setup for testthat.
# It is recommended that you do not modify it.
#
# Where should you do additional test configuration?
# Learn more about the roles of various files in:
# * https://r-pkgs.org/tests.html
# * https://testthat.r-lib.org/reference/test_package.html#special-files

library(testthat)
library(myspotify)

test_check("myspotify")

library(tidyverse)


most_played_artist <- function(temp){
  sorted_table <- temp %>%
    count(master_metadata_album_artist_name) %>%
    arrange(desc(n))
  most_played <- sorted_table[1,1]
  print(paste("Your most played artist of all time is ", most_played, "!", sep=""))
}





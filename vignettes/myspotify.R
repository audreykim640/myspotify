## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(ggplot2)
library(dplyr)

## ----setup--------------------------------------------------------------------
library(myspotify)

## ----loading_packages, include=FALSE------------------------------------------
library(devtools)
devtools::install_github("audreykim640/myspotify")
library(dplyr)
library(ggplot2)
library(myspotify)

## ---- message = FALSE---------------------------------------------------------
install.packages("devtools")
library(devtools)
devtools::install_github("audreykim640/myspotify")

## ----example_data_download----------------------------------------------------
# example:
# my_data <- read_file("workspace/my_spotify_data/myData/endsong_0.json",
#                      "workspace/my_spotify_data/myData/endsong_1.json",
#                      "workspace/my_spotify_data/myData/endsong_2.json")

## -----------------------------------------------------------------------------
head(extended_example, 5)



<!-- README.md is generated from README.Rmd. Please edit that file -->

# myspotify

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/myspotify)](https://CRAN.R-project.org/package=myspotify)
<!-- badges: end -->

The goal of `myspotify` is to to read personal Spotify data and complete
a series of analyses. Spotify is a popular music and podcast streaming
app globally.

## Purpose

Spotify, a popular music streaming platform, offers users the option to
download their personal usage history data. `myspotify` seeks to provide
tools to allow users to read and visualize their data to learn more
about their listening habits. The idea is somewhat similar to “Spotify
Wrapped,” a personalized summary that Spotify releases annually, but
this can assess history beyond just a year and allows the user to delve
into the patterns of the songs they listen to on Spotify.

## Target Audience

Open to all Spotify users who are interested in some visual breakdowns
of their listening habits and who are willing to wait a few days to
receive their data! (Account type doesn’t matter.)

## Installation

You can install the development version of myspotify from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("audreykim640/myspotify")
```

## Project phase 3 proposal

We propose to expand this package to include more functions that allow
users to take a deeper dive into their listening habits with
visualizations and summary statistics: e.g., more customization in
existing functions, viewing top artists/consumption habits, habits over
time, patterns in listening habits.

## Note about testing

There’s a test for the dataset in this package, but the rest of the
package (functions) return plots. We did not write tests for these, as
the suggested package, `vdiff`, does not exist for our working version
of R.

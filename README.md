
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
receive their data (Account type doesn’t matter). Users can request
their data by using the Download Your Data tool on the Privacy Settings
section of their account page or contacting Spotify directly
(<privacy@spotify.com>). Users will receive an email where they can
download a ZIP file of their personal data.

## Installation

You can install the development version of myspotify from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("audreykim640/myspotify")
#> Skipping install of 'myspotify' from a github remote, the SHA1 (8b4b184e) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

## Available tables

- `extended_example`: example dataset of Spotify listening history from
  one of the authors
- Load your own!
  - After loading the package and downloading your data from Spotify
    (instructions
    [here](https://github.com/audreykim640/myspotify/blob/main/vignettes/myspotify.Rmd)),
    run your data through the `read_file()` function:

``` r
# example:
# my_data <- read_file("workspace/my_spotify_data/myData/endsong_0.json",
#                      "workspace/my_spotify_data/myData/endsong_1.json",
#                      "workspace/my_spotify_data/myData/endsong_2.json")
```

**Other** `myspotify` **functions will not run without this step**. The
assigned variable (`my_data` in the example above) is what you can use
in conjunction with all of the other functions in the package.

## Example data visualizations

``` r
artist_trends(extended_example)
```

<img src="man/figures/README-examples pt 1-1.png" width="100%" />

``` r

# Spotify data by default includes all songs that started playing
# Say we only want to see artists whose songs we played for at least 2 minutes...
extended_example %>% 
  filter_playtime(length = 1) %>% 
  artist_trends()
```

<img src="man/figures/README-examples pt 1-2.png" width="100%" />

``` r
# Plot the top 5 most skipped songs
skipped_songs <- extended_example %>% 
  most_skipped() %>% 
  arrange(desc(skips)) %>% 
  head(5)
  
ggplot(skipped_songs, aes(x = song, y = skips)) +
  geom_col() +
  theme(axis.text.x = element_text(angle = -45, hjust = 0))
```

<img src="man/figures/README-examples pt 2-1.png" width="100%" />

## Note about testing

There’s a test for the dataset in this package, but the rest of the
package (functions) return plots. We did not write tests for these, as
the suggested package, `vdiff`, does not exist for our working version
of R.

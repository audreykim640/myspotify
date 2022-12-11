artist <- c("Jon", "Bill", "Maria", "Ben", "Tina")
ms_played <- c(60000, 4000, 80000, 120000, 300) # three represent ms > 1 min

df <- data.frame(artist, ms_played)

test_that("filter_playtime() works", {
  expect_equal(nrow(filter_playtime(df, length = 1)), 3)
})

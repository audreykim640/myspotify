test_that("Num rows in extended_example", {
  expect_equal(nrow(extended_example), 10835)
})

test_that("Num cols in extended_example", {
  expect_equal(ncol(extended_example), 9)
})

test_that("Col names", {
  expect_equal(stringr::str_sort(names(extended_example)),
               stringr::str_sort(c("ts","time","ms_played","song","artist","album","reason_start","reason_end")))
})


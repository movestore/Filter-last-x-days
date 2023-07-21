library('move2')

test_data <- test_data("input2.rds") #file must be move2!

test_that("happy path", {
  actual <- rFunction(data = test_data, time_now="2015-02-01T00:00:00Z",dur=14,dur_unit="days")
  expect_equal(nrow(actual), 31)
  expect_equal(length(unique(mt_track_id(actual))),2)
})

test_that("year not included", {
  actual <- rFunction(data = test_data, time_now=NULL,dur=14,dur_unit="days")
  expect_null(actual)
})

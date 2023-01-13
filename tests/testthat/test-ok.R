test_that("division works", {
  expect_equal(test_object[["b"]] / 2, 1)
})

test_that("substraction works", {
  expect_equal(test_object[["a"]] - 1, 0)
})

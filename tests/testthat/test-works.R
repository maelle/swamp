test_object <- list(a = 1, b = 2)

test_that("multiplication works", {
  expect_equal(test_object[["b"]] * 2, 4)
})

test_that("addition works", {
  expect_equal(test_object[["a"]] + 2, 3)
})

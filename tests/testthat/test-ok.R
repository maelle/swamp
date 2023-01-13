test_that("division works", {
  test_object <- basic_list()
  expect_equal(test_object[["b"]] / 2, 1)
})

test_that("substraction works", {
  test_object <- basic_list()
  expect_equal(test_object[["a"]] - 1, 0)
})

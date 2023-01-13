test_that("multiplication works", {
  test_object <- basic_list()
  expect_equal(test_object[["b"]] * 2, 4)
})

test_that("addition works", {
  test_object <- basic_list()
  expect_equal(test_object[["a"]] + 2, 3)
})

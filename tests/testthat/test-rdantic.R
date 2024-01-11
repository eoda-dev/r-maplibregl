test_that("rdantic", {
  # Prepare
  l <- list(a = 1, b = "test")
  types <- list(is.numeric, is.character)

  # Act
  l <- rdantic(l, types)

  # Assert
  expect_equal(l$a, 1)
  expect_equal(l$b, "test")
})

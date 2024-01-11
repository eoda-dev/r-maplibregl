test_that("rdantic", {
  # Prepare
  l <- list(a = 1, b = "test", d = NULL)
  types <- list(a = is.numeric, b = is.character, d = is.numeric)

  # Act
  l <- rdantic(l, types)

  # Assert
  expect_equal(l$a, 1)
  expect_equal(l$b, "test")
})

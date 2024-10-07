test_that("layer spec", {
  # Prepare
  id <- "test"
  type <- "fill"

  # Act
  layer <- layer(
    id = id,
    type = type
  )

  # Assert
  expect_equal(layer$id, id)
  expect_equal(layer$type, type)
  expect_s3_class(layer, c("list"))
  expect_s3_class(layer, c("MapLibreLayer"))
})

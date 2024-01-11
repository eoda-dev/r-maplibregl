test_that("layer spec", {
  # Prepare
  id <- "test"
  type <- "fill"

  # Act
  layer <- Layer(
    id = id,
    type = type
  )
  print(class(layer))

  # Assert
  expect_equal(layer$id, id)
  expect_equal(layer$type, type)
  expect_s3_class(layer, "MapLibreLayer")
})

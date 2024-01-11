test_that("marker spec", {
  # Prepare
  lng_lat <- c(5, 5)

  # Act
  marker <- Marker(lng_lat)

  # Assert
  expect_equal(marker$lngLat, lng_lat)
  expect_s3_class(marker, "list")
  expect_s3_class(marker, "MapLibreMarker")
})

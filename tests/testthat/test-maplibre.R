test_that("base map", {
  # Prepare
  m <- maplibre(map_options = map_options())
  m0 <- suppressWarnings(maplibre())

  # Act

  # Assert

  expect_equal(m$x$mapOptions, list(style = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json"))
  expect_equal(m0$x$mapOptions, list(style = "https://basemaps.cartocdn.com/gl/dark-matter-gl-style/style.json"))
  expect_s3_class(m, c("maplibre", "htmlwidget"))
  expect_s3_class(m0, c("maplibre", "htmlwidget"))
})

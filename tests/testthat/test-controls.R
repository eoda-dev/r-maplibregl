test_that("navigation control", {
  # prepare

  # act
  m0 <- maplibre(map_options()) |>
    navigation_control(position = "top-left", visualize_pitch = TRUE, show_compass = FALSE, show_zoom = FALSE)

  m1 <- maplibre(map_options()) |>
    navigation_control(position = "bottom-right", visualize_pitch = FALSE, show_compass = TRUE, show_zoom = FALSE)

  m2 <- maplibre(map_options()) |>
    navigation_control(position = "bottom-left", visualize_pitch = FALSE, show_compass = FALSE, show_zoom = TRUE)

  # assert
  expect_equal(
    m0$x$calls,
    list(
      list(
        "addControl",
        list(
          "NavigationControl",
          list(
            showCompass = FALSE,
            showZoom = FALSE,
            visualizePitch = TRUE
          ),
          "top-left"
        )
      )
    )
  )

  expect_equal(
    m1$x$calls,
    list(
      list(
        "addControl",
        list(
          "NavigationControl",
          list(
            showCompass = TRUE,
            showZoom = FALSE,
            visualizePitch = FALSE
          ),
          "bottom-right"
        )
      )
    )
  )

  expect_equal(
    m2$x$calls,
    list(
      list(
        "addControl",
        list(
          "NavigationControl",
          list(
            showCompass = FALSE,
            showZoom = TRUE,
            visualizePitch = FALSE
          ),
          "bottom-left"
        )
      )
    )
  )

  expect_s3_class(m0, c("maplibre", "htmlwidget"))
  expect_s3_class(m1, c("maplibre", "htmlwidget"))
  expect_s3_class(m2, c("maplibre", "htmlwidget"))
})


test_that("scale control", {
  m0 <- maplibre(map_options()) |>
    scale_control(
      position = "top-left",
      max_width = 200,
      unit = "metric"
    )
  m1 <- maplibre(map_options()) |>
    scale_control(
      position = "bottom-right",
      max_width = 100,
      unit = "imperial"
    )

  expect_equal(
    m0$x$calls,
    list(
      list(
        "addControl",
        list(
          "ScaleControl",
          list(
            maxWidth = 200,
            unit = "metric"
          ),
          "top-left"
        )
      )
    )
  )

  expect_equal(
    m1$x$calls,
    list(
      list(
        "addControl",
        list(
          "ScaleControl",
          list(
            maxWidth = 100,
            unit = "imperial"
          ),
          "bottom-right"
        )
      )
    )
  )
  expect_s3_class(m0, c("maplibre", "htmlwidget"))
  expect_s3_class(m1, c("maplibre", "htmlwidget"))
})


test_that("geolocator control", {
  m0 <- maplibre(map_options()) |>
    geolocate_control(position = "top-left",
                      show_accuracy_circle = T,
                      show_user_location = T,
                      track_user_location = T,
                      fit_bounds_options = list(list(linear = T)))

  expect_equal(
    m0$x$calls,
    list(
      list(
        "addControl",
        list(
          "GeolocateControl",
          list(
            showAccuracyCircle = TRUE,
            showUserLocation = TRUE,
            trackUserLocation = TRUE,
            FitBoundsOptions = list(linear = TRUE)
          ),
          "top-left"
        )
      )
    )
  )

  expect_s3_class(m0, c("maplibre", "htmlwidget"))
})

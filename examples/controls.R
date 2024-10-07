# Add Navigation control

maplibre(map_options()) |>
  navigation_control(
    position = "top-left",
    visualize_pitch = TRUE,
    show_compass = TRUE,
    show_zoom = TRUE
  )


# Add Scale control

maplibre(map_options()) |>
  scale_control(
    position = "top-left",
    max_width = 200,
    unit = "metric"
  )

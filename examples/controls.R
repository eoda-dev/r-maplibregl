# Add Navigation control

maplibre(map_options()) |>
  navigation_control(
    position = "top-left",
    visualize_pitch = TRUE,
    show_compass = TRUE,
    show_zoom = TRUE
  )

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
# Add Geolocate control

maplibre(map_options()) |>
  add_control(control_name = "GeolocateControl", control_position = "top-left")


maplibre(map_options()) |>
  geolocate_control(position = "top-left",show_accuracy_circle = TRUE, show_user_location = TRUE,
                    track_user_location = TRUE, fit_bounds_options = list(linear = FALSE))

map_options <- map_options(
  center = c(-123.1256, 49.24658),
  hash = TRUE,
  pitch = 0,
  style = basemaps$carto$dark_matter
)

# add control uses add_call to add a control to the map widget
maplibre(map_options, zoom = 12) |>
  add_control("NavigationControl", "top-left", showCompass = FALSE)

# this is equal to:
maplibre(map_options, zoom = 12) |>
  add_call("addControl", "NavigationControl", list(showCompass = FALSE), "top-left")

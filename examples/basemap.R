map_options <- mapOptions(
  center = c(-123.1256, 49.24658),
  hash = TRUE,
  pitch = 0,
  style = basemaps$carto$dark_matter,
  test = NULL
)
maplibre(map_options, zoom = 12) |>
  add_control("NavigationControl", "top-left", showCompass = F)


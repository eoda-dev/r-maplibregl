library(maplibre)

earthquakes_source <- list(
  type = "geojson",
  data = "https://docs.mapbox.com/mapbox-gl-js/assets/earthquakes.geojson"
)

earthquakes_layer <- layer(
  id = "earthquakes",
  type = "circle",
  source = earthquakes_source,
  paint = list("circle-color" = "yellow", "circle-radius" = 2)
)

maplibre() |>
  add_layer(earthquakes_layer)

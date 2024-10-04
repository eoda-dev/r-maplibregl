library(maplibre)

earthquakes_source <- list(
  type = "geojson",
  data = "https://docs.mapbox.com/mapbox-gl-js/assets/earthquakes.geojson"
)

earthquakes_layer <- Layer(
  id = "earthquakes",
  type = "circle",
  source = earthquakes_source,
  paint = list("circle-color" = "yellow", "circle-radius" = 2)
)

# Adds a tooltip that appears when hovering over it

maplibre() |>
  add_layer(earthquakes_layer) |>
  add_tooltip("earthquakes", prop = "mag")

# Adds a popup that appears when clicking on the layer

maplibre() |>
  add_layer(earthquakes_layer) |>
  add_popup("earthquakes", prop = "mag")

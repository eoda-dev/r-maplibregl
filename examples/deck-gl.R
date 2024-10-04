deck_grid_layer <- list(
  "@@type" = "GridLayer",
  id = "GridLayer",
  data = "https://raw.githubusercontent.com/visgl/deck.gl-data/master/website/sf-bike-parking.json",
  extruded = TRUE,
  getPosition = "@@=COORDINATES",
  getColorWeight = "@@=SPACES",
  getElevationWeight = "@@=SPACES",
  elevationScale = 4,
  cellSize = 200,
  pickable = TRUE
)

setup <- mapOptions(
  center = list(-122.4, 37.74),
  zoom = 12,
  pitch = 40,
  hash = TRUE
)

maplibre(setup, deck = TRUE) |>
  add_deck_layers(list(deck_grid_layer))

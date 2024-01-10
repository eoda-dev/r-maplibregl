#' @export
layer <- function(type, id, source = NULL, paint = NULL, layout = NULL, ...) {
  list(
    type = type,
    id = id,
    source = source,
    paint = paint,
    layout = layout
  )|>
    purrr::compact()
}

#' @export
add_layer <- function(.map, layer) {
  .map |> add_call("addLayer", layer)
}

run_layer_example <- function() {
  maplibre() |>
    add_layer(layer(
      id="earthquakes", type="circle",
      source=list(type="geojson", data="https://docs.mapbox.com/mapbox-gl-js/assets/earthquakes.geojson"),
      paint = list("circle-color" = "yellow"))
    )
}

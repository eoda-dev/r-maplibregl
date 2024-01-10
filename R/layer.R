#' @export
layer <- function(type, id, source = NULL, paint = NULL, layout = NULL, ...) {
  list(
    type = type,
    id = id,
    source = source,
    paint = paint,
    layout = layout
  ) |>
    purrr::compact()
}

#' @export
add_layer <- function(.map, layer) {
  .map |> add_call("addLayer", layer)
}

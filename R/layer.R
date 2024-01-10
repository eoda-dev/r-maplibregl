#' Create a layer
#'
#' @param type
#' @param id
#' @param source
#' @param paint
#' @param layout
#'
#' @export
Layer <- function(type, id, source = NULL, paint = NULL, layout = NULL, ...) {
  lay <- list(
    type = type,
    id = id,
    source = source,
    paint = paint,
    layout = layout
  ) |>
    purrr::compact()
  class(lay) <- "MapLibreLayer"
  return(lay)
}


#' Add a layer to map
#'
#' @param .map
#' @param layer
#'
#' @export
add_layer <- function(.map, layer) {
  .map |> add_call("addLayer", layer)
}

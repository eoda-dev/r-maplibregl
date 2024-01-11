#' Create a layer
#'
#' @param type
#' @param id
#' @param source
#' @param paint
#' @param layout
#'
#' @example examples/layers.R
#'
#' @export
Layer <- function(type, id, source = NULL, paint = NULL, layout = NULL, ...) {
  types <- list(type = is.character, id = is.character, source = is.list, paint = is.list, layout = is.list)
  c(rdantic(
    list(
      type = type,
      id = id,
      source = source,
      paint = paint,
      layout = layout
    ), types
  ), ...) |>
    purrr::compact() |>
    set_maplibre_class("MapLibreLayer")
}


#' Add a layer to map
#'
#' @param .map
#' @param layer
#'
#' @example examples/layers.R
#' @export
add_layer <- function(.map, layer) {
  .map |> add_call("addLayer", layer)
}


#' Add popup property to layer
#'
#' @param .map
#' @param layer_id
#' @param prop
#'
#' @return
#' @export
#'
#' @example examples/layers.R
add_popup <- function(.map, layer_id, prop) {
  .map |> add_call("addPopup", layer_id, prop)
}


#' Title
#'
#' @param .map
#' @param layer_id
#' @param prop
#'
#' @return
#' @export
#'
#' @examples
#' @example examples/layers.R
add_tooltip <- function(.map, layer_id, prop) {
  .map |> add_call("addTooltip", layer_id, prop)
}

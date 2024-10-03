#' Create a layer
#'
#' @param type A layer type
#' @param id
#' @param source
#' @param paint
#' @param layout
#'
#' @example examples/layers.R
#'
#' @export
Layer <- function(type, id, source = NULL, paint = NULL, layout = NULL, ...) {
  if(!is.element(type, LayerType)){
    stop(
      glue::glue("type needs to be one of ",
                 glue::glue_collapse(unlist(maplibre::LayerType), sep = " ")
      )
    )
  }
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

#' Rendering types of layers
#' @details
#' Rendering types of layers
#' \itemize{
#'   \item \strong{CIRCLE}: A filled circle.
#'   \item \strong{FILL}: A filled polygon with an optional stroked border.
#'   \item \strong{FILL_EXTRUSION}: An extruded polygon.
#'   \item \strong{LINE}: A stroked line.
#'   \item \strong{SYMBOL}: An icon or a text label.
#'   \item \strong{RASTER}: Raster map textures such as satellite imagery.
#'   \item \strong{HEATMAP}: A heatmap.
#'   \item \strong{HILLSHADE}: A Client-side hillshading visualization based on DEM data.
#'   \item \strong{BACKGROUND}: A background color or pattern.
#' }
#'
#' @export
#'
LayerType <- list(
  CIRCLE = "circle",
  FILL = "fill",
  FILL_EXTRUSION = "fill-extrusion",
  LINE = "line",
  SYMBOL = "symbol",
  RASTER = "raster",
  HEATMAP = "heatmap",
  HILLSHADE = "hillshade",
  BACKGROUND = "background"
)
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

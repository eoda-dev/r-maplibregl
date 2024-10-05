#' Create a layer
#'
#' @param type The type of the layer.
#' @param id The unique ID of the layer
#' @param source The name (unique ID) of a source or a source object to be used for the layer.
#' @param paint The paint properties of the layer.
#' @param layout The layout properties of the layer.
#' @param ... Additional layer options
#'
#' @example examples/layers.R
#'
#' @export
Layer <- function(type, id, source = NULL, paint = NULL, layout = NULL, ...) {
  if (!is.element(type, LayerType)) {
    stop(
      glue::glue(
        "type needs to be one of ",
        glue::glue_collapse(unlist(maplibre::LayerType), sep = " "),
        "\nSee ?maplibre::LayerType for more information."
      )
    )
  }

  if (is.sf(source)) source <- sf_as_geojson_source(source)

  c(rdantic(
    list(
      type = type,
      id = id,
      source = source,
      paint = paint,
      layout = layout
    ), TYPES_LAYER
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
#' @inherit add_control params return
#' @param layer A [Layer()] object
#' @param before_id The ID of an existing layer to insert the new layer before,
#' resulting in the new layer appearing visually beneath the existing layer.
#' If `None`, the new layer will appear above all other layers.
#'
#' @example examples/layers.R
#' @export
add_layer <- function(.map, layer, before_id = NULL) {
  .map |> add_call("addLayer", layer, before_id)
}


#' Add popup property to layer
#' @param .map A [maplibre()] HTML widget
#' @param layer_id The layer to which the popup is added.
#' @param prop The property of the source to be displayed. If `None`, all properties are displayed.
#' @param template A mustache template. If supplied, `prop` is ignored.
#' @returns The updated [maplibre()] HTML widget
#' @export
#'
#' @example examples/layers.R
add_popup <- function(.map, layer_id, prop = NULL, template = NULL) {
  .map |> add_call("addPopup", layer_id, prop, template)
}


#' Add tooltip property to layer
#'
#' @inherit add_popup params return
#'
#' @export
#'
#' @example examples/layers.R
add_tooltip <- function(.map, layer_id, prop = NULL, template = NULL) {
  .map |> add_call("addTooltip", layer_id, prop, template)
}

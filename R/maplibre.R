#' Create a Map Object for MapLibre GL
#'
#'
#' @param map_options [mapOptions()]
#' @param width,height The width and the height of the widget.
#' @param elementId The unique ID of the widgets's HTML element.
#' @param ... Further map options.
#' @import htmlwidgets
#'
#' @export
#' @example examples/basemap.R
#'
maplibre <- function(map_options = mapOptions(), width = "100%", height = NULL, elementId = NULL, ...) {
  if (inherits(map_options$bounds, "bbox")) {
    map_options$bounds <- unname(map_options$bounds)
  }
  map_options <- c(map_options, ...)
  map_options <- map_options[!sapply(map_options, is.null)]

  x <- list(
    mapOptions = map_options,
    calls = list()
  )

  # create widget
  htmlwidgets::createWidget(
    name = "maplibre",
    x,
    width = width,
    height = height,
    package = "maplibre",
    elementId = elementId
  )
}

#' Add Map Options to a Map Object
#'
#' @param style
#' @param antialias
#' @param attribution_control
#' @param bearing
#' @param bearing_snap
#' @param bounds
#' @param box_zoom
#' @param center
#' @param click_tolerance
#' @param custom_attribution
#' @param double_click_zoom
#' @param fade_duration
#' @param fit_bounds_options
#' @param hash
#' @param interactive
#' @param keyword
#' @param max_bounds
#' @param max_pitch
#' @param max_zoom
#' @param min_pitch
#' @param min_zoom
#' @param pitch
#' @param scroll_zoom
#' @param zoom
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
mapOptions <- function(style = basemaps$carto$dark_matter,
                       antialias = NULL,
                       attribution_control = NULL,
                       bearing = NULL,
                       bearing_snap = NULL,
                       bounds = NULL,
                       box_zoom = NULL,
                       center = NULL,
                       click_tolerance = NULL,
                       custom_attribution = NULL,
                       double_click_zoom = NULL,
                       fade_duration = NULL,
                       fit_bounds_options = NULL,
                       hash = NULL,
                       interactive = NULL,
                       keyword = NULL,
                       max_bounds = NULL,
                       max_pitch = NULL,
                       max_zoom = NULL,
                       min_pitch = NULL,
                       min_zoom = NULL,
                       pitch = NULL,
                       scroll_zoom = NULL,
                       zoom = NULL,
                       ...) {
  # BODY
  purrr::compact(
    rdantic(
      list(
        antialias = antialias,
        attributionControl = attribution_control,
        bearing = bearing,
        bearingSnap = bearing_snap,
        bounds = bounds,
        boxZoom = box_zoom,
        center = center,
        clickTolerance = click_tolerance,
        customAttribution = custom_attribution,
        doubleClickZoom = double_click_zoom,
        fadeDuration = fade_duration,
        fitBoundsOptions = fit_bounds_options,
        hash = hash,
        interactive = interactive,
        keyword = keyword,
        maxBounds = max_bounds,
        maxPitch = max_pitch,
        maxZoom = max_zoom,
        minPitch = min_pitch,
        minZoom = min_zoom,
        pitch = pitch,
        scrollZoom = scroll_zoom,
        style = style,
        zoom = zoom
      ), TYPES_MAP_OPTIONS
    ),
    ...
  )
}


#' Shiny bindings for maplibre
#'
#' Output and render functions for using maplibre within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a maplibre
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name maplibre-shiny
#'
#' @export
maplibreOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "maplibre", width, height, package = "maplibre")
}

#' @rdname maplibre-shiny
#' @export
renderMaplibre <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(expr, maplibreOutput, env, quoted = TRUE)
}

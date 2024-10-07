#' Create a Map Object for MapLibre GL
#'
#'
#' @param map_options [map_options()]
#' @param deck Whether to add `deck.gl` HTML dependency.
#' @param width,height The width and the height of the widget.
#' @param element_id The unique ID of the widgets's HTML element.
#' @param ... Further map options.
#' @import htmlwidgets
#'
#' @export
#' @example examples/basemap.R
#'
maplibre <- function(map_options = NULL,
                     deck = FALSE,
                     width = "100%", height = NULL, element_id = NULL, ...) {
  if (is.null(map_options)) {
    map_options <- map_options()
    warning("map_options is NULL. Using map_options() with dark-matterhl-style as style.")
  }
  if (inherits(map_options$bounds, "bbox")) {
    map_options$bounds <- unname(map_options$bounds)
  }
  map_options <- c(map_options, ...)
  map_options <- map_options[!sapply(map_options, is.null)]

  x <- list(
    mapOptions = map_options,
    calls = list()
  )

  # Dependencies
  dependencies <- list()
  if (isTRUE(deck)) {
    dependencies <- c(dependencies, list(dependency_deck_gl, dependency_deck_gl_json))
  }

  # create widget
  htmlwidgets::createWidget(
    name = "maplibre",
    x,
    width = width,
    height = height,
    package = "maplibre",
    dependencies = dependencies,
    elementId = element_id
  )
}

#' Add Map Options to a Map Object
#'
#' @param style The map's MapLibre style. This must be a JSON object conforming to the schema described in the \href{https://maplibre.org/maplibre-style-spec/}{MapLibre Style Specification}, or a URL to such JSON.
#' @param antialias If TRUE, the gl context will be created with MSAA antialiasing, which can be useful for antialiasing custom layers. Disabled by default as a performance optimization.
#' @param attribution_control If set, an AttributionControl will be added to the map with the provided options. To disable the attribution control, pass false. Note: showing the logo of MapLibre is not required for using MapLibre.
#' @param bearing The initial bearing (rotation) of the map, measured in degrees counter-clockwise from north. If bearing is not specified in the constructor options, MapLibre GL JS will look for it in the map's style object. If it is not specified in the style, either, it will default to 0.
#' @param bearing_snap The threshold, measured in degrees, that determines when the map's bearing will snap to north. For example, with a bearingSnap of 7, if the user rotates the map within 7 degrees of north, the map will automatically snap to exact north.
#' @param bounds The initial bounds of the map. If bounds is specified, it overrides center and zoom constructor options.
#' @param box_zoom If TRUE, the "box zoom" interaction is enabled
#' @param center The initial geographical centerpoint of the map. If center is not specified in the constructor options, MapLibre GL JS will look for it in the map's style object. If it is not specified in the style, either, it will default to (0, 0) Note: MapLibre GL JS uses longitude, latitude coordinate order (as opposed to latitude, longitude) to match GeoJSON.
#' @param click_tolerance The max number of pixels a user can shift the mouse pointer during a click for it to be considered a valid click (as opposed to a mouse drag).
#' @param double_click_zoom If TRUE, the "double click to zoom" interaction is enabled
#' @param fade_duration Controls the duration of the fade-in/fade-out animation for label collisions after initial map load, in milliseconds. This setting affects all symbol layers. This setting does not affect the duration of runtime styling transitions or raster tile cross-fading.
#' @param fit_bounds_options A \href{https://maplibre.org/maplibre-gl-js/docs/API/type-aliases/FitBoundsOptions/}{FitBoundsOptions} options object to use only when fitting the initial bounds provided above.
#' @param hash If TRUE, the map's position (zoom, center latitude, center longitude, bearing, and pitch) will be synced with the hash fragment of the page's URL. For example, http://path/to/my/page.html#2.59/39.26/53.07/-24.1/60. An additional string may optionally be provided to indicate a parameter-styled hash, e.g. http://path/to/my/page.html#map=2.59/39.26/53.07/-24.1/60&foo=bar, where foo is a custom parameter and bar is an arbitrary hash distinct from the map hash.
#' @param interactive If FALSE, no mouse, touch, or keyboard listeners will be attached to the map, so it will not respond to interaction.
#' @param keyboard If TRUE, keyboard shortcuts are enabled
#' @param maplibre_logo If TRUE, the MapLibre logo will be shown.
#' @param max_bounds If set, the map will be constrained to the given bounds.
#' @param max_pitch The maximum pitch of the map (0-85). Values greater than 60 degrees are experimental and may result in rendering issues.
#' @param max_zoom The maximum zoom level of the map (0-24).
#' @param min_pitch The minimum pitch of the map (0-85). Values greater than 60 degrees are experimental and may result in rendering issues.
#' @param min_zoom The minimum zoom level of the map (0-24).
#' @param pitch The initial pitch (tilt) of the map, measured in degrees away from the plane of the screen (0-85). If pitch is not specified in the constructor options, MapLibre GL JS will look for it in the map's style object. If it is not specified in the style, either, it will default to 0. Values greater than 60 degrees are experimental and may result in rendering issues.
#' @param scroll_zoom If TRUE, the "scroll to zoom" interaction is enabled.
#' @param zoom The initial zoom level of the map. If zoom is not specified in the constructor options, MapLibre GL JS will look for it in the map's style object. If it is not specified in the style, either, it will default to 0.
#' @param ... Additional parameters
#'
#' @return A list of map options.
#' @export
#' @references
#' Parameter descriptions are adapted from the Maplibre GL JS Project, please visit the official documentation at \url{https://maplibre.org/maplibre-gl-js/docs/API/type-aliases/MapOptions/}
#' @example examples/basemap.R
map_options <- function(style = maplibre::basemaps$carto$dark_matter,
                        antialias = NULL,
                        attribution_control = NULL,
                        bearing = NULL,
                        bearing_snap = NULL,
                        bounds = NULL,
                        box_zoom = NULL,
                        center = NULL,
                        click_tolerance = NULL,
                        double_click_zoom = NULL,
                        fade_duration = NULL,
                        fit_bounds_options = NULL,
                        hash = NULL,
                        interactive = NULL,
                        keyboard = NULL,
                        maplibre_logo = NULL,
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
  options <- rdantic(
    list(
      antialias = antialias,
      attributionControl = attribution_control,
      bearing = bearing,
      bearingSnap = bearing_snap,
      bounds = bounds,
      boxZoom = box_zoom,
      center = center,
      clickTolerance = click_tolerance,
      doubleClickZoom = double_click_zoom,
      fadeDuration = fade_duration,
      fitBoundsOptions = fit_bounds_options,
      hash = hash,
      interactive = interactive,
      keyboard = keyboard,
      maplibreLogo = maplibre_logo,
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
  )
  purrr::compact(
    c(
      options,
      list(...)
    )
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

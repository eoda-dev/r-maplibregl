#' Create a Marker
#'
#' @param lng_lat Longitude and latitude coordinates of the marker, measured in degrees based on WGS84 (EPSG:4326) standard.
#' @param popup The Popup that is displayed when a user clicks on the marker.
#' @param ... Additional marker options
#' @export
#' @example examples/markers.R
Marker <- function(lng_lat, popup = NULL, ...) {
  list(
    lngLat = lng_lat,
    popup = popup,
    options = MarkerOptions(...)
  ) |>
    purrr::compact() |>
    set_maplibre_class("MapLibreMarker")
}

#' Marker Options
#'
#' @param ... Additional marker options.
#' @param anchor A string indicating the part of the Marker that should be positioned closest to the coordinate set via the [Marker()] function. Options are 'center', 'top', 'bottom', 'left', 'right', 'top-left', 'top-right', 'bottom-left', and 'bottom-right'.
#' @param color The color to use for the default marker. The default is light blue.
#' @param pitchAlignment \code{map} aligns the Marker to the plane of the map. \code{viewport} aligns the Marker to the plane of the viewport. \code{auto} automatically matches the value of rotationAlignment.
#' @param rotationAlignment \code{map} aligns the Marker's rotation relative to the map, maintaining a bearing as the map rotates. \code{viewport} aligns the Marker's rotation relative to the viewport, agnostic to map rotations. \code{auto} is equivalent to viewport.
#' @param draggable A boolean indicating whether or not a marker is able to be dragged to a new position on the map.
#' @param rotation The rotation angle of the marker in degrees, relative to its respective rotationAlignment setting. A positive value will rotate the marker clockwise.
#' @param scale The scale to use for the default marker. The default scale corresponds to a height of 41px and a width of 27px.
#'
#' @references
#' Parameter descriptions are adapted from the Maplibre GL JS Project, please visit the official documentation at \url{https://maplibre.org/maplibre-gl-js/docs/API/type-aliases/MarkerOptions/}
#' @return A list of marker options
#' @export
#'
#' @example examples/markers.R
MarkerOptions <- function(anchor = NULL, color = NULL, pitchAlignment = NULL, rotationAlignment = NULL,
                          draggable = NULL, rotation = NULL, scale = NULL, ...) {
  marker_options <- list(...)
  stopifnot(sapply(marker_options[c("anchor", "color", "pitchAlignment", "rotationAlignment")], function(x) {
    is.null(x) | is.character(x)
  }))
  stopifnot(sapply(marker_options["draggable"], function(x) {
    is.null(x) | is.logical(x)
  }))
  stopifnot(sapply(marker_options[c("rotation", "scale")], function(x) {
    is.null(x) | is.numeric(x)
  }))
  marker_options <- marker_options |>
    purrr::compact()
  class(marker_options) <- "MarkerOptions"
  return(marker_options)
}

#' Add a marker to map
#'
#' @param .map A [maplibre()] HTML widget
#' @param marker A marker object defined using [Marker()]
#'
#' @export
#' @example examples/markers.R
add_marker <- function(.map, marker) {
  .map |> add_call("addMarker", marker)
}

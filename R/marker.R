#' Create a Marker
#'
#' @param lngLat
#' @param popup
#' @export
#' @example examples/markers.R
Marker <- function(lngLat, popup , ...) {
  mark <- list(
    lngLat  = lngLat,
    popup = popup,
    options = MarkerOptions(...)
  ) |>
    purrr::compact()
  class(mark) <- "MapLibreMarker"
  return(mark)
}

MarkerOptions <- function(...){
  marker_options <- list(...)
  stopifnot(sapply(marker_options[c("anchor", "color", "pitchAlignment", "rotationAlignment")], function(x){is.null(x) | is.character(x)}))
  stopifnot(sapply(marker_options["draggable"], function(x) {is.null(x) | is.logical(x)}))
  stopifnot(sapply(marker_options[c("rotation", "scale")], function(x) {is.null(x) | is.numeric(x)}))
  marker_options <- marker_options |>
    purrr::compact()
  class(marker_options) <- "MarkerOptions"
  return(marker_options)
}

#' Add a marker to map
#'
#' @param .map
#' @param marker
#'
#' @export
#' @example examples/markers.R
add_marker <- function(.map, marker) {
  .map |> add_call("addMarker", marker)
}

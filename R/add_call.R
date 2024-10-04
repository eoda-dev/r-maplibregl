#' Add a map method to a Map widget.
#'
#' @param .map A [maplibre()] HTML widget
#' @param .name The name of the map method to be executed
#' @param ... The arguments to be passed to the map method.
#'
#' @return The updated [maplibre()] HTML widget
#' @export
#'
#' @example examples/basemap.R
add_call <- function(.map, .name, ...) {
  pos <- length(.map$x$calls) + 1
  .map$x$calls[[pos]] <- list(
    .name, list(...) |> purrr::compact()
  )
  return(.map)
}

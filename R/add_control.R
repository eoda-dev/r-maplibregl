#' Title
#'
#' @param .map A [maplibre()] HTML widget
#' @param control_name The name of the control
#' @param control_position The position of the control.
#' @param ... Control options depending on the type of control.
#' @returns The updated [maplibre()] HTML widget
#' @export
#'
#' @examples
add_control <- function(.map, control_name = c(
                          "NavigationControl",
                          "ScaleControl", "FullscreenControl",
                          "GeolocateControl", "AttributionControl"
                        ),
                        control_position = c("top-left", "top-right", "bottom-left", "bottom-right"),
                        ...) {
  control_name <- match.arg(control_name)
  control_position <- match.arg(control_position)
  .map |>
    add_call("addControl", control_name, list(...), control_position)
}

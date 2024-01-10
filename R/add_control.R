#' Title
#'
#' @param map
#' @param control_name
#'
#' @return
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

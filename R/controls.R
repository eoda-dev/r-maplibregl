#' Add a control to a Map widget
#'
#' @param .map A [maplibre()] HTML widget
#' @param control_name The name of the control
#' @param control_position The position of the control.
#' @param ... Control options depending on the type of control.
#' @returns The updated [maplibre()] HTML widget
#' @export
#'
#' @example examples/basemap.R
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


#' Add navigation control to map
#' @inherit add_control params return
#' @param position The position of the control.
#' @param show_compass If TRUE the compass button is included.
#' @param show_zoom If TRUE the zoom-in and zoom-out buttons are included.
#' @param visualize_pitch If TRUE the pitch is visualized by rotating X-axis of compass.
#'
#' @export
#'
#' @example examples/controls.R
navigation_control <- function(.map,
                               position = c("top-left", "top-right", "bottom-left", "bottom-right"),
                               show_compass = TRUE,
                               show_zoom = TRUE,
                               visualize_pitch = TRUE) {
  control_options <- rdantic(
    list(
      showCompass = show_compass,
      showZoom = show_zoom,
      visualizePitch = visualize_pitch
    ),
    TYPES_NAVIGATION_CONTROL_OPTIONS
  )

  control_position <- match.arg(position)
  options <- purrr::compact(
    c(
      control_name = "NavigationControl", control_position = control_position,
      control_options
    )
  )

  do.call(add_control, args = list(.map = .map) |> append(options))
}

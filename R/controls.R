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
#' A NavigationControl control contains zoom buttons and a compass.
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


#' A ScaleControl control displays the ratio of a distance on the map to the corresponding distance on the ground.
#'
#' @inherit add_control params return
#' @inherit navigation_control params
#' @param max_width The maximum length of the scale control in pixels.
#' @param unit Unit of the distance ('imperial', 'metric' or 'nautical').
#'
#' @export
#'
#' @example examples/controls.R
scale_control <- function(.map,
                          position = c("top-left", "top-right", "bottom-left", "bottom-right"),
                          max_width = 100,
                          unit = c("imperial", "metric", "nautical")) {
  control_options <- rdantic(
    list(
      maxWidth = max_width,
      unit = match.arg(unit)
    ),
    TYPES_SCALE_CONTROL_OPTIONS
  )

  if(length(control_options)==0){
    control_options <- list("")
  }
  control_position <- match.arg(position)
  options <- purrr::compact(
    c(
      control_name = "ScaleControl", control_position = control_position,
      control_options
    )
  )

  do.call(add_control, args = list(.map = .map) |> append(options))
}


#' A GeolocateControl control provides a button that uses the browser's geolocation API to locate the user on the map.
#'
#' @inherit add_control params return
#' @inherit navigation_control params
#' @param show_accuracy_circle By default, if showUserLocation is true, a transparent circle will be drawn around the user location indicating the accuracy (95% confidence level) of the user's location. Set to FALSE to disable. Always disabled when showUserLocation is FALSE.
#' @param show_user_location By default a dot will be shown on the map at the user's location. Set to FALSE to disable.
#' @param track_user_location If TRUE the GeolocateControl becomes a toggle button and when active the map will receive updates to the user's location as it changes.
#' @param fit_bounds_options A options object to use when the map is panned and zoomed to the user's location. The default is to use a maxZoom of 15 to limit how far the map will zoom in for very accurate locations.
#' @param position_options Optional Geolocation APIs options
#'
#' @export
#'
#' @example examples/controls.R
geolocate_control <- function(.map,
                              position = c("top-left", "top-right", "bottom-left", "bottom-right"),
                              show_accuracy_circle = FALSE,
                              show_user_location = FALSE,
                              track_user_location = FALSE,
                              fit_bounds_options = NULL,
                              position_options = NULL){

  control_options <- c(
    rdantic(
      list(
        showAccuracyCircle = show_accuracy_circle,
        showUserLocation = show_user_location,
        trackUserLocation = track_user_location
      ),
      TYPES_GEOLOCATION_CONTROL_OPTIONS
    ),
    FitBoundsOptions = rdantic(
      fit_bounds_options, TYPES_FIT_BOUNDS_OPTIONS
    )

  )
  if(length(control_options)==0){
    control_options <- list("")
  }

  control_position <- match.arg(position)
  options <- purrr::compact(
    c(
      control_name = "GeolocateControl", control_position = control_position,
      control_options
    )
  )

  do.call(add_control, args = list(.map = .map) |> append(options))
}



#' A FullscreenControl control contains a button for toggling the map in and out of fullscreen mode
#'
#' @inherit add_control params return
#' @inherit navigation_control params
#'
#' @export
#'
#' @example examples/controls.R
fullscreen_control <- function(.map,
                               position = c("top-left", "top-right", "bottom-left", "bottom-right"),
                               ...){

  control_options <- list(...)
  if(length(control_options)==0){
    control_options <- list("")
  }
  control_position <- match.arg(position)
  options <- purrr::compact(
    c(
      control_name = "FullscreenControl", control_position = control_position,
      control_options
      )
  )

  do.call(add_control, args = (list(.map = .map) |> append(options)))

}

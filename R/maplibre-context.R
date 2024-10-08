is_maplibre_context <- function(widget) {
  return(!is.null(widget$session))
}

#' Context object to update a `maplibre()` HTML widget
#' Makes it possible to update your [maplibre()] HTML widget in Shiny apps.
#' @param output_id A maplibre output id set with [maplibreOutput()].
#' @param session A shiny session object.
#' @export
maplibre_context <- function(output_id, session = shiny::getDefaultReactiveDomain()) {
  ctx <- list(
    id = output_id,
    session = session,
    x = list(calls = list())
  )
  return(ctx)
}

send_maplibre_calls <- function(ctx) {
  # TODO: Rename 'pymaplibregl' in maplibre JS bindings
  handler_name <- glue::glue("maplibre-{id}", id = ctx$id)
  payload <- list(
    id = ctx$id,
    calls = ctx$x$calls
  )
  ctx$session$sendCustomMessage(handler_name, payload)
  invisible(ctx)
}

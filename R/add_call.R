#' Title
#'
#' @param .map
#' @param .name
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
add_call <- function(.map, .name, ...) {
  pos <- length(.map$x$calls) + 1
  .map$x$calls[[pos]] <- list(
    .name, list(...) |> purrr::compact()
  )
  return(.map)
}

set_maplibre_class <- function(.obj, class_name) {
  class(.obj) <- c(class(.obj), class_name)
  return(.obj)
}

rdantic <- function(.obj, types, test = 1L) {
  for (k in names(.obj)) {
    type_check <- types[[k]]
    value <- .obj[[k]]
    if (!is.null(value)) {
      if (!type_check(value)) {
        stop("Value of '", k, "' (\"", value, "\") failed test: ", deparse(substitute(type_check)), call. = FALSE)
      }
    }
  }
  return(.obj)
}

is.sf <- function(x) {
  inherits(x, "sf")
}

bbox_as_bounds <- function(bbox) {
  sf::st_as_sfc(bbox) |>
    sf::st_transform(4326) |>
    sf::st_bbox() |>
    as.vector()
}

set_maplibre_class <- function(.obj, class_name) {
  class(.obj) <- c(class(.obj), class_name)
  return(.obj)
}

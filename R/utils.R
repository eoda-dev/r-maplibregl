set_maplibre_class <- function(.obj, class_name) {
  class(.obj) <- c(class(.obj), class_name)
  return(.obj)
}

rdantic <- function(.obj, types, test = 1L) {
  for (i in 1:length(.obj)) {
    # print(.obj[[i]])
    # print(types[[i]])
    type_check <- types[[i]]
    value <- .obj[[i]]
    # stopifnot(type_check(value))
    if (!type_check(value)) {
      stop(value, " is not ", deparse(substitute(type_check)) , call.=FALSE)
    }
  }

  return(.obj)
}

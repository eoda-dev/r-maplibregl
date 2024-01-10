mapOptions <- function(style = basemaps$carto$dark_matter, ...){
  map_options <- list(style = style,
                      ...)
  return(map_options)
}


#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
#' @example examples/basemap.R
#'

maplibre <- function(map_options, width = NULL, height = NULL, elementId = NULL, ...) {
  if (inherits(map_options$bounds, "bbox")) {
    map_options$bounds <- unname(map_options$bounds)
  }
  map_options <- c(map_options, ...)
  map_options <- map_options[!sapply(map_options, is.null)]

  x <-   list(
    mapOptions = map_options,
    calls  = list()
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'maplibre',
    x,
    width = width,
    height = height,
    package = 'maplibre',
    elementId = elementId
  )
}

#' Shiny bindings for maplibre
#'
#' Output and render functions for using maplibre within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a maplibre
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name maplibre-shiny
#'
#' @export
maplibreOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'maplibre', width, height, package = 'maplibre')
}

#' @rdname maplibre-shiny
#' @export
renderMaplibre <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, maplibreOutput, env, quoted = TRUE)
}

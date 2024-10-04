#' Create a basemap style definition
#' @param sources The sources to be used for the basemap style.
#' @param layers The layers to be used for the basemap style.
#' @param name The name of the basemap style.
#' @returns list
#' @example examples/pmtiles.R
#' @export
construct_basemap_style <- function(sources, layers, name = "custom-basemap") {
  basemap_style <- list(
    name = name,
    version = 8L,
    sources = sources,
    layers = layers
  )
  return(rdantic(basemap_style, TYPES_BASEMAP_STYLE))
}

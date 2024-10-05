#' GeoJSON Source
#' @param data Either an URL or a GeoJSON object.
#' @param ... Further options.
#' @returns list
#' @export
geojson_source <- function(data, ...) {
  list(type = "geojson", data = data, ...)
}

sf_as_geojson_source <- function(x) {
  geojson_source(geojsonsf::sf_geojson(sf::st_transform(x, crs = 4326)))
}

#' Add a source to map
#' @inherit add_layer params return
#' @param id The unique ID of the source.
#' @param source The source to be added to the map.
#' @export
add_source <- function(.map, id, source) {
  if (is.sf(source)) source <- sf_as_geojson_source(source)
  add_call(.map, "addSource", id, source)
}

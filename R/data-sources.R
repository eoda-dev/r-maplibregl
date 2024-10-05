sf_as_geojson_source <- function(x) {
  list(
    type = "geojson",
    data = geojsonsf::sf_geojson(sf::st_transform(x, crs = 4326))
  )
}

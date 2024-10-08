nc <- sf::st_read(system.file("shape/nc.shp", package = "sf"))

# Wrong CRS
bounds <- sf::st_bbox(nc) |>
  unname() |>
  as.list()


nc_layer <- layer(
  type = "line",
  id = "nc",
  source = "nc-polygons"
)

maplibre(map_options(style = basemaps$carto$voyager, bounds = bounds)) |>
  add_source("nc-polygons", nc) |>
  add_layer(nc_layer)

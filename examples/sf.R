nc <- sf::st_read(system.file("shape/nc.shp", package="sf"))

sf::st_crs(nc)
sf::st_bbox(nc)

bounds <- sf::st_bbox(nc) |> bbox_as_bounds()

nc_layer <- layer(
  type = "line",
  id = "nc",
  source = nc
)

maplibre(map_options(style = basemaps$carto$voyager, bounds = bounds)) |>
  add_layer(nc_layer)

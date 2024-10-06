raster_source <- list(type = "raster",
                          tiles =
                            jsonlite::toJSON(c('https://tiles.stadiamaps.com/tiles/stamen_watercolor/{z}/{x}/{y}.jpg'))
                          ,
                          tileSize = 256
                        )

raster_layer <- Layer(
  id = "layer",
  type = "raster",
  source = raster_source
)

maplibre(map_options = mapOptions(zoom = 2, center = c(-74.5, 40))) |>
  add_layer(raster_layer)


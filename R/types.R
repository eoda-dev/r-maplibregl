TYPES_BASEMAP_STYLE <- list(
  name = is.character,
  version = is.integer,
  sources = is.list,
  layers = is.list
)

TYPES_LAYER <- list(
  type = is.character,
  id = is.character,
  source = function(x) {
    is.list(x) | is.character(x)
  },
  paint = is.list,
  layout = is.list
)

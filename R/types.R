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

TYPES_MAP_OPTIONS <- list(
  style = function(x) {
    is.list(x) | is.character(x)
  },
  antialias = is.logical,
  attributionControl = is.logical,
  bearing = function(x) {
    is.integer(x) | is.numeric(x)
  },
  bearingSnap = is.integer,
  bounds = is.list,
  boxZoom = is.logical,
  center = is.list,
  clickTolerance = function(x) {
    is.integer(x) | x == round(x, 0)
  },
  customAttribution = is.logical,
  doubleClickZoom = is.logical,
  fadeDuration = function(x) {
    is.integer(x) | x == round(x, 0)
  },
  fitBoundsOptions = is.list,
  hash = is.logical,
  interactive = is.logical,
  keyword = is.logical,
  maxBounds = is.list,
  maxPitch = function(x) {
    is.integer(x) | x == round(x, 0)
  },
  maxZoom = function(x) {
    is.integer(x) | x == round(x, 0)
  },
  minPitch = function(x) {
    is.integer(x) | x == round(x, 0)
  },
  minZoom = function(x) {
    is.integer(x) | x == round(x, 0)
  },
  pitch = function(x) {
    is.integer(x) | x == round(x, 0)
  },
  scrollZoom = is.logical,
  zoom = function(x) {
    is.integer(x) | is.numeric(x)
  }
)

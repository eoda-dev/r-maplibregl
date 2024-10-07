# Types ####

## Basemap Style ####
TYPES_BASEMAP_STYLE <- list(
  name = is.character,
  version = is.integer,
  sources = is.list,
  layers = is.list
)

## Layer ####
TYPES_LAYER <- list(
  type = is.character,
  id = is.character,
  source = function(x) {
    is.list(x) | is.character(x) | is.sf(x)
  },
  paint = is.list,
  layout = is.list
)

## Map options ####
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
  center = is.numeric,
  clickTolerance = function(x) {
    is.integer(x) | x == round(x, 0)
  },
  doubleClickZoom = is.logical,
  fadeDuration = function(x) {
    is.integer(x) | x == round(x, 0)
  },
  fitBoundsOptions = is.list,
  hash = is.logical,
  interactive = is.logical,
  keyboard = is.logical,
  maplibreLogo = is.logical,
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


## Navigation control ####

TYPES_NAVIGATION_CONTROL_OPTIONS <- list(
  showCompass = is.logical,
  showZoom = is.logical,
  visualizePitch = is.logical
)

## Scale control ####
TYPES_SCALE_CONTROL_OPTIONS <- list(
  maxWidth = function(x) {
    is.integer(x) | is.numeric(x)
  },
  unit = is.character
)


## Geolocation control ####

TYPES_GEOLOCATION_CONTROL_OPTIONS <- list(
  showAccuracyCircle = is.logical,
  showUserLocation = is.logical,
  trackUserLocation = is.logical
)

TYPES_FIT_BOUNDS_OPTIONS <- list(
  linear = is.logical,
  maxZoom = function(x){
    is.integer(x) | x == round(x, 0)
  },
  offset = function(x){
    (is.integer(x) | is.numeric(x)) & length(x) = 2
  }

)


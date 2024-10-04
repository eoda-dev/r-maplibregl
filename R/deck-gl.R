#' Add `deck.gl` layers to the map
#' @inherit add_control params return
#' @param layers A list of `deck.gl` layers.
#' @param tooltip Either a single mustache template string applied to all layers
#'  or a dictionary where keys are layer ids and values are mustache template strings.
#' @example examples/deck-gl.R
#' @export
add_deck_layers <- function(.map, layers, tooltip = NULL) {
  add_call(.map, "addDeckOverlay", layers, tooltip)
}

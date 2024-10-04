DECK_GL_VERSION <- "9.0.16"

dependency_deck_gl <- htmltools::htmlDependency(
  name = "deck.gl",
  version = DECK_GL_VERSION,
  src = list(
    href = glue::glue("https://unpkg.com/deck.gl@{DECK_GL_VERSION}")
  ),
  script = "dist.min.js",
  all_files = FALSE
)

dependency_deck_gl_json <- htmltools::htmlDependency(
  name = "deck.gl.json",
  version = DECK_GL_VERSION,
  src = list(
    href = glue::glue("https://unpkg.com/@deck.gl/json@{DECK_GL_VERSION}")
  ),
  script = "dist.min.js",
  all_files = FALSE
)

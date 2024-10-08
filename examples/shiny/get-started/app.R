library(shiny)

earthquakes_source <- geojson_source(
  data = "https://docs.mapbox.com/mapbox-gl-js/assets/earthquakes.geojson"
)

earthquakes_layer <- layer(
  id = "earthquakes",
  type = "circle",
  source = earthquakes_source,
  paint = list("circle-color" = "yellow", "circle-radius" = 2)
)

ui <- fluidPage(
  titlePanel("A map"),
  maplibreOutput("map"),
  selectInput("color", "Circle color", c("yellow", "green", "red"))
)

server <- function(input, output) {
  output$map <- renderMaplibre({
    maplibre() |>
      add_layer(earthquakes_layer)
  })

  observeEvent(input$color, {
    message("input changed ", input$color)
    maplibre_context("map") |>
      add_call("setPaintProperty", "earthquakes", "circle-color", input$color) |>
      send_maplibre_calls()
  })
}

shinyApp(ui = ui, server = server)

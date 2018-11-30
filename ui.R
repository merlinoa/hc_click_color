fluidPage(
  tags$head(
    tags$script(src = "custom.js")
  ),
  fluidRow(
    column(
      12,
      h1("Highcharts Click to Color Demo"),
      br()
    )
  ),
  fluidRow(
    column(
      3,
      wellPanel(
        colourInput(
          "select_color",
          "Select Color",
          value = "red"
        ),
        switchInput(inputId = "color_switch", value = TRUE)
      )
    ),
    column(
      9,
      highchartOutput("chart_out")
    )
  )
)
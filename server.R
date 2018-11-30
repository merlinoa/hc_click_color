library(highcharter)

hc_handle_click <- JS(
  "function(event) {
    Shiny.onInputChange('hc_clicked', {series: this.series.index, index: this.index});
  }"
)

function(input, output, session) {

  observeEvent(input$hc_clicked, {
    if (input$color_switch) {
      # send to client side js to change the color of the bar
      session$sendCustomMessage(
        "change_bar_color",
        message = list(
          series = input$hc_clicked[[1]],
          index = input$hc_clicked[[2]],
          color = input$select_color
        )
      )
    }

  })

  output$chart_out <- renderHighchart({
    highchart() %>%
      hc_chart(type = "column") %>%
      hc_plotOptions(
        column = list(
          point = list(
            events = list(
              click = handle_click
            )
          )
        )
      ) %>%
      hc_add_series(
        data = c(10, 9, 11, 8, 5)
      )
  })

}
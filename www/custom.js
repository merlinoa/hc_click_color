(function() {

  // update the color of the clicked bar
  Shiny.addCustomMessageHandler(
    "change_bar_color",
    function(message) {
      $("#chart_out").highcharts().series[message.series].data[message.index].update({
        color: message.color
      });
    }
  )

})()
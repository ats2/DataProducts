
shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      # Create the main ggplot
      p<-ggplot(subset(data,BRAND==input$selection), aes(WK_DATE,INDIVIDUALS)) + 
        geom_line(aes(y = INDIVIDUALS), col = "blue") +
        ggtitle('Newsletter Subscriptions \n') + 
        xlab("Date (weeks)") + 
        ylab("Subscriptions") + xlim(input$date)
      # If the show trend box was checked, include a line on the plots.  Otherwise, plot with no line.
      if(input$trend){
        p<-p+geom_smooth(method="lm",colour='black',lty=2,fullrange=TRUE) + 
          xlim(input$date+(7*input$forecast)) 
      }
      p
      })
    }
)



shinyUI(
  fluidPage(
  # Application title
  titlePanel("Newsletter Subscriptions"),
  
  sidebarLayout(
    # Sidebar with a slider and selection inputs
    sidebarPanel(
      selectInput("selection", "Choose a brand:", choices = brands),
      checkboxInput("trend", "Show Trend Line"),
      numericInput('forecast', 'Add Forecast Weeks (0 to 8)', 0, min = 0, max = 8, step = 1),
      sliderInput("date","Date Range:",
              min=min(data$WK_DATE),max=max(data$WK_DATE),value=c(min(data$WK_DATE),max(data$WK_DATE)))
    ),
  # Show trend
  mainPanel(
    #plotOutput("plot")
    tabsetPanel(
      tabPanel("App",plotOutput("plot")),
      tabPanel("Documentation",includeMarkdown("Documentation.md"))
    )
    )
  )
))
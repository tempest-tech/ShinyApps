
shinyUI(fluidPage(theme = "myshiny.css",

  headerPanel("Power"),
  
  sidebarLayout(
    sidebarPanel(
      radioButtons("K1", 
                  label = "K1",
                  choices = c("2", "3",
                              "4", "5"),
                  selected = "2",
                  inline = TRUE),
      
      radioButtons("K2", 
                  label = "K2",
                  choices = c("2", "3",
                              "4", "5"),
                  selected = "2",
                  inline = TRUE),
      
      sliderInput("effect", 
                  label = "Effect Size:",
                  min = .2, max = .8, value = c(.2, .8)),
      
      sliderInput("sample", 
                  label = "Sample Size:",
                  min = 2, max = 100, value = c(2, 100))
    ),
    
    mainPanel(
      textOutput("effect"),
      textOutput("sample"),
      plotOutput("plot")
    )
  )
))
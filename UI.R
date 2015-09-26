library(datasets)
data("mtcars")
fit<-lm(mpg~am+hp+wt,data = mtcars)
shinyUI(pageWithSidebar(
  headerPanel("Predict your car's MPG"),

  sidebarPanel(
    sliderInput("obs",
                "weight of cars:",
                min = 1,
                max = 6,
                value=2,step = 0.01),
  
    radioButtons("dist", "Transmission type:",
                 c("Manual" = 1,
                   "Automatic" = 0
                )),

    numericInput("caption", "HorsePower:",100),
    
    submitButton("Calculate")
    
  ),
 
  
  mainPanel(
    verbatimTextOutput("distPlot"),
    plotOutput("pl",plot(mtcars$mpg,mtcars$wt),width = "400px",height = "400px"),
    helpText("This application used to calculate the miles per gallon of your car ,you could input three value"),
    helpText("1.Weight of your car"),
    helpText("2.Your cars Transmission type"),
    helpText("3.Horse power of your car\n"),
    helpText("After you Input all value,you could click the \"calculate\" button"),
    helpText("Then the result will appear on the right top coner"),
    helpText("The picture above show a relationship between wt and mpg")
    
  )
)
)
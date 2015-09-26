library(datasets);
library(ggplot2)
data("mtcars")
fit<-lm(mpg~am+hp+wt,data = mtcars)
shinyServer(
  
  function(input, output) {
    
    output$distPlot<-renderPrint(34.00287512*as.numeric({input$dist})+2.08371013*(1-as.numeric({input$dist}))-0.03747873*as.numeric({input$caption})-2.87857541*as.numeric({input$obs}))
    g<-ggplot(data = mtcars,aes(wt,mpg))+geom_point()
    output$pl<-renderPlot(g)
  }
)
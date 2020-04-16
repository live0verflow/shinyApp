# server.R

source("helpers.R") #this is the most efficient location to put this code
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)
shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      
      mapping <- switch(input$var, 
                        "Percent White" = counties$white,
                        "Percent Black" = counties$black,
                        "Percent Hispanic" = counties$hispanic,
                        "Percent Asian" = counties$asian)
      color <- switch(input$var,
                      "Percent White" = "red",
                      "Percent Black" = "blue",
                      "Percent Hispanic" = "green",
                      "Percent Asian" = "orange")
      title <- switch(input$var,
                      "Percent White" = "Percent White",
                      "Percent Black" = "Percent Black",
                      "Percent Hispanic" = "Percent Hispaninc",
                      "Percent Asian" = "Percent Asian")
      
      percent_map( mapping, color, title, input$range[1], input$range[2])
    })
      
   }
 )
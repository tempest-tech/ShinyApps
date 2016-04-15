# server.R

library(ggplot2)
library(RColorBrewer)
#datum <- read.csv("C:/Users/abutler/Desktop/App-1/graphData.csv")
datum <- read.csv("graphData.csv")

shinyServer(
  function(input, output) {
 
    output$effect <- renderText({ 
      paste("You have chosen an Effect Size that goes from",
            input$effect[1], "to", input$effect[2])
    })
    
    output$sample <- renderText({ 
      paste("You have chosen a Sample Size that goes from",
            input$sample[1], "to", input$sample[2])
    })
    
   dataset <- reactive({
     if(input$K1=="2"&input$K2=="2"){
    data.frame(samp=datum$row,eff=datum$col,res=datum$results22)
    } else {
      data.frame(samp=datum$row,eff=datum$col,res=datum$results24)
    }
   })
        
    #dataset <- data.frame(samp=datum$row,eff=datum$col,res=res)
    
    output$plot <- renderPlot({
      #p <- plot(dataset()$samp,dataset()$res)
       p <- ggplot(dataset()) + 
        geom_tile(aes(x=samp,y=eff,fill=res)) +
        stat_contour(data=dataset(),aes(x=samp,y=eff,z=res)) +
        xlim(input$sample[1],input$sample[2]) +
        ylim(input$effect[1],input$effect[2]) +
        scale_fill_gradientn(guide=guide_legend(title="Power"),colours=rev(brewer.pal(10,"RdYlBu"))) +
        labs(title="Predicted Power as a function of Sample and Effect Size",x="Sample Size",y="Effect Size") 
      
      print(p)
    
  }
)
  }
)
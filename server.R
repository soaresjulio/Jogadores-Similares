function(input, output, session) {
  
    selectedData1 <- reactive({
      dados %>%
      filter(dados$nome != input$jogador) 
    })
    
    selectedData2 <- reactive({
      selectedData1() %>%
        select(1,4,5,6,7,10,39,26,34,24,25,12,13,14,15,16,23,17,
               18,19,20,28,27,22,21,29,30,31,32,33) %>%
      filter(selectedData1()$posicao %in% input$posicao,
             selectedData1()$pe_preferido %in% input$pe_preferido) %>%
      filter(overall >= input$overall[1]) %>%
      filter(overall <= input$overall[2]) %>%
      filter(altura >= input$altura[1])  %>%
      filter(altura <= input$altura[2]) 
    })
    
    selectedData3 <- reactive({
      dados %>%
        select(1,4,5,6,7,10,39,26,34,24,25,12,13,14,15,16,23,17,
               18,19,20,28,27,22,21,29,30,31,32,33) %>%
        filter(dados$nome == input$jogador) 
      
    })
    
    selectedData4 <- reactive({
      rbind(selectedData3(),selectedData2())
      
    })
    
    selectedData5 <- reactive({
      selectedData4() %>%
      select(8:30)
    })
    
    selectedData6 <- reactive({
    as.numeric(knnx.index(selectedData5(), selectedData5()[1, , drop=FALSE], k=11))
    })
    
    selectedData7 <- reactive({
      selectedData4()[selectedData6(),]
    })
    
    selectedData8 <- reactive({
      selectedData7() %>%
        select(8:30)
    })
    

    # Combine the selected variables into a new data frame
  output$plot1 <- renderPlotly({
    
    plot_ly(
      type = 'scatterpolar',
      mode = "closest",
      fill = 'toself'
    ) %>%
      add_trace(
        r = as.matrix(selectedData8()[1,]),
        theta = c("EQUI","RES","VEL","EXP","OFE","C.BOL","DRI","P.RAST","P.ALT",
                  "F.CHU","FIN","C.COL","CURV","CAB","IMP","C.FIS","DESAR","DEF",
                  "H.GOL","F.GOL","CLEA","REFL","COV"),
        showlegend = TRUE,
        mode = "closest",
        name = selectedData7()[1,1]
      ) %>%
      add_trace(
        r = as.matrix(selectedData8()[2,]),
        theta = c("EQUI","RES","VEL","EXP","OFE","C.BOL","DRI","P.RAST","P.ALT",
                  "F.CHU","FIN","C.COL","CURV","CAB","IMP","C.FIS","DESAR","DEF",
                  "H.GOL","F.GOL","CLEA","REFL","COV"),
        showlegend = TRUE,
        mode = "closest",
        visible="legendonly",
        name = selectedData7()[2,1]
      ) %>%
      add_trace(
        r = as.matrix(selectedData8()[3,]),
        theta = c("EQUI","RES","VEL","EXP","OFE","C.BOL","DRI","P.RAST","P.ALT",
                  "F.CHU","FIN","C.COL","CURV","CAB","IMP","C.FIS","DESAR","DEF",
                  "H.GOL","F.GOL","CLEA","REFL","COV"),
        showlegend = TRUE,
        mode = "closest",
        visible="legendonly",
        name = selectedData7()[3,1]
      ) %>%
      add_trace(
        r = as.matrix(selectedData8()[4,]),
        theta = c("EQUI","RES","VEL","EXP","OFE","C.BOL","DRI","P.RAST","P.ALT",
                  "F.CHU","FIN","C.COL","CURV","CAB","IMP","C.FIS","DESAR","DEF",
                  "H.GOL","F.GOL","CLEA","REFL","COV"),
        showlegend = TRUE,
        mode = "closest",
        visible="legendonly",
        name = selectedData7()[4,1]
      ) %>%
      add_trace(
        r = as.matrix(selectedData8()[5,]),
        theta = c("EQUI","RES","VEL","EXP","OFE","C.BOL","DRI","P.RAST","P.ALT",
                  "F.CHU","FIN","C.COL","CURV","CAB","IMP","C.FIS","DESAR","DEF",
                  "H.GOL","F.GOL","CLEA","REFL","COV"),
        showlegend = TRUE,
        mode = "closest",
        visible="legendonly",
        name = selectedData7()[5,1]
      ) %>%
      add_trace(
        r = as.matrix(selectedData8()[6,]),
        theta = c("EQUI","RES","VEL","EXP","OFE","C.BOL","DRI","P.RAST","P.ALT",
                  "F.CHU","FIN","C.COL","CURV","CAB","IMP","C.FIS","DESAR","DEF",
                  "H.GOL","F.GOL","CLEA","REFL","COV"),
        showlegend = TRUE,
        mode = "closest",
        visible="legendonly",
        name = selectedData7()[6,1]
      ) %>%
      add_trace(
        r = as.matrix(selectedData8()[7,]),
        theta = c("EQUI","RES","VEL","EXP","OFE","C.BOL","DRI","P.RAST","P.ALT",
                  "F.CHU","FIN","C.COL","CURV","CAB","IMP","C.FIS","DESAR","DEF",
                  "H.GOL","F.GOL","CLEA","REFL","COV"),
        showlegend = TRUE,
        mode = "closest",
        visible="legendonly",
        name = selectedData7()[7,1]
      ) %>%
      add_trace(
        r = as.matrix(selectedData8()[8,]),
        theta = c("EQUI","RES","VEL","EXP","OFE","C.BOL","DRI","P.RAST","P.ALT",
                  "F.CHU","FIN","C.COL","CURV","CAB","IMP","C.FIS","DESAR","DEF",
                  "H.GOL","F.GOL","CLEA","REFL","COV"),
        showlegend = TRUE,
        mode = "closest",
        visible="legendonly",
        name = selectedData7()[8,1]
      ) %>%
      add_trace(
        r = as.matrix(selectedData8()[9,]),
        theta = c("EQUI","RES","VEL","EXP","OFE","C.BOL","DRI","P.RAST","P.ALT",
                  "F.CHU","FIN","C.COL","CURV","CAB","IMP","C.FIS","DESAR","DEF",
                  "H.GOL","F.GOL","CLEA","REFL","COV"),
        showlegend = TRUE,
        mode = "closest",
        visible="legendonly",
        name = selectedData7()[9,1]
      ) %>%
      add_trace(
        r = as.matrix(selectedData8()[10,]),
        theta = c("EQUI","RES","VEL","EXP","OFE","C.BOL","DRI","P.RAST","P.ALT",
                  "F.CHU","FIN","C.COL","CURV","CAB","IMP","C.FIS","DESAR","DEF",
                  "H.GOL","F.GOL","CLEA","REFL","COV"),
        showlegend = TRUE,
        mode = "closest",
        visible="legendonly",
        name = selectedData7()[10,1]
      ) %>%
      add_trace(
        r = as.matrix(selectedData8()[11,]),
        theta = c("EQUI","RES","VEL","EXP","OFE","C.BOL","DRI","P.RAST","P.ALT",
                  "F.CHU","FIN","C.COL","CURV","CAB","IMP","C.FIS","DESAR","DEF",
                  "H.GOL","F.GOL","CLEA","REFL","COV"),
        showlegend = TRUE,
        mode = "closest",
        visible="legendonly",
        name = selectedData7()[11,1]
      ) %>%
      layout(
        polar = list(
          radialaxis = list(
            visible = T,
            range = c(0,100)
          )
       ),
     
     showlegend=TRUE
      
        
      )
    
  })
  
}




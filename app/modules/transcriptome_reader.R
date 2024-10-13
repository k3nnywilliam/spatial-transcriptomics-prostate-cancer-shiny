ui_module_Genomics10xVisualizer <- function(id){
  ns <- NS(id)
  tabPanel(
    title = "Viewer",
    fluid = TRUE,
    #absolutePanel(
    #  #top = 100, 
    #  #left = 70, 
    #  draggable = FALSE, width = "100%", 
    #  #style = "z-index:500; min-width: 300px;",
    #)
    actionButton(ns("show_visualizer"), "Show Visualization"),
    tags$div(id = ns("deckgl-container"))  # Placeholder for deck.gl visualization
  )
}

server_module_Genomics10xVisualizer <- function(id){
  moduleServer(id, function(input, output, session){
    observe({
      print("Clicked")
      # Send the Visium data to the JavaScript side
      session$sendCustomMessage(type = "visiumData", message = "Initializing...")
    }) |> bindEvent(input$show_visualizer)
    
  })
}

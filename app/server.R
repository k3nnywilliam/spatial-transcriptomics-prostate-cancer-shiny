server <- function(input,output,session){
  cat("Server starting...", "\n")
  server_module_Genomics10xVisualizer('visualizer')
}
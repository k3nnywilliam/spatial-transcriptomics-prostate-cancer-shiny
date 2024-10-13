ui <- tagList(
  useWaiter(), 
  waiterPreloader(html = tagList(
    p("WELCOME"),
    spin_3()
  ),
  color = "#000000",
  fadeout = TRUE),
  navbarPage(
    "Spatial Transcriptomic",
    tags$head(
      tags$link(
        href = "styles.css",
        rel = "stylesheet"
      ),
      tags$script(src = "https://unpkg.com/deck.gl@8.5.8/dist.min.js"),  # Load deck.gl
      tags$script(type = "module", src = "transcriptome_read.js") #Load custom JavaScript script as a module
    ),
    theme = bslib::bs_theme(
      version = "5", 
      "navbar-bg" = "rgba(255,255,255,0)",
      "nav-link-font-size" = "20px",
      "nav-link-color" = "#464646 !important",
      "nav-link-hover-color" = "red !important",
      "navbar-light-active-color" = "red !important"
      #bootswatch = "darkly"),
    ),
    ui_module_Genomics10xVisualizer('visualizer'),
    #footer = tags$footer(
    #  HTML(
    #    '
    #    <br>
    #    <br>
    #    <p class = "page-footer"> ', paste0("This Shiny app was made by Kenny Anak William Nyallau © 2024"),'</p>')
    #)
  ) #End of navbar
)


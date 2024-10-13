
library('shiny')
library('htmltools')
library('htmlwidgets')
library('dplyr')
library('shinyjs')
library('waiter')
library('data.table') 
library('Matrix')
library('Seurat')
library('Rsamtools')
library('GenomicAlignments')
library('jsonlite')
library('stringr')
library('reticulate')

# Source the app modules
source('modules/transcriptome_reader.R')
#reticulate::use_virtualenv('venv/', required = TRUE)
#reticulate::source_python("py_modules/spatial_coord_loader.py")

# Read source files from json settings
bam_files_path <- jsonlite::fromJSON("settings/data_settings.json")
manual_alignment <- jsonlite::fromJSON("data/human_prostate_cancer/manual_alignment/Visium_FFPE_Human_Prostate_IF_alignment_file.json")

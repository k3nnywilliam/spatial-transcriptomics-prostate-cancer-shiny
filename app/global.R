
#library("remotes")
#if (!requireNamespace("BiocManager", quietly = TRUE))
#  remotes::install_version("BiocManager", "3.19")

#BiocManager::install("Rsamtools")
#BiocManager::install("GenomicAlignments")
#BiocManager::install("Seurat")
#BiocManager::install("IRanges")

library('shiny')
library('htmltools')
library('htmlwidgets')
library('dplyr')
library('shinyjs')
library('waiter')
library('data.table')
library('reticulate')
#library('Seurat')
library('Rsamtools')
library('GenomicAlignments')
library('jsonlite')

# Source the app modules
source('modules/transcriptome_reader.R')

# Read source files from json settings
bam_files_path <- jsonlite::fromJSON("settings/data_settings.json")

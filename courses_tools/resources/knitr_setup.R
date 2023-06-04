## libraries always loaded 
library(tidyverse)
library(cowplot)

## Basic option chunks
## for xaringan
knitr::opts_chunk$set(warning = FALSE, message = FALSE, cache = TRUE,
                      verbose = TRUE, comment = NA,
                      dpi = 100,
                      echo = FALSE, eval = FALSE, 
                      fig.align = "center", results = "markup", 
                      fig.width = 7, fig.height = 3.5,  
                      out.width = '60%', out.height = '30%' )

## To solve issues with tibble displays in xaringan and github action
options(crayon.enabled = FALSE)
 
## for beamer pres
# knitr::opts_chunk$set(warning = FALSE, message = FALSE, cache = TRUE,
#                       verbose = TRUE, comment = NA, 
#                       fig.align = "center", results = "markup", 
#                       fig.width = 5, fig.height = 2.5,  fig.pos = 'htbp!',
#                       out.width = '.8\\textwidth')

# knitr::knit_hooks$set(subdir = function(before, options, envir) {
# 
#     knitr::opts_knit$set(child.path = paste0(opt$child_path, "functionals/"))
#   options$child.path <- paste(options$child.path, subdir)
#   options
# })

## -----------------------------------------------------------------------------
## CUSTOMIZE CHUNKS

## ------------------------------------------------------------------------------
## Dplyr opt
options(tibble.print_max = 4, tibble.print_min = 4)

### for beamer pres
## Block font color in light gray
# color_block = function(color) {
#   function(x, options) sprintf('\\color{%s}\\begin{verbatim}%s\\end{verbatim}\\color{black}', color, x)
# }
# 
# knitr::knit_hooks$set(output = color_block('gray'))
# def.chunk.hook  <- knitr::knit_hooks$get("chunk")
# knitr::knit_hooks$set(chunk = function(x, options) {
#   x <- def.chunk.hook(x, options)
#   ifelse(options$size != "normalsize", paste0("\\", options$size,"\n\n", x, "\n\n \\normalsize"), x)
# })

## -----------------------------------------------------------------------------
## GGPLOT OPTIONS

# Set plotting to bw plot default, but with transparent background elements.  
# Note transparency requires the panel.background, plot.background, and device background all be set!
# theme_set(theme_bw(base_size=12))
# theme_update(panel.background = element_rect(fill = "transparent", colour = NA),
#              plot.background = element_rect(fill = "transparent", colour = NA))
# knitr::opts_chunk$set(dev.args=list(bg="transparent"))
# I fail to define a permanent palette up to now
# # Set a color-blind friendly pallette
# # adapted from http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
# cbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", 
#                "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
# 


### Theme ggplot
theme_set(theme_minimal())

#### removing function messages 
quiet <- function(x) { 
  sink(tempfile()) 
  on.exit(sink()) 
  invisible(force(x)) 
} 



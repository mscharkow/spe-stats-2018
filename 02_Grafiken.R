#' ---
#' title: "Sitzung 2: Grafiken mit ggplot2"
#' subtitle: "Angewandte Statistik mit R"
#' author: "Michael Scharkow <michael.scharkow@zu.de>"
#' date: "Zeppelin Universität, Fall 2018"
#' output:
#'   html_document:
#'     toc: true
#'     toc_float: true
#'     theme: lumen
#'     highlight: pygments
#' ---

#' # Vorbereitung
#' ## Laden der notwendigen R-Pakete

library(haven)
library(tidyverse)

#' ## Laden des Datensatzes

# http://www.europeansocialsurvey.org/download.html?file=ESS8e02&y=2016
d = read_sav("data/ESS8e02.sav") %>% sample_n(1000)

#' # Univariate Plots

theme_set(theme_bw())

#' ## Histogramme



#' ## Bar plots und dot plots

# Dot plot

#' ## Box Plots

#' # Bivariate Plots
#' ## Box Plots mit Gruppen

#' ## Scatter Plots

# Jittering, Transparenz und smoothing

#' ## Facets

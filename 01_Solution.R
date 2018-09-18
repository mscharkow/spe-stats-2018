#' ---
#' title: "Sitzung 1: Datenmanagement mit dplyr"
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
d = read_sav("data/ESS8e02.sav")

d
dim(d)
names(d)


#' # Auswählen von Fällen (Zeilen) mit filter() und slice()

#' ## slice()

d %>% slice(1:10)

#' ## filter()

d %>% filter(cntry=="AT")

#' # Auswählen von Variablen (Spalten) mit select()

#' ## Direkte Auswahl per Spaltennummer und Variablennamen

d %>% select(1:3)

d %>% select(idno, pplfair, polintr)

d %>% select(idno:netustm)

#' ## Auswahl mit Hilfsfunktionen

d %>% select(starts_with("ppl"))

d %>% select(contains("edu"))

#' # Sortieren mit arrange()

d %>% arrange(netustm)

d %>% arrange(-netustm, -netusoft)

count(d,cntry) %>% arrange(-n)

#' # Variablen anlegen und verändern mit mutate()

#' ## Gelabelte Variablen umwandeln in factor
d %>% mutate(cntry_long = as_factor(cntry)) %>% count(cntry_long) %>% arrange(-n)

#' ## Recodieren von Alter

d %>% mutate(adult = if_else(agea >= 18, "adult", "adolescent")) %>% select(agea, adult)

#' ## Dauerhafte Änderungen im data frame

d  = d %>% mutate(gender = as_factor(gndr),
                  age = as.numeric(agea),
                  adult = if_else(age >= 18, "adult", "adolescent"),
                  country = as_factor(cntry)
                  )

#' ## Grundauszählung mit count()
d %>% count(country, gender, adult) %>% na.omit

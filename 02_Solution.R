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

ggplot(data = d, aes(x = netustm))+geom_histogram()

d %>% ggplot(aes(x = netustm))+geom_histogram()

ggplot(data = d, aes(x = netustm))+geom_freqpoly(color="blue")

#' ## Bar plots und dot plots

d %>% ggplot(aes(x = mnactic)) + geom_bar() # not useful

d %>% mutate(mnactic = as_factor(mnactic)) %>%
  ggplot(aes(x = mnactic)) + geom_bar()

d %>% filter(!is.na(mnactic)) %>%
  mutate(mnactic = as_factor(mnactic) %>% fct_infreq %>% fct_rev) %>%
  ggplot(aes(x = mnactic)) + geom_bar() + coord_flip()

# Dot plot
d %>% filter(!is.na(mnactic)) %>%
  mutate(mnactic = as_factor(mnactic) %>% fct_infreq %>% fct_rev) %>%
  count(mnactic) %>% mutate(pct = n/sum(n)*100) %>%
  ggplot(aes(x = mnactic,y = pct))+geom_point()+coord_flip()

#' ## Box Plots

d %>% ggplot(aes(y = netustm))+geom_boxplot()


#' # Bivariate Plots
#' ## Box Plots mit Gruppen

d %>% ggplot(aes(y = netustm,
                 x = as.character(cntry),
                 fill = as.character(cntry)))+geom_boxplot(show.legend = F)

#' ## Scatter Plots
d %>% ggplot(aes(x = agea, y = netustm))+geom_point()

# Jittering and transparency
d %>% ggplot(aes(x = agea, y = jitter(netustm)))+geom_point(alpha=.5)

d %>% ggplot(aes(x = agea, y = jitter(netustm)))+geom_point(alpha=.5)+
  geom_smooth(method="lm")

#' ## Facets

d %>% ggplot(aes(x = agea, y = jitter(netustm)))+geom_point(alpha=.5)+
  geom_smooth(method="lm")+facet_wrap(~cntry)

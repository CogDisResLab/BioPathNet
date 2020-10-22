## code to prepare `rnorvegicus` dataset goes here

library(tidyverse)
library(fgsea)
library(devtools)

url <- "http://download.baderlab.org/EM_Genesets/October_01_2020/Rat/symbol/Rat_GO_AllPathways_with_GO_iea_October_01_2020_symbol.gmt"

tmp <- tempfile("gmtfile", fileext = "gmt")
download.file(url, tmp)

rnorvegicus <- fgsea::gmtPathways(tmp)

ids <- names(rnorvegicus)

ids <- str_replace(ids, "Ω", "omega") %>%
  str_replace("Α", "A") %>%
  iconv(from = "latin1", to = "ASCII", sub = " ")

names(rnorvegicus) <- ids

usethis::use_data(rnorvegicus, overwrite = TRUE)

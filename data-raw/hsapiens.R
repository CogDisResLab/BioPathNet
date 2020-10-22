## code to prepare `hsapiens` dataset goes here

library(tidyverse)
library(fgsea)
library(devtools)

url <- "http://download.baderlab.org/EM_Genesets/October_01_2020/Human/symbol/Human_GO_AllPathways_with_GO_iea_October_01_2020_symbol.gmt"

tmp <- tempfile("gmtfile", fileext = "gmt")
download.file(url, tmp)

hsapiens <- fgsea::gmtPathways(tmp)

ids <- names(hsapiens)

ids <- str_replace(ids, "Ω", "omega") %>%
  str_replace("Α", "A") %>%
  iconv(from = "latin1", to = "ASCII", sub = " ")

names(hsapiens) <- ids

usethis::use_data(hsapiens, overwrite = TRUE)

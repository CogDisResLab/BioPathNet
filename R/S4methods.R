#' @include classes.R
#' @import stringr methods
NULL

setMethod("show",
          signature = c("BPNList"),
          definition = function(object) {
            print(
              stringr::str_glue("
An Object of class {class(object)}
Input Size: \t\t\t{nrow(object@input)} Differentially Expressed Genes
GSEA Results: \t\t\t{ifelse(is_empty(object@gsea@alpha), \"Analysis Not Run\",\"Analysis Completed\")}
EnrichR Results: \t\t{ifelse(is_empty(object@enrichr@alpha), \"Analysis Not Run\",\"Analysis Completed\")}
iLINCS Results: \t\t{ifelse(is_empty(object@ilincs@threshold_pval), \"Analysis Not Run\",\"Analysis Completed\")}
Leading Edge Results: \t\t{ifelse(is_empty(object@leading@placeholder), \"Analysis Not Run\",\"Analysis Completed\")}
Integrated Results: \t\t{ifelse(is_empty(object@integrated@placeholder), \"Analysis Not Run\",\"Analysis Completed\")}\n")
            )
            invisible(NULL)
          })

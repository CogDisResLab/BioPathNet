#' @include classes.R
#' @import stringr methods
NULL


# Methods for BPNList
setMethod(
  "show",
  signature = "BPNList",
  definition = function(object) {
    print(
      stringr::str_glue(
        "
An Object of class {class(object)}
Input Size: \t\t\t{nrow(object@input)} Differentially Expressed Genes
GSEA Results: \t\t\t{ifelse(object@gsea@empty, \"Analysis Not Run\",\"Analysis Completed\")}
EnrichR Results: \t\t{ifelse(object@enrichr@empty, \"Analysis Not Run\",\"Analysis Completed\")}
iLINCS Results: \t\t{ifelse(object@ilincs@empty, \"Analysis Not Run\",\"Analysis Completed\")}
Leading Edge Results: \t\t{ifelse(object@leading@empty, \"Analysis Not Run\",\"Analysis Completed\")}
Integrated Results: \t\t{ifelse(object@integrated@empty, \"Analysis Not Run\",\"Analysis Completed\")}\n"
      )
    )
    invisible(NULL)
  }
)

setGeneric("input", function(object, ...) {
  standardGeneric("input")
})
setMethod("input", "BPNList",
          function(object) {
            object@input
          })

setGeneric("gsea", function(object, ...) {
  standardGeneric("gsea")
})
setMethod("gsea", "BPNList",
          function(object) {
            object@gsea
          })

setGeneric("gsea<-", function(object, value) {
  standardGeneric("gsea<-")
})
setMethod("gsea<-", "BPNList",
          function(object, value) {
            object@gsea <- value
            if (validObject(object)) {
              return(object)
            }
          })

setGeneric("enrichr", function(object, ...) {
  standardGeneric("enrichr")
})
setMethod("enrichr", "BPNList",
          function(object) {
            object@enrichr
          })

setGeneric("enrichr<-", function(object, value) {
  standardGeneric("enrichr<-")
})
setMethod("enrichr<-", "BPNList",
          function(object, value) {
            object@enrichr <- value
            if (validObject(object)) {
              return(object)
            }
          })

# Methods for GSEAResult



# Methods for EnrichRResult



# Methods for iLINCSResult



# Methods for LEResult



# Methods for RevigoResult



# Methods for IntegratedResult


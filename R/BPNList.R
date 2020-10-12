#' @include classes.R
NULL


#' Construct a BPNList object
#'
#' @param input tbl_df A tibble with the differentially expressed genes
#' @param gsea GSEAResult An object containing the GSEA results
#' @param enrichr EnrichRResult An object containing the EnrichR results
#' @param ilincs iLINCSResult An object containing the iLINCS results
#' @param leading LEResult An object containing the Leading Edge Analysis results
#' @param revigo RevigoResult An object containing the Revigo results
#' @param integrated IntegratedResult An object containing the Integrated results
#'
#' @return A BPNList object
#' @export
#'
#' @import methods
#'
#' @examples
#' TRUE

BPNList <- function(input, gsea, enrichr, ilincs, leading, revigo, integrated) {
  # Construct a BPNList object
  # Created 2020-10-11.
  # Last Updated 2020-10-11

  if (missing(input)) {
    stop("Must supply the input DEG dataset")
  }

  if (missing(gsea)) {
    gsea <- new("GSEAResult")
  }

  if (missing(enrichr)) {
    enrichr <- new("EnrichRResult")
  }

  if (missing(ilincs)) {
    ilincs <- new("iLINCSResult")
  }

  if (missing(leading)) {
    leading <- new("LEResult")
  }

  if (missing(revigo)) {
    revigo <- new("RevigoResult")
  }

  if (missing(integrated)) {
    integrated <- new("IntegratedResult")
  }

  x <- new("BPNList",
           input = input,
           gsea = gsea,
           enrichr = enrichr,
           ilincs = ilincs,
           leading = leading,
           revigo = revigo,
           integrated = integrated)

  x
}

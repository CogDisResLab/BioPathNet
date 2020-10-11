#' @include classes.R
#' @import methods
NULL


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

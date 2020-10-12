#' Perform the Geneset Enrichment Analysis
#'
#' This function takes a BPNList object and performs a Geneset Enrichment Analysis
#' and returns a BPNList object with the results of the GSEA
#'
#' @param bpn BPNList An object of class BPNList created from \link{prepare_data}
#' @param species character One of the species for which we provide current GMT pathways. Currently the valid species are hsapiens, mmusculus and rnorvegicus. Cannot be specified along with gmtfile
#' @param gmtfile character A full path to a GMT File you would like to use. Cannot be specified along with species
#' @param lower numeric The cutoff for down-regulated genes. If not specified, it takes the bottom 10% of the dataset
#' @param upper numeric The cutoff for up-regulated genes. If not specified, it takes the top 10% of the dataset
#' @param alpha numeric The Alpha value for statistical significance. Defaults to 0.05.
#' @param minSize numeric The minimum number of genes that should be in a pathway for it to be included in the analysis
#' @param maxSize numeric The maximum number of genes that should be in a pathway for it to be included in the analysis
#'
#' @return An object of class BPNList with its gsea slot populated with the results
#' @export
#'
#' @import fgsea dplyr tibble
#'
#' @examples
#' TRUE

do_gsea_pod <- function(bpn, species = "hsapiens", gmtfile = NULL,
                        lower = NULL, upper = NULL, alpha = 0.05,
                        minSize = 15, maxSize = 500) {
  if (!is.null(species) & is.null(gmtfile)) {
    pathways <- load_patways(species)
  } else if (is.null(species) & !is.null(gmtfile)) {
    pathways <- fgsea::gmtPathways(gmtfile)
  } else {
    stop("please specify only one of species and gmtfile")
  }

  inp <- bpn@input

  if (is.null(lower)) {
    lower <- round(quantile(inp$Value_LogDiffExp, 0.10))
  }

  if (is.null(upper)) {
    upper <- round(quantile(inp$Value_LogDiffExp, 0.90))
  }

  upreg <- inp %>%
    dplyr::filter(Value_LogDiffExp > upper)

  downreg <- inp %>%
    dplyr::filter(Value_LogDiffExp < lower)

  ranked <- inp %>%
    dplyr::arrange(desc(Value_LogDiffExp)) %>%
    dplyr::select(-Significane_pvalue) %>%
    tibble::deframe()

  results <- fgsea::fgsea(pathways, ranked, minSize, maxSize)

  g <- GSEAResult(
    results, pathways, lower, upper, alpha, upreg, downreg
  )

  gsea(bpn) <- g

  bpn
}

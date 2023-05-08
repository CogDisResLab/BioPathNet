#' Load Pathways data
#'
#' @param species The species. Can be hsapiens,  mmusculus or rnorvegicus
#'
#' @return The loaded pathways
#'
#'importFrom utils data
#'
#' @examples
#' TRUE
load_pathways <- function(species) {
  out <- eval(as.name(species))
  out
}


#' Perform the Geneset Enrichment Analysis
#'
#' This function takes a BPNList object and performs a Geneset Enrichment Analysis
#' and returns a BPNList object with the results of the GSEA
#'
#' This function takes a BPNList object and performs a Geneset Enrichment Analysis
#' and returns a BPNList object with the results of the GSEA
#'
#' @param bpn BPNList An object of class BPNList created from \link{prepare_data}
#' @param species character One of the species for which we provide current GMT pathways. Currently the valid species are hsapiens, mmusculus and rnorvegicus. Cannot be specified along with gmtfile
#' @param gmtfile character A full path to a GMT File you would like to use. Cannot be specified along with species
#' @param lower numeric The cutoff for down-regulated genes. If not specified, it takes the bottom 10\% of the dataset
#' @param upper numeric The cutoff for up-regulated genes. If not specified, it takes the top 10\% of the dataset
#' @param alpha numeric The Alpha value for statistical significance. Defaults to 0.05.
#' @param minSize numeric The minimum number of genes that should be in a pathway for it to be included in the analysis
#' @param maxSize numeric The maximum number of genes that should be in a pathway for it to be included in the analysis
#' @param rankWithSignificance logical Whether to rank genes using p-values
#' @param useFDR logical Whether to filter by adjusted p-value
#'
#' @return An object of class BPNList with its gsea slot populated with the results
#' @export
#'
#' @import fgsea tibble
#' @importFrom rlang .data
#' @importFrom stats quantile
#' @import dplyr
#'
#' @examples
#' TRUE

do_gsea_pod <- function(bpn, species = "hsapiens", gmtfile = NULL,
                        lower = NULL, upper = NULL, alpha = 0.05,
                        minSize = 15, maxSize = 500, rankWithSignificance = FALSE, useFDR=TRUE) {
  if(!is.null(gmtfile)) {
    pathways <- fgsea::gmtPathways(gmtfile)
  } else if(!is.null(species)) {
    pathways <- load_pathways(species)
  } else {
    stop("please specify one of species or gmtfile")
  }

  inp <- input(bpn)

  if (is.null(lower)) {
    lower <- round(stats::quantile(inp$Value_LogDiffExp, 0.10), 3)
  }

  if (is.null(upper)) {
    upper <- round(stats::quantile(inp$Value_LogDiffExp, 0.90), 3)
  }

  upreg <- inp %>%
    dplyr::filter(.data$Value_LogDiffExp > upper)

  downreg <- inp %>%
    dplyr::filter(.data$Value_LogDiffExp < lower)

  ranked <- inp %>%
    dplyr::mutate(score = (.data$Value_LogDiffExp * ifelse(rankWithSignificance, -log10(.data$Significane_pvalue), 1))) %>%
    dplyr::select(!any_of(c("Value_LogDiffExp", "Significane_pvalue"))) %>%
    tibble::deframe()

  results <- fgsea::fgsea(pathways, ranked, minSize = minSize, maxSize = maxSize)

  g <- GSEAResult(
    results, pathways, lower, upper, alpha, upreg, downreg, useFDR
  )

  gsea(bpn) <- g

  bpn
}

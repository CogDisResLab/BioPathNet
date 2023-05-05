#' @include classes.R
NULL

#' Construct an EnrichRResult object
#'
#' @param up_results tbl_df A tibble of enrichment results from the upregulated genes
#' @param down_results tbl_df A tibble of enrichment results from the upregulated genes
#' @param upreg tbl_df A tibble of up-regulated genes
#' @param downreg tbl_df A tibble of down-regulated genes
#' @param lower numeric Lower threshold for down-regulated genes
#' @param upper numeric Upper threshold for up-regulated genes
#' @param alpha numeric Alpha level of significance
#' @param dbs character a vector of the databases used for the enrichment analysis
#' @param useFDR logical Whether to filter by adjusted p-value
#'
#' @return an object of class EnrichRResult
#' @export
#'
#' @import enrichR dplyr tibble
#' @importFrom rlang .data
#'
#' @examples
#' TRUE

EnrichRResult <- function(up_results, down_results, upreg, downreg, alpha, upper, lower, dbs, useFDR) {

  alpha <- alpha
  threshold_up <- upper
  threshold_down <- lower

  upregulated_genes <- upreg %>%
    tibble::tibble()

  downregulated_genes <- downreg %>%
    tibble::tibble()

  dbs_used <- dbs

  up_enrichr <- up_results %>%
    tibble::tibble()

  down_enrichr <- down_results %>%
    tibble::tibble()

  if(useFDR) {
    sig_up_enrichr <- up_enrichr %>%
      dplyr::filter(.data$Adjusted.P.value <= alpha) %>%
      tibble::tibble()

    sig_down_enrichr <- down_enrichr %>%
      dplyr::filter(.data$Adjusted.P.value <= alpha) %>%
      tibble::tibble()
  } else {
    sig_up_enrichr <- up_enrichr %>%
      dplyr::filter(.data$P.value <= alpha) %>%
      tibble::tibble()

    sig_down_enrichr <- down_enrichr %>%
      dplyr::filter(.data$P.value <= alpha) %>%
      tibble::tibble()
  }

  num_upreg <- nrow(upreg)
  num_downreg <- nrow(downreg)
  num_up_enrichr <- nrow(up_enrichr)
  num_down_enrichr <- nrow(down_enrichr)
  num_sig_up_enrichr <- nrow(sig_up_enrichr)
  num_sig_down_enrichr <- nrow(sig_down_enrichr)

  e <- new("EnrichRResult",
           alpha = alpha,
           threshold_up = threshold_up,
           threshold_down = threshold_down,
           upregulated_genes = upregulated_genes,
           downregulated_genes = downregulated_genes,
           dbs_used = dbs_used,
           up_enrichr = up_enrichr,
           down_enrichr = down_enrichr,
           sig_up_enrichr = sig_up_enrichr,
           sig_down_enrichr = sig_down_enrichr,
           num_upreg = num_upreg,
           num_downreg = num_downreg,
           num_up_enrichr = num_up_enrichr,
           num_down_enrichr = num_down_enrichr,
           num_sig_up_enrichr = num_sig_up_enrichr,
           num_sig_down_enrichr = num_sig_down_enrichr,
           empty = FALSE
  )

  e
}

#' @include classes.R
NULL

#' Title
#'
#' @param up_results
#' @param down_results
#' @param upreg
#' @param downreg
#' @param alpha
#' @param upper
#' @param lower
#' @param dbs
#'
#' @return
#' @export
#'
#' @import enrichr dplyr tibble
#'
#' @examples
#' TRUE

EnrichRResult <- function(up_results, down_results, upreg, downreg, alpha, upper, lower, dbs) {

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

  sig_up_enrichr <- up_enrichr %>%
    dplyr::filter(P.value < alpha) %>%
    tibble::tibble()

  sig_down_enrichr <- down_enrichr %>%
    dplyr::filter(P.value < alpha) %>%
    tibble::tibble()

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
           num_sig_down_enrichr = num_sig_down_enrichr
  )

  e
}


#' @slot alpha numeric. The Alpha threshold for significance
#' @slot threshold_up numeric. The logfc threshold for up-regulated genes
#' @slot threshold_down numeric. The logfc threshold for down-regulated genes
#' @slot upregulated_genes tbl_df. The up-regulated genes from the input DEG tibble
#' @slot downregulated_genes tbl_df. The down-regulated genes from the input DEG tibble
#' @slot dbs_used character. A vector of the databases used from enrichR
#' @slot up_enrichr tbl_df. Enriched pathways in up-regulated genes
#' @slot down_enrichr tbl_df. Enriched pathways in down-regulated genes
#' @slot sig_up_enrichr tbl_df. Significant enriched pathways in up-regulated genes
#' @slot sig_down_enrichr tbl_df. Significant enriched pathways in down-regulated genes
#' @slot num_upreg numeric. Number of up-regulated genes
#' @slot num_downreg numeric. Number of down-regulated genes
#' @slot num_up_enrichr numeric. Number of enriched pathways in up-regulated genes
#' @slot num_down_enrichr numeric. Number of enriched pathways in down-regulated genes
#' @slot num_sig_up_enrichr numeric. Number of significant enriched pathways in up-regulated genes
#' @slot num_sig_down_enrichr numeric. Number of significant enriched pathways in down-regulated genes
#'

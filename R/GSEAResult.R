#' @include classes.R
NULL

#' Construct a GSEAResult Object
#'
#' @param results tbl_df A tibble with the results from fgsea
#' @param pathways list A list of vectors with gene sets
#' @param lower numeric Lower threshold for down-regulated genes
#' @param upper numeric Upper threshold for up-regulated genes
#' @param alpha numeric Alpha level of significance
#' @param upreg tbl_df A tibble of up-regulated genes
#' @param downreg tbl_df A tibble of down-regulated genes
#'
#' @return
#' @export
#'
#' @import dplyr
#'
#' @examples
GSEAResult <- function(results, pathways, lower, upper, alpha, upreg, downreg) {

  alpha <- alpha
  threshold_up <- upper
  threshold_down <- lower
  upregulated_genes <- upreg
  downregulated_genes <- downreg

  pos_enriched <- results %>%
    dplyr::filter(ES > 0) %>%
    dplyr::arrange(desc(ES), pval)

  neg_enriched <- results %>%
    dplyr::filter(ES < 0) %>%
    dplyr::arrange(desc(ES), pval)

  sig_pos_enriched <- pos_enriched %>%
    dplyr::filter(pval < alpha) %>%
    dplyr::arrange(desc(ES), pval)

  sig_neg_enriched <- neg_enriched %>%
    dplyr::filter(pval < alpha) %>%
    dplyr::arrange(desc(ES), pval)

  num_tested <- nrows(results)
  num_upreg <- nrows(upreg)
  num_downreg <- nrows(downreg)
  num_pos_enriched <- nrows(pos_enriched)
  num_neg_enriched <- nrows(neg_enriched)
  num_sig_pos_enriched <- nrows(sig_pos_enriched)
  num_sig_neg_enriched <- nrows(sig_neg_enriched)

  g <- new("GSEAResult",
           alpha = alpha,
           pathways = pathways,
           threshold_up = threshold_up,
           threshold_down = threshold_down,
           upregulated_genes = upregulated_genes,
           downregulated_genes = downregulated_genes,
           pos_enriched = pos_enriched,
           neg_enriched = neg_enriched,
           sig_pos_enriched = sig_pos_enriched,
           sig_neg_enriched = sig_neg_enriched,
           num_tested = num_tested,
           num_upreg = num_upreg,
           num_downreg = num_downreg,
           num_pos_enriched = num_pos_enriched,
           num_neg_enriched = num_neg_enriched,
           num_sig_pos_enriched = num_sig_pos_enriched,
           num_sig_neg_enriched = num_sig_neg_enriched
           )

  g
}

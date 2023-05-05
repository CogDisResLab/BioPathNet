#' Extract Leading Edge Genes from GSEA Results
#'
#' @param gsea an object of class GSEAResult
#' @param direction one of "up" or "down"
#'
#' @return A tibble with the leading edge genes and associated pathways
#'
#' @importFrom magrittr %>%
#' @importFrom dplyr select rename
#' @importFrom tidyr unnest separate
#' @importFrom rlang .data
#'
#' @examples
#' TRUE
leading_edge <- function(gsea, direction) {

  if (direction == "up") {
    g <- slot(gsea, "sig_pos_enriched")
  } else if (direction == "down") {
    g <- slot(gsea, "sig_neg_enriched")
  } else {
    stop("Direction must by one of 'up' or 'down'")
  }

  out <- g %>%
    dplyr::select(.data$pathway, .data$leadingEdge) %>%
    tidyr::unnest(cols = c(.data$leadingEdge)) %>%
    tidyr::separate(.data$pathway, into = c("Pathway", "Ontology", "GOID"), sep = "%") %>%
    dplyr::rename(Name_GeneSymbol = .data$leadingEdge)

  out

}


#' Perform Leading Edge Gene Analysis
#'
#' This method takes in a bpn object and performs a leading edge analysis to
#' identify the genes that are driving the majority of pathways.
#'
#' @param bpn An object of class BPNList. Must have the gsea analysis completed beforehand.
#'
#' @return An object of class BPNList with its leading slot populated with the results
#' @export
#'
#' @importFrom magrittr %>%
#' @importFrom dplyr inner_join
#' @importFrom rlang .data
#'
#' @examples
#' TRUE
do_leading_pod <- function(bpn) {
  inp <- input(bpn)
  g <- gsea(bpn)

  if (slot(g, "empty") == TRUE) {
    stop("Please perform the GSEA analysis first.")
  }

  leading_up <- leading_edge(g, direction = "up") %>%
    dplyr::inner_join(inp, by = "Name_GeneSymbol")
  leading_down <- leading_edge(g, direction = "down") %>%
    inner_join(inp, by = "Name_GeneSymbol")

  l <- LEResult(leading_up, leading_down)

  leading(bpn) <- l

  bpn

}

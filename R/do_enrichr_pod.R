#' Perform the EnrichR Analysis
#'
#' @param bpn
#' @param alpha
#' @param lower
#' @param upper
#'
#' @return
#' @export
#'
#' @import purrr dplyr enrichR
#'
#' @examples
#' TRUE
do_enrichr_pod <- function(bpn, alpha = 0.05, lower = NULL, upper = NULL) {

  if (is.null(lower)) {
    lower <- round(quantile(inp$Value_LogDiffExp, 0.10))
  }

  if (is.null(upper)) {
    upper <- round(quantile(inp$Value_LogDiffExp, 0.90))
  }

  inp <- bpn@input

  dbs <- c("GO_Biological_Process_2018",
           "GO_Molecular_Function_2018",
           "GO_Cellular_Component_2018")

  columns <- c("Biological_Process",
               "Molecular_Function",
               "Cellular_Component")

  upreg <- inp %>%
    filter(Value_LogDiffExp > upper)

  downreg <- inp %>%
    filter(Value_LogDiffExp < lower)

  up_enrichr <- upreg %>%
    pull(Name_GeneSymbol) %>%
    enrichR::enrichr(., dbs) %>%
    map2(columns, ~ mutate(.x, namespace = .y)) %>%
    bind_rows

  down_enrichr <- downreg %>%
    pull(Name_GeneSymbol) %>%
    enrichR::enrichr(., dbs) %>%
    map2(columns, ~ mutate(.x, namespace = .y)) %>%
    bind_rows

  e <- EnrichRResult(
    up_enrichr, down_enrichr, upreg, downreg, alpha, upper, lower, dbs
  )

  enrichr(bpn) <- e

  bpn
}

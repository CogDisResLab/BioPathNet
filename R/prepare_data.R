#' @include classes.R
#' @import tibble dplyr purrr
NULL

conditional_dataset <- function(genes, logfc, pvalues = NULL) {

  # return a dataset with two or three columns
  # based on whether or not pvalues were supplied

  dataset <- tibble::tibble(
    Name_GeneSymbol = genes,
    Value_LogDiffExp = logfc)

  if (!is.null(pvalues)) {
    dataset$Significane_pvalue <- pvalues
  }

  out <- dataset %>%
    dplyr::arrange(desc(Value_LogDiffExp))

  out
}

#' Prepare the data for downstream analysis
#'
#' This function takes vectors of gene names, log Fold-change values and optionally p-values
#' and formats them into a tibble for downstream analysis.
#'
#' The function returns an object of class BPNList that will update as the analysis proceeds
#'
#' @param genes a character vector of gene names
#' @param logfc a numeric vector of log fold-change values
#' @param pvalues (optional) a numeric vector of p-values
#'
#' @return An object of class BPNList with the following slot set:
#'
#' input
#'
#' @export
#'
#' @examples
#' TRUE

prepare_data <- function(genes, logfc, pvalues = NULL) {
  # Generate a dataset with a formal and expected structure
  # and return a BPNList object

  if (missing(genes) | missing(logfc)) {
    stop("genes and logfc must be specified")
  }

  if (!purrr::is_vector(genes) | !purrr::is_character(genes)) {
    stop("genes must be a character vector of gene names")
  }

  if (!purrr::is_vector(logfc) | !is.numeric(logfc)) {
    stop("logfc must be a numeric vector containing log fold-change values")
  }

  if (length(genes) != length(logfc)) {
    stop("genes and logfc must be of the same length")
  }

  if (!is.null(pvalues)) {
    if (!purrr::is_vector(pvalues) | !is.numeric(pvalues)) {
      stop("pvalues must be a numeric vector containing pvalues")
    }
    if (length(pvalues) != length(genes)) {
      stop("pvalues must be the same length as genes and logfc")
    }
  }

  dataset <- conditional_dataset(genes = genes, logfc = logfc, pvalues = pvalues)

  bpn <- BPNList(input = dataset)

  bpn
}


conditional_dataset <- function(genes, logfc, pvalues = NULL) {

  # return a dataset with two or three columns
  # based on whether or not pvalues were supplied

  dataset <- tibble::tibble(
    Name_GeneSymbol = genes,
    Value_LogDiffExp = logfc)

  if (!is.null(pvalues)) {
    dataset$pvalues <- pvalues
  }

  out <- dataset %>%
    arrange(desc(Value_LogDiffExp))

  out
}

prepare_data <- function(genes, logfc, pvalues = NULL) {
  # Generate a dataset with a formal and expected structure
  # and return a BPNList object

  if (!is_vector(genes) | !is_character(genes)) {
    stop("genes must be a character vector of gene names")
  }

  if (!is_vector(logfc) | !is_double(logfc)) {
    stop("logfc must be a numeric vector containing log fold-change values")
  }

  if (length(genes) != length(logfc)) {
    stop("genes and logfc must be of the same length")
  }

  if (!is.null(pvalues)) {
    if (!is_vector(pvalues) | !is_double(pvalues)) {
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

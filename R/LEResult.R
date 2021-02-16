#' @include classes.R
NULL

#' Construct an LEResult object
#'
#' @param leading_up tbl_df. A dataframe with the results of all the leading edge genes from upregulated genes
#' @param leading_down tbl_df. A dataframe with the results of all the leading edge genes from downregulated genes
#'
#' @return An object of class LEResult
#' @export
#'
#' @importFrom dplyr count
#' @importFrom magrittr %>%
#' @importFrom rlang .data
#'
#' @examples
#' TRUE
LEResult <- function(leading_up, leading_down) {

  count_leading_up <- leading_up %>%
    dplyr::count(.data$Name_GeneSymbol)

  count_leading_down <- leading_down %>%
    dplyr::count(.data$Name_GeneSymbol)

  num_leading_up <- nrow(count_leading_up)

  num_leading_down <- nrow(count_leading_down)

  l <- new("LEResult",
           leading_up = leading_up,
           leading_down = leading_down,
           count_leading_up = count_leading_up,
           count_leading_down = count_leading_down,
           num_leading_up = num_leading_up,
           num_leading_down = num_leading_down,
           empty = FALSE)

  l
}

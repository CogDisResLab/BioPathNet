#' Perform Revigo enrichment analysis
#'
#' @param input_data A dataframe containing GO IDs and associated p-values
#'
#' @return A dataframe containing the Revigo Enrichment analysis
#' @export
#'
#' @import readr stringr dplyr
#' @importFrom rlang .data
#'
#' @examples
#' TRUE
get_revigo_output <- function(input_data) {
  java_binary <- system.file("java", "RevigoStandalone.jar", package = "BioPathNet")

  temp <- tempfile()
  input_data %>%
    readr::write_tsv(temp, col_names = F)

  command <- stringr::str_glue("java -jar {java_binary} {temp} --stdout")

  output <- system(command, intern = T)

  output_df <- readr::read_tsv(
    stringr::str_c(output, collapse = "\n"),
    skip = 2
  ) %>%
    dplyr::rename(namespace = .data$`%namespace`) %>%
    dplyr::select(.data$namespace, .data$term_ID, .data$description,
                  .data$frequency, .data$`log10_p-value`, .data$uniqueness,
                  .data$dispensability, .data$representative) %>%
    dplyr::rename_with(stringr::str_to_title) %>%
    dplyr::rename(GOID = .data$Term_id,
                  Log10_pval = .data$`Log10_p-Value`)

  return(output_df)
}

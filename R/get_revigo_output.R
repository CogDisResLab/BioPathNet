#' Perform Revigo enrichment analysis
#'
#' @param input_data A dataframe containing GO IDs and associated p-values
#'
#' @return A dataframe containing the Revigo Enrichment analysis
#' @export
#'
#' @import readr stringr dplyr
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
    dplyr::rename(namespace = `%namespace`) %>%
    dplyr::select(namespace, term_ID, description,
                  frequency, `log10_p-value`, uniqueness,
                  dispensability, representative) %>%
    dplyr::rename_with(stringr::str_to_title) %>%
    dplyr::rename(GOID = Term_id,
                  Log10_pval = `Log10_p-Value`)

  return(output_df)
}

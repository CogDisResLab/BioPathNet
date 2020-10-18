#' @import methods
NULL

#' GSEAResult-class: Class storing GSEA Results
#'
#' This class stores the input parameters and results of the Gene Set Enrichment Analysis.
#'
#' @slot alpha numeric. The Alpha threshold for significance
#' @slot threshold_up numeric. The logfc threshold for up-regulated genes
#' @slot threshold_down numeric. The logfc threshold for down-regulated genes
#' @slot upregulated_genes tbl_df. The up-regulated genes from the input DEG tibble
#' @slot pathways tbl_df. The pathways we used, either built-in or user-supplied
#' @slot downregulated_genes tbl_df. The down-regulated genes from the input DEG tibble
#' @slot pos_enriched tbl_df. The positively enriched pathways
#' @slot neg_enriched tbl_df. The negatively enriched pathways
#' @slot sig_pos_enriched tbl_df. Significant positively enriched pathways
#' @slot sig_neg_enriched tbl_df. Significant positively enriched pathways
#' @slot num_upreg numeric. Number of up-regulated genes
#' @slot num_downreg numeric. Number of down-regulated genes
#' @slot num_tested numeric. Number of pathways tested
#' @slot num_pos_enriched numeric. Number of positively enriched pathways
#' @slot num_neg_enriched numeric. Number of negatively enriched pathways
#' @slot num_sig_pos_enriched numeric. Number of significant positively enriched pathways
#' @slot num_sig_neg_enriched numeric. Number of significant negatively enriched pathways
#' @slot empty logical. A simple check for whether or not the object is empty
#'
#' @return an object of class GSEAResult
#' @export
#'
#' @examples
#' TRUE
setClass("GSEAResult",
         slots = c(
           alpha = "numeric", # The Alpha threshold for significance
           threshold_up = "numeric", # The logfc threshold for up-regulated genes
           threshold_down = "numeric", # the logfc threshold for down-regulated genes
           upregulated_genes = "tbl_df", # The up-regulated genes from the input DEG tibble
           downregulated_genes = "tbl_df", # The down-regulated genes from the input DEG tibble
           pathways = "list", # The pathways we used, either built-in or user-supplied
           pos_enriched = "tbl_df", # The positively enriched pathways
           neg_enriched = "tbl_df", # The negatively enriched pathways
           sig_pos_enriched = "tbl_df", # Significant positively enriched pathways
           sig_neg_enriched = "tbl_df", # Significantly negatively enriched pathways
           num_upreg = "numeric", # Number of up-regulated genes
           num_downreg = "numeric", # Number of down-regulated genes
           num_tested = "numeric", # Number of pathways tested
           num_pos_enriched = "numeric", # Number of positively enriched pathways
           num_neg_enriched = "numeric", # Number of negatively enriched pathways
           num_sig_pos_enriched = "numeric", # Number of significant positively enriched pathways
           num_sig_neg_enriched = "numeric", # Number of significant negatively enriched pathways
           empty = "logical"
         ))


#' EnrichRResult-class: Class storing EnrichR Results
#'
#' This class stores the input parameters and results of the Gene Set Enrichment Analysis.
#'
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
#' @slot empty logical. A simple check for whether or not the object is empty
#'
#' @return an object of class EnrichRResult
#' @export
#'
#' @examples
#' TRUE
setClass("EnrichRResult",
         slots = c(
           alpha = "numeric", # The Alpha threshold for significance
           threshold_up = "numeric", # The logfc threshold for up-regulated genes
           threshold_down = "numeric", # the logfc threshold for down-regulated genes
           upregulated_genes = "tbl_df", # The up-regulated genes from the input DEG tibble
           downregulated_genes = "tbl_df", # The down-regulated genes from the input DEG tibble
           dbs_used = "character", # The names of the databases used to generate enrichment scores
           up_enrichr = "tbl_df", # Enriched pathways in up-regulated genes
           down_enrichr = "tbl_df", # Enriched pathways in down-regulated genes
           sig_up_enrichr = "tbl_df", # Significant enriched pathways in up-regulated genes
           sig_down_enrichr = "tbl_df", # Significant enriched pathways in down-regulated genes
           num_upreg = "numeric", # Number of up-regulated genes
           num_downreg = "numeric", # Number of down-regulated genes
           num_up_enrichr = "numeric", # Number of enriched pathways in up-regulated genes
           num_down_enrichr = "numeric", # Number of enriched pathways in down-regulated genes
           num_sig_up_enrichr = "numeric", # Number of significant enriched pathways in up-regulated genes
           num_sig_down_enrichr = "numeric", # Number of significant enriched pathways in down-regulated genes
           empty = "logical"
         ))

#' iLINCSResult-class: Class storing iLINCS Results
#'
#' This class stores the result of the results from iLINCS
#'
#' @slot threshold_up numeric. LFC threshold for up-regulated genes
#' @slot threshold_down numeric. LFC threshold for down-regulated genes
#' @slot threshold_pval numeric. P Value threshold for genes.
#' @slot threshold_similarity numeric. Similarity threshold
#' @slot l1000_subset tbl_df. Subset of L1000 genes in the dataset
#' @slot upregulated_genes tbl_df. L1000 genes up-regulatedd in dataset
#' @slot downregulated_genes tbl_df. L1000 genes down-regulated in dataset
#' @slot ilincs_query_signature tbl_df. Complete iLINCS Query signature
#' @slot all_perturbagens tbl_df. Complete list returned from iLINCS of perturbagens
#' @slot filtered_perturbagens tbl_df. Filtered list of perturbagens by the similarity threshold
#' @slot num_genes_l1000 numeric. Number of L1000 genes in dataset
#' @slot num_genes_upregulated numeric. Number of up-regulated L1000 genes in dataset
#' @slot num_genes_downregulated numeric. Number of down-regulated L1000 genes in dataset
#' @slot num_all_perturbagens numeric. Number of all perturbagens returned by iLINCS
#' @slot num_filtered_perturbagens numeric. Number of filtered perturbagens returned by iLINCS
#' @slot empty logical. A simple check for whether or not the object is empty
#'
#' @return
#' @export
#'
#' @examples
#' TRUE
setClass("iLINCSResult",
         slots = c(
           threshold_up = "numeric", # LFC threshold for up-regulated genes
           threshold_down = "numeric", # LFC threshold for down-regulated genes
           threshold_pval = "numeric", # P Value threshold for genes.
           threshold_similarity = "numeric", # Similarity threshold
           l1000_subset = "tbl_df", # Subset of L1000 genes in the dataset
           upregulated_genes = "tbl_df", # L1000 genes up-regulatedd in dataset
           downregulated_genes = "tbl_df", # L1000 genes down-regulated in dataset
           ilincs_query_signature = "tbl_df", # Complete iLINCS Query signature
           all_perturbagens = "tbl_df", # Complete list returned from iLINCS of perturbagens
           filtered_perturbagens = "tbl_df", # Filtered list of perturbagens by the similarity threshold
           num_genes_l1000 = "numeric", # Number of L1000 genes in dataset
           num_genes_upregulated = "numeric", # Number of up-regulated L1000 genes in dataset
           num_genes_downregulated = "numeric", # Number of down-regulated L1000 genes in dataset
           num_all_perturbagens = "numeric", # Number of all perturbagens returned by iLINCS
           num_filtered_perturbagens = "numeric", # Number of filtered perturbagens returned by iLINCS
           empty = "logical"
         ))

#' LEResult-class: Class containing Leading Edge Analysis results
#'
#' @slot placeholder numeric.
#' @slot empty logical. A simple check for whether or not the object is empty
#'
#' @return an object of class LEResult
#' @export
#'
#' @examples
#' TRUE

setClass("LEResult",
         slots = c(
           placeholder = "numeric",
           empty = "logical"
         ))

#' RevigoResult-class: Class containing results from Revigo
#'
#' @slot placeholder numeric.
#' @slot empty logical. A simple check for whether or not the object is empty
#'
#' @return and object of class RevigoResult
#' @export
#'
#' @examples
#' TRUE

setClass("RevigoResult",
         slots = c(
           placeholder = "numeric",
           empty = "logical"
         ))

#' IntegratedResult-class: Class containing Integrated results
#'
#' @slot placeholder numeric.
#' @slot empty logical. A simple check for whether or not the object is empty
#'
#' @return and object of class IntegratedResults
#' @export
#'
#' @examples
#' TRUE
setClass("IntegratedResult",
         slots = c(
           placeholder = "numeric",
           empty = "logical"
         ))

#' BPNList-class: The BioPathNet Core Class
#'
#' This class takes care of the entire analysis infrastructure of the BioPathNet analysis.
#' This class is created with inputting a list of differentially expressed genes and then
#' stores the subsequently generated results.
#'
#' @slot input tbl_df. A tibble with Two columns of gene names and logfc values and optionally a p-value column
#' @slot gsea GSEAResult. An instance of \link{GSEAResult-class} class storing the results GSEA Analysis
#' @slot enrichr EnrichRResult. An instance of \link{EnrichRResult-class} class storing the results EnrichR Analysis
#' @slot ilincs iLINCSResult. An instance of \link{iLINCSResult-class} class storing the results iLINCS Analysis
#' @slot leading LEResult. An instance of \link{LEResult-class} class storing the results Leading Edge Analysis
#' @slot revigo RevigoResult. An instance of \link{RevigoResult-class} class storing the results Revigo Analysis
#' @slot integrated IntegratedResult. An instance of \link{IntegratedResult-class} class storing the results after integrating the three components
#'
#' @return An object of class BPNList
#' @export
#'
#' @examples
#' TRUE
setClass("BPNList",
         slots = c(
           input = "tbl_df",
           gsea = "GSEAResult",
           enrichr = "EnrichRResult",
           ilincs = "iLINCSResult",
           leading = "LEResult",
           revigo = "RevigoResult",
           integrated = "IntegratedResult"
           ))



require(methods)

setClass("GSEAResult",
         slots = c(
           alpha_gsea = "numeric", # The Alpha threshold for significance
           threshold_up_gsea = "numeric", # The logfc threshold for up-regulated genes
           threshold_down_gsea = "numeric", # the logfc threshold for down-regulated genes
           upregulated_gsea = "tbl_df", # The up-regulated genes from the input DEG tibble
           downregulated_gsea = "tbl_df", # The down-regulated genes from the input DEG tibble
           pathways = "tbl_df", # The pathways we used, either built-in or user-supplied
           pos_gsea_enriched = "tbl_df", # The positively enriched pathways
           neg__gsea_enriched = "tbl_df", # The negatively enriched pathways
           sig_pos_gsea_enriched = "tbl_df", # Significant positively enriched pathways
           sig_neg_gsea_enriched = "tbl_df", # Significantly negatively enriched pathways
           num_upreg_gsea = "numeric", # Number of up-regulated genes
           num_downreg_gsea = "numeric", # Number of down-regulated genes
           num_tested_gsea = "numeric", # Number of pathways tested
           num_pos_enriched_gsea = "numeric", # Number of positively enriched pathways
           num_neg_enriched_gsea = "numeric", # Number of negatively enriched pathways
           num_sig_pos_enriched_gsea = "numeric", # Number of significant positively enriched pathways
           num_sig_neg_enriched_gsea = "numeric" # Number of significant negatively enriched pathways
         ))

setClass("EnrichRResult",
         slots = c(
           alpha_enrichr = "numeric", # The Alpha threshold for significance
           threshold_up_enrichr = "numeric", # The logfc threshold for up-regulated genes
           threshold_down_enrichr = "numeric", # the logfc threshold for down-regulated genes
           upregulated_enrichr = "tbl_df", # The up-regulated genes from the input DEG tibble
           downregulated_enrichr = "tbl_df", # The down-regulated genes from the input DEG tibble
           dbs_used = "character", # The names of the databases used to generate enrichment scores
           up_enrichr_enriched = "tbl_df", # Enriched pathways in up-regulated genes
           down_enrichr_enriched = "tbl_df", # Enriched pathways in down-regulated genes
           sig_up_enrichr_enriched = "tbl_df", # Significant enriched pathways in up-regulated genes
           sig_down_enrichr_enriched = "tbl_df", # Significant enriched pathways in down-regulated genes
           num_upreg_enrichr = "numeric", # Number of up-regulated genes
           num_downreg_enrichr = "numeric", # Number of down-regulated genes
           num_up_enrichr_enriched = "numeric", # Number of enriched pathways in up-regulated genes
           num_down_enrichr_enriched = "numeric", # Number of enriched pathways in down-regulated genes
           num_sig_up_enrichr_enriched = "numeric", # Number of significant enriched pathways in up-regulated genes
           num_sig_down_enrichr_enriched = "numeric" # Number of significant enriched pathways in down-regulated genes
         ))

setClass("iLINCSResult",
         slots = c(
           threshold_up_ilincs = "numeric", # LFC threshold for up-regulated genes
           threshold_down_ilincs = "numeric", # LFC threshold for down-regulated genes
           threshold_pval_ilincs = "numeric", # P Value threshold for genes.
           threshold_similarity = "numeric", # Similarity threshold
           l1000_subset = "tbl_df", # Subset of L1000 genes in the dataset
           upregulated_ilincs = "tbl_df", # L1000 genes up-regulatedd in dataset
           downregulated_ilincs = "tbl_df", # L1000 genes down-regulated in dataset
           ilincs_query_signature = "tbl_df", # Complete iLINCS Query signature
           all_perturbagens_ilincs = "tbl_df", # Complete list returned from iLINCS of perturbagens
           filtered_perturbagens_ilincs = "tbl_df", # Filtered list of perturbagens by the similarity threshold
           num_genes_l1000 = "numeric", # Number of L1000 genes in dataset
           num_genes_upregulated_ilincs = "numeric", # Number of up-regulated L1000 genes in dataset
           num_genes_downregulated_ilincs = "numeric", # Number of down-regulated L1000 genes in dataset
           num_all_perturbagens_ilincs = "numeric", # Number of all perturbagens returned by iLINCS
           num_filtered_perturbagens_ilincs = "numeric" # Number of filtered perturbagens returned by iLINCS
         ))

setClass("LEResult",
         slots = c(
           placeholder = "numeric"
         ))

setClass("RevigoResult",
         slots = c(
           placeholder = "numeric"
         ))

setClass("IntegratedResult",
         slots = c(
           placeholder = "numeric"
         ))

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



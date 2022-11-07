#' Filter geneTF prior based on the gene list user provided
#' @param geneTF_matrix geneTF prior
#' @param gene_list gene list user provided
#' @param TF_upbound the upper bound of percentage of TF targeted genes over all genes. The default is 80\%
#' @param TF_lowbound  the lower bound of number of TF targeted genes. The defalut is 10
#' @param gene_lowbound the lower bound of number of TFs targeting to the gene
#' @return geneTF matrix
#' @export

filter_geneTF <- function(geneTF_matrix, gene_list, TF_upbound=0.8, TF_lowbound=10, gene_lowbound=5){

  gene_comm <- intersect(rownames(geneTF_matrix), gene_list)

  # TF_comm <- intersect(colnames(geneTF_matrix), gene_list)

  df_geneTF <- geneTF_matrix[gene_comm,]

  df_geneTF_1 <- filter_gene(df_geneTF, gene_lowbound)

  df_geneTF_2 <- filter_TF(df_geneTF_1, TF_lowbound, TF_upbound)

  df_geneTF_3 <- filter_gene(df_geneTF_2, gene_lowbound)

  df_geneTF_4 <- filter_TF(df_geneTF_3, TF_lowbound, TF_upbound)

  return(df_geneTF_4)
}

filter_gene <- function(geneTF_matrix, gene_lowbound){
  return(geneTF_matrix[rowSums(geneTF_matrix != 0) > gene_lowbound,])
}

filter_TF <- function(geneTF_matrix, TF_lowbound, TF_upbound){
  TFs_cond <- (colSums(geneTF_matrix !=0) < TF_upbound*nrow(geneTF_matrix)) & (colSums(geneTF_matrix !=0) > TF_lowbound)
  return(geneTF_matrix[,TFs_cond])
}

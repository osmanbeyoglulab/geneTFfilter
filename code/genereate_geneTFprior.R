library(data.table)
library(dplyr)
library(tidyverse)

#combine TF-gene original download and TF motif info table to generate the geneTF prior matrix
# This code does not intend for user to run. It is saved for our recodes showing how to genereate this prior matrix
# For actual usage, user just need to load the "geneTFprior.csv" file which is saved in "../data-raw" folder
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

generate_geneTFprior <- function() {

  df_geneTF <-data.table::fread("./internal_data/tf-target-matrix_April.csv")

  df_geneTF <- df_geneTF %>% remove_rownames %>% column_to_rownames(var="V1")

  df_TFs <- as.data.frame(data.table::fread("./internal_data/TFs_Osmanbeyoglu.csv"))

  TFs_cond <-  df_TFs[,'Name'][(df_TFs[,'Is TF']=="Yes") & (df_TFs[,'TF assessment']=="Known motif")]

  TFs_comm <- intersect(colnames(df_geneTF), TFs_cond)

  df_geneTF_comm <- df_geneTF[, TFs_comm]

  df_geneTF_filtered <- df_geneTF_comm[rowSums(df_geneTF_comm)>0, ]

  fwrite(df_geneTF_filtered, "../data-raw/geneTFprior.csv", row.names=TRUE)

}

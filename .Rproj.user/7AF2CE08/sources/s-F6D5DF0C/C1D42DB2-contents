#' Load TF and target gene matrix prior
#' @param filepath geneTF matrix file path
#' @return geneTF matrix
#' @export

load_geneTF <- function(filepath) {

  geneTF_raw <-data.table::fread(filepath)

  geneTF <- geneTF_raw[,-1]
  rownames(geneTF) <- geneTF_raw[,1]

  return(geneTF)

}

# geneTFfilter
geneTFfilter is an R package whose function is to filter geneTF prior matrix based on the gene list that the user provides.

## Install the package
In the R environment, simply type in the following code to install and load the package
```sh
library(devtools)
install.github('osmanbeyoglulab/Dfilter')
```
## Usage
Once the package has been loaded to the R environment, then call the function filter_geneTF(). 

There are 5 parameters in the function call
```sh
@param geneTF_matrix
       geneTF prior
@param gene_lis
       t gene list user provided
@param TF_upbound (optional)
       the upper bound of percentage of TF targeted genes over all genes. The default is 80\%
@param TF_lowbound (optional)
       the lower bound of number of TF targeted genes. The defalut is 10
@param gene_lowbound (optional)
       the lower bound of number of TFs targeting to the gene

@return geneTF matrix
```
Usage examples:
```sh
filter_geneTF(geneTFmatrix, gene_list)
filter_geneTF(geneTFmatrix, gene_list, gene_lowbound=20)

```
Users can download "geneTFprior.csv" from "./data-raw" folder. In the "./code" folder, we archive the process on how we generated this prior matrix.

We also provide function load_geneTF(filepath) for convinient loading of geneTF prior matrix
```sh
geneTFprior <- oad_geneTF("./data-raw/geneTFprior.csv")
```
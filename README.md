# geneTFfilter
geneTFfilter is an R package whose function is to filter geneTF prior matrix based on the user-provided gene list.

## Install the package
In the R environment, simply type in the following code to install and load the package
```sh
library(devtools)
install_github('osmanbeyoglulab/geneTFfilter')
library(geneTFfilter)
```
## Usage
Once the package has been loaded to the R environment, then call the function filter_geneTF(). 

There are 5 parameters in the function call
```sh
@param geneTF_prior
       geneTF prior matrix/dataframe
@param gene_list
       user provided gene list
@param TF_upbound (optional)
       the upper bound of percentage of TF targeted genes over all genes. The default is 80\%.
@param TF_lowbound (optional)
       the lower bound of number of TF targeted genes. The default is 10.
@param gene_lowbound (optional)
       the lower bound of number of TFs targeting to the gene. The default is 5.

@return geneTF matrix
```
Usage examples:
```sh
geneTFprior <- filter_geneTF(geneTFprior, genelist)
geneTFprior <- filter_geneTF(geneTFprior, genelist, gene_lowbound=20)

```
Users can download "geneTFprior.csv" from "./data-raw" folder. We archived the process on how we generated this prior matrix in the "./code/genereate_geneTFprior.R".

We also provide a function load_geneTF(filepath) for convinient loading of geneTF prior matrix

usage example:
```sh
geneTFprior <- load_geneTF("./data-raw/geneTFprior.csv")
```

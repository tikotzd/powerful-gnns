# What this repo is all about?
Reproduction of the results of the article "How Powerful are Graph Neural Networks?" (published as a conference paper at ICLR 2019), written by Keyulu Xu, Weihua Hu, Jure Leskovec and Stefanie Jegelka. 
The original article can be found here - https://arxiv.org/pdf/1810.00826.

More specifically, this repo contains files which we have created in order to reconstruct the results reported in the article. 
Some files in this repo rely on the authors' repository, whose link is "https://github.com/weihua916/powerful-gnns". This link is attached in the article.

More elaboration on each file type can be found below.


# Different file types
## bash_files
### Description
Each file in this folder contains execution of the whole learning process (training+testing) of a specific GNN variant, on all given datasets.
More specifically - there is a bash file for each GNN variant examined in the article (max as aggregation func. with 1-layer-MLP, max as aggregation func. with 2-layer-MLP, mean as aggregation func. with 1-layer-MLP, mean as aggregation func. with 2-layer MLP, sum as aggregation func. with 1-layer-MLP, sum as aggregation func. with epsilon value of 0 and with 2-layer-MLP, and sum as aggregation func. with learnable epsilon value and with 2-layer-MLP - where epsilon regards to equation (4.1) in the article), where in each bash file there is execution of main.py, on each of the ten possible fold indices, and on each of the datasets for which there are results for this GNN variant in the original article.

### Usage
To execute any of these files:
1. clone the original "powerful-gnns" repo to any linux machine, and put the wanted bash file in the same directory as in main.py.
2. Make sure "outputs" subdirectory exists in the directory where the bash file and main.py are executed.
3. Change line 147 in main.py to open args.filename in "append" mode instead of "writing" mode, so that output file will contain data for each of the epochs and not only for the last one.
4. Execute the bash file.

### Comments
* meaning of "additional_flag": in the README file of the original repo, for COLLAB and IMDB datasets the flag "--degree_as_tag" is required for execution.
* Varying amount of epochs: for datasets for which training accuracy graphs do not exist (COLLAB, IMDBMULTI, MUTAG, REDDITMULTI5K), we had noticed that convergence is reached within much less than 350 epochs for any fold index and hence drastically reduced the amount of epochs for main.py. Specifically, we have reduced the number of epochs to either 30, 50 or 70 - depending on the dataset and the GNN variant. 
The main factor for that reduction is MASSIVE save of time. If we focus on mean-1-layer GNN variant and REDDITMULTI5K dataset, executing 70 epochs on each fold index took us 73 minutes on average, on a 1TB RAM server(!!!). Now multiply that by 10 (the amount of fold indices), and we get over 12 hours by total. If we had executed 350 epochs on each fold index instead of 70, it would have taken over 2.5 days ONLY for one dataset and for one GNN variant.

## outputs
The name of each output file in this directory complies with the format "{GNN_variant}\_{dataset}\_{fold_index}".
In each output file, each line complies with the format "{epoch_number} {average_loss} {training_accuracy} {test_accuracy}".
There are seven GNN variants, nine datasets, two GNN variants (max-1-layer, max-mlp) for which three datasets (COLLAB, REDDITBINARY, REDDITMULTI5K) are not executed, and ten fold indices. Hence, the total amount of output files is (7*9-6)*10 = 570.

## display_results.ipynb

### test
sssss

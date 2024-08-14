#!/bin/bash

# Define the datasets
datasets=("IMDBBINARY" "IMDBMULTI" "MUTAG" "NCI1" "PROTEINS" "PTC")

# Loop over each dataset
for dataset in "${datasets[@]}"; do
	# Check if the dataset's name is "IMDBMULTI", "IMDBBINARY" or "COLLAB"
	if [[ "$dataset" == "IMDBMULTI" || "$dataset" == "IMDBBINARY" ]]; then
		additional_flag="--degree_as_tag"
	else
		additional_flag=""
	fi
	
	# Run the python script
	if [[ "$dataset" == "IMDBMULTI" ]]; then
		for fold_idx in {0..9}
		do
			python main.py --dataset ${dataset} --fold_idx ${fold_idx} --filename outputs/max_mlp_${dataset}_${fold_idx} ${additional_flag} --batch_size 128 --epochs 50 --neighbor_pooling_type max
		done
	else
		for fold_idx in {0..9}
		do
			python main.py --dataset ${dataset} --fold_idx ${fold_idx} --filename outputs/max_mlp_${dataset}_${fold_idx} ${additional_flag} --batch_size 128 --neighbor_pooling_type max
		done
	fi
done

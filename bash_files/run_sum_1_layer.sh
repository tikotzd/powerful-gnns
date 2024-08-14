#!/bin/bash

# Define the datasets
datasets=("COLLAB" "IMDBBINARY" "IMDBMULTI" "MUTAG" "NCI1" "PROTEINS" "PTC" "REDDITBINARY" "REDDITMULTI5K")

# Loop over each dataset
for dataset in "${datasets[@]}"; do
	# Check if the dataset's name is "IMDBMULTI", "IMDBBINARY" or "COLLAB"
	if [[ "$dataset" == "IMDBMULTI" || "$dataset" == "IMDBBINARY" || "$dataset" == "COLLAB" ]]; then
		additional_flag="--degree_as_tag"
	else
		additional_flag=""
	fi
	
	# Run the python script
	if [[ "$dataset" == "IMDBMULTI" || "$dataset" == "REDDITMULTI5K" || "$dataset" == "MUTAG" ]]; then
		for fold_idx in {0..9}
		do
			python main.py --dataset ${dataset} --fold_idx ${fold_idx} --filename outputs/sum_1_layer_${dataset}_${fold_idx} ${additional_flag} --batch_size 128 --epochs 70 --num_mlp_layers 1
		done
	elif [[ "$dataset" == "COLLAB" ]]; then
		for fold_idx in {0..9}
		do
			python main.py --dataset ${dataset} --fold_idx ${fold_idx} --filename outputs/sum_1_layer_${dataset}_${fold_idx} ${additional_flag} --batch_size 128 --epochs 30 --num_mlp_layers 1
		done
	else
		for fold_idx in {0..9}
		do
			python main.py --dataset ${dataset} --fold_idx ${fold_idx} --filename outputs/sum_1_layer_${dataset}_${fold_idx} ${additional_flag} --batch_size 128 --num_mlp_layers 1
		done
	fi
done

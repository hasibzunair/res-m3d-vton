#!/bin/bash

# Run models on test dataset (934 samples)
python test.py --model MTM --name MTM --dataroot datasets/MPV3D --datalist test_pairs --checkpoints_dir logs/res-m3dvton --results_dir results
python test.py --model DRM --name DRM --dataroot datasets/MPV3D --datalist test_pairs --checkpoints_dir logs/res-m3dvton --results_dir results
python test.py --model TFM --name TFM --dataroot datasets/MPV3D --datalist test_pairs --checkpoints_dir logs/res-m3dvton --results_dir results

# Get point clouds
python rgbd2pcd.py --parse_root datasets/MPV3D/image-parse
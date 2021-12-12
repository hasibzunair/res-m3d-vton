#!/bin/bash

# Run models on custom examples
python test.py --model MTM --name MTM --dataroot mpv3d_example_custom --datalist test_pairs --checkpoints_dir logs/res-m3dvton --results_dir results
python test.py --model DRM --name DRM --dataroot mpv3d_example_custom --datalist test_pairs --checkpoints_dir logs/res-m3dvton --results_dir results
python test.py --model TFM --name TFM --dataroot mpv3d_example_custom --datalist test_pairs --checkpoints_dir logs/res-m3dvton --results_dir results

# Get point clouds
python rgbd2pcd.py --parse_root mpv3d_example_custom/image-parse
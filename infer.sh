#!/bin/bash

python test.py --model MTM --name MTM --dataroot mpv3d_example --datalist test_pairs --checkpoints_dir logs/exp1 --results_dir results
python test.py --model DRM --name DRM --dataroot mpv3d_example --datalist test_pairs --checkpoints_dir logs/exp1 --results_dir results
python test.py --model TFM --name TFM --dataroot mpv3d_example --datalist test_pairs --checkpoints_dir logs/exp1 --results_dir results
python rgbd2pcd.py

# python test.py --model MTM --name MTM --dataroot mpv3d_example --datalist test_pairs --checkpoints_dir logs/exp1 --results_dir results/exp1/
# python test.py --model DRM --name DRM --dataroot mpv3d_example --datalist test_pairs --checkpoints_dir logs/exp1 --results_dir results/exp1/
# python test.py --model TFM --name TFM --dataroot mpv3d_example --datalist test_pairs --checkpoints_dir logs/exp1 --results_dir results/exp1/
# python rgbd2pcd.py
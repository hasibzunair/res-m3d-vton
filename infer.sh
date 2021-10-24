#!/bin/bash

python test.py --model MTM --name MTM --dataroot datasets/MPV3D --datalist test_pairs --checkpoints_dir logs/exp1 --results_dir results
python test.py --model DRM --name DRM --dataroot datasets/MPV3D --datalist test_pairs --checkpoints_dir logs/exp1 --results_dir results
python test.py --model TFM --name TFM --dataroot datasets/MPV3D --datalist test_pairs --checkpoints_dir logs/exp1 --results_dir results
python rgbd2pcd.py --parse_root datasets/MPV3D/image-parse

# python test.py --model MTM --name MTM --dataroot mpv3d_example --datalist test_pairs --checkpoints_dir logs/exp1 --results_dir results/exp1/
# python test.py --model DRM --name DRM --dataroot mpv3d_example --datalist test_pairs --checkpoints_dir logs/exp1 --results_dir results/exp1/
# python test.py --model TFM --name TFM --dataroot mpv3d_example --datalist test_pairs --checkpoints_dir logs/exp1 --results_dir results/exp1/
# python rgbd2pcd.py
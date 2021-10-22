# m3d-vton

This code is built on top of M3D-VTON: A Monocular-to-3D Virtual Try-On Network ([Paper](https://arxiv.org/abs/2108.05126), [Code](M3D-VTON: A Monocular-to-3D Virtual Try-On Network))

# Make env
Run below commands.

```
conda create --name comp6381 python=3.8
conda activate comp6381
conda install pytorch torchvision torchaudio cudatoolkit=11.1 -c pytorch-lts -c nvidia
conda install -c conda-forge jupyterlab
pip install opencv-python, matplotlib, sklearn, tqdm, pycocotools, tensorboard
```


# Test model

Run `MTM`, `DRM` and `TFM` modules to get final output.

```python
python test.py --model MTM --name MTM --dataroot mpv3d_example --datalist test_pairs --results_dir results
python test.py --model DRM --name DRM --dataroot mpv3d_example --datalist test_pairs --results_dir results
python test.py --model TFM --name TFM --dataroot mpv3d_example --datalist test_pairs --results_dir results
python rgbd2pcd.py
```

# Preprocess data

After downlaoding dataset, run:

```python
python util/data_preprocessing.py --MPV3D_root datasets/MPV3D/
```

# Train MTM
```python
python train.py --model MTM --name MTM --dataroot datasets/MPV3D/ --datalist train_pairs --checkpoints_dir logs/exp1
```
then run the command below to obtain the --warproot (here refers to the --results_dir) which is necessary for the other two modules:

```python
python test.py --model MTM --name MTM --dataroot  datasets/MPV3D/ --datalist train_pairs --checkpoints_dir logs/exp1/aligned/MTM --results_dir outs/mtm_results
```

# Train DRM
```python
python train.py --model DRM --name DRM --dataroot datasets/MPV3D/ --datalist train_pairs --checkpoints_dir logs/exp1
```

# Train TFM
```python
python train.py --model MTM --name MTM --dataroot datasets/MPV3D/ --datalist train_pairs --checkpoints_dir logs/exp1
```
(See options/base_options.py and options/train_options.py for more training options.)

# Todos

* <s>Run repo code</s>
* <s>Get final output on example image</s>
* Get output on custom image
* <s> </s>


# References
* [https://arxiv.org/abs/2108.05126](https://arxiv.org/abs/2108.05126)
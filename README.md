# m3d-vton

This code is built on top of M3D-VTON: A Monocular-to-3D Virtual Try-On Network ([Paper](https://arxiv.org/abs/2108.05126), [Code](https://github.com/fyviezhao/M3D-VTON))

# Make env

Python >= 3.8.0 required. Run below commands.
```
conda create --name comp6381 python=3.8
conda activate comp6381
conda install pytorch torchvision torchaudio cudatoolkit=11.1 -c pytorch-lts -c nvidia
conda install -c conda-forge jupyterlab
pip install opencv-python, matplotlib, sklearn, tqdm, pycocotools, tensorboard
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
python test.py --model MTM --name MTM --dataroot  datasets/MPV3D/ --datalist train_pairs --checkpoints_dir logs/exp1/ --results_dir outs/mtm_results
```

# Train DRM
```python
python train.py --model DRM --name DRM --batch_size 4 --dataroot datasets/MPV3D/ --warproot outs/mtm_results/aligned/MTM/train_pairs --datalist train_pairs --checkpoints_dir logs/exp1

```

# Train TFM
```python
python train.py --model TFM --name TFM --dataroot datasets/MPV3D/ --warproot outs/mtm_results/aligned/MTM/train_pairs --datalist train_pairs --checkpoints_dir logs/exp1

```
(See options/base_options.py and options/train_options.py for more training options.)

# Test model

```
bash infer.sh
```

# Todos

Mains:
* <s>Setting up the M3D-VTON algorithm</s>
* <s>Implement residual units to improve 2D try-on outputs</s>
* <s>Show results visually to demonstrate improved performance</s>
* Build end-to-end pipeline to use custom (person image, cloth) pairs as input
* Visually test M3D-VTON and proposed method on custom images

Others:
* Get output on custom image


# References
* [https://arxiv.org/abs/2108.05126](https://arxiv.org/abs/2108.05126)
* Metrics computed using [PyTorch FID](https://github.com/mseitzer/pytorch-fid) package
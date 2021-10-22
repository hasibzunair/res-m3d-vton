# m3d-vton

This code is built on top of M3D-VTON: A Monocular-to-3D Virtual Try-On Network

`https://github.com/fyviezhao/M3D-VTON`.

# Make env
Run below commands.

````
conda create --name comp6381 python=3.8
conda activate comp6381
conda install pytorch torchvision torchaudio cudatoolkit=11.1 -c pytorch-lts -c nvidia
conda install -c conda-forge jupyterlab
pip install opencv-python, matplotlib, sklearn, tqdm
```


# Test model

Inference:
```python
python test.py --model MTM --name MTM --dataroot mpv3d_example --datalist test_pairs --results_dir results
python test.py --model DRM --name DRM --dataroot mpv3d_example --datalist test_pairs --results_dir results
python test.py --model TFM --name TFM --dataroot mpv3d_example --datalist test_pairs --results_dir results
python rgbd2pcd.py
```

# Todos

* <s>Run repo code</s>
* <s>Get final output on example image</s>
* Get output on custom image
* <s> </s>


# References

* [https://arxiv.org/abs/2108.05126](https://arxiv.org/abs/2108.05126)
# Scripts for G0-arrest prediction
scripts for running the HistoMIL package in the cluster across stages of:
  1) downloading data
  2) preprocessing
    - 2.1) I suggest running preprocessing_path.sh first to get read slide, segment tissue and tesselate the tissue and store them in the DATA directory. 
    - 2.2) For feature extraction (NOTE: we directly leverage off-the-shelf feature extractors to avoid the computationally expensive self-supervised learning), there are standard preprocessing scripts include using the [ctranspath](https://github.com/Xiyue-Wang/TransPath), [UNI](https://github.com/mahmoodlab/UNI) and [gigapath](https://github.com/prov-gigapath/prov-gigapath) backbones for feature encoding of the patches. 
    - 2.3) files ending with ARRAY_OPTIONAL run a python file which splits the dataset into 5 parts to allow for running array jobs in the cluster (sun grid engine) to speed up feature extraction by running different parts of the dataset in parallel. It's optional, in the sense that you can run the feature extraction sequentially if your dataset is small enough. 
  3) training a MIL model to predict g0 arrest 

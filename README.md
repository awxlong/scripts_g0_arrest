# Scripts for G0-arrest prediction
Scripts for running the HistoMIL package for our paper on gauging G0-arrest on colorectal whole slide images:
  0. downloading data
  1. preprocessing

     1.1 I suggest running preprocessing_path.sh first to read slide, segment tissue and tesselate the tissue and store them in the DATA directory. 

     1.2 For feature extraction (NOTE: we directly leverage off-the-shelf feature extractors to avoid the computationally expensive self-supervised learning), there are standard preprocessing scripts include using the [ctranspath](https://github.com/Xiyue-Wang/TransPath), [UNI](https://github.com/mahmoodlab/UNI) and [gigapath](https://github.com/prov-gigapath/prov-gigapath) backbones for feature encoding of the patches. 

     1.3 files ending with ARRAY_OPTIONAL run a python file which splits the dataset into 5 parts to allow for running array jobs in the cluster (sun grid engine) to speed up feature extraction by running different parts of the dataset in parallel. It's optional, in the sense that you can run the feature extraction sequentially if your dataset is small enough. 
  3. training a MIL model under a 5-fold cross-validation framework to predict g0 arrest from colorectal tissue
  4. evaluating a MIL model through an ensemble or just with the best model from 5-fold CV
  5. interpretability analysis which includes computing attention-score based heatmaps following the method of [CLAM](https://github.com/mahmoodlab/CLAM), and [integrated gradients method](https://arxiv.org/abs/1703.01365) for TransMIL with multimodal fusion of clinical features

Scripts are named as per their corresponding steps in the pipeline of our paper. 

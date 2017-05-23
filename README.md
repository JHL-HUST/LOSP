# LOSP
These codes are for our paper "Local Spectral Method for Semi-supervised Community Detection"
## Requirements
Before compiling codes, the following software should be installed in your system.
- Matlab
- gcc (for Linux and Mac) or Microsoft Windows SDK (for Windows)
## Datasets Information
- SNAP datasets (available at http://snap.stanford.edu/data/)
- Isobase datasets (available at http://cb.csail.mit.edu/cb/mna/isobase/) 
- LFR benchmark graphs (available at http://sites.google.com/site/santofortunato/inthepress2/)
## Example dataset
- Amazon dataset (available at http://snap.stanford.edu/data/com-Amazon.html)
- nodes: 334863, edges: 925872 
- nodes are products, edges are co-purchase relationships
- top 5000 communities with ground truth size >= 3
## How to run
$ cd codes
$ matlab
$ mex -largeArrayDims GetLocalCond.c   % compile the mex file
$ LOSP(WalkMode,d,k,alpha,TruncateMode,beta)
######## Command Options ########
WalkMode: 1: standard, 2: light lazy, 3: lazy, 4: personalized
d: dimension of local spectral subspace
k: number of random walk steps
alpha: a parameter of random walk diffusion
TruncateMode: 1: truncation by truth size, 2: truncation by local minimal conductance
beta: a parameter of local minimal conductance

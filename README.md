# LOSP
These codes are for our paper "Detecting Overlapping Communities from Local Spectral Subspaces"
# LOSP_Plus
LOSP Plus are variants and simplification of LOSP, and the codes are for our paper "Krylov Subspace Approximation for Local Community Detection in Large Networks"
## Requirements
Before compiling codes, the following software should be installed in your system.
- Matlab
- gcc (for Linux and Mac) or Microsoft Visual Studio (for Windows)
## Datasets Information
- SNAP datasets (available at http://snap.stanford.edu/data/)
- Isobase datasets (available at http://cb.csail.mit.edu/cb/mna/isobase/) 
- LFR benchmark graphs (available at http://sites.google.com/site/santofortunato/inthepress2/)
### Example dataset
- Amazon dataset (available at http://snap.stanford.edu/data/com-Amazon.html)
- nodes: 334863, edges: 925872 
- nodes are products, edges are co-purchase relationships
- top 5000 communities with ground truth size >= 3
## How to run LOSP algorithm
```
$ cd LOSP_codes 
$ matlab 
$ LOSP
```
## How to run LOSP_Plus algorithm
```
$ cd LOSP_Plus_codes
$ matlab 
$ mex -largeArrayDims GetLocalCond.c   % compile the mex file 
$ LOSP_Plus(WalkMode,d,k,alpha,TruncateMode,beta) 
```
### Command Options for LOSP_Plus algorithm:

WalkMode: 1: standard, 2: light lazy, 3: lazy, 4: personalized (default: 2)

d: dimension of local spectral subspace (default: 2)

k: number of random walk steps (default: 3)

alpha: a parameter controls random walk diffusion (default: 1)

TruncateMode: 1: truncation by truth size, 2: truncation by local minimal conductance (default: 2)

beta: a parameter controls local minimal conductance (default: 1.02)
## How to run baseline algorithms
### run HK algorithm
```
$ cd baseline_codes/HK
$ matlab 
$ mex -largeArrayDims hkgrow_mex.cpp   % compile the mex file 
$ HK
```
### run PR algorithm
```
$ cd baseline_codes/PR
$ matlab 
$ mex -largeArrayDims pprgrow_mex.cc   % compile the mex file 
$ PR
```
## Announcements
### Licence
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://fsf.org/.
### Notification
Please email to panshi@hust.edu.cn or setup an issue if you have any problems or find any bugs.

Please cite our papers if you use the codes in your paper:
```
@inproceedings{hsbhl:LOSP,
  author = "Kun He and Yiwei Sun and David Bindel and John Hopcroft and Yixuan Li",
  title = "Detecting Overlapping Communities from Local Spectral Subspaces",
  booktitle = "ICDM",
  pages = "769-774",
  year = "2015"
}

@inproceedings{he2016local,
  author = "Kun He and Pan Shi and John Hopcroft and David Bindel",
  title = "Local Spectral Diffusion for Robust Community Detection",
  booktitle = "SIGKDD Twelfth Workshop on Mining and Learning with Graphs",
  year = "2016"
}

@article{he2017krylov,
    title={Krylov Subspace Approximation for Local Community Detection},
    author={He, Kun and Shi, Pan and Bindel, David and Hopcroft, John E},
    journal={arXiv preprint arXiv:1712.04823},
    year={2017}
    }
```
### Acknowledgement
In the program, we incorporate some open source codes as baseline algorithms from the following websites:
- [HK](https://github.com/kkloste/hkgrow)
- [PR](https://www.cs.purdue.edu/homes/dgleich/codes/neighborhoods/)

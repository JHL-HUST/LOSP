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
```
$ cd codes 
$ matlab 
$ mex -largeArrayDims GetLocalCond.c   % compile the mex file 
$ LOSP(WalkMode,d,k,alpha,TruncateMode,beta) 
```
### Command Options:

WalkMode: 1: standard, 2: light lazy, 3: lazy, 4: personalized (default: 2)

d: dimension of local spectral subspace (default: 2)

k: number of random walk steps (default: 3)

alpha: a parameter controls random walk diffusion (default: 1)

TruncateMode: 1: truncation by truth size, 2: truncation by local minimal conductance (default: 2)

beta: a parameter controls local minimal conductance (default: 1.02)
## Announcements

### Licence
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.

### Notification

Please email to us or setup an issue if you have any problems or find any bugs.

Please cite our papers if you use the code in your paper:
### Acknowledgement

In the program, we incorporates some open source codes as baseline algorithms from the following websites:


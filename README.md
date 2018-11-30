# LOSP
These codes are for our paper "Detecting Overlapping Communities from Local Spectral Subspaces"
## Requirements
Before compiling codes, the following software should be installed in your system.
- Matlab
- gcc (for Linux and Mac) or Microsoft Visual Studio (for Windows)
## Datasets Information
- SNAP datasets (available at http://snap.stanford.edu/data/)
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
## How to run baseline algorithms
### run LEMON algorithm
```
$ cd baseline_codes/LEMON
$ matlab 
$ LEMON
```
### run HK algorithm
```
$ cd baseline_codes/HK
$ matlab 
$ mex -largeArrayDims hkgrow_mex.cpp   % compile the mex file 
$ HK
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
```
### Acknowledgement
In the program, we incorporate some open source codes as baseline algorithms from the following websites:
- [LEMON](https://github.com/yixuanli/lemon)
- [HK](https://github.com/kkloste/hkgrow)

# condaCDF

The CDF (Common Data Format) file type has become the standard interchange
mechanism for sharing data in the space physics community.  In addition 
Anaconda is a widely used python virtual environment.  This repository provides
a slightly altered version of the pycdf module from the [SpacePy](https://github.com/spacepy/spacepy)
project along with [Anaconda](https://anaconda.org) packaging for the
Goddard Spaceflight Center's [CDF library](https://cdf.gsfc.nasa.gov/) to
create a standalone CDF reader for python.  

This is a low-level packagen on which more complicated items may be built.
The only dependency other than the basic python interpreter is numpy >= 1.11.

This project is a pathfinder.  The author hopes that another group will take
over maintenance in time.

## Anaconda Package
[![Anaconda Package](https://anaconda.org/dasdevelopers/pycdf/badges/version.svg)](https://anaconda.org/DasDevelopers/pycdf)

*As of today, only the Linux package has been built, MacOS and Windows packages will
follow soon.*

Pre-built versiions of pycdf are available from Anaconda.  To install the conda
package run the command:
```bash
(base) $ conda install -c dasdevelopers pycdf
```
If this works, then test using Van Allen Probes data, for example:
```bash
(base) $ wget https://emfisis.physics.uiowa.edu/Flight/RBSP-A/L2/2017/07/08/rbsp-a_HFR-waveform_emfisis-L2_20170708T19_v1.6.3.cdf
(base) $ python
>>> import pycdf
>>> f = pycdf.CDF('rbsp-a_HFR-waveform_emfisis-L2_20170708T19_v1.6.3.cdf')
>>> f.keys()
```
If this produces a list similar to the following...
```
KeysView(<CDF:
APID: CDF_UINT2 [634]
Epoch: CDF_TIME_TT2000 [634]
HBGain: CDF_BYTE [634]
HBSelect: CDF_BYTE [634]
HFR_Spec: CDF_FLOAT [0, 4096]
HFRsamples: CDF_REAL4 [634, 4096]
MET: CDF_REAL8 [634]
SPTT: CDF_TIME_TT2000 [634]
fftSize: CDF_INT4 [1] NRV
timeOffsets: CDF_REAL8 [4096] NRV
>)
```
... then it works.

For more information on using pycdf, see the SpacePy [pycdf webpage](https://spacepy.github.io/pycdf.html).
If this particular dataset is of interest, then see the Van Allen Probes
[EMFISIS instrument](https://emfisis.physics.uiowa.edu/) data site.


## Package Maintenance
These instructions are only for package manatainers, though anyone can be a package maintainer, so dive in :)

First, activate your conda environment:
```bash
$ source $HOME/minconda3/bin/activate  # For ex. varies by install location
```

Install the conda-build, conda-verify, and anaconda-client packages if needed
```bash
(base) $ conda install conda-build
(base) $ conda install conda-verify
(base) $ conda install anaconda-client
```

In the working directory of this repo run the build command
```bash
(base) $ conda-build ./recipe
```
The build command downloads the CDF software from the Goddard site and then patches
the sources to cut out some build commands and to add in the python wrapper supplied
by SpacePy.

If you change the contents of the `./pycdf` subdirectory or the `setup.py` file then
you will have to re-build the patch file.  To do this run the command:
```bash
$ ./make_patch.sh
```
It requires bash, diff, sed, and wget for proper operation.  This will update the 
file `recipe/0001_add_pycdf.patch`.

Upload the build output to your favorite repository.  Below I'm using 
[DasDevelopers](https://anaconda.org/DasDevelopers) site at 
[anaconda.org](https://anaconda.org).
```bash
(base) $ anaconda upload -u dasdevelopers pycdf
```








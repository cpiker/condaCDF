# condaCDF (In development)

The CDF (Common Data Format) file type has become the standard interchange
mechanism for sharing data in the space physics community.  In addition 
Anaconda is a widely used python virtual environment.  This repository provides
a slightly altered version of the pycdf module from the [SpacePy](https://github.com/spacepy/spacepy)
project along with [Anaconda](https://anaconda.org) packaging for the Goddard Spaceflight Center's CDF binary
libraries to create a standalone CDF reader for python.

## Build

Activate your conda environment

```bash
$ source $HOME/minconda3/bin/activate  # For ex. varies by install location
```

Install conda build if needed
```bash
(base) $ conda install conda-build
```

In the working directory of this repo run the build command
```bash
(base) $ conda-build ./recipe
```

Upload the build output to your favorite repository.  Below I'm using 
[DasDevelopers](https://anaconda.org/DasDevelopers) site at 
[anaconda.org](https://anaconda.org).
```bash
(base) $ anaconda upload -u dasdevelopers pycdf
```

## Install

This project is in development.  As soon as a working version is ready,
installation instructions will be provided.  Since there is no new code
development here, it shouldn't take long.







#!/usr/bin/env bash

make OS=linux ENV=gnu CURSES=no all
echo "make install INSTALLDIR=${PREFIX}"
make install INSTALLDIR=${PREFIX}

python setup.py install


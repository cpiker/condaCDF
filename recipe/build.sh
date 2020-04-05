#!/usr/bin/env bash

make OS=linux ENV=gnu CURSES=no all

python setup.py build

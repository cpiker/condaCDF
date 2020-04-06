#!/usr/bin/env bash

sUname=$(uname)

if [ "${sUname}" = "Linux" ]; then

	make OS=linux ENV=gnu CURSES=no all
	make install.lib.so INSTALLDIR=${PREFIX}
	
elif [ "${sUname}" = "Darwin" ]; then

	make OS=linux ENV=gnu CURSES=no all
	make install.lib.dylib INSTALLDIR=${PREFIX}
	
else
	echo "Unknown OS '${sUname}'"
	exit 7
fi

$PYTHON setup.py install

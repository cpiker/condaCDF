#!/usr/bin/env bash

sUname=$(uname)

if [ "${sUname}" = "Linux" ]; then

	echo "make OS=linux ENV=gnu CURSES=no all"
	make OS=linux ENV=gnu CURSES=no all
	echo "make install.lib.so INSTALLDIR=${PREFIX}"
	make install.lib.so INSTALLDIR=${PREFIX}
	
elif [ "${sUname}" = "Darwin" ]; then
	echo "make OS=macosx ENV=gnu CURSES=no all"
	make OS=macosx ENV=gnu CURSES=no all
	echo "make install.lib.dylib INSTALLDIR=${PREFIX} MACLIB=${PREFIX}/lib"
	make install.lib.dylib INSTALLDIR=${PREFIX}
	
else
	echo "Unknown OS '${sUname}'"
	exit 7
fi

$PYTHON setup.py install

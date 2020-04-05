#!/usr/bin/env bash

# This script is used to make the pycdf patch file.  
# It is only needed if setup.py or the contents of the pycdf are changed

CDF_SRC_FILE=cdf-dist-cdf.tar.gz
CDF_SRC_DIR=https://spdf.gsfc.nasa.gov/pub/software/cdf/dist/cdf37_1
CDF_SRC_URL=${CDF_SRC_DIR}/${CDF_SRC_FILE}

UNTAR_DIR=cdf37_1-dist
PATCH_DIR=cdf_dist_patched

if [ ! -d ${PWD}/tmp ] ; then
	mkdir ./tmp
fi

cd ./tmp

# Get sources if needed
if [ ! -e ${CDF_SRC_FILE} ] ; then
	wget ${CDF_SRC_URL}
	nRet=$?
	if [ "$nRet" != "0" ] ; then
		echo "'wget ${CDF_SRC_URL}' failed"
		exit 7
	fi
fi

# Untar sources if needed
if [ ! -d ${UNTAR_DIR} ] ; then
	if ! tar -xvzf ${CDF_SRC_FILE} ; then
		echo "'tar -xvzf ${CDF_SRC_FILE}' failed"
		exit 7
	fi
fi

# Delete the source tree copy if present
if [ -d cdf_dist_patched ] ; then
	if ! rm -r cdf_dist_patched ; then
		echo "'rm -r cdf_dist_patched' failed"
		exit 7
	fi
fi
	
# Make a copy of the source tree
if ! cp -r ${UNTAR_DIR} ${PATCH_DIR} ; then
	echo "'cp -r ${UNTAR_DIR} ${PATCH_DIR}' failed"
	exit 7
fi


# Copy in the pycdf and setup.py files
cd ${PATCH_DIR}
cp -r ../../pycdf .
cp ../../setup.py .

cd ../

# Make the patch in the recipe folder
cd ${PATCH_DIR}
diff -ruN ../${UNTAR_DIR} . > ../../recipe/0001_add_pycdf.patch.bad

cd ../../recipe

echo "cat 0001_add_pycdf.patch.bad | sed \"s/\.\/${UNTAR_DIR}//g\" > 0001_add_pycdf.patch"
cat 0001_add_pycdf.patch.bad | sed "s/\.\/${UNTAR_DIR}//g" > 0001_add_pycdf.patch

exit 0


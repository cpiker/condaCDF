#!/usr/bin/env python

from distutils.core import setup

setup(
   name="pycdf",
	version="0.1.4",
	description="PyCDF: The CDF module from SpacePy",
	author='Steve Morley, Josef Koller, Dan Welling, Brian Larsen, Mike Henderson, Jon Niehof',
   author_email='spacepy@lanl.gov',
   url='http://www.spacepy.lanl.gov',
#   requires=['numpy'],
	packages=['pycdf'],
	classifiers=[
		'Development Status :: 4 - Beta',
		'Intended Audience :: Science/Research',
		'License :: OSI-Approved Open Source :: Python Software Foundation License',
		'Operating System :: MacOS :: MacOS X',
		'Operating System :: POSIX',
		'Programming Language :: Python',
		'Topic :: Scientific/Engineering :: Physics',
		'Topic :: Software Development :: Libraries :: Python Modules'
   ]
)
	

# CDF Makefile for MS Visual C compiler

# Definitions ################################################################

MAKE=nmake /nologo
CC=cl.exe /nologo
TARG=cdf

# Source Directories
ZSRC_DIR=src\lib\zlib
ZHDR_DIR=src\lib\zlib

LSRC_DIR=src\lib
LHDR_DIR=src\include

# Output directory
BD=build.windows

INC=/I $(ZHDR_DIR) /I $(LHDR_DIR)
DEFINES=/DWIN32 /D_FILE_OFFSET_BITS=64 /D_LARGEFILE64_SOURCE \
/D_LARGEFILE_SOURCE /DMALLOC_CHECK_=0 /DHAVE_STDARG_H /DZ_PREFIX
CFLAGS=$(CFLAGS) $(DEFINES) $(INC)
 
ZIP_OBJS=$(BD)\adler32.obj $(BD)\crc32.obj $(BD)\deflate.obj $(BD)\inffast.obj \
 $(BD)\inflate.obj $(BD)\infback.obj $(BD)\inftrees.obj $(BD)\trees.obj \
 $(BD)\zutil.obj
 
LIB_OBJS=$(BD)\cdflib.obj $(BD)\cdfcre.obj $(BD)\cdfope.obj $(BD)\cdfclo.obj \
$(BD)\cdfdel.obj $(BD)\cdfsel.obj $(BD)\cdfcon.obj $(BD)\cdfget.obj \
$(BD)\cdfmisc2.obj $(BD)\cdfread.obj $(BD)\cdfwrite.obj $(BD)\cdfhyper.obj \
$(BD)\epochuf.obj $(BD)\dirutils.obj $(BD)\cdfput1.obj $(BD)\cdfput2.obj \
$(BD)\cdfcsi.obj $(BD)\cdffsi.obj $(BD)\cdffii.obj $(BD)\cdftext.obj \
$(BD)\cdfed.obj $(BD)\cdfstr.obj $(BD)\cdfvalid.obj $(BD)\cdfmem.obj \
$(BD)\vstream.obj $(BD)\epochu.obj $(BD)\cdfmisc3.obj $(BD)\cdfhuff.obj \
$(BD)\cdfrle.obj $(BD)\cdfmisc1.obj $(BD)\cdfalloc.obj $(BD)\cdfgzip.obj \
$(BD)\cdfalloc64.obj $(BD)\cdfdel64.obj $(BD)\cdfmisc2_64.obj \
$(BD)\cdfread64.obj $(BD)\cdfclo64.obj $(BD)\cdfget64.obj \
$(BD)\cdfmisc3_64.obj $(BD)\cdfsel64.obj $(BD)\cdfcon64.obj \
$(BD)\cdfput1_64.obj $(BD)\cdfwrite64.obj $(BD)\cdfcre64.obj \
$(BD)\cdfmisc1_64.obj $(BD)\cdfput2_64.obj $(BD)\vstream64.obj \
$(BD)\cdfhyper64.obj $(BD)\cdfrle64.obj $(BD)\cdfhuff64.obj \
$(BD)\cdfgzip64.obj $(BD)\cdffsi2.obj $(BD)\cdffsi3.obj $(BD)\cdfcks.obj \
$(BD)\cdfmd5.obj $(BD)\cdfsav.obj $(BD)\cdfvalidator.obj \
$(BD)\cdfvalidator64.obj $(BD)\cdftt2000.obj $(BD)\cdftt2000f.obj

ALL_OBJS=$(ZIP_OBJS) $(LIB_OBJS)

# Redistributable headers only
HDRS=$(LHDR_DIR)\cdf.h $(LHDR_DIR)\cdfconfig.h $(LHDR_DIR)\cdfdist.h \
$(LHDR_DIR)\cdflib.h $(LHDR_DIR)\cdflib64.h

# Rules ######################################################################

build: $(BD) $(BD)\$(TARG).dll $(BD)\$(TARG).lib

$(BD):
	if not exist "$(BD)" mkdir "$(BD)"
	
$(BD)\$(TARG).dll:$(ALL_OBJS)
	link /nologo /ltcg /dll $(ALL_OBJS) $(EX_LIBS) /out:$(BD)\$(TARG).dll /implib:$(BD)\$(TARG).lib

# Inference rule for building zlib files
{$(ZSRC_DIR)\}.c{$(BD)\}.obj:
	$(CC) $(CFLAGS) /Fo:$@ /c $<
	
# Inference rule for building cdf lib files
{$(LSRC_DIR)\}.c{$(BD)\}.obj:
	$(CC) $(CFLAGS) /Fo:$@ /c $<
	
install:
	if not exist $(LIBRARY_PREFIX)\bin mkdir $(LIBRARY_PREFIX)\bin
	if not exist $(LIBRARY_PREFIX)\lib mkdir $(LIBRARY_PREFIX)\lib
	if not exist $(LIBRARY_PREFIX)\include\das2 mkdir $(LIBRARY_PREFIX)\include\das2
	copy $(BD)\$(TARG).dll $(LIBRARY_PREFIX)\bin
	copy $(BD)\$(TARG).lib $(LIBRARY_PREFIX)\lib
	for %I in ( $(HDRS) ) do copy %I $(LIBRARY_PREFIX)\include

clean:
	if exist $(BD) rmdir /S /Q $(BD)


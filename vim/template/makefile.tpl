TARGET	=

LOGIN	= gaspar_d
TARNAME = $(LOGIN)-piscin00.tar.bz2

SRCDIR = src
BINDIR = bin


CC	= gcc
CFLAGS	= -Wall -W -std=c99 -pedantic \
	  -Wfloat-equal -Wundef -Wshadow -Wpointer-arith \
	  -Wbad-function-cast -Wcast-qual -Wcast-align \
	  -Waggregate-return -Wstrict-prototypes -Wmissing-prototypes \
	  -Wmissing-declarations -Wnested-externs \
	  -Wunreachable-code -fstack-protector
CCFLAGS	= -Wall -Wcast-align -Wundef -pedantic -fstack-protector
LDFLAGS	= -g -ggdb -ldl -lpthread

# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------

SOURCE	= $(wildcard $(SRCDIR)/*.c)
OBJS	= $(SOURCE:.c=.o)
TODEL	= tags *~ .*.sw? \\\#*\\\# *.core

ROOTDIR = `basename \`pwd\``

DOC_GENERATOR	=	doxygen
DOC_CONFIG_FILE	=	Doxyfile
DOC_FLAG	=

AR	= ar
ARFLAGS	= rsc
RMFLAGS = -rf

TAR	= tar
TARFLAGS= -jcf

RM	= rm
CP	= cp
MKDIR	= mkdir
MOUNT	= mount
UMOUNT	= umount
DD	= dd

.PHONY: all clean distclean dist doc

# ----------------------------------------------------------------------------
# ----------------------------------------------------------------------------

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -o $(BINDIR)/$(TARGET) $(OBJS) $(LDFLAGS)

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

doc:
	doxygen Doxyfile
	cd doc/latex && $(MAKE)
	mv doc/latex/refman.pdf doc/myCipher.pdf

clean: clean-local
	$(RM) $(RMFLAGS) $(OBJS)

clean-local:
	find . -type f -name '#*'   -exec rm -f "{}" \;
	find . -type f -name '*.so'   -exec rm -f "{}" \;
	find . -type f -name '*.o'   -exec rm -f "{}" \;
	find . -type f -name '*.a'   -exec rm -f "{}" \;
	find . -type f -name '*~'    -exec rm -f "{}" \;
	find . -type f -name '*.gch' -exec rm -f "{}" \;
	find . -type f -name '*.dot' -exec rm -f "{}" \;
	find . -type f -name '*.bz2' -exec rm -f "{}" \;
	find . -type f -name '*.gz' -exec rm -f "{}" \;

distclean: clean
	$(RM) $(RMFLAGS) $(TARGET) $(TODEL)

dist: distclean
	$(MKDIR) $(ROOTDIR)
	- $(CP) -Rf * $(ls -I $(ROOTDIR)) $(ROOTDIR)/
	$(TAR) $(TARFLAGS) $(TARNAME) $(ROOTDIR) --exclude *$(LOGIN)*$(LOGIN)*
	$(RM) $(RMFLAGS) $(ROOTDIR)

readme:
	$(ls -Ra) >> README

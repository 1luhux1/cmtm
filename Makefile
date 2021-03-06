CC        ?= gcc
CFLAGS    ?= -std=c99 -Wall -Wextra -pedantic -Os
FEATURES  ?= -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=600 -D_XOPEN_SOURCE_EXTENDED
HEADERS   ?=
LIBPATH   ?=
CURSESLIB ?= ncursesw
LIBS      ?= -l$(CURSESLIB) -lutil

all: cmtm

cmtm: vtparser.c mtm.c pair.c config.h
	$(CC) $(CFLAGS) $(FEATURES) -o $@ $(HEADERS) vtparser.c mtm.c pair.c $(LIBPATH) $(LIBS)

config.h: config.def.h
	cp -i config.def.h config.h

clean:
	rm -f *.o cmtm

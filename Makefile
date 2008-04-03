CC = gcc
CFLAGS = -g -O2 -W -Wall
LDFLAGS =
DESTDIR =
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man
MAN8DIR = $(MANDIR)/man8
INSTALL = install

PROGRAMS = ath_info
MANS = ath_info.8

all: $(PROGRAMS)

ath_info: ath_info.o
	$(CC) $(LDFLAGS) -o $@ $<

.c.o:
	$(CC) $(CFLAGS) -c $<

clean:
	rm -f *.o $(PROGRAMS)

install:
	$(INSTALL) -d $(DESTDIR)$(BINDIR)
	$(INSTALL) -m 755 $(PROGRAMS) $(DESTDIR)$(BINDIR)
	$(INSTALL) -d $(DESTDIR)$(MAN8DIR)
	$(INSTALL) -m 644 $(MANS) $(DESTDIR)$(MAN8DIR)

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/$(PROGRAMS)
	rm -f $(DESTDIR)$(MAN8DIR)/$(MANS)

.SUFFIXES: .c .o
.PHONY: all clean install uninstall
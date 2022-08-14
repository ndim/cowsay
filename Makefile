# Makefile for Cowsay

PACKAGE_TARNAME = cowsay

prefix = /usr/local
exec_prefix = ${prefix}
bindir = ${exec_prefix}/bin
datarootdir = ${prefix}/share
datadir = ${datarootdir}
docdir = ${datarootdir}/doc/${PACKAGE_TARNAME}
sysconfdir = ${prefix}/etc
mandir=${datarootdir}/man

pkgdatadir = ${datadir}/${PACKAGE_TARNAME}
cowsdir = ${pkgdatadir}/cows
sitecowsdir = ${pkgdatadir}/site-cows

srcdir = .

SHELL = /bin/sh
INSTALL = install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = ${INSTALL} -m 644
LN = ln

# If you implement support for *.pm cows, add share/cows/*.pm here.
#
# Note that this is a list of shell globs to be evaluated by the
# shell, not a list of files to be evaluated by make.
COW_FILES = share/cows/*.cow

.PHONY: clean man install uninstall

clean:
	@echo Nothing to do.

# The target creates cowsay.1.adoc, and is included for convenience
#
# The 'make man' target is intended for use at write time, not build time,
# so it is not part of the normal build sequence, and its outputs are
# checked in to the source tree. This is partially to simplify the build 
# process, and partially to preserve the internal "update" timestamp inside
# the man pages. We do this at build time to avoid introducing a dependency on
# Asciidoc for users.

man: cowsay.1

cowsay.1: cowsay.1.adoc
	a2x --format manpage ./cowsay.1.adoc

install: cowsay.1
	$(INSTALL) -d $(DESTDIR)$(prefix)
	$(INSTALL) -d $(DESTDIR)$(bindir)
	$(INSTALL_PROGRAM) cowsay $(DESTDIR)$(bindir)/cowsay
	$(LN) -s cowsay $(DESTDIR)$(bindir)/cowthink
	$(INSTALL) -d $(DESTDIR)$(mandir)/man1
	$(INSTALL_DATA) cowsay.1 $(DESTDIR)$(mandir)/man1
	$(INSTALL_DATA) cowthink.1 $(DESTDIR)$(mandir)/man1
	$(INSTALL) -d $(DESTDIR)$(cowsdir)
	$(INSTALL_DATA) $(COW_FILES) $(DESTDIR)$(cowsdir)
	$(INSTALL) -d $(DESTDIR)$(sitecowsdir)

uninstall:
	rm -f $(DESTDIR)$(bindir)/cowsay $(DESTDIR)$(bindir)/cowthink
	rm -f $(DESTDIR)$(mandir)/man1/cowsay.1 $(DESTDIR)$(mandir)/man1/cowthink.1
	rm -rf $(DESTDIR)$(cowsdir)

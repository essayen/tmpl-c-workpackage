
SUBDIRS := $(wildcard [0123456789]*)

all: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ -f ../scripts/Makefile

%.test: 
	$(MAKE) -C $* -f ../scripts/Makefile test

%.solution: 
	$(MAKE) -C $* -f ../scripts/Makefile solution

%.clean:
	$(MAKE) -C $* -f ../scripts/Makefile clean

%.format:
	$(MAKE) -C $* -f ../scripts/Makefile format

%.tidy:
	$(MAKE) -C $* -f ../scripts/Makefile tidy

.PHONY: all $(SUBDIRS) %.test


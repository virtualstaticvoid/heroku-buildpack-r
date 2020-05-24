# default target
all::

FILES=$(shell find . -maxdepth 2 -type f -name Makefile)
SUBDIRS=$(filter-out ./,$(dir $(FILES)))
LOG_FILE=$(shell date +%Y%m%d-%H%M)

.PHONY: all
all:: test

.PHONY: test
test: $(SUBDIRS)

.PHONY: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@ 2>&1 | tee $@test-$(LOG_FILE).log

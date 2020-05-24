# default target
all::

include ../Makefile.vars

.PHONY: all
all:: test

.PHONY: test
test:
	@../runtest.sh $(HEROKU_STACK) $(BUILDPACK_VERSION)

# default target
all::

include ../Makefile.vars

.PHONY: all
all:: test

.PHONY: test
test: .without_flags .with_flags

.without_flags:
	@echo "> Without flags"
	@../runtest.sh $(HEROKU_STACK) $(BUILDPACK_VERSION)

.with_flags:
	@echo "> With flags"
	@BUILDPACK_DEBUG=1 PACKAGE_INSTALL_VERBOSE=1 ../runtest.sh $(HEROKU_STACK) $(BUILDPACK_VERSION)

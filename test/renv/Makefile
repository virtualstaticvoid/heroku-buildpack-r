# default target
all::

include ../Makefile.vars

UID:=$(shell id -u)
GID:=$(shell id -g)

.PHONY: all
all:: test

.PHONY: test
test:
	@../runtest.sh $(HEROKU_STACK) $(BUILDPACK_VERSION)

.PHONY: build
build:
	docker run -it --rm --user "$(UID):$(GID)" -v "$(PWD):/app" --workdir=/app r-base:$(R_VERSION) \
		/usr/bin/R --no-save --quiet -s --file=/app/setup.R

.PHONY: run
run:
	docker run -it --rm --user "$(UID):$(GID)" -v "$(PWD):/app" --workdir=/app r-base:$(R_VERSION) \
		/usr/bin/R

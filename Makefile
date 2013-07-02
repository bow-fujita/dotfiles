SHELL := /bin/bash
.SUFFIXES:

.PHONY: all
all: build

.PHONY: build
build:


GITCONFIG := gitconfig
INSTALL_TARGETS += $(GITCONFIG)

$(HOME)/.$(GITCONFIG): $(GITCONFIG)
	cp -i $? $@

.PHONY: install
install: build $(foreach x,$(INSTALL_TARGETS),$(HOME)/.$(x))


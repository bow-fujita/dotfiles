SHELL := /bin/bash
.SUFFIXES:

.PHONY: all
all:

SYMLINK := ln -si

BASHRC_D := bashrc.d
BASH_PROFILE := bash_profile
INSTALL_TARGETS += $(BASHRC_D) $(BASH_PROFILE)

$(HOME)/.$(BASHRC_D): $(BASHRC_D)
	cd $(@D); $(SYMLINK) $(realpath $(BASHRC_D)) $(@F) || true

$(HOME)/.$(BASH_PROFILE): $(BASH_PROFILE)
	cd $(@D); $(SYMLINK) $(realpath $(BASH_PROFILE)) $(@F) || true


GITCONFIG := gitconfig
INSTALL_TARGETS += $(GITCONFIG)

$(HOME)/.$(GITCONFIG): $(GITCONFIG)
	cp -i $? $@ || true


VIM := vim
VIMRC := vimrc
VIMRC_D := vimrc.d
INSTALL_TARGETS += $(VIM) $(VIMRC) $(VIMRC_D)

VIM_BUNDLE_DIR := $(VIM)/bundle

.PHONY: build-vim-bundle
build-vim-bundle: | $(VIM_BUNDLE_DIR)
	@for repo in $(shell cat $(VIM_BUNDLE_DIR)/github-repos); do \
		$(MAKE) GITHUB_REPO=$$repo load-vim-bundle; \
	done

.PHONY: load-vim-bundle
ifeq ($(MAKECMDGOALS),load-vim-bundle)

ifeq ($(GITHUB_REPO),)
$(error GITHUB_REPO is not defined)
endif
VIM_PLUGIN_DIR := $(VIM_BUNDLE_DIR)/$(shell basename $(GITHUB_REPO))

$(VIM_PLUGIN_DIR):
ifeq ($(wildcard $(VIM_PLUGIN_DIR)),)
	git clone http://github.com/$(GITHUB_REPO) $@
else
	cd $@; git pull
endif

load-vim-bundle: $(VIM_PLUGIN_DIR)

endif # $(MAKECMDGOALS) == load-vim-bundle

$(HOME)/.$(VIM): | build-vim-bundle
	cd $(@D); $(SYMLINK) $(realpath $(VIM)) $(@F)

$(HOME)/.$(VIMRC): $(VIMRC)
	cd $(@D); $(SYMLINK) $(realpath $(VIMRC)) $(@F)

$(HOME)/.$(VIMRC_D): | $(VIMRC_D)
	cd $(@D); $(SYMLINK) $(realpath $(VIMRC_D)) $(@F)


.PHONY: install
install: $(foreach x,$(INSTALL_TARGETS),$(HOME)/.$(x))


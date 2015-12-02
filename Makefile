SHELL := /bin/bash
.SUFFIXES:

.PHONY: all
all: install

SYMLINK = cd $(HOME); ln -si $(notdir $(CURDIR))/$(1) .$(notdir $(1)) || true

BASHRC_D := bashrc.d
BASH_PROFILE := bash_profile
BASH_ALIASES := bash_aliases
BASH_ALIASES_D := bash_aliases.d
INSTALL_TARGETS += $(BASHRC_D) $(BASH_PROFILE) $(BASH_ALIASES) $(BASH_ALIASES_D)

$(HOME)/.$(BASHRC_D): $(BASHRC_D)
	$(call SYMLINK,$?)

$(HOME)/.$(BASH_PROFILE): $(BASH_PROFILE)
	$(call SYMLINK,$?)

$(HOME)/.$(BASH_ALIASES): $(BASH_ALIASES)
	$(call SYMLINK,$?)

$(HOME)/.$(BASH_ALIASES_D): $(BASH_ALIASES_D)
	$(call SYMLINK,$?)


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
	@for repo in $(shell cat $(VIM_BUNDLE_DIR)/github-repos 2> /dev/null); do \
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
	git clone https://github.com/$(GITHUB_REPO) $@
else
	cd $@; git pull
endif

load-vim-bundle: $(VIM_PLUGIN_DIR)

endif # $(MAKECMDGOALS) == load-vim-bundle

$(HOME)/.$(VIM): $(VIM) | build-vim-bundle
	$(call SYMLINK,$?)

$(HOME)/.$(VIMRC): $(VIMRC)
	$(call SYMLINK,$?)

$(HOME)/.$(VIMRC_D): | $(VIMRC_D)
	$(call SYMLINK,$?)


.PHONY: install
install: $(foreach x,$(INSTALL_TARGETS),$(HOME)/.$(x))


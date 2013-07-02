SHELL := /bin/bash
.SUFFIXES:

.PHONY: all
all:


GITCONFIG := gitconfig
INSTALL_TARGETS += $(GITCONFIG)

$(HOME)/.$(GITCONFIG): $(GITCONFIG)
	cp -i $? $@


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
	cd $(@D); ln -s $(realpath $(VIM)) $(@F)

$(HOME)/.$(VIMRC): | $(VIMRC)
	cd $(@D); ln -s $(realpath $(VIMRC)) $(@F)

$(HOME)/.$(VIMRC_D): | $(VIMRC_D)
	cd $(@D); ln -s $(realpath $(VIMRC_D)) $(@F)


.PHONY: install
install: $(foreach x,$(INSTALL_TARGETS),$(HOME)/.$(x))


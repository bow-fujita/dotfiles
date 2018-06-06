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


TMUX_CONF := tmux.conf
INSTALL_TARGETS += $(TMUX_CONF)

$(HOME)/.$(TMUX_CONF): $(TMUX_CONF)
	$(call SYMLINK,$?)


VIM := vim
VIMRC := vimrc
VIMRC_D := vimrc.d
INSTALL_TARGETS += $(VIM) $(VIMRC) $(VIMRC_D)

$(HOME)/.$(VIM): $(VIM)
	$(call SYMLINK,$?)

$(HOME)/.$(VIMRC): $(VIMRC)
	$(call SYMLINK,$?)

$(HOME)/.$(VIMRC_D): $(VIMRC_D)
	$(call SYMLINK,$?)


.PHONY: install
install: $(foreach x,$(INSTALL_TARGETS),$(HOME)/.$(x))


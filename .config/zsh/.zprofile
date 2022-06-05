#!/bin/zsh

# Adjusting path

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export SOURCE_HOME="$HOME/.local/src"
export BINARY_HOME="$HOME/.local/bin"
export PATH="$PATH:$BINARY_HOME"
export SVDIR="$HOME/.local/services"

# Preferences

export LOCATION="Edirne"
export EDITOR="nvim"
export TERMINAL="st"
export READER="zathura"
export BROWSER="brave"
export PASSWORD_MANAGER="passmenu"
export LOCKER="slock"

export SUDO_EDITOR="nvim"

# History Configuration
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export SAVEHIST=1000000              # Number of history entries to save to disk
export HISTSIZE=1000000              # How many lines of history to keep in memory

# ~/ Clean-up:

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # This line will break some DMs.
export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME/x11/xserverrc"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export LESSHISTFILE="-"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export INPUTRC="$XDG_CONFIG_HOME/inputrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export SSH_CONFIG="$XDG_CONFIG_HOME/ssh/config"
export SSH_ID="$XDG_CONFIG_HOME/ssh/id_ed25519"
export SSH_KNOWN_HOSTS="$XDG_CONFIG_HOME/ssh/known_hosts"
export ELECTRUMDIR="$XDG_DATA_HOME/electrum"
export MBSYNCRC="$XDG_CONFIG_HOME/isync/mbsyncrc"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/config"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR/npm"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/wineprefixes/default"

# Start X server

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx "$XDG_CONFIG_HOME/x11/xinitrc"
fi

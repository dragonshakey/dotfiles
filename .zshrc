export ZDOTDIR="$HOME/.config/zsh"
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..|clear)"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export SCRIPTS="$HOME/.config/scripts"
export ETCCONFS="$HOME/.config/etcconfs"
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

#vim
bindkey -v
bindkey 'qq' vi-cmd-mode
bindkey -M vicmd 'L' end-of-line
bindkey -M vicmd 'H' beginning-of-line
bindkey '^V' yank

# Fixing zsh history problems on multiple terminals
setopt inc_append_history
setopt share_history

# Ignore duplicate commands in history file
setopt histignorealldups

# Fixing some keys inside zsh
autoload -Uz select-word-style
select-word-style bash

# Add highlight enabled tab completion with colors
zstyle ':completion:*' menu select
eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Get bash's compgen
autoload -Uz compinit
compinit
autoload -Uz bashcompinit
bashcompinit

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

#add neovim to path
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# custom ZSH keybinds
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

#set editor
export EDITOR="nvim"
export VISUAL="nvim"

#add functions
fpath+=${ZDORDIR:-~}/.zsh_functions

#oh my zsh
export ZSH="$HOME/Programs/.oh-my-zsh"
ZSH_THEME="jonathan"
plugins=(
	git
)

source $ZSH/oh-my-zsh.sh

#aliases
alias e="nvim"
alias p="python"
alias p3="python3"
alias cls="clear"
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
alias ls="lsd -a --group-directories-first"
alias ll="lsd -la --group-directories-first"

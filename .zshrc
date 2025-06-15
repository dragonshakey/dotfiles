export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
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

#aliases
alias e="nvim"
alias c="cd"
alias l="ls"
alias la="ls -a"
alias lla="ls -lah"
alias p="python"
alias p3="python3"
alias cls="clear"

#set editor
export EDITOR="nvim"
export VISUAL="nvim"

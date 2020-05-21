# ~/.bashrc: executed by bash for non-login shells.

# Do not do anything if not running an interactive shell.
case $- in
  *i*) ;;
  *) return;;
esac

# Configure dircolors to use the Nord colour scheme. This enables nice colour
# output with ls, grep, and other commands.
if [[ -x '/usr/bin/dircolors' ]]; then
  eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# Use vi key bindings for bash instead of emacs ones.
set -o vi

# Checks that a command found in the hash table exists before trying to
# execute. If a hashed command no longer exists, a normal path search is
# performed.
shopt -u checkhash

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Append to the history file, do not overwrite it.
shopt -s histappend

# Do not put duplicate lines or lines starting with space in the history file.
export HISTCONTROL='ignoreboth'

# Prevent certain commands from being added to the history file.
export HISTIGNORE='cd:ls:ls -la:pwd:exit:clear:history'

# Add date, and time to bash history.
export HISTTIMEFORMAT='[%d/%m/%y %T] '

# Keep all commands I ever type in history, since it does not appear to slow
# things down, and we have plenty of RAM, and storage.
export HISTSIZE='-1'
export HISTFILESIZE='-1'

# Set vim as our text editor.
export EDITOR='vim'
export VISUAL='vim'

# Set most as the pager for manpages, adding some colors to them.
export MANPAGER='/usr/bin/most -s'

# Define custom colors for buku.
export BUKU_COLORS='hOghE'

# Set the history file location for ffsend.
export FFSEND_HISTORY="$HOME/.config/ffsend/history"

# Set the GOPATH environment variable for Go projects, and their binaries.
export GOPATH="$HOME/.local/share/go"
export PATH="$PATH:$GOPATH/bin"

# Use our custom bash prompt.
if [[ -f "$HOME/.bash_prompt" ]]; then
  source "$HOME/.bash_prompt"
fi

# Use our custom aliases for bash.
if [[ -f "$HOME/.bash_aliases" ]]; then
  source "$HOME/.bash_aliases"
fi

# Enable programmable completion features.
if [[ -f '/usr/share/bash-completion/bash_completion' ]]; then
  source '/usr/share/bash-completion/bash_completion'
fi

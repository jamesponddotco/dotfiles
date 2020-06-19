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

# Write commands to .bash_history right away.
export PROMPT_COMMAND='history -a; history -n'

# Do not put duplicate lines or lines starting with space in the history file.
export HISTCONTROL='ignoreboth'

# Prevent certain commands from being added to the history file.
export HISTIGNORE='cd:ls*:pwd:exit:clear:history*:aerc:vim:htop'

# Add date, and time to bash history.
export HISTTIMEFORMAT='[%d/%m/%y %T] '

# Keep all commands I ever type in history, since it does not appear to slow
# things down, and we have plenty of RAM, and storage.
export HISTSIZE='-1'
export HISTFILESIZE='-1'

# Set vim as our text editor.
export EDITOR='vim'
export VISUAL='vim'

# Provide colored output for man, following my terminal colorscheme, nord.
export LESS_TERMCAP_mb=$'\e[01;34m'
export LESS_TERMCAP_md=$'\e[01;34m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;30m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;34m'
export LESS_TERMCAP_ue=$'\e[0m'

# Define custom colors for buku.
export BUKU_COLORS='hOghE'

# Define custom colors for grep.
export GREP_COLORS='fn=34:mt=01;34:ln=01;30:se=30'

# Keep WeeChat configuration files where they should be.
export WEECHAT_HOME="$HOME/.config/weechat/"

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

# The gpg-agent expects the GPG_TTY variable to point to the output the tty
# from where it is invoked.
GPG_TTY="$(tty)"
export GPG_TTY

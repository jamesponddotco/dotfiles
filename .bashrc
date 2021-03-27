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

# Use our custom bash prompt.
if [[ -f "${HOME}/.bash_prompt" ]]; then
  source "${HOME}/.bash_prompt"
fi

# Use our custom aliases for bash.
if [[ -f "${HOME}/.bash_aliases" ]]; then
  source "${HOME}/.bash_aliases"
fi

# Checks that a command found in the hash table exists before trying to
# execute. If a hashed command no longer exists, a normal path search is
# performed.
shopt -u checkhash

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Append to the history file, do not overwrite it.
shopt -s histappend

# Shorten the lenght of the prompt.
export PROMPT_DIRTRIM='3'

# Write commands to .bash_history right away.
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"

# Do not put duplicate lines or lines starting with space in the history file.
export HISTCONTROL='ignoreboth'

# Prevent certain commands from being added to the history file.
export HISTIGNORE='cd*:ls*:pwd:exit:clear:history*:aerc:vim:htop:1p*:op*:mpv*'

# Add date and time to bash history in the ISO8601 format.
export HISTTIMEFORMAT='[%y-%m-%d %T] '

# Keep all commands I ever type in history, since it does not appear to slow
# things down and we have plenty of storage.
export HISTSIZE='-1'
export HISTFILESIZE='-1'

# Set vim as our text editor.
export EDITOR='vim'
export VISUAL='vim'
export GH_EDITOR='vim'
export GIT_EDITOR='vim'

# Provide colored output for man following my terminal colorscheme.
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
export WEECHAT_HOME="${HOME}/.config/weechat/"

# Tell ffsend to never save usage history.
export FFSEND_INCOGNITO='true'
export FFSEND_HISTORY='/dev/null'

# Do not allow the GitHub CLI to call home.
export GH_NO_UPDATE_NOTIFIER='false'

# Set the GOPATH environment variable for Go.
export GOPATH="${HOME}/.local/share/go"
export PATH="${PATH}:${GOPATH}/bin"

# Enable programmable completion features.
if [[ -f '/usr/share/bash-completion/bash_completion' ]]; then
  source '/usr/share/bash-completion/bash_completion'
fi

# The gpg-agent expects the GPG_TTY variable to point to the tty from where it
# is invoked.
GPG_TTY="$(tty)"
export GPG_TTY

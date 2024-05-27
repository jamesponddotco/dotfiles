#!/bin/bash
#
# Bash Aliases
#

# Default aliases from Ubuntu.
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Misc aliases.
alias top='htop'
alias :q='gpg-connect-agent reloadagent /bye; ssh-add -D; sudo -K; exit'
alias edit='vim'

# The "I am bad at typing" aliases.
alias boku='buku'

# Enable alias expansion for commands run by sudo.
alias sudo='sudo '

# Make standard file operations more verbose.
alias cp='cp -v'
alias mv='mv -v'
alias rm='rm -v'

# Find the 10 biggest directories, or files in the current path.
alias fatdirs='du -Sh | sort -rh | head -n 10'
alias fatfiles='find . -type f -exec du -Sh {} + | sort -rh | head -n 10'

# Remove all the snap crap from the df output.
alias df='df -x squashfs'

# Alias version of scurl, from Whonix.
# https://www.whonix.org/wiki/Secure_Downloads
alias scurl='curl --tlsv1.2 --proto =https'
alias dcurl='scurl --location --remote-name-all --remote-header-name'

# Disable HSTS history file for wget.
alias wget='wget --hsts-file='

# I am five, sue me.
alias gimme='wget --hsts-file='

# Make ffsend easier to remember.
alias upload='ffsend'

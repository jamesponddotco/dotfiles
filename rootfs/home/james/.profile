# ~/.profile: executed by the command interpreter for login shells. This file
# is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.

# Define XDG Base Directory specification variables.
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# Define editor variables.
export EDITOR='nvim'
export VISUAL='nvim'

# If running Bash, source its configuration file.
if [[ -n "${BASH_VERSION}" ]]; then
  export BASH_CONFIG_HOME="${XDG_CONFIG_HOME}/bash"

  if [[ -f "${BASH_CONFIG_HOME}/bash.conf" ]]; then
    source "${BASH_CONFIG_HOME}/bash.conf"
  fi
fi

#
# Run commands for login shells.
#
# Context:
#   - [✔] Login.
#   - [ ] Interactive.
#   - [ ] Script.
#
# Order:
#   - [ ] /etc/zshenv
#   - [ ] ZDOTDIR/.zshenv
#   - [ ] /etc/zprofile
#   - [✔] ZDOTDIR/.zprofile
#   - [ ] /etc/zshrc
#   - [ ] ZDOTDIR/.zshrc
#   - [ ] ZDOTDIR/flux-capacitor.zsh
#   - [ ] /etc/zlogin
#   - [ ] ZDOTDIR/.zlogin
#   - [ ] ZDOTDIR/.zlogout
#   - [ ] /etc/zlogout
#

################################################################################
# Interactive options.
################################################################################

#
# By default, Zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
#

export WORDCHARS='*?[]~&;!$%^<>'

#
# Browser.
#

if [[ "${OSTYPE}" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors.
#

export PAGER='less'
export EDITOR='vim'
export VISUAL='vim'
export GIT_EDITOR='vim'
export MANPAGER='less -s -M +Gg'
# export MANWIDTH=80

#
# Language.
#

if [[ -z "${LANG}" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
#

export LESS='-F -g -i -M -R -S -w -X -z-4'

#
# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
#

if (( ${#commands[(i)lesspipe(|.sh)]} )); then
  export LESSOPEN="| /usr/bin/env ${commands[(i)lesspipe(|.sh)]} %s 2>&-"
fi

################################################################################
# User variables.
################################################################################

#
# Go.
#

# export GOPATH="${HOME}/.go"

#
# Python.
#

# export PYENV_ROOT='/usr/local/var/pyenv'

#
# NVM.
#

# export NVM_DIR="${HOME}/.nvm"

#
# Homebrew Cask.
#

# export HOMEBREW_CASK_OPTS='--appdir=/Applications'

###############################################################################
# Paths.
###############################################################################

#
# Ensure path arrays do not contain duplicates.
#

typeset -gU cdpath fpath mailpath path

#
# Set the the list of directories that cd searches.
#

# cdpath=(
#   $cdpath
# )

#
# Set the list of directories that Zsh searches for functions.
#

# fpath=(
#   $fpath
# )

#
# Set the list of directories that Zsh searches for programs.
#

path=(
  '/opt/local/bin'
  '/usr/local/'{bin,sbin}
  $path
)

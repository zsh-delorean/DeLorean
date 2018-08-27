#
# Run commands for interactive shells.
#
# Note: Login shells are usually, but not always, interactive.
#
# Context:
#   - [ ] Login.
#   - [✔] Interactive.
#   - [ ] Script.
#
# Order:
#   - [ ] /etc/zshenv
#   - [ ] ZDOTDIR/.zshenv
#   - [ ] /etc/zprofile
#   - [ ] ZDOTDIR/.zprofile
#   - [ ] /etc/zshrc
#   - [✔] ZDOTDIR/.zshrc
#   - [ ] ZDOTDIR/flux-capacitor.zsh
#   - [ ] /etc/zlogin
#   - [ ] ZDOTDIR/.zlogin
#   - [ ] ZDOTDIR/.zlogout
#   - [ ] /etc/zlogout
#

# Get the DeLorean up to speed.
if [[ -s "${DELOREAN_LOCATION}/88" ]]; then
  source "${DELOREAN_LOCATION}/88"
fi

################################################################################
# Limits.
################################################################################

#
# Maximum number of open file descriptors any one process may have.
#

ulimit -n 2560

################################################################################
# Hooks.
################################################################################

#
# Hook 'chpwd_recent_dirs' to 'chpwd' for the `cdr` command.
#

# add-zsh-hook chpwd chpwd_recent_dirs

################################################################################
# Functions.
################################################################################

#
# Define interactive user functions here.
#

###############################################################################
# Aliases.
###############################################################################

alias v='vim'
alias screencast='ffscreencast --sargs="-capture_cursor 1 -capture_mouse_clicks 1"'

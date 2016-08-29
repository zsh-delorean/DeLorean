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

# Start the DeLorean engine.
if [[ -s "${ZDOTDIR}/engine.zsh" ]]; then
  source "${ZDOTDIR}/engine.zsh"
fi

################################################################################
# Increase limits.
################################################################################

ulimit -n 2560

################################################################################
# User hooks.
################################################################################

#
# For the `cdr` command.
#

# add-zsh-hook chpwd chpwd_recent_dirs

################################################################################
# User functions.
################################################################################

#
# Define user functions here.
#

###############################################################################
# Program aliases.
###############################################################################

alias v='vim'
alias screencast='ffscreencast --sargs="-capture_cursor 1 -capture_mouse_clicks 1"'

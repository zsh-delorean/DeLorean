@delorean.exec.command.future.util.schematic.stdout--zshenv.user () {
<<'FILE'
#
# Sets $ZDOTDIR and the DeLorean location. 
#

################################################################################
# NOTE TO SELF FROM THE FUTURE:
#
# This file materialized as ~/.zshenv when the DeLorean hit 88 MPH, and should
# not be edited. Instead, edit .zshenv inside the DeLorean's ZDOTDIR:
#
# __ZDOTDIR__/.zshenv
#
# Zsh's default behavior for the .zshenv found in a user's $HOME directory is to
# source it, then if it sets $ZDOTDIR, use that for sourcing .zshrc and friends.
# Therefore, the DeLorean .zshenv has to be sourced manually (as is done below).
################################################################################

builtin export DELOREAN_ZSHENV="${HOME}/.zshenv"
builtin export DELOREAN_LOCATION='__LOCATION__'
builtin export DELOREAN_CIRCUITS="${DELOREAN_LOCATION}/ZDOTDIR/circuits"

if ! [[ -s "${DELOREAN_LOCATION}/88" ]]; then
<<EOF >&2

  Aborting ZDOTDIR redirection for:
    ${DELOREAN_ZSHENV}

  Failed to find DeLorean location:
    ${DELOREAN_LOCATION}

  Please try reinstalling DeLorean!

EOF
  builtin return
fi

builtin export ZDOTDIR='__ZDOTDIR__'

[[ -s "${ZDOTDIR}/.zshenv" ]] && builtin source "${ZDOTDIR}/.zshenv"
FILE
}

@delorean.exec.command.future.util.schematic.stdout--zshenv.system () {
<<'FILE'
#
# Sets $ZDOTDIR and the DeLorean location. 
#

################################################################################
# NOTE TO SELF FROM THE FUTURE:
#
# This file materialized as /etc/zshenv when the DeLorean hit 88 MPH, and should
# not be edited. Instead, edit .zshenv inside the DeLorean's ZDOTDIR:
#
# __ZDOTDIR__/.zshenv
#
# Zsh's default behavior for system-wide zshenv is to source the first .zshenv
# found in $ZDOTDIR, so the DeLorean .zshenv is sourced automatically.
################################################################################

builtin export DELOREAN_ZSHENV='/etc/zshenv'
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
FILE
}

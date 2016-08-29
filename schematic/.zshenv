#
# Forcefully define environment variables for all contexts.
#
# Variables defined here will always override the values of their parent context
# because .zshenv will be sourced at the start of all contexts. For this reason,
# try to avoid any slow operations or adding to variables like an array (because
# it will slow down the shell, and variables will accumulate duplicates equal to
# the number of shell levels).
#
# Unless some variable absolutely MUST have a fixed value at the start of ALL
# contexts, define varaibles instead in ZDOTDIR/.zprofile so they are inherited.
#
# Context:
#   - [✔] Login.
#   - [✔] Interactive.
#   - [✔] Script.
#
# Order:
#   - [ ] /etc/zshenv
#   - [✔] ZDOTDIR/.zshenv
#   - [ ] /etc/zprofile
#   - [ ] ZDOTDIR/.zprofile
#   - [ ] /etc/zshrc
#   - [ ] ZDOTDIR/.zshrc
#   - [ ] ZDOTDIR/flux-capacitor.zsh
#   - [ ] /etc/zlogin
#   - [ ] ZDOTDIR/.zlogin
#   - [ ] ZDOTDIR/.zlogout
#   - [ ] /etc/zlogout
#

################################################################################
# Environment variables.
################################################################################

#
# Define fixed environment variables here.
#

################################################################################
# Temporary files.
################################################################################

#
# $TMPDIR is normally specified by the operating system. For example, macOS sets
# this on a per-user basis to a unique and user-owned directory that looks like:
#
#   /var/folders/kb/ydt74z19765cv9vb86rwvcrr0000gn/T/
#
# If $TMPDIR hasn't been specified, we create it using the $LOGNAME variable,
# which is a safe string that uniquely represents the current user's username.
#
# This is in .zshenv because Zsh makes use of this variable, and we want it to
# be set to the proper location even for one-off command argument calls to Zsh.
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

#
# Zsh and DeLorean use $TMPPREFIX for creating temporary files.
#
# $TMPPREFIX is a Zsh construct, defualting to /tmp/zsh, and used as a prefix:
#
#   echo "$(date)" >! "${TMPPREFIX}-temp_date"
#
# By default the temporary file would be created at /tmp/zsh-temp_date which is
# inconsistent with the user-local $TMPDIR defined above. For consistency,
# $TMPPREFIX is set below, by using the $TMPDIR from above:
#

export TMPPREFIX="${TMPDIR%/}/zsh"

#
# Now, on macOS, Zsh and DeLorean create temporary files like:
#
#   /var/folders/kb/ydt74z19765cv9vb86rwvcrr0000gn/T/zsh-5.2-zcompdump
#   /var/folders/kb/ydt74z19765cv9vb86rwvcrr0000gn/T/zsh-5.2-circuit.zwc
#

################################################################################
# Source ZDOTDIR/.zprofile
################################################################################

#
# Zsh shells can lack an environment due to inconsistencies between OS X, linux,
# and SSH implementations, so we manually keep track of if ZDOTDIR/.zprofile has
# been properly sourced. This also protects ZDOTDIR/.zprofile from being sourced
# more than once, as historically it's only meant to be run once at user login.
#

if [[ -o LOGIN ]]; then
  export DELOREAN_ENV_EXISTS='yes'
elif [[ -o INTERACTIVE && -z "${DELOREAN_ENV_EXISTS}" ]]; then
  export DELOREAN_ENV_EXISTS='yes'
  [[ -s "${ZDOTDIR}/.zprofile" ]] && source "${ZDOTDIR}/.zprofile"
fi

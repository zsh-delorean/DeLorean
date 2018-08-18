#
# Zshenv variables.
#

@delorean.exec.command.util.zshenv-vars () {
  local 'isSystem'

  isSystem="${1}"

  if @delorean.is-flag "${isSystem}"; then
    DELOREAN[zshenv_su]='yes'
    DELOREAN[zshenv_ext]='system'
    DELOREAN[zshenv_loc]="/etc/zshenv"
  else
    (( ${+DELOREAN[zshenv_su]} )) && builtin unset 'DELOREAN[zshenv_su]'
    DELOREAN[zshenv_ext]='user'
    DELOREAN[zshenv_loc]="${HOME}/.zshenv"
  fi

  #
  # When did we last touch zshenv?
  #

  builtin zmodload 'zsh/attr'
  builtin local 'zshenv_epoch'
  builtin zgetattr "${DELOREAN[zshenv_loc]}" 'epoch' 'zshenv_epoch' &>/dev/null
  DELOREAN[zshenv_epoch]="${zshenv_epoch}"

  builtin zmodload -F 'zsh/stat' 'b:zstat'
  DELOREAN[zshenv_mtime]="$(builtin zstat '+mtime' "${DELOREAN[zshenv_loc]}" 2>/dev/null)"

}

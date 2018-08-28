@delorean.exec.command.util.zshenv-vars () {
  builtin local 'system' 'zshenv_epoch'

  system="${1}"

  #
  # Zshenv variables.
  #

  if (( ${system} )); then
    DELOREAN[zshenv_su]='yes'
    DELOREAN[zshenv_ext]='system'
    DELOREAN[zshenv_loc]="/etc/zshenv"
  else
    if [[ "${DELOREAN_ZSHENV}" == '/etc/zshenv' ]]; then
      ${0}.stderr.system-flag-warning
      if ! read -q "?Proceed without --system flag [y/N]? " && builtin print; then
        builtin return 1
      fi
    fi
    (( ${+DELOREAN[zshenv_su]} )) && builtin unset 'DELOREAN[zshenv_su]'
    DELOREAN[zshenv_ext]='user'
    DELOREAN[zshenv_loc]="${HOME}/.zshenv"
  fi

  #
  # When did we last touch zshenv?
  #

  builtin zmodload 'zsh/attr'
  builtin zmodload -F 'zsh/stat' 'b:zstat'

  builtin zgetattr "${DELOREAN[zshenv_loc]}" 'epoch' 'zshenv_epoch' &>/dev/null

  DELOREAN[zshenv_epoch]="${zshenv_epoch}"
  DELOREAN[zshenv_mtime]="$(builtin zstat '+mtime' "${DELOREAN[zshenv_loc]}" 2>/dev/null)"

  builtin return 0
}

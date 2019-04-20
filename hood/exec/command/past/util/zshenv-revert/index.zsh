@delorean.exec.command.past.util.zshenv-revert() {
  @delorean.import './stderr/*'

  #
  # Revert to zshenv.past with the utmost care.
  #

  if (( ${DELOREAN[zshenv_mtime]} )) && (( ${DELOREAN[zshenv_epoch]} )); then

    if (( ${DELOREAN[zshenv_mtime]} != ${DELOREAN[zshenv_epoch]} )); then
      if ! builtin read -q "?Remove ${DELOREAN[zshenv_loc]} even though it has unsaved changes [y/N]? "; then
        ${0}.stderr.abort
        builtin return 1
      fi
      builtin print
    fi

    if [[ -s "${DELOREAN[zshenv_loc]}.past" ]]; then
      ${0}.stderr.begin
      ${DELOREAN[zshenv_su]:+'sudo'} builtin noglob command mv -f -v "${DELOREAN[zshenv_loc]}.past" "${DELOREAN[zshenv_loc]}"
    else
      ${DELOREAN[zshenv_su]:+'sudo'} builtin noglob command rm "${DELOREAN[zshenv_loc]}"
    fi

    if (( ${?} != 0 )); then
      ${0}.stderr.fail
      builtin return 1
    fi

  fi

  builtin return 0
}

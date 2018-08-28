@delorean.exec.command.future.util.zshenv-displace () {
  @delorean.import './stderr/*'
  @delorean.import '../schematic/'

  #
  # Ensure temporal displacement of zshenv can be reversed.
  #

  # if zshenv already exists
  if (( ${DELOREAN[zshenv_mtime]} )); then
    # and was created by us
    if (( ${DELOREAN[zshenv_epoch]} )); then
      # but has been tampered with
      if (( ${DELOREAN[zshenv_epoch]} != ${DELOREAN[zshenv_mtime]} )); then
        ${0}.stderr.has-been-modified
        builtin return 1
      fi
    # or, it was not created by us
    elif read -q "?Backup ${DELOREAN[zshenv_loc]} and proceed [y/N]? " && builtin print; then
      if ! [[ -s "${DELOREAN[zshenv_loc]}.past" ]]; then
        ${DELOREAN[zshenv_su]:+'sudo'} builtin noglob command mv -v "${DELOREAN[zshenv_loc]}" "${DELOREAN[zshenv_loc]}.past"
      else
        ${0}.stderr.backup-past-conflict
        builtin return 1
      fi
    # or, the user chose to abort
    else
      ${0}.stderr.backup-abort
      builtin return 1
    fi
  fi

  #
  # Remove previously materialized zshenv.
  #

  if [[ -f "${DELOREAN[zshenv_loc]}" ]]; then
    ${DELOREAN[zshenv_su]:+'sudo'} builtin noglob command rm "${DELOREAN[zshenv_loc]}"
  fi

  #
  # Use schematic to materialize a new zshenv.
  #

  @delorean.exec.command.future.util.schematic "zshenv.${DELOREAN[zshenv_ext]}" "${DELOREAN[zshenv_loc]}" "${DELOREAN[zshenv_su]}"

  if (( ${?} )); then
    ${0}.stderr.schematic-fail
    builtin return 1
  fi

  builtin return 0
}

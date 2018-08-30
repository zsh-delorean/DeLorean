@delorean.exec.command.future.util.circuits-setup () {
  @delorean.import './stderr/*'

  builtin local 'opt_circuits'

  opt_circuits="${1}"

  if (( ${#opt_circuits} )); then
    DELOREAN[circuits_loc]="${opt_circuits}"
  elif (( ${#DELOREAN_ZSHENV} )) && (( ${#DELOREAN_CIRCUITS} )); then
    DELOREAN[circuits_loc]="${DELOREAN_CIRCUITS}"
  else
    DELOREAN[circuits_loc]="${HOME}/.delorean/circuits"
  fi

  @delorean.log-var "${0}" 'DELOREAN[circuits_loc]' "${DELOREAN[circuits_loc]}"

  builtin command mkdir -p "${DELOREAN[circuits_loc]}"

  if ! [[ -d "${DELOREAN[circuits_loc]}" ]]; then
    ${0}.stderr.mkdir
    builtin return 1
  fi
}

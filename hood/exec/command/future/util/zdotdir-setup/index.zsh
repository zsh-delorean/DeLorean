@delorean.exec.command.future.util.zdotdir-setup () {
  @delorean.import './stderr/*'

  builtin local 'opt_zdotdir'

  opt_zdotdir="${1}"

  if (( ${#opt_zdotdir} )); then
    DELOREAN[zdotdir]="${opt_zdotdir}"
  elif (( ${#DELOREAN_ZSHENV} )) && (( ${#ZDOTDIR} )); then
    DELOREAN[zdotdir]="${ZDOTDIR}"
  else
    DELOREAN[zdotdir]="${HOME}/.config/ZDOTDIR"
  fi

  @delorean.log-var "${0}" 'DELOREAN[zdotdir]' "${DELOREAN[zdotdir]}"

  builtin command mkdir -p "${DELOREAN[zdotdir]}"

  if ! [[ -d "${DELOREAN[zdotdir]}" ]]; then
    ${0}.stderr.mkdir
    builtin return 1
  fi
  
  builtin return 0
}

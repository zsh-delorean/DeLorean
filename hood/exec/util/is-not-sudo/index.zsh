@delorean.exec.util.is-not-sudo () {
  #
  # Disallow sudo, in order to keep the space-time continuum intact.
  #

  if (( ${EUID} == 0 )); then
    @delorean.import './stderr/is-sudo'
    ${0}.stderr.is-sudo
    builtin return 1
  fi

  builtin return 0
}

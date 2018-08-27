#
# Disallow sudo, in order to keep the space-time continuum intact.
#

@delorean.exec.util.is-not-sudo () {
  if (( ${EUID} == 0 )); then
    @delorean.import './stderr/is-sudo'
    @delorean.exec.util.is-not-sudo.stderr.is-sudo
    builtin return 1
  fi
}


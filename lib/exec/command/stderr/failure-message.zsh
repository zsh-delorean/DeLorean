@delorean.exec.command.stderr.failure-message () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

  builtin local 'message'
  message="${1}"

<<EOF >&2

${DELOREAN_TRUNK[T]}Failure message:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}${message}

EOF
}

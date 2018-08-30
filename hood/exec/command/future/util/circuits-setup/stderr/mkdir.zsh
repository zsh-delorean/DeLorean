@delorean.exec.command.future.util.circuits-setup.stderr.mkdir () {
  @delorean.import '~/util/stderr-prefix/'
  @delorean.util.stderr-prefix

<<EOF >&2

${DELOREAN_TRUNK[T]}FAILED to materialize circuits directory:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}${DELOREAN[circuits_loc]}

EOF
}

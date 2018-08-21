@delorean.exec.command.stderr.password-empty () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

<<EOF >&2

${DELOREAN_TRUNK[T]}Empty password.
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}Press CTRL-C to skip.

EOF
}

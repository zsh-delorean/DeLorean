@delorean.exec.command.stderr.password-wrong () {
  @delorean.import '~/util/stderr-prefix/'
  @delorean.util.stderr-prefix

<<EOF >&2

${DELOREAN_TRUNK[T]}Wrong password.
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}Press CTRL-C to skip.

EOF
}

@delorean.exec.command.util.zshenv-vars.stderr.system-flag-warning () {
  @delorean.import '~/util/stderr-prefix/'
  @delorean.util.stderr-prefix

<<EOF >&2

${DELOREAN_TRUNK[T]}Warning! Current shell was configured using system zshenv:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}/etc/zshenv
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}Did you mean to pass the --system flag?

EOF
}

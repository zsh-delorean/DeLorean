@delorean.exec.command.future.util.schematic.stderr.conflict () {
  @delorean.import '~/util/stderr-prefix/'
  @delorean.util.stderr-prefix

  builtin local 'out'
  out="${1}"

<<EOF >&2

${DELOREAN_TRUNK[T]}Schematic destination conflicts with an existing file:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}${out}

EOF
}

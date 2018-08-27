@delorean.exec.command.future.util.schematic.stderr.missing () {
  @delorean.import '~/util/stderr-prefix/'
  @delorean.util.stderr-prefix

  builtin local 'in'
  cmd="${1}"

<<EOF >&2

${DELOREAN_TRUNK[T]}Schematic function is missing or lost in space and time:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}${cmd}

EOF
}

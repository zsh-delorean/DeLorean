@delorean.exec.command.future.util.schematic.stderr.missing () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

  builtin local 'in'
  in="${1}"

<<EOF >&2

${DELOREAN_TRUNK[T]}Schematic file is missing or lost in space and time:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}${in}

EOF
}

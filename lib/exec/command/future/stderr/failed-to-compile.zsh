@delorean.exec.command.future.stderr.failed-to-compile () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

  builtin local file="${1}"

<<EOF >&2

${DELOREAN_TRUNK[T]}Warning! Failed to compile:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}${file}

EOF
}

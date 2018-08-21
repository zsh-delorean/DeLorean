@delorean.exec.command.past.util.zshenv-revert.stderr.fail () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

<<EOF >&2

${DELOREAN_TRUNK[H]}Failed to rewind the hands of time for ${DELOREAN[zshenv_loc]}

EOF
}

@delorean.exec.command.future.util.zshenv-displace.backup-abort () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

<<EOF >&2

${DELOREAN_TRUNK[H]}Aborting temporal displacement of ${DELOREAN[zshenv_loc]}

EOF
}

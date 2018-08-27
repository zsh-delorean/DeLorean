@delorean.exec.command.future.util.zshenv-displace.stderr.backup-past-conflict () {
  @delorean.import '~/util/stderr-prefix/'
  @delorean.util.stderr-prefix

<<EOF >&2

${DELOREAN_TRUNK[T]}Backup failed for ${DELOREAN[zshenv_loc]}
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}Move it away and try again.

EOF
}

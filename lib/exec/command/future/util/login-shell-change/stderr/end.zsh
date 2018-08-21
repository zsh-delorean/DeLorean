@delorean.exec.command.future.util.login-shell-change.stderr.end () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

<<EOF >&2

${DELOREAN_TRUNK[T]}CHANGED the default login shell to:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}${DELOREAN[login_shell]}

EOF
}

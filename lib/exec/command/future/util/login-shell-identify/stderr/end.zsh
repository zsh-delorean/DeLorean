@delorean.exec.command.future.util.login-shell-identify.stderr.end () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

<<EOF >&2

${DELOREAN_TRUNK[T]}IDENTIFIED the current default login shell as:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}${DELOREAN[login_shell]}

EOF
}

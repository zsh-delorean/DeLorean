@delorean.exec.command.future.util.login-shell-change.stderr.unchanged () {
  @delorean.import '~/util/stderr-prefix/'
  @delorean.util.stderr-prefix

<<EOF >&2

${DELOREAN_TRUNK[T]}(2/2) SKIPPED default login shell change.
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}The default login shell is already Zsh:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}${DELOREAN[login_shell]}

EOF
}

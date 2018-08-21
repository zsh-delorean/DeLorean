@delorean.exec.command.future.util.login-shell-change.stderr.bogus () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

<<EOF >&2

${DELOREAN_TRUNK[T]}(2/2) Cannot change the default login shell!
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}There is a bad Zsh entry in /etc/shells
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}Please fix /etc/shells and try again.

EOF
}

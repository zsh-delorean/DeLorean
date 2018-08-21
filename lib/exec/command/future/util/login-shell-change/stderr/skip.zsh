@delorean.exec.command.future.util.login-shell-change.stderr.skip () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

  builtin local 'chsh_zsh' 'header'
  chsh_zsh="${1}"
  header="${2}"

<<EOF >&2

${DELOREAN_TRUNK[T]}${header:-SKIPPED} default login shell change.
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}To change it yourself, run the following command:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}chsh -s "${chsh_zsh}"

EOF
}

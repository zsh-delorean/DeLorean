@delorean.exec.command.future.util.login-shell-identify.stderr.skip () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

  builtin local 'header'
  header="${1}"

<<EOF >&2

${DELOREAN_TRUNK[T]}${header:-SKIPPED} default login shell identification.
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}Will assume your default login shell is the current shell:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}${DELOREAN[login_shell]}

EOF
}

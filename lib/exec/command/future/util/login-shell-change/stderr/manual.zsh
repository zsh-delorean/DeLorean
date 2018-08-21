@delorean.exec.command.future.util.login-shell-change.stderr.manual () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

  builtin local 'chsh_zsh'
  chsh_zsh="${1}"

<<EOF >&2

${DELOREAN_TRUNK[T]}(2/2) Cannot change the default login shell! 
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}This system does not have chsh.
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}Please manually change your default login shell to:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}${chsh_zsh}

EOF
}

@delorean.exec.command.future.how-to-change-shell () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

<<EOF >&2

${DELOREAN_TRUNK[T]}Almost there, Doc!!!
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}Framework successfully installed, but unfortunately you are not yet using Zsh.
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}Your default login shell must be changed to Zsh before you can use DeLorean.
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}Run ${DELOREAN[prog]} with the -c flag now to change your default login shell to Zsh:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}${DELOREAN[prog]} -c future

EOF
}

@delorean.exec.command.future.util.zshenv-displace.stderr.has-been-modified () {
  @delorean.import '~/util/stderr-prefix/'
  @delorean.util.stderr-prefix

<<EOF >&2

${DELOREAN_TRUNK[T]}${DELOREAN[zshenv_loc]} has been modified since the last temporal displacement!
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}Copy the changes you intend to keep from: 
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}${DELOREAN[zshenv_loc]} -> ${DELOREAN[dir]}/ZDOTDIR/.zshenv
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[L]}Then remove ${DELOREAN[zshenv_loc]} and try again.

EOF
}

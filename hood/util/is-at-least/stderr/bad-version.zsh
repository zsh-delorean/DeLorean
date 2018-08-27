@delorean.util.is-at-least.stderr.bad-version () {
  @delorean.import '~/util/stderr-prefix/'
  @delorean.util.stderr-prefix

<<EOF >&2

${DELOREAN_TRUNK[T]}Prehistoric Zsh version detected!
${DELOREAN_TRUNK[I]}Plutonium not invented until Zsh version: ${DELOREAN[min_zsh_version]}
${DELOREAN_TRUNK[L]}Please install at least version ${DELOREAN[min_zsh_version]} of Zsh.

EOF
}

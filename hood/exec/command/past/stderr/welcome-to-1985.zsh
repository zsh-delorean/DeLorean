@delorean.exec.command.past.stderr.welcome-to-1985 () {
  @delorean.import '~/util/stderr-prefix/'
  @delorean.util.stderr-prefix

<<EOF >&2

${DELOREAN_TRUNK[T]}Welcome back to 1985.
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}Your config remains at:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}${ZDOTDIR}
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}To destroy DeLorean, remove:
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}${DELOREAN_LOCATION}
${DELOREAN_TRUNK[L]}${DELOREAN_CIRCUITS}

EOF
}

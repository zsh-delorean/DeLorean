@delorean.exec.stderr.usage () {
  @delorean.import '~/util/stderr/padding'
  @delorean.util.stderr.padding

<<EOF >&2

${DELOREAN_TRUNK[T]}usage: ${DELOREAN[prog]} [-option ...] [--] command
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}options:
${DELOREAN_TRUNK[I]}  -s         System-wide (/etc/zshenv instead of ~/.zshenv).
${DELOREAN_TRUNK[I]}  -q         Quietly suppress theme music and ascii art.
${DELOREAN_TRUNK[I]}  -c         Change the default login shell to Zsh.
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}commands:
${DELOREAN_TRUNK[I]}  future     Send your Zsh into the future!
${DELOREAN_TRUNK[I]}  past       Travel back to how things were, before DeLorean.
${DELOREAN_TRUNK[L]}  circuit    Generates a minimal circuit with passed name.

EOF
}

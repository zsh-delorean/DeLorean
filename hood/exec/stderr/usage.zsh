@delorean.exec.stderr.usage () {
  @delorean.import '~/util/stderr-prefix/'
  @delorean.util.stderr-prefix

<<EOF >&2

${DELOREAN_TRUNK[T]}usage: ${DELOREAN[prog]} [-option ...] command [-option ...]
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}options:
${DELOREAN_TRUNK[I]}  --dev         Import source files.
${DELOREAN_TRUNK[I]}  --debug       Enable debug logging.
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}commands:
${DELOREAN_TRUNK[I]}  future        Send your Zsh into the future!
${DELOREAN_TRUNK[I]}  past          Travel back to how things were, before DeLorean.
${DELOREAN_TRUNK[I]}
${DELOREAN_TRUNK[I]}options:
${DELOREAN_TRUNK[I]}  -s, --system  System-wide (/etc/zshenv instead of ~/.zshenv).
${DELOREAN_TRUNK[I]}  -q, --quiet   Quietly suppress theme music and ascii art.
${DELOREAN_TRUNK[L]}  -c, --chsh    Change the default login shell to Zsh.

EOF
}

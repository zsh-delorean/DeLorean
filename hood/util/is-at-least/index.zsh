#
# Are we in the modern era?
#

@delorean.util.is-at-least () {
  if ! builtin autoload -Uz 'is-at-least' || ! is-at-least "${DELOREAN[min_zsh_version]}"; then
    @delorean.import './stderr/bad-version'
    @delorean.util.is-at-least.stderr.bad-version
    builtin return 1
  fi
}

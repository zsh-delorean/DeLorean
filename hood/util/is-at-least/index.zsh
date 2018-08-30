@delorean.util.is-at-least () {
  #
  # Are we in the modern era?
  #

  if ! builtin autoload -Uz 'is-at-least' || ! is-at-least "${DELOREAN[min_zsh_version]}"; then
    @delorean.import './stderr/bad-version'
    ${0}.stderr.bad-version
    builtin return 1
  fi
}

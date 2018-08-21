@delorean.exec.command.past() {
  @delorean.import './stderr/*'
  @delorean.import './util/zshenv-revert/'

  #
  # Set zshenv variables.
  #

  @delorean.exec.command.util.zshenv-vars "${isSystem}"

  #
  # Revert zshenv.
  #

  @delorean.exec.command.past.util.zshenv-revert
  (( ${?} == 0 )) || builtin return 1

  #
  # Welcome to 1985.
  #

  @delorean.exec.command.past.stderr.welcome-to-1985
  builtin return 0
}

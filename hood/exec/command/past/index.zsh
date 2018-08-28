@delorean.exec.command.past() {
  @delorean.import './stderr/*'
  @delorean.import '../util/zshenv-vars/'
  @delorean.import './util/zshenv-revert/'

  #
  # Parse command options.
  #

  builtin zparseopts -A opts -D -E -M -- 's=-system' '-system'

  #
  # Set zshenv variables.
  #

  @delorean.exec.command.util.zshenv-vars "${+opts[--system]}" || builtin return 1

  #
  # Revert zshenv.
  #

  ${0}.util.zshenv-revert || builtin return 1

  #
  # Welcome to 1985.
  #

  ${0}.stderr.welcome-to-1985

  builtin return 0
}

@delorean.exec () {
  @delorean.import '~/util/is-at-least/'
  @delorean.import './util/is-not-sudo/'
  @delorean.import './command/future/'
  @delorean.import './command/past/'
  @delorean.import './stderr/usage'

  #
  # Ensure a safe execution environment.
  #

  @delorean.exec.util.is-not-sudo || builtin return 1
  @delorean.util.is-at-least || builtin return 1

  #
  # Get command.
  #

  builtin local 'cmd'
  
  if (( ${#} > 0 )); then
    cmd="${1}"
    builtin shift
  fi

  #
  # Handle command.
  #

  case "${cmd}" in

    #
    # Displace zshenv, change shell, and compile.
    #

    ('future')
      @delorean.exec.command.future "${@[@]}"
    ;;

    #
    # Travel back to the past.
    #

    ('past')
      @delorean.exec.command.past "${@[@]}"
    ;;

    #
    # Command not yet invented. Maybe wait until 2025?
    #

    (*)
      @delorean.exec.stderr.usage
      builtin return 1
    ;;

  esac

  builtin return "${?}"
}

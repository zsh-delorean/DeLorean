#
# Only allow sourcing from Zsh.
#

if [ -z $ZSH_VERSION ]; then
  builtin echo
  builtin echo 'You may only source this script from within a Zsh session.'
  builtin echo
  builtin echo 'Try running it instead: ./88 -c future'
  builtin echo
  builtin return 1
fi

#
# Debug logging.
#

@delorean.log () {
  (( ${#DELOREAN[debug]} )) && builtin print "${DELOREAN[prog]}[${1}]: ${2}"
}

@delorean.log-info () {
  @delorean.log 'info' "${1}"
}

@delorean.log-cmd () {
  @delorean.log-info "${1} () => ${2} ${*[3,-1]}"
}

@delorean.log-var () {
  @delorean.log-info "${1} () => ${2}='${3}'"
}

@delorean.log-opts () {
  builtin local 'func' 'name'
  builtin local -A 'opts'

  func="${1}"
  name="${2}"
  opts=("${@[3,-1]}")

  for key value in "${(kv)opts[@]}"; do
    @delorean.log-var "${func}" "${name}[${key}]" "${value}"
  done
}

#
# Development import.
#

@delorean.import () {
  (( ${#DELOREAN[dev]} )) || builtin return 0

  builtin local -a 'parts' 'middle'
  builtin local 'front' 'back' 'trace' 'search' 'file'

  parts=("${(s:/:)1}");
  back="${parts[-1]}"
  front="${parts[1]}"
  middle=("${parts[@]:1:-1}")
  trace="${funcfiletrace[1]%/*}"

  case "${front}" in
    ('.')
      front="${trace}"
    ;;
    ('..')
      front="${trace}/.."
    ;;
    ('~'|'@delorean')
      front="${DELOREAN[loc]}/hood"
    ;;
  esac

  search="${front}/${(j:/:)middle[@]}/${back:-index}.zsh";

  @delorean.log-info "${0} () => ${search}"

  builtin setopt 'local_options' 'extended_glob' 'glob_subst'

  for file (${search}(.)) builtin source "${file}"
}

#
# Main function.
#

88 () {
  #
  # Shared global associative arrays (hidden).
  #

  builtin typeset -gAH 'DELOREAN' 'DELOREAN_TRUNK'

  #
  # Parse flags and set universal options.
  #

  builtin zparseopts -A opts -D -E -M -- '-dev' '-debug'

  DELOREAN[dev]="${opts[--dev]+yes}"
  DELOREAN[debug]="${opts[--debug]+yes}"

  DELOREAN[min_zsh_version]='5.0'
  DELOREAN[loc]="${${funcsourcetrace[1]%:*}:A:h}"

  #
  # Invokation method determines entry point.
  #

  if [[ "${ZSH_EVAL_CONTEXT[1,4]}" == 'file' ]]; then
    #
    # Invoked by runcom:
    #   - Do any necessary recompilation.
    #   - Affect the sourcing Zsh instance.
    #   - F.ex, in .zshrc: source "${DELOREAN_LOCATION}/88"
    #

    DELOREAN[prog]='DeLorean'
    @delorean.log-opts "${0}" 'DELOREAN' "${(kv)DELOREAN[@]}"

    @delorean.import '~/source/'
    @delorean.source
  elif [[ "${ZSH_EVAL_CONTEXT[1,8]}" == 'toplevel' ]]; then
    #
    # Invoked by user:
    #   - Execute the passed command plus flags.
    #   - F.ex, from the command-line: ./88 --dev future -c
    #

    DELOREAN[prog]='88'
    @delorean.log-opts "${0}" 'DELOREAN' "${(kv)DELOREAN[@]}"

    @delorean.import '~/exec/'
    if @delorean.exec "${@}"; then
      #
      # Don't start any subprocess if STDIN is not a TTY.
      #

      if ! [[ -t 0 || -p /dev/stdin ]]; then
        builtin return 0
      fi

      #
      # Start using the new DeLorean Zsh configuration!
      #

      builtin command login -fql "${LOGNAME}"

      #
      # End the parent process when the above subprocess exits.
      #

      # When called like: ./88
      if (( ${SHLVL} > 1 )); then
        builtin kill -9 "${PPID}"
      fi

      # When called like: 88
      builtin exit 0
    else
      #
      # The command failed... return the error code.
      #

      builtin return "${?}"
    fi
  fi
}

#
# Get DeLorean up to speed!
#

88 "${@}"
builtin return "${?}"

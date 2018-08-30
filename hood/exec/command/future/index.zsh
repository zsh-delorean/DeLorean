@delorean.exec.command.future () {
  @delorean.import './util/zdotdir-setup/'
  @delorean.import './util/circuits-setup/'
  @delorean.import '../util/zshenv-setup/'
  @delorean.import './util/zshenv-displace/'
  @delorean.import './util/schematic/'
  @delorean.import './util/login-shell-identify/'
  @delorean.import './util/login-shell-change/'
  @delorean.import './stderr/*'

  #
  # Parse command options.
  #

  builtin zparseopts -A opts -D -E -M -- \
    's=-system' '-system' \
    'c=-chsh' '-chsh' \
    'q=-quiet' '-quiet' \
    '-zdotdir::' \
    '-circuits::'

  @delorean.log-opts "${0}" 'opts' "${(kv)opts[@]}"

  #
  # Set future location of ZDOTDIR.
  #

  ${0}.util.zdotdir-setup "${opts[--zdotdir]}" || builtin return 1

  #
  # Set location of circuits.
  #

  ${0}.util.circuits-setup "${opts[--circuits]}" || builtin return 1

  #
  # Set zshenv variables.
  #

  @delorean.exec.command.util.zshenv-setup "${opts[--system]+yes}" || builtin return 1

  #
  # Temporally displace zshenv (backs up to f.ex: ~/zshenv.past).
  #

  ${0}.util.zshenv-displace || builtin return 1

  #
  # Materialize any missing user files into ZDOTDIR (non-zero exit is OK).
  #

  builtin local -a 'user_files'

  user_files=('.zshenv' '.zprofile' '.zshrc' 'flux-capacitor.zsh' '.zlogin' '.zlogout')

  for file in "${user_files[@]}"; do
    {
      ${0}.util.schematic "${file}" "${DELOREAN[zdotdir]}/${file}"
    } 2>/dev/${${${DELOREAN[debug]}:+stderr}:-null}
  done

  #
  # Compile known ZDOTDIR files (run 88 again after editing any of these).
  #

  for file in "${user_files[@]}"; do
    file="${DELOREAN[zdotdir]}/${file}"

    if ! builtin zcompile -Uz "${file}"; then
      ${0}.stderr.failed-to-compile "${file}"
    fi
  done

  #
  # Identify and change the default login shell, if requested.
  #

  DELOREAN[login_shell]="${SHELL}"
  @delorean.log-var "${0}" 'DELOREAN[login_shell]' "${DELOREAN[login_shell]}"

  if (( ${+opts[--chsh]} )); then
    ${0}.util.login-shell-identify
    ${0}.util.login-shell-change
  fi

  #
  # Explain how to get up to speed if Zsh is not the default login shell.
  #

  if ! [[ "${DELOREAN[login_shell]}" =~ "zsh" ]]; then
    ${0}.stderr.how-to-change-shell
    builtin return 1
  fi

  #
  # Critical velocity has been reached (88 MPH), welcome to the future!
  #

  if ! (( ${+opts[--quiet]} )); then
    if [[ "$(<"${DELOREAN[loc]}/README.md")" =~ '```DeLorean(.*)```' ]]; then
      builtin print -f "%s\n" "${match[1]}" >&2

      if (( ${+commands[afplay]} )); then
        builtin command afplay "${DELOREAN[loc]}/.github/bttf.wav" &>/dev/null &!
      elif (( ${+commands[aplay]} )); then
        builtin command aplay -t 'wav' "${DELOREAN[loc]}/.github/bttf.wav" &>/dev/null &!
      fi
    fi
  fi

  builtin return 0
}

@delorean.exec.command.future () {
  @delorean.import '../util/zshenv-vars/'
  @delorean.import './util/zshenv-displace/'
  @delorean.import './util/schematic/'
  #@delorean.import './util/login-shell-identify/'
  #@delorean.import './util/login-shell-change/'
  @delorean.import './stderr/*'

  #
  # Parse command options.
  #

  builtin zparseopts -D -- 's=isSystem' 'c=isChsh' 'q=isQuiet'

  #
  # Set zshenv variables.
  #

  @delorean.exec.command.util.zshenv-vars "${isSystem}"

  #
  # Temporally displace zshenv (backs up to f.ex: ~/zshenv.past).
  #

  @delorean.exec.command.future.util.zshenv-displace
  (( ${?} == 0 )) || builtin return 1
  builtin return 5

  #
  # Use schematic to materialize any missing user files into ZDOTDIR (non-zero exit is OK).
  #

  builtin local 'user_files'
  user_files=('.zshenv' '.zprofile' '.zshrc' '.zlogin' '.zlogout')

  for file in ("${user_files[@]}"); do
    @delorean.exec.command.future.util.schematic "${file}" "${DELOREAN[dir]}/ZDOTDIR/${file}" 2>/dev/null
  done

  #
  # Compile known ZDOTDIR files (run 88 again after editing any of these).
  #

  for file in ("${user_files[@]}" 'flux-capacitor.zsh'); do
    file="${DELOREAN[dir]}/ZDOTDIR/${file}"

    if ! builtin zcompile -Uz "${file}"; then
      @delorean.exec.command.future.stderr.failed-to-compile "${file}"
    fi
  done

  #
  # Identify and change the default login shell, if requested.
  #

  DELOREAN[login_shell]="${SHELL}"

  if @delorean.is-flag "${isChsh}"; then
    @delorean.exec.command.future.util.login-shell-identify

    @delorean.exec.command.future.util.login-shell-change
  fi

  #
  # Explain how to get up to speed if Zsh is not the default login shell.
  #

  if ! [[ "${DELOREAN[login_shell]}" =~ "zsh" ]]; then
    @delorean.exec.command.future.stderr.how-to-change-shell
    builtin return 1
  fi

  #
  # Critical velocity has been reached (88 MPH), welcome to the future!
  #

  if ! @delorean.is-flag "${isQuiet}"; then
    if [[ "$(<"${DELOREAN[dir]}/README.md")" =~ '```DeLorean(.*)```' ]]; then
      builtin print -f "%s\n" "${match[1]}"
    fi

    if (( ${+commands[afplay]} )); then
      builtin command afplay "${DELOREAN[dir]}/.github/bttf.wav" &>/dev/null &!
    elif (( ${+commands[aplay]} )); then
      builtin command aplay -t 'wav' "${DELOREAN[dir]}/.github/bttf.wav" &>/dev/null &!
    fi
  fi
}

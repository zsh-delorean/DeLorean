@delorean.exec.command.future.util.login-shell-change () {
  @delorean.import '~/exec/command/stderr/password-empty'
  @delorean.import '~/exec/command/stderr/password-wrong'
  @delorean.import '~/exec/command/stderr/failure-message'
  @delorean.import './stderr/*'

  builtin local 'chsh_zsh' 'chsh_zsh_stderr' 'return_code'

  return_code='0'

  if ! [[ "${DELOREAN[login_shell]}" =~ "zsh" ]]; then
    return_code='1'

    if (( ${+commands[chsh]} )); then
      ${0}.stderr.begin

      chsh_zsh="$(grep '/zsh$' '/etc/shells' | tail '-1')"

      if [[ -n "$("${chsh_zsh}" -c 'print "${ZSH_VERSION}"')" ]]; then
        builtin trap 'true' 'INT'
        while true; do
          chsh_zsh_stderr="$(chsh -s "${chsh_zsh}" 2>&1)"

          case "$?" in
            ('0')
              DELOREAN[login_shell]="${chsh_zsh}"
              @delorean.log-info "${0} () => DELOREAN[login_shell] = ${DELOREAN[login_shell]}"
              ${0}.stderr.end
              return_code='0'
              builtin break
            ;;
            ('130')
              # chsh returns 130 on CTRL-C
              ${0}.stderr.skip "${chsh_zsh}"
              return_code='130'
              builtin break
            ;;
            (*)
              case "${chsh_zsh_stderr}" in
                (*'Credentials'*)
                  @delorean.exec.command.stderr.password-wrong
                ;;
                (*'Empty'*)
                  @delorean.exec.command.stderr.password-empty
                ;;
                (*)
                  ${0}.stderr.skip "${chsh_zsh}" 'FAILED'
                  @delorean.exec.command.stderr.failure-message "${chsh_zsh_stderr}"
                  builtin break
                ;;
              esac
            ;;
          esac
        done
        builtin trap '-' 'INT'
      else
        ${0}.stderr.bogus
      fi
    else
      ${0}.stderr.manual "${chsh_zsh}"
    fi
  else
    ${0}.stderr.unchanged
  fi

  builtin return "${return_code}"
}

@delorean.exec.command.future.util.login-shell-identify () {
  @delorean.import './stderr/*'

  builtin local 'temp_file' 'ssh_stdout' 'ssh_error_code' 'ssh_stderr' 'return_code'

  temp_file="$(mktemp)" 

  @delorean.exec.command.future.util.login-shell-identify.stderr.begin

  builtin trap 'true' 'INT'
  while true; do
    ssh_stdout="$(
      ssh localhost \
      -o 'PreferredAuthentications=keyboard-interactive' \
      -o 'NumberOfPasswordPrompts=1' \
      -o 'PubkeyAuthentication=no'
      -t 'echo $SHELL' 2>!"${temp_file}"
    )"
    ssh_error_code="${?}"
    ssh_stderr="$(<"${temp_file}")"

    return_code='1'
    case "${ssh_error_code}" in
      ('0')
        if (( ${#ssh_stdout} > 2 )); then
          return_code='0'
          DELOREAN[login_shell]="${ssh_stdout}"
          @delorean.log-info "${0} () => DELOREAN[login_shell] = ${DELOREAN[login_shell]}"
          @delorean.exec.command.future.util.login-shell-identify.stderr.end
        else
          @delorean.exec.command.future.util.login-shell-identify.stderr.skip 'FAILED'
        fi
        builtin break
      ;;
      ('130')
        # ssh returns 130 on CTRL-C
        return_code='130'
        @delorean.exec.command.future.util.login-shell-identify.stderr.skip
        builtin break
      ;;
      ('255')
        case "${ssh_stderr}" in
          (*'denied'*)
            @delorean.exec.command.stderr.password-wrong
          ;;
          (*)
            @delorean.exec.command.future.util.login-shell-identify.stderr.skip 'FAILED'
            @delorean.exec.command.stderr.failure-message "${ssh_stderr}"
            builtin break
          ;;
        esac
      ;;
      (*)
        @delorean.exec.command.stderr.password-wrong
      ;;
    esac
  done
  builtin trap '-' 'INT'

  builtin return "${return_code}"
}

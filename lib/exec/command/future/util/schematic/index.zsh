@delorean.exec.command.future.util.schematic () {
  @delorean.import './stderr/*'

  builtin local 'in' 'out' 'su' 'schema' 'mtime'

  in="${DELOREAN[dir]}/template/${1}"
  out="${2}"
  su="${3}"

  @delorean.log-info "${0} () => Requested to copy ${in} to ${out} ${su:+'with sudo.'}"

  if ! [[ -f "${in}" ]]; then
    @delorean.exec.command.future.util.schematic.stderr.missing "${1}"
    builtin return 1
  fi

  if [[ -s "${out}" ]]; then
    @delorean.exec.command.future.util.schematic.stderr.conflict "${out}"
    builtin return 1
  fi

  #
  # Read in.
  #

  schema="${$(<"${in}")//__ZDOTDIR__/${prog_home}/ZDOTDIR}"

  #
  # Write out.
  #

  builtin print "${schema}" | ${su:+'sudo'} builtin command tee "${out}" >/dev/null

  #
  # Get mtime.
  #

  mtime="$(builtin zmodload -F 'zsh/stat' 'b:zstat'; builtin zstat '+mtime' "${out}")"

  if [[ ! "${mtime}" ]]; then
    @delorean.exec.command.future.util.schematic.stderr.mtime "${out}"
    builtin return 1
  fi

  #
  # Set epoch attr.
  #

  ${su:+'sudo'} builtin command zsh -c "builtin zmodload 'zsh/attr'; builtin zsetattr ${out} 'epoch' ${mtime}" &>/dev/null

  if (( ${?} != 0 )); then
    @delorean.exec.command.future.util.schematic.stderr.epoch "${out}"
    builtin return 1
  fi

  builtin return 0
}

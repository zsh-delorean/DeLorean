@delorean.exec.command.future.util.schematic () {
  @delorean.import './stderr/*'

  builtin local 'in' 'out' 'su' 'schema' 'mtime'

  in="${DELOREAN[dir]}/template/${1}"
  out="${2}"
  su="${3}"

  if ! [[ -f "${in}" ]]; then
    @delorean.exec.command.future.util.schematic.stderr.missing "${1}"
    builtin return 1
  fi

  if [[ -s "${out}" ]]; then
    @delorean.exec.command.future.util.schematic.stderr.conflict "${out}"
    builtin return 1
  fi

  # read in
  schema="${$(<"${in}")//__ZDOTDIR__/${prog_home}/ZDOTDIR}"

  # write out
  builtin print "${schema}" | ${su:+sudo} builtin command tee "${out}" >/dev/null

  # set epoch attr to mtime
  mtime="$(builtin zmodload -F 'zsh/stat' 'b:zstat'; builtin zstat '+mtime' "${out}")"
  ${su:+sudo} builtin command zsh -c "builtin zmodload 'zsh/attr'; builtin zsetattr ${out} 'epoch' ${mtime}" &>/dev/null
}

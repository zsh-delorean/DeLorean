@delorean.source () {
  #
  # Initiates the circuit sequence as configured in the flux capacitor.
  #

  ################################################################################
  # Setup.
  ################################################################################

  #
  # Are we in the modern era?
  #

  min_zsh_version='5.0'
  if ! autoload -Uz 'is-at-least' || ! is-at-least "${min_zsh_version}"; then
    cat <<EOF >&2

  DeLorean: Prehistoric Zsh version detected!
  Plutonium not invented until Zsh version: ${min_zsh_version}

EOF
    return 1
  fi
  unset 'min_zsh_version'

  ################################################################################
  # Epoch.
  ################################################################################

  function epoch-{exists,uptodate,update} {
    [[ -w "$1" ]] || return 2

    zmodload 'zsh/attr'

    # Cache the value of _DELOREAN_EPOCH.
    if (( ! ${+_DELOREAN_EPOCH} )); then
      export '_DELOREAN_EPOCH'
      zgetattr "${DELOREAN_ZSHENV}" 'epoch' '_DELOREAN_EPOCH'
    fi

    case "${0/epoch-/}" in

      #
      # Checks if the file has the "epoch" attribute.
      #

      ('exists')
        zgetattr "$1" 'epoch' 'epoch_exists' &>/dev/null && return 0 || return 1
      ;;

      #
      # Compares the "epoch" attribute of two files.
      #

      ('uptodate')
        zgetattr "$1" 'epoch' 'passed_epoch' &>/dev/null || return 1
        return $(( _DELOREAN_EPOCH != passed_epoch ))
      ;;

      #
      # Updates the "epoch" attribute of a file.
      #

      ('update')
        zsetattr "$1" 'epoch' "${_DELOREAN_EPOCH}"
      ;;
    esac
  }

  ################################################################################
  # FPATH.
  ################################################################################

  #
  # Copy all files in the fpath to a single location minus those in the blacklist,
  # and set the fpath to this sole "flattened" location.
  #
  # Files must be present as real files even after the next digest step, to avoid
  # errors that crop up if/when all real core Zsh files are completely removed.
  #

  function fpath-flatten {
    local 'blacklist'
    zstyle -a ':delorean:fpath' 'blacklist' 'blacklist'
    blacklist="^(${(j:|:)blacklist})"

    if [[ -d "${_DELOREAN_FPATH}" ]]; then
      epoch-exists "${_DELOREAN_FPATH}" && rm -r "${_DELOREAN_FPATH}" || {
        print "DeLorean: Failed to remove the fpath directory ${_DELOREAN_FPATH}" >&2
        return 1
      }
    fi

    mkdir -p "${_DELOREAN_FPATH}" || {
      print "DeLorean: Failed to create the fpath directory ${_DELOREAN_FPATH}" >&2
      return 1
    }

    # Anon func to contain setopt and redirect "no match found" errors.
    function {
      setopt 'local_options' 'extended_glob'
      for fp ("${fpath[@]}") cp -n "${fp}/"${~blacklist} "${_DELOREAN_FPATH}"
    } &>/dev/null

    [[ -s "${_DELOREAN_FPATH}/compinit" && -s "${_DELOREAN_FPATH}/_complete" ]] || {
      print "DeLorean: Important files missing from ${_DELOREAN_FPATH}" >&2
      return 1
    }

    epoch-update "${_DELOREAN_FPATH}"
  }

  #
  # Creates a zcompile digest from all files specified on the fpath.
  #

  function fpath-digest {
    local 'it'
    local -a 'zarr' 'ztail'

    setopt 'local_options' 'extended_glob'

    for it in "${_DELOREAN_FPATH}/"*; do
      [[ "${${it:t}[1]}" == '_' ]] && continue
      ztail=("${zarr[@]:t}")
      if [[ -z "${ztail[(r)${it:t}]}" ]]; then
        if zcompile -Uz "${TMPPREFIX}-try-zcompile" "${it}" &>/dev/null; then
          zarr+="${it}"
        else
          print "DeLorean: Consider adding ${it:t} to the fpath blacklist." >&2
        fi
      else
        #print "DUPLICATE: ${it}"
      fi
    done

    zcompile -Uz "${_DELOREAN_DIGEST}" "${zarr[@]}"

    zcompile -t "${_DELOREAN_DIGEST}" 'compinit' 'promptinit' || {
      print "DeLorean: Important functions missing from ${_DELOREAN_DIGEST}" >&2
      return 1
    }
  }

  ################################################################################
  # Circuit mechanism.
  ################################################################################

  #
  # Opens the circuit mechanism.
  #

  function circuit-open {
    typeset -ga '_DELOREAN_CIRCUITS'
    typeset -ga '_DELOREAN_FUNCTIONS'
    typeset -ga '_DELOREAN_COMPLETIONS'

    _DELOREAN_FPATH="${TMPPREFIX}-${ZSH_VERSION}-fpath"
    _DELOREAN_DIGEST="${TMPPREFIX}-${ZSH_VERSION}-fpath.zwc"
    _DELOREAN_COMPDUMP="${TMPPREFIX}-${ZSH_VERSION}-zcompdump"

    epoch-uptodate "${_DELOREAN_FPATH}" && _DELOREAN_UPTODATE='yes'

    if (( ${+_DELOREAN_UPTODATE} )) || fpath-flatten; then
      DELOREAN_FLAT='yes'
      fpath=("${_DELOREAN_FPATH}")
    fi

    if (( ${+_DELOREAN_UPTODATE} )); then
      fpath=("${_DELOREAN_DIGEST}" $fpath)
    fi
  }

  #
  # Add files to be compiled into the digest.
  #

  function digest {
    local 'it'

    for it in "$@"; do
      if [[ "${${it:t}[1]}" == '_' ]]; then
        _DELOREAN_COMPLETIONS=("${it}" $_DELOREAN_COMPLETIONS)
      else
        _DELOREAN_FUNCTIONS=("${it}" $_DELOREAN_FUNCTIONS)
      fi
    done
  }

  #
  # Recursive function for initiating circuits.
  #

  function circuit {
    local 'circuit'

    for circuit in "$@"; do
      if zstyle -t ":delorean:circuit:${circuit}" 'initiated' 'yes' 'no'; then
        continue
      elif [[ ! -d "${DELOREAN_CIRCUITS}/${circuit}" ]]; then
        print "DeLorean: no such circuit: ${circuit}" >&2
        zstyle ":delorean:circuit:${circuit}" initiated 'no'
        continue
      else
        (( ${+_DELOREAN_UPTODATE} )) || fpath=("${DELOREAN_CIRCUITS}/${circuit}" $fpath)

        # First call for each circuit in sequence.
        autoload -Uz +X "circuit-${circuit}" && "circuit-${circuit}"

        case "$?" in
          ('0')
            # Remember for second call (on close).
            _DELOREAN_CIRCUITS+="${circuit}"
            # Add the circuit itself to the digest.
            digest "${DELOREAN_CIRCUITS}/${circuit}/circuit-${circuit}" 
            # Don't try to initiate a second time.
            zstyle ":delorean:circuit:${circuit}" 'initiated' 'yes'
          ;;
          ('1')
            print "DeLorean: Great Scott! The ${circuit} circuit failed to initiate." >&2
          ;|
          ('69')
            # Service unavailable: Fail silently (usually a dumb terminal).
          ;|
          ('72')
            # Critical file missing: Warn the user (maybe need to git pull submodules).
            print "DeLorean: Great Scott! The ${circuit} circuit is missing critical files." >&2
          ;|
          ('78')
            # Configuration error: Inform the user (perhaps the result of a dumb terminal).
            print "DeLorean: Will not run the ${circuit} circuit due to configuration." >&2
          ;|
          (*)
            zstyle ":delorean:circuit:${circuit}" 'initiated' 'no'
          ;;
        esac
      fi
    done
  }

  #
  # Allows sequencing of circuits after the fact. This has many side-effects,
  # so a circuit loaded this way may need special design for this use-case.
  #
  # However, using interrupt for lazy-loading does seem to work with many of
  # the default circuits after some preliminary tests, which might be useful if
  # a circuit is needed for a one-off task in a specific session.
  #
  # Obvious side-effects:
  #
  # ALL functions and completions from the circuit digest will be available on
  # the fpath. Does NOT respect load order, and will be as if it loaded last.
  #
  # Initiation sequence will NOT be respected; will be as if it had ran after
  # all other modules initialized and executed; because many may already have.
  #
  # Will NOT be compiled in any way; compinit will be called with the -D flag.
  #

  function interrupt {
    if [[ "${ZSH_EVAL_CONTEXT}" != 'toplevel:shfunc' ]]; then
      print 'DeLorean: The "interrupt" command should only be used from the command-line!' >&2
    fi
    unset '_DELOREAN_UPTODATE' 'DELOREAN_FLAT'
    _DELOREAN_CIRCUITS=()
    _DELOREAN_FUNCTIONS=()
    _DELOREAN_COMPLETIONS=()
    circuit "$@"
    circuit-close
  }

  #
  # Closes the circuit mechanism.
  #
  # Compiles the digest and completion dump if outdated, and makes sure functions
  # are marked for autoload-ing before finally executing the sequenced circuits.
  #

  function circuit-close {
    autoload -Uz 'compinit'

    # Compile everything.
    if (( ${+_DELOREAN_UPTODATE} )); then
      compinit -C -d "${_DELOREAN_COMPDUMP}"
    else
      local 'fallback' 'circuit'

      if (( ${+DELOREAN_FLAT} )); then
        if cp -f "${_DELOREAN_FUNCTIONS[@]}" "${_DELOREAN_COMPLETIONS[@]}" "${_DELOREAN_FPATH}"; then
          if fpath-digest; then
            if compinit -i -d "${_DELOREAN_COMPDUMP}"; then
              if ! zcompile -Uz "${_DELOREAN_COMPDUMP}"; then
                print "DeLorean: Failed to compile the completion dump." >&2
              fi
            else
              print "DeLorean: Failed to initialize the completion dump." >&2
            fi
          else
            print "DeLorean: Failed to digest circuit functions and completions." >&2
          fi
        else
          print "DeLorean: Failed to copy circuit functions and completions." >&2
          fallback='yes'
        fi
      else
        fallback='yes'
      fi

      if [[ "${fallback}" == 'yes' ]]; then
        # Last-ditch effort to have a working configuration.
        fpath=(${"${_DELOREAN_FUNCTIONS[@]}":h} ${"${_DELOREAN_COMPLETIONS[@]}":h} $fpath)
        compinit -i -D
      fi
    fi
    
    # Mark all digest functions added by circuits for autoload-ing.
    autoload -Uz ${"${_DELOREAN_FUNCTIONS[@]}":t}

    # Second call for each circuit in sequence.
    for circuit in "${_DELOREAN_CIRCUITS[@]}"; do
      "circuit-${circuit}" || print "DeLorean: Great Scott! The ${circuit} circuit blew a fuse." >&2
    done
  }

  ################################################################################
  # Roads? Where we're going, we don't need roads.
  ################################################################################

  #
  # Flux capacitor configuration.
  #

  if [[ -s "${ZDOTDIR}/flux-capacitor.zsh" ]]; then
    source "${ZDOTDIR}/flux-capacitor.zsh"
  fi

  #
  # Disable color and theme in dumb terminals.
  #

  if [[ "${TERM}" == 'dumb' ]]; then
    zstyle ':delorean:*:*' 'color' 'no'
    zstyle ':delorean:circuit:prompt' 'theme' 'off'
  fi

  #
  # Load Zsh modules.
  #

  zstyle -a ':delorean:load' 'zmodule' 'zmodules'
  for zmodule ("${zmodules[@]}") zmodload "zsh/${(z)zmodule}"
  unset 'zmodule'{,'s'}

  #
  # Autoload Zsh functions.
  #

  zstyle -a ':delorean:load' 'zfunction' 'zfunctions'
  autoload -Uz "${zfunctions[@]}"
  unset 'zfunctions'

  #
  # Sequence DeLorean circuits.
  #

  circuit-open
  zstyle -a ':delorean:sequence' 'circuit' 'circuits'
  circuit "${circuits[@]}"
  unset 'circuits'
  circuit-close
}

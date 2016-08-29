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
if ! autoload -Uz is-at-least || ! is-at-least "$min_zsh_version"; then
  cat <<EOF >&2

DeLorean: Prehistoric Zsh version detected!
Plutonium not invented until Zsh version: ${min_zsh_version}

EOF
  return 1
fi
unset min_zsh_version

################################################################################
# Epoch.
################################################################################

function epoch-{exists,uptodate,update} {
  [[ -w "$1" ]] || return 3

  zmodload zsh/attr

  # Cache the value of DELOREAN_EPOCH.
  if (( ! $+DELOREAN_EPOCH )); then
    export DELOREAN_EPOCH
    zgetattr "${DELOREAN_ZSHENV}" 'epoch' DELOREAN_EPOCH
  fi

  case "${0/epoch-/}" in

    #
    # Checks if the file has the "epoch" attribute.
    #

    exists)
      zgetattr "$1" 'epoch' epoch_exists &>/dev/null && return 0 || return 1
    ;;

    #
    # Compares the "epoch" attribute of two files.
    #

    uptodate)
      zgetattr "$1" 'epoch' passed_epoch &>/dev/null || return 2
      return $(( DELOREAN_EPOCH != passed_epoch ))
    ;;

    #
    # Updates the "epoch" attribute of a file.
    #

    update)
      zsetattr "$1" 'epoch' "${DELOREAN_EPOCH}"
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
  zstyle -a ':delorean:fpath' blacklist 'blacklist'
  blacklist="^(${(j:|:)blacklist})"

  if [[ -d "${DELOREAN_FPATH}" ]]; then
    epoch-exists "${DELOREAN_FPATH}" && rm -r "${DELOREAN_FPATH}" || {
      print "DeLorean: Failed to remove the fpath directory ${DELOREAN_FPATH}" >&2
      return 1
    }
  fi

  mkdir -p "${DELOREAN_FPATH}" || {
    print "DeLorean: Failed to create the fpath directory ${DELOREAN_FPATH}" >&2
    return 1
  }

  # Anon func to restrict glob and redirect "no match found" errors.
  function {
    setopt LOCAL_OPTIONS EXTENDED_GLOB
    for fp ("$fpath[@]") cp -n "${fp}/"$~blacklist "${DELOREAN_FPATH}"
  } &>/dev/null

  [[ -s "${DELOREAN_FPATH}/compinit" && -s "${DELOREAN_FPATH}/_complete" ]] || {
    print "DeLorean: Important files missing from ${DELOREAN_FPATH}" >&2
    return 1
  }

  epoch-update "${DELOREAN_FPATH}"
}

#
# Creates a zcompile digest from all files specified on the fpath.
#

function fpath-digest {
  typeset -a zarr ztail

  setopt LOCAL_OPTIONS EXTENDED_GLOB

  for it in "${DELOREAN_FPATH}/"*; do
    [[ ${${it:t}[1]} == '_' ]] && continue
    ztail=(${zarr:t})
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

  zcompile -Uz "${DELOREAN_DIGEST}" "$zarr[@]"

  zcompile -t "${DELOREAN_DIGEST}" 'compinit' 'promptinit' || {
    print "DeLorean: Important functions missing from ${DELOREAN_DIGEST}" >&2
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
  typeset -ga DELOREAN_CIRCUITS
  typeset -ga DELOREAN_FUNCTIONS
  typeset -ga DELOREAN_COMPLETIONS

  DELOREAN_FPATH="${TMPPREFIX}-${ZSH_VERSION}-fpath"
  DELOREAN_DIGEST="${TMPPREFIX}-${ZSH_VERSION}-fpath.zwc"
  DELOREAN_COMPDUMP="${TMPPREFIX}-${ZSH_VERSION}-zcompdump"

  epoch-uptodate "${DELOREAN_FPATH}" && DELOREAN_UPTODATE='yes'

  if (( $+DELOREAN_UPTODATE )) || fpath-flatten; then
    DELOREAN_FLAT='yes'
    fpath=("${DELOREAN_FPATH}")
  fi

  if (( $+DELOREAN_UPTODATE )); then
    fpath=("${DELOREAN_DIGEST}" $fpath)
  fi
}

#
# Add files to be compiled into the digest.
#

function digest {
  for it in "$@"; do
    if [[ ${${it:t}[1]} == '_' ]]; then
      DELOREAN_COMPLETIONS=("${it}" $DELOREAN_COMPLETIONS)
    else
      DELOREAN_FUNCTIONS=("${it}" $DELOREAN_FUNCTIONS)
    fi
  done
}

#
# Recursive function for initiating circuits.
#

function circuit {
  local circuit

  for circuit in "$@"; do
    if zstyle -t ":delorean:circuit:$circuit" initiated 'yes' 'no'; then
      continue
    elif [[ ! -d "${ZDOTDIR}/circuits/$circuit" ]]; then
      print "DeLorean: no such circuit: $circuit" >&2
      zstyle ":delorean:circuit:$circuit" initiated 'no'
      continue
    else
      (( $+DELOREAN_UPTODATE )) || fpath=("${ZDOTDIR}/circuits/${circuit}" $fpath)

      # First call for each circuit in sequence.
      autoload -Uz +X "circuit-${circuit}" && "circuit-${circuit}"

      if (( $? == 0 )); then
        # Remember for second call (on close).
        DELOREAN_CIRCUITS+=${circuit}
        # Add the circuit itself to the digest.
        digest "${ZDOTDIR}/circuits/${circuit}/circuit-${circuit}" 
        # Don't try to initiate a second time.
        zstyle ":delorean:circuit:$circuit" initiated 'yes'
      else
        print "DeLorean: Great Scott! The ${circuit} circuit failed to initiate." >&2
        zstyle ":delorean:circuit:$circuit" initiated 'no'
      fi
    fi
  done
}

#
# Allows sequencing of circuits after the fact. This has many side-effects, so a
# circuit loaded this way would have to be specially designed for this use-case.
#
# However, using interrupt for lazy-loading does seem to work with many of the
# default circuits after some preliminary tests. This is useful if a circuit is
# needed for a one-off task in a session.
#
# Obvious side-effects:
#
# ALL functions and completions from the circuit digest will be available on the
# fpath. Does NOT respect load order, and it will be as if it were loaded last.
#
# Initiation sequence will NOT be respected; will be as if it ran after all
# modules had initialized and executed; because many may already have.
#
# Will NOT be compiled in any way; compinit will be called with the -D flag.
#

function interrupt {
  if [[ "$ZSH_EVAL_CONTEXT" != 'toplevel:shfunc' ]]; then
    print 'DeLorean: The "interrupt" command should only be used from the command-line!' >&2
  fi
  unset DELOREAN_UPTODATE DELOREAN_FLAT
  DELOREAN_CIRCUITS=()
  DELOREAN_FUNCTIONS=()
  DELOREAN_COMPLETIONS=()
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
  autoload -Uz compinit

  # Compile everything.
  if (( $+DELOREAN_UPTODATE )); then
    compinit -C -d "${DELOREAN_COMPDUMP}"
  else
    local fallback

    if (( $+DELOREAN_FLAT )); then
      if cp -f "${DELOREAN_FUNCTIONS[@]}" "${DELOREAN_COMPLETIONS[@]}" "${DELOREAN_FPATH}"; then
        if fpath-digest; then
          if compinit -i -d "${DELOREAN_COMPDUMP}"; then
            if ! zcompile -Uz "${DELOREAN_COMPDUMP}"; then
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
      for func (${"${DELOREAN_FUNCTIONS[@]}":h}) fpath=("${func}" $fpath)
      for comp (${"${DELOREAN_COMPLETIONS[@]}":h}) fpath=("${comp}" $fpath)
      compinit -i -D
    fi
  fi
  
  # Mark all digest functions added by circuits for autoload-ing.
  for func (${"${DELOREAN_FUNCTIONS[@]}":t}) autoload -Uz "${func}"

  # Second call for each circuit in sequence.
  for circuit in "${DELOREAN_CIRCUITS[@]}"; do
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

if [[ "$TERM" == 'dumb' ]]; then
  zstyle ':delorean:*:*' color 'no'
  zstyle ':delorean:circuit:prompt' theme 'off'
fi

#
# Load Zsh modules.
#

zstyle -a ':delorean:load' zmodule 'zmodules'
for zmodule ("$zmodules[@]") zmodload "zsh/${(z)zmodule}"
unset zmodule{s,}

#
# Autoload Zsh functions.
#

zstyle -a ':delorean:load' zfunction 'zfunctions'
for zfunction ("$zfunctions[@]") autoload -Uz "$zfunction"
unset zfunction{s,}

#
# Sequence DeLorean circuits.
#

circuit-open
zstyle -a ':delorean:sequence' circuit 'circuits'
circuit "$circuits[@]"
unset circuits
circuit-close

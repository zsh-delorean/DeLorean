@delorean.exec.command.future.util.schematic.stdout--flux-capacitor.zsh () {
<<'FILE'
#
# Tweaking the flux capacitor makes DeLorean travel to an alternate future!
#
# Get DeLorean up to speed by running "88 future" after making any tweaks here.
#

################################################################################
# Sequence of DeLorean circuits (order should not matter for core circuits).
################################################################################

zstyle ':delorean:sequence' 'circuit' \
  'environment' \
  'history-substring-search' \
  'iterm2' \
  'editor' \
  'utility' \
  'history' \
  'terminal' \
  'directory' \
  'completion' \
  'syntax-highlighting' \
  'git' \
  'hub' \
  'nvm' \
  'npm' \
  'prompt-pure'

################################################################################
# Zsh modules and functions.
################################################################################

#
# Set the Zsh modules to load (man zshmodules).
#

zstyle ':delorean:load' 'zmodule' 'attr' 'stat'

#
# Set the Zsh functions to load (man zshcontrib).
#

zstyle ':delorean:load' 'zfunction' 'add-zsh-hook' 'chpwd_recent_dirs' 'cdr'

################################################################################
# General configuration.
################################################################################

#
# Set case-sensitivity for completion, history lookup, etc.
#

# zstyle ':delorean:*:*' 'case-sensitive' 'yes'

#
# Color output (auto set to 'no' on dumb terminals).
#

zstyle ':delorean:*:*' 'color' 'yes'

################################################################################
# Configuration for fpath.
################################################################################

#
# Set the fpath files to blacklist.
#
# Visit the following wiki page for more details:
#
#   https://github.com/zsh-delorean/DeLorean/wiki/FPATH-blacklist
#

zstyle ':delorean:fpath' 'blacklist' \
  '_SUSEconfig' \
  '_a2ps' \
  '_a2utils' \
  '_aap' \
  '_acpi*' \
  '_acroread' \
  '_analyseplugin' \
  '_antiword' \
  'prompt_*' \
  '*calendar*' \
  '*mail*' \
  'zcalc' \
  'zcalc-auto-insert' \
  'zed-set-file-name' \
  'ztodo'

################################################################################
# DeLorean completion circuit.
################################################################################

#
# Show dotfiles in tab completion.
#

zstyle ':delorean:circuit:completion' 'dotfiles' 'yes'

#
# Set the completion files to whitelist.
#

zstyle ':delorean:circuit:completion' 'whitelist' \
  '_ag' \
  '_ansible' \
  '_vagrant'

################################################################################
# DeLorean editor circuit.
################################################################################

#
# Set the key mapping style to 'emacs' or 'vi'.
#

zstyle ':delorean:circuit:editor' 'key-bindings' 'vi'

#
# Auto convert .... to ../..
#

zstyle ':delorean:circuit:editor' 'dot-expansion' 'yes'

#
# Allow # comments on the interactive command line.
#

zstyle ':delorean:circuit:editor' 'comments' 'yes'

################################################################################
# DeLorean git circuit.
################################################################################

#
# Ignore submodules when they are 'dirty', 'untracked', 'all', or 'none'.
#

# zstyle ':delorean:circuit:git:status:ignore' 'submodules' 'all'

################################################################################
# DeLorean nvm circuit.
################################################################################

#
# Set location of NVM_DIR.
#

zstyle ':delorean:circuit:nvm' 'nvm-dir' "${HOME}/.nvm"

################################################################################
# DeLorean history-substring-search circuit.
################################################################################

#
# Set the query found color.
#

# zstyle ':delorean:circuit:history-substring-search:color' 'found' ''

#
# Set the query not found color.
#

# zstyle ':delorean:circuit:history-substring-search:color' 'not-found' ''

#
# Set the search globbing flags.
#

# zstyle ':delorean:circuit:history-substring-search' 'globbing-flags' ''

################################################################################
# DeLorean syntax-highlighting circuit.
################################################################################

# Set syntax highlighters.
# By default, only the main highlighter is enabled.
# zstyle ':delorean:circuit:syntax-highlighting' 'highlighters' \
#   'main' \
#   'brackets' \
#   'pattern' \
#   'line' \
#   'cursor' \
#   'root'
#
# Set syntax highlighting styles.
# zstyle ':delorean:circuit:syntax-highlighting' 'styles' \
#   'builtin' 'bg=blue' \
#   'command' 'bg=blue' \
#   'function' 'bg=blue'

################################################################################
# DeLorean terminal circuit.
################################################################################

#
# Auto set the tab and window titles.
#

zstyle ':delorean:circuit:terminal' 'auto-title' 'yes'

#
# Set the window title format.
#

zstyle ':delorean:circuit:terminal:window-title' 'format' '%n@%m: %s'

#
# Set the tab title format.
#

tab_title () {
  local pwd="${PWD/#${HOME}/~}"

  if [[ "${pwd}" == (#m)[/~] ]]; then
    echo "${MATCH}"
    unset 'MATCH'
  else
    echo "${${${${(@j:/:M)${(@s:/:)pwd}##.#?}:h}%/}//\%/%%}/${${pwd:t}//\%/%%}"
  fi
}

zstyle -e ':delorean:circuit:terminal:tab-title' 'format' 'reply=$(tab_title)'
FILE
}

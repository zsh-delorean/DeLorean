# Try:
#  - zplugin zsh-delorean/circuit-blah atload'circuit-blah; circuit-blah'
#    - after source 88 / before source 88

# build.zsh:
#   - Build hood/88.zsh -> 88
#   - ??? DELOREAN[loc]=${DELOREAN_LOCATION:-"${HOME}/.delorean"}

# Installer will clone zsh-delorean/DeLorean to:
#   ~/.delorean/DeLorean/{build.zsh,hood,.github,.git,.gitignore}
#   ~/.delorean/circuits/{.git,.gitmodules,circuit-git,circuit-editor}
#   ~/.zplugin/

# Where will record of installed circuits be stored?
# Can we use flux-capacitor.zsh list to install missing?

# --------------------------------------------------

# 88 is not necessarily in same directory as ZDOTDIR
#
# .zshenv =__ZDOTDIR__=> ~/.config/ZDOTDIR
# ~/.config/ZDOTDIR/.zshrc =source=> DELOREAN_LOCATION/88 -> ~/.delorean/88
# ~/.delorean/88 =source=> ~/.config/ZDOTDIR/flux-capacitor.zsh
# ~/.delorean/88 =circuit=> ~/.config/ZDOTDIR/circuits/environment/circuit-environment

# If running 88, user wants:
#   - past: Restore old zshenv.
#   - future -c: Copy schematics and change shell.
#   - future: Mark next login shell to rebuild because of .z* or $fpath change.
#
#   - Manage the centralized repository of user functions and aliases?
#   - Enable or disable circuits or reorder?
#
# If user is sourcing 88, DeLorean should:
#   - Flatten fpath if 88 future ran and marked zshenv epoch.
#   - Replace fpath with flattened location.
#   - Load circuits.

# TODO/CONSIDER:
#   - Location after install (compare to zulu)
#     - Zulu cannot load custom repos
#   - login... what about function call 88 when loaded in shell? might need to add back || exit 0
#     - Headless option... --skip-login if ! [ -t 0 ] || [ -p /dev/stdin ]; then
#   - zplugin
#   - Lazy load triggers
#   
#   - Brew commands in circuits
#   - Circuits can register mackup-style backups of configs.
#
#   - Will need to be DELOREAN_CIRCUITS.

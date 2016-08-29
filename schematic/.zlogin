#
# Executes commands at login post-zshrc.
#
# Context:
#   - [✔] Login.
#   - [ ] Interactive.
#   - [ ] Script.
#
# Order:
#   - [ ] /etc/zshenv
#   - [ ] ZDOTDIR/.zshenv
#   - [ ] /etc/zprofile
#   - [ ] ZDOTDIR/.zprofile
#   - [ ] /etc/zshrc
#   - [ ] ZDOTDIR/.zshrc
#   - [ ] ZDOTDIR/flux-capacitor.zsh
#   - [ ] /etc/zlogin
#   - [✔] ZDOTDIR/.zlogin
#   - [ ] ZDOTDIR/.zlogout
#   - [ ] /etc/zlogout
#

# If STDERR is bound to a TTY.
[[ -o INTERACTIVE && -t 2 ]] && {

  # Print a random greeting.
  if (( $+commands[fortune] )); then
    fortune -as
    print
  fi

} >&2

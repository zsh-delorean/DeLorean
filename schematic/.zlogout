#
# Executes commands at logout.
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
#   - [ ] ZDOTDIR/.zlogin
#   - [✔] ZDOTDIR/.zlogout
#   - [ ] /etc/zlogout
#

# If STDERR is bound to a TTY.
[[ -o INTERACTIVE && -t 2 ]] && {

  # Print the farewell.
  print
  print 'SEE YOU IN THE FUTURE!'

} >&2

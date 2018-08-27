@delorean.exec.command.future.util.schematic.stdout--.zlogout () {
<<'FILE'
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
  print 'If my calculations are correct, you will receive this letter'
  print 'immediately after you saw the DeLorean struck by lightning.'

} >&2
FILE
}

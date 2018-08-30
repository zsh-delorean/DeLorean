#!/usr/bin/env zsh

<<EOF >! '88'
#!/usr/bin/env zsh

EOF

() {
  builtin setopt 'local_options' 'extended_glob'
  < hood/**/(^88).zsh >> '88'
}

< 'hood/88.zsh' >> '88'

builtin command chmod 'u+x' '88'

builtin print '88 has been built.'

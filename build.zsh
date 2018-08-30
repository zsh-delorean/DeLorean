#!/usr/bin/env zsh

builtin :>! 88

<<EOF >> '88'
#!/usr/bin/env zsh

EOF

setopt EXTENDED_GLOB
< hood/**/(^88).zsh >> '88'

< 'hood/88.zsh' >> '88'

builtin command chmod 'u+x' '88'

builtin print '88 has been built.'

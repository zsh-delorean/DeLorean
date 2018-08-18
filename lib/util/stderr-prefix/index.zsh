#
# STDERR prefix.
#

@delorean.util.stderr-prefix () {
  DELOREAN_TRUNK[H]="${DELOREAN[prog]} ━━━ "
  DELOREAN_TRUNK[T]="${DELOREAN[prog]} ━┳━ "
  DELOREAN_TRUNK[I]="${DELOREAN[prog]//?/ }  ┃  "
  DELOREAN_TRUNK[L]="${DELOREAN[prog]//?/ }  ┗━ "
}

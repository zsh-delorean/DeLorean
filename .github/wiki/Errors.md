## `STDERR_ZSHENV_`

### `HAS_BEEN_MODIFIED`

```console
$ ./88 -q future
$ touch "${HOME}/.zshenv"
$ ./88 future

88 ━┳━ /Users/leoj/.zshenv has been modified since the last temporal displacement!
    ┃
    ┃  Copy the changes you intend to keep from:
    ┃
    ┃  /Users/leoj/.zshenv -> /Users/leoj/DeLorean/ZDOTDIR/.zshenv
    ┃
    ┗━ Then remove /Users/leoj/.zshenv and try again.
```

### `BACKUP_PAST_CONFLICT`

```console
$ print '# not empty' > "${HOME}/.zshenv"{,'.past'}
$ ./88 future
Backup /Users/leoj/.zshenv and proceed [y/N]? y

88 ━┳━ Backup failed for /Users/leoj/.zshenv
    ┃
    ┗━ Move it away and try again.
```

### `BACKUP_USER_ABORT`

```console
$ print '# not empty' > "${HOME}/.zshenv"
$ ./88 future
Backup /Users/leoj/.zshenv and proceed [y/N]?

88 ━━━ Aborting temporal displacement of /Users/leoj/.zshenv
```

### `SCHEMATIC_FAIL`

```console
$ ./88 -q future
$ sudo chflags uchg "${HOME}/.zshenv"
$ ./88 future
override rw-r--r--  leoj/staff uchg for /Users/leoj/.zshenv?

88 ━┳━ Schematic destination /Users/leoj/.zshenv conflicts with an existing file!
    ┃
    ┗━ Temporal displacement of /Users/leoj/.zshenv has failed.
```

### `REMOVE_USER_ABORT`

```console
$ ./88 -q future
$ touch "${HOME}/.zshenv"
$ ./88 past
Remove /Users/leoj/.zshenv even though it has unsaved changes [y/N]?

88 ━━━ Aborting removal of /Users/leoj/.zshenv
```

### `REVERT_FAIL`

```console
$ print '# not empty' > "${HOME}/.zshenv"
$ ./88 -q future
Backup /Users/leoj/.zshenv and proceed [y/N]? y
/Users/leoj/.zshenv -> /Users/leoj/.zshenv.past

$ sudo chflags uchg "${HOME}/.zshenv"
Password:

$ ./88 past

88 ━━━ Reverting /Users/leoj/.zshenv to its original state.

mv: rename /Users/leoj/.zshenv.past to /Users/leoj/.zshenv: Operation not permitted

88 ━━━ Failed to rewind the hands of time for /Users/leoj/.zshenv
```

## `STDERR_CHANGE_SHELL_`

### `ABORT`

```console
$ chsh -s '/bin/bash'
Changing shell for leoj.
Password for leoj:

$ ./88 -cq future

88 ━━━ Time to change the default shell to Zsh!

Password for leoj:

88 ━┳━ Change of default login shell has been cancelled!
    ┃
    ┃  To try again, run the following command at any time:
    ┃
    ┗━ chsh -s "/usr/local/bin/zsh"
```

### `WRONG`

```console
$ chsh -s '/bin/bash'
Changing shell for leoj.
Password for leoj:

$ ./88 -c future

88 ━━━ Time to change the default shell to Zsh!

Password for leoj:

88 ━┳━ Wrong password.
    ┃
    ┗━ Press CTRL-C to skip.

Password for leoj:
```

### `EMPTY`

```console
$ chsh -s '/bin/bash'
Changing shell for leoj.
Password for leoj:

$ ./88 -c future

88 ━━━ Time to change the default shell to Zsh!

Password for leoj:

88 ━┳━ Empty password.
    ┃
    ┗━ Press CTRL-C to skip.

Password for leoj:
```

### `OTHER`

```console

```

### `BOGUS`

```console

```

### `MANUAL`

```console

```

### `UNCHANGED`

```console
$ chsh -s '/usr/local/bin/zsh'
Changing shell for leoj.
Password for leoj:

```

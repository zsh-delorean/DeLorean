The `$fpath` blacklist allows the removal of unused functions from the ZSH
`$fpath` by copying all referenced files (less those on the blacklist) into a
special location, and then forcing the `$fpath` variable to that sole location.

Because of how this works, `88` has to be re-run every time a new file is added
to a standard `$fpath` location (usually after installing software that adds
completion scripts).

Reasons to blacklist unused completions and/or functions:
  
  - For security purposes.
  - Tidy up your shell environment.
  - Resolve conflicts with other software.
  - Speed (less files for Zsh to parse through).

Additionally, understanding what's available to blacklist unveils what Zsh has
to offer, like Tetris!

## Completions from ZSH version 5.2

These are the default completions that come with ZSH version 5.2

| Completion File              | ZSH | Description  |
|:---------------------------- |:---:|:------------ |
| `_SUSEconfig`                |     | Configure SUSE LINUX.
| `_a2ps`                      |     | GNU a2ps is an Any to PostScript filter.
| `_a2utils`                   |     | Apache enable/disable module/site.
| `_aap`                       |     | The Aap program executes recipes similar to the Make build tool.
| `_acpi*`                     |     | Advanced Configuration and Power Interface.
| `_acroread`                  |     | Acroread is a well known PDF viewer.
| `_adb`                       |     | Android Debug Bridge.
| `_add-zsh-hook`              |  ✓  | The shell function add-zsh-hook provides a simple way of adding or removing functions from the array.
| `_alias`                     |  ✓  | Suggests `alias definition` completions for the `alias` command.
| `_aliases`                   |  ✓  | Suggests `association key` completions for the `$aliases` array.
| `_all_labels`                |  ✓  | Implements the loop over the tag aliases.
| `_all_matches`               |  ✓  | This completer can be used to add a string consisting of all other matches.
| `_alternative`               |  ✓  | This function is useful in simple cases where multiple tags are available.
| `_analyseplugin`             |     | Linux Audio Developer's Simple Plugin API for handling audio filters and audio signal processing effects.
| `_ant`                       |     | Pure Java build tool.
| `_antiword`                  |     | Antiword: a free MS Word document reader.
| `_apachectl`                 |     |
| `_apm`                       |     |
| `_approximate`               |     |
| `_apt`                       |     |
| `_apt-file`                  |     |
| `_apt-move`                  |     |
| `_apt-show-versions`         |     |
| `_aptitude`                  |     |
| `_arch_archives`             |     |
| `_arch_namespace`            |     |
| `_arg_compile`               |     |
| `_arguments`                 |     |
| `_arp`                       |     |
| `_arping`                    |     |
| `_arrays`                    |     |
| `_assign`                    |     |
| `_at`                        |     |
| `_attr`                      |     |
| `_augeas`                    |     |
| `_auto-apt`                  |     |
| `_autocd`                    |     |
| `_awk`                       |     |
| `_axi-cache`                 |     |
| `_bash_completions`          |     |
| `_baz`                       |     |
| `_be_name`                   |     |
| `_beadm`                     |     |
| `_beep`                      |     |
| `_bind_addresses`            |     |
| `_bindkey`                   |     |
| `_bison`                     |     |
| `_bittorrent`                |     |
| `_bogofilter`                |     |
| `_bpython`                   |     |
| `_brace_parameter`           |     |
| `_brctl`                     |     |
| `_bsd_pkg`                   |     |
| `_bsdconfig`                 |     |
| `_bsdinstall`                |     |
| `_btrfs`                     |     |
| `_bts`                       |     |
| `_bug`                       |     |
| `_builtin`                   |     |
| `_bzip2`                     |     |
| `_bzr`                       |     |
| `_cabal`                     |     |
| `_cache_invalid`             |     |
| `_cal`                       |     |
| `_calendar`                  |     |
| `_call_function`             |     |
| `_call_program`              |     |
| `_canonical_paths`           |     |
| `_cat`                       |     |
| `_ccal`                      |     |
| `_cd`                        |     |
| `_cdbs-edit-patch`           |     |
| `_cdcd`                      |     |
| `_cdr`                       |     |
| `_cdrdao`                    |     |
| `_cdrecord`                  |     |
| `_chflags`                   |     |
| `_chkconfig`                 |     |
| `_chmod`                     |     |
| `_chown`                     |     |
| `_chrt`                      |     |
| `_chsh`                      |     |
| `_clay`                      |     |
| `_cmdstring`                 |     |
| `_cmp`                       |     |
| `_combination`               |     |
| `_comm`                      |     |
| `_command`                   |     |
| `_command_names`             |     |
| `_comp_locale`               |     |
| `_compadd`                   |     |
| `_compdef`                   |     |
| `_complete`                  |     |
| `_complete_debug`            |     |
| `_complete_help`             |     |
| `_complete_help_generic`     |     |
| `_complete_tag`              |     |
| `_compress`                  |     |
| `_condition`                 |     |
| `_configure`                 |     |
| `_coreadm`                   |     |
| `_correct`                   |     |
| `_correct_filename`          |     |
| `_correct_word`              |     |
| `_cowsay`                    |     |
| `_cp`                        |     |
| `_cpio`                      |     |
| `_cplay`                     |     |
| `_cryptsetup`                |     |
| `_cssh`                      |     |
| `_csup`                      |     |
| `_ctags_tags`                |     |
| `_curl`                      |     |
| `_cut`                       |     |
| `_cvs`                       |     |
| `_cvsup`                     |     |
| `_cygcheck`                  |     |
| `_cygpath`                   |     |
| `_cygrunsrv`                 |     |
| `_cygserver`                 |     |
| `_cygstart`                  |     |
| `_dak`                       |     |
| `_darcs`                     |     |
| `_date`                      |     |
| `_date_formats`              |     |
| `_dates`                     |     |
| `_dbus`                      |     |
| `_dchroot`                   |     |
| `_dchroot-dsa`               |     |
| `_dcop`                      |     |
| `_dcut`                      |     |
| `_dd`                        |     |
| `_deb_architectures`         |     |
| `_deb_packages`              |     |
| `_debchange`                 |     |
| `_debcheckout`               |     |
| `_debdiff`                   |     |
| `_debfoster`                 |     |
| `_debsign`                   |     |
| `_default`                   |     |
| `_defaults`                  |     |
| `_delimiters`                |     |
| `_describe`                  |     |
| `_description`               |     |
| `_devtodo`                   |     |
| `_df`                        |     |
| `_dhclient`                  |     |
| `_dhcpinfo`                  |     |
| `_dict`                      |     |
| `_dict_words`                |     |
| `_diff`                      |     |
| `_diff_options`              |     |
| `_diffstat`                  |     |
| `_dir_list`                  |     |
| `_directories`               |     |
| `_directory_stack`           |     |
| `_dirs`                      |     |
| `_disable`                   |     |
| `_dispatch`                  |     |
| `_django`                    |     |
| `_dladm`                     |     |
| `_dlocate`                   |     |
| `_dmidecode`                 |     |
| `_dnf`                       |     |
| `_domains`                   |     |
| `_dpatch-edit-patch`         |     |
| `_dpkg`                      |     |
| `_dpkg-buildpackage`         |     |
| `_dpkg-cross`                |     |
| `_dpkg-repack`               |     |
| `_dpkg_source`               |     |
| `_dput`                      |     |
| `_dsh`                       |     |
| `_dtrace`                    |     |
| `_du`                        |     |
| `_dumpadm`                   |     |
| `_dumper`                    |     |
| `_dupload`                   |     |
| `_dvi`                       |     |
| `_dynamic_directory_name`    |     |
| `_ecasound`                  |     |
| `_echotc`                    |     |
| `_echoti`                    |     |
| `_elfdump`                   |     |
| `_elinks`                    |     |
| `_elm`                       |     |
| `_email_addresses`           |     |
| `_emulate`                   |     |
| `_enable`                    |     |
| `_enscript`                  |     |
| `_env`                       |     |
| `_equal`                     |     |
| `_espeak`                    |     |
| `_etags`                     |     |
| `_ethtool`                   |     |
| `_expand`                    |     |
| `_expand_alias`              |     |
| `_expand_word`               |     |
| `_extensions`                |     |
| `_external_pwds`             |     |
| `_fakeroot`                  |     |
| `_fc`                        |     |
| `_feh`                       |     |
| `_fetch`                     |     |
| `_fetchmail`                 |     |
| `_ffmpeg`                    |     |
| `_figlet`                    |     |
| `_file_descriptors`          |     |
| `_file_systems`              |     |
| `_files`                     |     |
| `_find`                      |     |
| `_find_net_interfaces`       |     |
| `_finger`                    |     |
| `_fink`                      |     |
| `_first`                     |     |
| `_flasher`                   |     |
| `_flex`                      |     |
| `_floppy`                    |     |
| `_flowadm`                   |     |
| `_fmadm`                     |     |
| `_fortune`                   |     |
| `_freebsd-update`            |     |
| `_fsh`                       |     |
| `_fstat`                     |     |
| `_functions`                 |     |
| `_fuse_arguments`            |     |
| `_fuse_values`               |     |
| `_fuser`                     |     |
| `_fusermount`                |     |
| `_gcc`                       |     |
| `_gcore`                     |     |
| `_gdb`                       |     |
| `_generic`                   |     |
| `_genisoimage`               |     |
| `_getclip`                   |     |
| `_getconf`                   |     |
| `_getent`                    |     |
| `_getfacl`                   |     |
| `_getmail`                   |     |
| `_git`                       |     |
| `_git-buildpackage`          |     |
| `_global`                    |     |
| `_global_tags`               |     |
| `_globflags`                 |     |
| `_globqual_delims`           |     |
| `_globquals`                 |     |
| `_gnome-gv`                  |     |
| `_gnu_generic`               |     |
| `_gnupod`                    |     |
| `_gnutls`                    |     |
| `_go`                        |     |
| `_gpg`                       |     |
| `_gphoto2`                   |     |
| `_gprof`                     |     |
| `_gqview`                    |     |
| `_gradle`                    |     |
| `_graphicsmagick`            |     |
| `_grep`                      |     |
| `_grep-excuses`              |     |
| `_groff`                     |     |
| `_groups`                    |     |
| `_growisofs`                 |     |
| `_gs`                        |     |
| `_guard`                     |     |
| `_guilt`                     |     |
| `_gv`                        |     |
| `_gzip`                      |     |
| `_hash`                      |     |
| `_have_glob_qual`            |     |
| `_hdiutil`                   |     |
| `_head`                      |     |
| `_hg`                        |     |
| `_history`                   |     |
| `_history_complete_word`     |     |
| `_history_modifiers`         |     |
| `_hosts`                     |     |
| `_hwinfo`                    |     |
| `_iconv`                     |     |
| `_id`                        |     |
| `_ifconfig`                  |     |
| `_iftop`                     |     |
| `_ignored`                   |     |
| `_imagemagick`               |     |
| `_in_vared`                  |     |
| `_inetadm`                   |     |
| `_init_d`                    |     |
| `_initctl`                   |     |
| `_invoke-rc.d`               |     |
| `_ionice`                    |     |
| `_ip`                        |     |
| `_ipadm`                     |     |
| `_ipset`                     |     |
| `_iptables`                  |     |
| `_irssi`                     |     |
| `_ispell`                    |     |
| `_iwconfig`                  |     |
| `_jails`                     |     |
| `_java`                      |     |
| `_java_class`                |     |
| `_jexec`                     |     |
| `_jls`                       |     |
| `_jobs`                      |     |
| `_jobs_bg`                   |     |
| `_jobs_builtin`              |     |
| `_jobs_fg`                   |     |
| `_joe`                       |     |
| `_join`                      |     |
| `_kfmclient`                 |     |
| `_kill`                      |     |
| `_killall`                   |     |
| `_kld`                       |     |
| `_knock`                     |     |
| `_kvno`                      |     |
| `_last`                      |     |
| `_ld_debug`                  |     |
| `_ldd`                       |     |
| `_less`                      |     |
| `_lha`                       |     |
| `_lighttpd`                  |     |
| `_limit`                     |     |
| `_limits`                    |     |
| `_links`                     |     |
| `_lintian`                   |     |
| `_list`                      |     |
| `_list_files`                |     |
| `_lldb`                      |     |
| `_ln`                        |     |
| `_loadkeys`                  |     |
| `_locales`                   |     |
| `_locate`                    |     |
| `_logical_volumes`           |     |
| `_look`                      |     |
| `_losetup`                   |     |
| `_lp`                        |     |
| `_ls`                        |     |
| `_lscfg`                     |     |
| `_lsdev`                     |     |
| `_lslv`                      |     |
| `_lsof`                      |     |
| `_lspv`                      |     |
| `_lsusb`                     |     |
| `_lsvg`                      |     |
| `_lynx`                      |     |
| `_lzop`                      |     |
| `_mac_applications`          |     |
| `_mac_files_for_application` |     |
| `_madison`                   |     |
| `_mail`                      |     |
| `_mailboxes`                 |     |
| `_main_complete`             |     |
| `_make`                      |     |
| `_make-kpkg`                 |     |
| `_man`                       |     |
| `_match`                     |     |
| `_math`                      |     |
| `_math_params`               |     |
| `_matlab`                    |     |
| `_md5sum`                    |     |
| `_mdadm`                     |     |
| `_members`                   |     |
| `_mencal`                    |     |
| `_menu`                      |     |
| `_mere`                      |     |
| `_mergechanges`              |     |
| `_message`                   |     |
| `_metaflac`                  |     |
| `_mh`                        |     |
| `_mii-tool`                  |     |
| `_mime_types`                |     |
| `_mixerctl`                  |     |
| `_mkdir`                     |     |
| `_mkshortcut`                |     |
| `_mkzsh`                     |     |
| `_module`                    |     |
| `_module-assistant`          |     |
| `_module_math_func`          |     |
| `_modutils`                  |     |
| `_mondo`                     |     |
| `_monotone`                  |     |
| `_moosic`                    |     |
| `_mosh`                      |     |
| `_most_recent_file`          |     |
| `_mount`                     |     |
| `_mozilla`                   |     |
| `_mpc`                       |     |
| `_mplayer`                   |     |
| `_mt`                        |     |
| `_mtools`                    |     |
| `_mtr`                       |     |
| `_multi_parts`               |     |
| `_mutt`                      |     |
| `_my_accounts`               |     |
| `_mysql_utils`               |     |
| `_mysqldiff`                 |     |
| `_nautilus`                  |     |
| `_ncftp`                     |     |
| `_nedit`                     |     |
| `_net_interfaces`            |     |
| `_netcat`                    |     |
| `_netscape`                  |     |
| `_netstat`                   |     |
| `_newsgroups`                |     |
| `_next_label`                |     |
| `_next_tags`                 |     |
| `_nice`                      |     |
| `_nkf`                       |     |
| `_nl`                        |     |
| `_nm`                        |     |
| `_nmap`                      |     |
| `_nmcli`                     |     |
| `_normal`                    |     |
| `_nothing`                   |     |
| `_notmuch`                   |     |
| `_npm`                       |     |
| `_nslookup`                  |     |
| `_objdump`                   |     |
| `_object_classes`            |     |
| `_od`                        |     |
| `_okular`                    |     |
| `_oldlist`                   |     |
| `_open`                      |     |
| `_options`                   |     |
| `_options_set`               |     |
| `_options_unset`             |     |
| `_osc`                       |     |
| `_other_accounts`            |     |
| `_pack`                      |     |
| `_parameter`                 |     |
| `_parameters`                |     |
| `_patch`                     |     |
| `_patchutils`                |     |
| `_path_commands`             |     |
| `_path_files`                |     |
| `_pax`                       |     |
| `_pbm`                       |     |
| `_pbuilder`                  |     |
| `_pdf`                       |     |
| `_pdftk`                     |     |
| `_perforce`                  |     |
| `_perl`                      |     |
| `_perl_basepods`             |     |
| `_perl_modules`              |     |
| `_perldoc`                   |     |
| `_pfctl`                     |     |
| `_pfexec`                    |     |
| `_pgrep`                     |     |
| `_php`                       |     |
| `_physical_volumes`          |     |
| `_pick_variant`              |     |
| `_pids`                      |     |
| `_pine`                      |     |
| `_ping`                      |     |
| `_piuparts`                  |     |
| `_pkg-config`                |     |
| `_pkg5`                      |     |
| `_pkg_instance`              |     |
| `_pkgadd`                    |     |
| `_pkginfo`                   |     |
| `_pkgrm`                     |     |
| `_pkgtool`                   |     |
| `_pon`                       |     |
| `_portaudit`                 |     |
| `_portlint`                  |     |
| `_portmaster`                |     |
| `_ports`                     |     |
| `_portsnap`                  |     |
| `_postfix`                   |     |
| `_postscript`                |     |
| `_powerd`                    |     |
| `_prcs`                      |     |
| `_precommand`                |     |
| `_prefix`                    |     |
| `_print`                     |     |
| `_printenv`                  |     |
| `_printers`                  |     |
| `_procstat`                  |     |
| `_prompt`                    |     |
| `_prove`                     |     |
| `_prstat`                    |     |
| `_ps`                        |     |
| `_ps1234`                    |     |
| `_pscp`                      |     |
| `_pspdf`                     |     |
| `_psutils`                   |     |
| `_ptree`                     |     |
| `_pump`                      |     |
| `_putclip`                   |     |
| `_pydoc`                     |     |
| `_python`                    |     |
| `_python_modules`            |     |
| `_qdbus`                     |     |
| `_qemu`                      |     |
| `_qiv`                       |     |
| `_qtplay`                    |     |
| `_quilt`                     |     |
| `_raggle`                    |     |
| `_rake`                      |     |
| `_ranlib`                    |     |
| `_rar`                       |     |
| `_rcs`                       |     |
| `_rdesktop`                  |     |
| `_read`                      |     |
| `_read_comp`                 |     |
| `_readelf`                   |     |
| `_readshortcut`              |     |
| `_rebootin`                  |     |
| `_redirect`                  |     |
| `_regex_arguments`           |     |
| `_regex_words`               |     |
| `_remote_files`              |     |
| `_renice`                    |     |
| `_reprepro`                  |     |
| `_requested`                 |     |
| `_retrieve_cache`            |     |
| `_retrieve_mac_apps`         |     |
| `_ri`                        |     |
| `_rlogin`                    |     |
| `_rm`                        |     |
| `_rpm`                       |     |
| `_rpmbuild`                  |     |
| `_rrdtool`                   |     |
| `_rsync`                     |     |
| `_rubber`                    |     |
| `_ruby`                      |     |
| `_run-help`                  |     |
| `_runit`                     |     |
| `_sablotron`                 |     |
| `_samba`                     |     |
| `_savecore`                  |     |
| `_sccs`                      |     |
| `_sched`                     |     |
| `_schedtool`                 |     |
| `_schroot`                   |     |
| `_scl`                       |     |
| `_screen`                    |     |
| `_sed`                       |     |
| `_sep_parts`                 |     |
| `_sequence`                  |     |
| `_service`                   |     |
| `_services`                  |     |
| `_set`                       |     |
| `_set_command`               |     |
| `_setfacl`                   |     |
| `_setopt`                    |     |
| `_setup`                     |     |
| `_setxkbmap`                 |     |
| `_sh`                        |     |
| `_showmount`                 |     |
| `_signals`                   |     |
| `_sisu`                      |     |
| `_slrn`                      |     |
| `_smit`                      |     |
| `_snoop`                     |     |
| `_socket`                    |     |
| `_sockstat`                  |     |
| `_softwareupdate`            |     |
| `_sort`                      |     |
| `_source`                    |     |
| `_spamassassin`              |     |
| `_sqlite`                    |     |
| `_sqsh`                      |     |
| `_ss`                        |     |
| `_ssh`                       |     |
| `_sshfs`                     |     |
| `_stat`                      |     |
| `_stgit`                     |     |
| `_store_cache`               |     |
| `_strace`                    |     |
| `_strftime`                  |     |
| `_strip`                     |     |
| `_stty`                      |     |
| `_su`                        |     |
| `_sub_commands`              |     |
| `_subscript`                 |     |
| `_subversion`                |     |
| `_sudo`                      |     |
| `_suffix_alias_files`        |     |
| `_surfraw`                   |     |
| `_svcadm`                    |     |
| `_svccfg`                    |     |
| `_svcprop`                   |     |
| `_svcs`                      |     |
| `_svcs_fmri`                 |     |
| `_svn-buildpackage`          |     |
| `_sysctl`                    |     |
| `_sysstat`                   |     |
| `_systat`                    |     |
| `_system_profiler`           |     |
| `_tags`                      |     |
| `_tail`                      |     |
| `_tar`                       |     |
| `_tar_archive`               |     |
| `_tardy`                     |     |
| `_tcpdump`                   |     |
| `_tcpsys`                    |     |
| `_tcptraceroute`             |     |
| `_telnet`                    |     |
| `_terminals`                 |     |
| `_tex`                       |     |
| `_texi`                      |     |
| `_texinfo`                   |     |
| `_tidy`                      |     |
| `_tiff`                      |     |
| `_tilde`                     |     |
| `_tilde_files`               |     |
| `_time_zone`                 |     |
| `_tin`                       |     |
| `_tla`                       |     |
| `_tmux`                      |     |
| `_todo.sh`                   |     |
| `_toilet`                    |     |
| `_toolchain-source`          |     |
| `_topgit`                    |     |
| `_totd`                      |     |
| `_tpb`                       |     |
| `_tpconfig`                  |     |
| `_tr`                        |     |
| `_tracepath`                 |     |
| `_trap`                      |     |
| `_tree`                      |     |
| `_ttyctl`                    |     |
| `_ttys`                      |     |
| `_tune2fs`                   |     |
| `_twidge`                    |     |
| `_twisted`                   |     |
| `_typeset`                   |     |
| `_ulimit`                    |     |
| `_uml`                       |     |
| `_unace`                     |     |
| `_uname`                     |     |
| `_unexpand`                  |     |
| `_unhash`                    |     |
| `_uniq`                      |     |
| `_unison`                    |     |
| `_units`                     |     |
| `_update-alternatives`       |     |
| `_update-rc.d`               |     |
| `_urls`                      |     |
| `_urpmi`                     |     |
| `_urxvt`                     |     |
| `_uscan`                     |     |
| `_user_admin`                |     |
| `_user_at_host`              |     |
| `_user_expand`               |     |
| `_user_math_func`            |     |
| `_users`                     |     |
| `_users_on`                  |     |
| `_uzbl`                      |     |
| `_valgrind`                  |     |
| `_value`                     |     |
| `_values`                    |     |
| `_vared`                     |     |
| `_vars`                      |     |
| `_vcsh`                      |     |
| `_vim`                       |     |
| `_vim-addons`                |     |
| `_vmstat`                    |     |
| `_vnc`                       |     |
| `_volume_groups`             |     |
| `_vorbis`                    |     |
| `_vorbiscomment`             |     |
| `_vserver`                   |     |
| `_vux`                       |     |
| `_w3m`                       |     |
| `_wait`                      |     |
| `_wajig`                     |     |
| `_wakeup_capable_devices`    |     |
| `_wanna-build`               |     |
| `_wanted`                    |     |
| `_watch`                     |     |
| `_watch-snoop`               |     |
| `_wc`                        |     |
| `_webbrowser`                |     |
| `_wget`                      |     |
| `_whereis`                   |     |
| `_which`                     |     |
| `_whois`                     |     |
| `_wiggle`                    |     |
| `_wpa_cli`                   |     |
| `_x_arguments`               |     |
| `_x_borderwidth`             |     |
| `_x_color`                   |     |
| `_x_colormapid`              |     |
| `_x_cursor`                  |     |
| `_x_display`                 |     |
| `_x_extension`               |     |
| `_x_font`                    |     |
| `_x_geometry`                |     |
| `_x_keysym`                  |     |
| `_x_locale`                  |     |
| `_x_modifier`                |     |
| `_x_name`                    |     |
| `_x_resource`                |     |
| `_x_selection_timeout`       |     |
| `_x_title`                   |     |
| `_x_utils`                   |     |
| `_x_visual`                  |     |
| `_x_window`                  |     |
| `_xargs`                     |     |
| `_xauth`                     |     |
| `_xautolock`                 |     |
| `_xclip`                     |     |
| `_xdvi`                      |     |
| `_xfig`                      |     |
| `_xft_fonts`                 |     |
| `_xloadimage`                |     |
| `_xmlsoft`                   |     |
| `_xmms2`                     |     |
| `_xmodmap`                   |     |
| `_xournal`                   |     |
| `_xpdf`                      |     |
| `_xrandr`                    |     |
| `_xscreensaver`              |     |
| `_xset`                      |     |
| `_xt_arguments`              |     |
| `_xt_session_id`             |     |
| `_xterm`                     |     |
| `_xv`                        |     |
| `_xwit`                      |     |
| `_xxd`                       |     |
| `_xz`                        |     |
| `_yafc`                      |     |
| `_yast`                      |     |
| `_yodl`                      |     |
| `_yp`                        |     |
| `_yum`                       |     |
| `_zargs`                     |     |
| `_zattr`                     |     |
| `_zcalc`                     |     |
| `_zcalc_line`                |     |
| `_zcat`                      |     |
| `_zcompile`                  |     |
| `_zdump`                     |     |
| `_zed`                       |     |
| `_zfs`                       |     |
| `_zfs_dataset`               |     |
| `_zfs_keysource_props`       |     |
| `_zfs_pool`                  |     |
| `_zftp`                      |     |
| `_zip`                       |     |
| `_zle`                       |     |
| `_zlogin`                    |     |
| `_zmodload`                  |     |
| `_zmv`                       |     |
| `_zoneadm`                   |     |
| `_zones`                     |     |
| `_zpool`                     |     |
| `_zpty`                      |     |
| `_zsh`                       |     |
| `_zsh-mime-handler`          |     |
| `_zsocket`                   |     |
| `_zstyle`                    |     |
| `_ztodo`                     |     |
| `_zypper`                    |     |

## Functions from ZSH version 5.2

These are the default functions that come with ZSH version 5.2

| Function File                   | Description |
| ------------------------------- | ----------- |
| `VCS_INFO_*`                    | Version control information system for prompts.
| `add-zsh-hook`                  | The shell function add-zsh-hook provides a simple way of adding or removing functions from the array.
| `after`                         |
| `age`                           |
| `allopt`                        |
| `backward-kill-word-match`      |
| `backward-word-match`           |
| `bashcompinit`                  |
| `before`                        |
| `bracketed-paste-magic`         |
| `bracketed-paste-url-magic`     |
| `calendar`                      |
| `calendar_add`                  |
| `calendar_edit`                 |
| `calendar_lockfiles`            |
| `calendar_parse`                |
| `calendar_read`                 |
| `calendar_scandate`             |
| `calendar_show`                 |
| `calendar_showdate`             |
| `calendar_sort`                 |
| `capitalize-word-match`         |
| `catch`                         |
| `cdr`                           |
| `checkmail`                     |
| `chpwd_recent_add`              |
| `chpwd_recent_dirs`             |
| `chpwd_recent_filehandler`      |
| `colors`                        |
| `compaudit`                     |
| `compdump`                      |
| `compinit`                      |
| `compinstall`                   |
| `copy-earlier-word`             |
| `cycle-completion-positions`    |
| `define-composed-chars`         |
| `delete-whole-word-match`       |
| `down-case-word-match`          |
| `down-line-or-beginning-search` |
| `edit-command-line`             |
| `expand-absolute-path`          |
| `forward-word-match`            |
| `getjobs`                       |
| `harden`                        |
| `history-beginning-search-menu` |
| `history-pattern-search`        |
| `history-search-end`            |
| `incarg`                        |
| `incremental-complete-word`     |
| `insert-composed-char`          |
| `insert-files`                  |
| `insert-unicode-char`           |
| `is-at-least`                   |
| `keeper`                        |
| `keymap+widget`                 |
| `kill-word-match`               |
| `match-word-context`            |
| `match-words-by-style`          |
| `mere`                          |
| `modify-current-argument`       |
| `move-line-in-buffer`           |
| `narrow-to-region`              |
| `narrow-to-region-invisible`    |
| `nslookup`                      |
| `pick-web-browser`              |
| `predict-on`                    |
| `prompt_*`                      |
| `promptinit`                    |
| `promptnl`                      |
| `quote-and-complete-word`       |
| `read-from-minibuffer`          |
| `regexp-replace`                |
| `relative`                      |
| `replace-argument`              |
| `replace-string`                |
| `replace-string-again`          |
| `run-help*`                     |
| `select-bracketed`              |
| `select-quoted`                 |
| `select-word-style`             |
| `send-invisible`                |
| `smart-insert-last-word`        |
| `split-shell-arguments`         |
| `sticky-note`                   |
| `surround`                      |
| `tcp_*`                         |
| `tetris`                        |
| `tetriscurses`                  |
| `throw`                         |
| `transpose-lines`               |
| `transpose-words-match`         |
| `up-case-word-match`            |
| `up-line-or-beginning-search`   |
| `url-quote-magic`               |
| `vcs_info*`                     |
| `which-command`                 |
| `xtermctl`                      |
| `zargs`                         |
| `zcalc`                         |
| `zcalc-auto-insert`             |
| `zed`                           |
| `zed-set-file-name`             |
| `zfanon`                        |
| `zfautocheck`                   |
| `zfcd`                          |
| `zfcd_match`                    |
| `zfcget`                        |
| `zfclose`                       |
| `zfcput`                        |
| `zfdir`                         |
| `zffcache`                      |
| `zfgcp`                         |
| `zfget`                         |
| `zfget_match`                   |
| `zfgoto`                        |
| `zfhere`                        |
| `zfinit`                        |
| `zfls`                          |
| `zfmark`                        |
| `zfopen`                        |
| `zfparams`                      |
| `zfpcp`                         |
| `zfput`                         |
| `zfrglob`                       |
| `zfrtime`                       |
| `zfsession`                     |
| `zfstat`                        |
| `zftp_chpwd`                    |
| `zftp_progress`                 |
| `zftransfer`                    |
| `zftype`                        |
| `zfuget`                        |
| `zfuput`                        |
| `zkbd`                          |
| `zmathfuncdef`                  |
| `zmv`                           | Multiple move based on zsh pattern matching.
| `zrecompile`                    | Find wordcode files and automatically re-compile them.
| `zsh-mime-contexts`             |
| `zsh-mime-handler`              |
| `zsh-mime-setup`                |
| `zsh-newuser-install`           |
| `zsh_directory_name_cdr`        |
| `zsh_directory_name_generic`    |
| `zstyle+`                       | This makes defining styles a bit simpler.
| `ztodo`                         | Directory-based todos cached in ~/.ztodolist

### Example blacklist

```sh
#
# Set the fpath files to blacklist.
#

zstyle ':delorean:circuit:fpath' blacklist \
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
  'zed' \
  'ztodo'
```


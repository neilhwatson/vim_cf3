" vim:foldmethod=marker

" Vim syntax file
" Language:     Cfengine version 3
" Maintainer:   Neil Watson <neil@watson-wilson.ca>
" Last Change:  Jun 02 2018
" Location:
"
" TODO:
"	- would be great to know current promise type
"
" This is my first attempt at a syntax file.  Feel free to send me corrections
" or improvements.  I'll give you a credit.
"
" USAGE
" There is already a vim file that uses 'cf' as a file extension.  You can use
" cf3 for your cf3 file extensions or identify via your vimrc file:
" au BufRead,BufNewFile *.cf set ft=cf3
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded

if version < 600 " {{{
    syntax clear
elseif exists ("b:current_syntax")
    finish
endif

syn case ignore

syn match	cf3BundleParams /(\w\+\(,\s*\w\+\)*)/hs=s+1,he=e-1 contained
syn match   cf3BundleName /\s\+\w\+\s*/ contained nextgroup=cf3BundleParams

syn keyword cf3BundleTypes agent common server knowledge monitor edit_line contained nextgroup=cf3BundleName skipwhite
syn keyword cf3BundleTypes edit_xml contained nextgroup=cf3BundleName skipwhite
syn match   cf3Bundle /^\s*bundle\s\+/ nextgroup=Cf3BundleTypes skipwhite

syn keyword cf3BodyTypes action classes contain acl changes contained nextgroup=cf3BundleName skipwhite
syn keyword cf3BodyTypes copy_from delete depth_search contained nextgroup=cf3BundleName skipwhite
syn keyword cf3BodyTypes edit_defaults file_select password contained nextgroup=cf3BundleName skipwhite
syn keyword cf3BodyTypes link_from perms rename tcp_ip contained nextgroup=cf3BundleName skipwhite
syn keyword cf3BodyTypes package_method process_count package_module contained nextgroup=cf3BundleName skipwhite
syn keyword cf3BodyTypes process_select service_method contained nextgroup=cf3BundleName skipwhite
syn keyword cf3BodyTypes mount volume printfile match_value contained nextgroup=cf3BundleName skipwhite
syn keyword cf3BodyTypes association select_region delete_select contained nextgroup=cf3BundleName skipwhite
syn keyword cf3BodyTypes insert_select location edit_field replace_with contained nextgroup=cf3BundleName skipwhite
syn keyword cf3BodyTypes common database_server environment_resources contained nextgroup=cf3BundleName skipwhite
syn match   cf3Body /^\s*body\s\+/ nextgroup=Cf3BodyTypes skipwhite

syn match   cf3BodyControl /^\s*body\s\+\(common\|agent\|server\)\s\+control/
syn match   cf3BodyControl /^\s*body\s\+\(monitor\|runagent\)\s\+control/
syn match   cf3BodyControl /^\s*body\s\+\(executor\|knowledge\|hub\)\s\+control/
syn match   cf3BodyControl /^\s*body\s\+\(reporter\|file\)\s\+control/

syn match cf3Action /\<\(vars\|classes\|reports\|meta\|users\):/
syn match cf3Action /\<\(commands\|databases\|files\|interfaces\|methods\|packages\|storage\):/
syn match cf3Action /\<\(access\|measurements\|roles\|topics\|occurrences\|defaults\):/
syn match cf3Action /\<\(control\|guest_environments\|outputs\|processes\|services\|things\):/
syn match cf3Action /\<\(delete_lines\|field_edits\|insert_lines\|replace_patterns\):/

syn match   cf3Class        /[^ "\t:#]\+::/
syn region  cf3ClassBlock   start=/\[%CFEngine/ end=/%\]/ contains=Cf3Class

syn keyword TODO todo TODO FIXME TBD NOTE contained
syn match   cf3Comment      /#.*/ contains=TODO

syn match   cf3Identifier   /=>/

" Escape sequences in regexes
syn match   cf3Esc          /\\\\[sSdD+][\+\*]*/ contained
" Array indexes contained in [].  Does not seems to be working.
syn region  cf3Array        start=/\(\\\)\@<!\[/ end=/\]/ contained contains=cf3Var
" Variables wrapped in {} or ()
syn region  cf3Var          start=/[$@][{(]/ end=/[})]/ contains=cf3Var,cf3Array
syn region  cf3String       start=/\z\("\|'\)/ skip=/\(\\\)\@<!\(\\\\\)*\\\z1/ end=/\z1/ contains=cf3Var,cf3Esc,cf3Array

syn keyword cf3Type			string int real slist ilist rlist data

" The following list may be automatically generated using
" tools/extract_cf3BuiltIns.sh

" Last update: 2018/06/02 - git tag 0d9d2ce30b91cb0a3d09d2b8b517b39e876dc7f3

syn keyword cf3BuiltIns	access accessedbefore accumulated active_directory additional-resources contained
syn keyword cf3BuiltIns	adjusting-schedules adopting-cfengine agility ago alerts-custom-actions alerts-notifications contained
syn keyword cf3BuiltIns	all-types and application-management architecture-design augments authoring-policy-tools-and-workflow contained
syn keyword cf3BuiltIns	backup-and-restore basic-file-directory best-practices bodies browsing-host-information build-deploy-manage-audit contained
syn keyword cf3BuiltIns	bundles bundles-best-practices bundlesmatching bundlestate callstack_callers callstack_promisers contained
syn keyword cf3BuiltIns	canonify canonifyuniquely cf-agent cfe_internal cfe_internal-CFE_cfengine cfe_internal-core contained
syn keyword cf3BuiltIns	cfe_internal-enterprise cfe_internal-update cfe_internal-update-cfe_internal_dc_workflow cfe_internal-update-cfe_internal_local_git_remote cfe_internal-update-cfe_internal_update_from_repository cfe_internal-update-lib contained
syn keyword cf3BuiltIns	cfe_internal-update-systemd_units cfe_internal-update-update_bins cfe_internal-update-update_policy cfe_internal-update-update_processes cfengine-administration cf-execd contained
syn keyword cf3BuiltIns	cf-hub cf-key cf-monitord cf-net cf-promises cf-runagent contained
syn keyword cf3BuiltIns	cf-serverd changedbefore changelog-core changelog-enterprise changelog-masterfiles-policy-framework change-management contained
syn keyword cf3BuiltIns	changes changes-api-usage cheatsheet checking-status classes classes contained
syn keyword cf3BuiltIns	classesmatching classify classmatch cloud-computing command-line-reports commands contained
syn keyword cf3BuiltIns	commands-scripts-execution common-attributes-include common-body-attributes-include common_next_steps components concat contained
syn keyword cf3BuiltIns	connection const content-driven-policy controlling-frequency controls controls-cf_agent contained
syn keyword cf3BuiltIns	controls-cf_execd controls-cf-hub controls-cf_monitord controls-cf_runagent controls-cf_serverd controls-def contained
syn keyword cf3BuiltIns	controls-def_inputs controls-reports controls-update_def controls-update_def_inputs countclassesmatching countlinesmatching contained
syn keyword cf3BuiltIns	custom-https-certificate custom_inventory custom-ldap-port custom-ldaps-certificate database databases contained
syn keyword cf3BuiltIns	data_expand data_readstringarray data_readstringarrayidx data_regextract datastate data_sysctlvalues contained
syn keyword cf3BuiltIns	debugging-mission-portal def defaults delete_lines devops difference contained
syn keyword cf3BuiltIns	directory-structure dirname diskfree distributed-scheduling distribute-files-from-a-central-location edit contained
syn keyword cf3BuiltIns	edit_line edit_xml enable-plain-http enterprise enterprise-api enterprise-api-examples contained
syn keyword cf3BuiltIns	enterprise-api-ref enterprise-cfengine-guide enterprise-license enterprise-report-collection enterprise-report-filtering escape contained
syn keyword cf3BuiltIns	eval every example_aborting_execution example_change_detection example_copy_single_files example_create_filedir contained
syn keyword cf3BuiltIns	example_diskfree example_edit_motd example_edit_name_resolution example_enable_service example_find_mac_addr example_install_package contained
syn keyword cf3BuiltIns	example_mount_nfs example_ntp example_process_kill example_process_restart examples example-snippets contained
syn keyword cf3BuiltIns	example_ssh_keys example_sudoers example_updating_from_central_hub execresult expandrange external_data contained
syn keyword cf3BuiltIns	faq fhs field_edits file_comparison file-content file_control_promises contained
syn keyword cf3BuiltIns	fileexists file_hash file_permissions files filesexist filesize contained
syn keyword cf3BuiltIns	filestat files-tutorial file-template filter findfiles findprocesses contained
syn keyword cf3BuiltIns	find-public-key-for-host-sha fix-trust-after-ip-change fix-undefined-body-error format functions general contained
syn keyword cf3BuiltIns	general-installation getclassmetatags getenv getfields getgid getindices contained
syn keyword cf3BuiltIns	getuid getuserinfo getusers getvalues getvariablemetatags glossary contained
syn keyword cf3BuiltIns	glossary grep groupexists guest_environments guide hash contained
syn keyword cf3BuiltIns	hashmatch hash_to_int hierarchies high-availability host host2ip contained
syn keyword cf3BuiltIns	hostinnetgroup hostrange hosts-health hostsseen hostswithclass hub_administration contained
syn keyword cf3BuiltIns	hubknowledge ifelse include-install-bootstrap-configure-summary index insert_lines installation-and-configuration contained
syn keyword cf3BuiltIns	installation-community installation-enterprise installation-enterprise-free installation-enterprise-free-aws-rhel installation-enterprise-generic-tarball installation-enterprise-vagrant contained
syn keyword cf3BuiltIns	installation-guide install-get-started intersection introduction inventory inventory contained
syn keyword cf3BuiltIns	inventory-any inventory-debian inventory-freebsd inventory-generic inventory-linux inventory-lsb contained
syn keyword cf3BuiltIns	inventory-macos inventory-os inventory-redhat inventory-suse inventory-windows ip2host contained
syn keyword cf3BuiltIns	iprange irange isdir isexecutable isgreaterthan isipinsubnet contained
syn keyword cf3BuiltIns	islessthan islink isnewerthan isplain isvariable iteration contained
syn keyword cf3BuiltIns	itil join json-yaml-support-in-cfengine known-issues language-concepts lastnode contained
syn keyword cf3BuiltIns	laterthan latest-release ldap-api ldaparray ldaplist ldapvalue contained
syn keyword cf3BuiltIns	learn legal length lib lib-autorun lib-bundles contained
syn keyword cf3BuiltIns	lib-cfe_internal lib-cfe_internal_hub lib-cfengine_enterprise_hub_ha lib-commands lib-common lib-databases contained
syn keyword cf3BuiltIns	lib-edit_xml lib-event lib-examples lib-feature lib-files lib-guest_environments contained
syn keyword cf3BuiltIns	lib-monitor lib-packages lib-paths lib-processes lib-reports lib-services contained
syn keyword cf3BuiltIns	lib-stdlib lib-storage lib-testing lib-users lib-vcs line_editing contained
syn keyword cf3BuiltIns	lookup-license-info loops lsdir macros makerule managing-settings contained
syn keyword cf3BuiltIns	managing-users-and-roles manual-execution maparray mapdata maplist masterfiles-policy-framework contained
syn keyword cf3BuiltIns	masterfiles_policy_framework_upgrade match max mean measurements mergedata contained
syn keyword cf3BuiltIns	meta methods min modularity mon monitoring contained
syn keyword cf3BuiltIns	monitoring-reporting mustache-templating namespaces network network_connections networking contained
syn keyword cf3BuiltIns	nfs_and_containers none normal-ordering not now nth contained
syn keyword cf3BuiltIns	on open-nebula or orchestration output-email package_bundles contained
syn keyword cf3BuiltIns	package_modules packages packages-deprecated packagesmatching packageupdatesmatching parseintarray contained
syn keyword cf3BuiltIns	parsejson parserealarray parsestringarray parsestringarrayidx parseyaml pattern-matching-and-referencing contained
syn keyword cf3BuiltIns	peerleader peerleaders peers policy-deployment policy-framework policy-layers-abstraction contained
syn keyword cf3BuiltIns	policy-style pre-installation-checklist processes processexists product promise-patterns contained
syn keyword cf3BuiltIns	promises promises promises-available-in-cfengine promise-types putty-quick-start-guide query contained
syn keyword cf3BuiltIns	randomint readcsv readdata readenvfile readfile readintarray contained
syn keyword cf3BuiltIns	readintlist readjson readrealarray readreallist readstringarray readstringarrayidx contained
syn keyword cf3BuiltIns	readstringlist readtcp readyaml reference regarray regcmp contained
syn keyword cf3BuiltIns	regenerate-self-signed-cert regex_replace regextract registryvalue regldap regline contained
syn keyword cf3BuiltIns	reglist reinstall remoteclassesmatching remotescalar replace_patterns reporting contained
syn keyword cf3BuiltIns	reporting reporting-architecture reporting_ui report_inventory_remediate_sec_vulnerabilities reports reset-admin-creds contained
syn keyword cf3BuiltIns	returnszero reverse roles rrange search secure-bootstrap contained
syn keyword cf3BuiltIns	security-overview selectservers services services services-autorun services-main contained
syn keyword cf3BuiltIns	settings show-classes-and-vars shuffle software-adminstration some sort contained
syn keyword cf3BuiltIns	special-topics special-variables splayclass splitstring sql-queries sql-queries-enterprise-api contained
syn keyword cf3BuiltIns	sql-schema status-settings stigs storage storejson strcmp contained
syn keyword cf3BuiltIns	strftime string_downcase string_head string_length string_mustache string_reverse contained
syn keyword cf3BuiltIns	string_split string_tail string_upcase sublist sum supported-platforms contained
syn keyword cf3BuiltIns	sys sysctlvalue system-administration system-file system-information system-security contained
syn keyword cf3BuiltIns	tags teamwork testing-policies this timing-counting-measuring translatepath contained
syn keyword cf3BuiltIns	tutorials unable-to-log-in-mission-portal uninstall-reinstall unique update upgrading contained
syn keyword cf3BuiltIns	url_get usemodule userexists user-interface user-management users contained
syn keyword cf3BuiltIns	users users-rbac variables variables variablesmatching variablesmatching_as_data contained
syn keyword cf3BuiltIns	variance vars version-control vi-quick-start-guide what-did-cfengine-change what-is-promise-locking contained
syn keyword cf3BuiltIns	whatsnew why-are-files-not-being-distributed why-are-remote-agents-not-updating windows-registry contained

" The following list may be automatically generated using
" tools/extract_cf3evolve_freelib.sh

" Last update: 2018/06/02 - git tag d9d8bc814a70b64f5fb0fca0104f9802c4a7d88b

syn keyword cf3Evolve_freelib	 by_command by_command contain_efl_command contain_efl_command efl_command contained
syn keyword cf3Evolve_freelib	efl_command efl_copy_files efl_copy_files efl_cpf efl_cpf efl_delete_files contained
syn keyword cf3Evolve_freelib	efl_delete_files efl_delta_reporting efl_delta_reporting efl_disable_service efl_disable_service efl_dump_strings contained
syn keyword cf3Evolve_freelib	efl_dump_strings efl_edit_template efl_edit_template efl_empty efl_empty efl_enable_service contained
syn keyword cf3Evolve_freelib	efl_enable_service efl_file_perms efl_file_perms efl_kill_process efl_kill_process efl_kill_process contained
syn keyword cf3Evolve_freelib	efl_kill_process efl_lastseen efl_lastseen efl_link efl_link efl_mon_cfengine contained
syn keyword cf3Evolve_freelib	efl_mon_cfengine efl_notseen efl_notseen efl_packages efl_packages efl_packages_new contained
syn keyword cf3Evolve_freelib	efl_packages_new efl_packages_via_cmd efl_packages_via_cmd efl_process_count efl_process_count efl_rcs_pull contained
syn keyword cf3Evolve_freelib	efl_rcs_pull efl_recurse_and_exclude efl_recurse_and_exclude efl_rkn efl_rkn efl_server_csv contained
syn keyword cf3Evolve_freelib	efl_server_csv efl_server_json efl_server_json efl_service efl_service efl_service_recurse contained
syn keyword cf3Evolve_freelib	efl_service_recurse efl_source_type efl_source_type efl_start_service efl_start_service efl_sysctl_conf_file contained
syn keyword cf3Evolve_freelib	efl_sysctl_conf_file efl_sysctl_live efl_sysctl_live efl_test_classes efl_test_classes efl_test_count contained
syn keyword cf3Evolve_freelib	efl_test_count efl_test_vars efl_test_vars el_efl_sysctl_conf_file el_efl_sysctl_conf_file name_age_negate contained
syn keyword cf3Evolve_freelib	name_age_negate negate_by_name negate_by_name contained

" The following list may be automatically generated using
" tools/extract_cf3Stdlib.sh

" Last update: 2018/06/02 - git tag 9ff3f394a2b0435549ce17e595edb295a92e53b7

syn keyword cf3Stdlib	 INI_section access_generic after all all_changes contained
syn keyword cf3Stdlib	alpinelinux always any_count append_groups_starting append_if_no_line append_if_no_lines contained
syn keyword cf3Stdlib	append_to_line_end append_user_field append_users_starting apt apt_get apt_get contained
syn keyword cf3Stdlib	apt_get_permissive apt_get_release autorun backup_local_cp backup_timestamp before contained
syn keyword cf3Stdlib	bg bigger_than bootstart brew bundles_common by_name contained
syn keyword cf3Stdlib	by_owner by_pid cat cf2_if_else cfe_internal_cleanup_agent_reports cfe_internal_common contained
syn keyword cf3Stdlib	cfe_internal_database_cleanup_consumer_status cfe_internal_database_cleanup_diagnostics cfe_internal_database_cleanup_promise_log cfe_internal_database_cleanup_reports cfe_internal_database_partitioning cfe_internal_hub_common contained
syn keyword cf3Stdlib	cfe_internal_hub_maintain cfe_internal_postgresql_maintenance cfe_internal_postgresql_vacuum cfengine_enterprise_hub_ha check_range classes_generic contained
syn keyword cf3Stdlib	classic_services cmd_repair cmerge col collect_vars comment contained
syn keyword cf3Stdlib	comment_lines_containing comment_lines_matching common_knowledge contains_literal_string control converge contained
syn keyword cf3Stdlib	copyfrom_sync create_solaris_admin_file cronjob daemonize darwin_knowledge days_old contained
syn keyword cf3Stdlib	days_older_than debian_knowledge delete_lines_matching detect_all_change detect_all_change_using detect_content contained
syn keyword cf3Stdlib	detect_content_using diff diff_noupdate diff_results dir_sync dirs contained
syn keyword cf3Stdlib	disable dpkg_version emerge empty enumerate event_cancel_events contained
syn keyword cf3Stdlib	event_debug_handler event_handle event_install_handler event_register event_usage_example ex_list contained
syn keyword cf3Stdlib	exclude exclude_procs expand_template feature feature_cancel feature_test contained
syn keyword cf3Stdlib	file_copy file_empty file_hardlink file_link file_make file_make_mog contained
syn keyword cf3Stdlib	file_make_mustache file_make_mustache_with_perms file_mustache file_mustache_jsonstring file_tidy fileinfo contained
syn keyword cf3Stdlib	files_common filetype_older_than filetypes_older_than force_deps freebsd freebsd_portmaster contained
syn keyword cf3Stdlib	freebsd_ports fstab_option_editor fstab_options generic git git_add contained
syn keyword cf3Stdlib	git_checkout git_checkout_new_branch git_clean git_commit git_init git_stash contained
syn keyword cf3Stdlib	git_stash_and_clean hashed_password head head_n if_elapsed if_elapsed_day contained
syn keyword cf3Stdlib	if_else if_notkept if_ok if_ok_cancel if_repaired ifwin_bg contained
syn keyword cf3Stdlib	immediate in_dir in_dir_shell in_dir_shell_and_silent in_shell in_shell_and_silent contained
syn keyword cf3Stdlib	in_shell_bg include_base insert_before_if_no_line insert_file insert_ini_section insert_lines contained
syn keyword cf3Stdlib	ips jail kept_successful_command kvm line line_match_value contained
syn keyword cf3Stdlib	lines_present linkchildren linkfrom ln_s local_cp local_dcp contained
syn keyword cf3Stdlib	local_mysql local_postgresql log_repaired log_verbose logrotate m contained
syn keyword cf3Stdlib	maintain_key_values manage_variable_values_ini measure_performance measure_promise_time min_free_space mo contained
syn keyword cf3Stdlib	mog msi_explicit msi_implicit name_age nfs nfs_p contained
syn keyword cf3Stdlib	nimclient no_backup no_backup_cp no_backup_dcp no_backup_rcp noupdate contained
syn keyword cf3Stdlib	npm npm_g npm_knowledge ntfs og older_than contained
syn keyword cf3Stdlib	opencsw owner package_absent package_latest package_module_knowledge package_present contained
syn keyword cf3Stdlib	package_specific package_specific_absent package_specific_latest package_specific_present packages_common pacman contained
syn keyword cf3Stdlib	paths perms_cp perms_dcp pip pip_knowledge pkg contained
syn keyword cf3Stdlib	pkgsrc plain plaintext_password policy prepend_if_no_line probabilistic_usebundle contained
syn keyword cf3Stdlib	process_kill prunedir prunetree quoted_var recurse recurse_ignore contained
syn keyword cf3Stdlib	recurse_with_base redhat_knowledge redhat_no_locking_knowledge regex_replace remote_cp remote_dcp contained
syn keyword cf3Stdlib	replace_line_end replace_or_add resolvconf resolvconf_o results rm_rf contained
syn keyword cf3Stdlib	rm_rf_depth rotate rpm_filebased rpm_knowledge rpm_version run_ifdefined contained
syn keyword cf3Stdlib	sample_rate scan_changing_file scan_log scoped_classes_generic secure_cp seed_cp contained
syn keyword cf3Stdlib	services_common set_colon_field set_config_values set_config_values_matching set_line_based set_quoted_values contained
syn keyword cf3Stdlib	set_user_field set_variable_values set_variable_values_ini setuid setuid_gid_umask setuid_sh contained
syn keyword cf3Stdlib	setuid_umask setuidgid_dir setuidgid_sh silent silent_in_dir single_value contained
syn keyword cf3Stdlib	size_range slackpkg smartos smartos_pkg_add solaris solaris_install contained
syn keyword cf3Stdlib	solaris_knowledge standard_services standard_services start state_repaired std_defs contained
syn keyword cf3Stdlib	stdlib_common strict suse_knowledge symlinked_to sync_cp system_owned contained
syn keyword cf3Stdlib	testing_generic_report testing_junit_report testing_ok testing_ok_if testing_skip testing_tap_bailout contained
syn keyword cf3Stdlib	testing_tap_report testing_todo testing_usage_example tidy to u_kept_successful_command contained
syn keyword cf3Stdlib	uncomment uncomment_lines_containing uncomment_lines_matching unmount url_ping value contained
syn keyword cf3Stdlib	vcs_common warn_lines_matching warn_only windows_feature xml_insert_tree xml_insert_tree_nopath contained
syn keyword cf3Stdlib	xml_set_attribute xml_set_value yum yum yum_group yum_rpm contained
syn keyword cf3Stdlib	yum_rpm_enable_repo yum_rpm_permissive zypper zypper contained

"syn	match	cf3Function		/\w\+[,;(\>]/ contains=cf3BuiltIns,cf3Stdlib
syn	match	cf3Function		/\<\w\+[,;()]/ contains=cf3BuiltIns,cf3Stdlib,cf3Evolve_freelib

syn keyword cf3ControlAttr	bundlesequence cache_system_functions goal_categories contained
syn keyword cf3ControlAttr	ignore_missing_bundles ignore_missing_inputs inputs contained
syn keyword cf3ControlAttr	version lastseenexpireafter output_prefix domain contained
syn keyword cf3ControlAttr	require_comments host_licenses_paid site_classes contained
syn keyword cf3ControlAttr	syslog_host syslog_port fips_mode protocol_version contained
syn keyword cf3ControlAttr	package_module contained
syn keyword cf3MethodAttr	usebundle useresult inherit contained
syn keyword cf3CommonAttr	action classes if unless ifvarclass handle depends_on comment policy with meta contained
syn keyword cf3ClassesAttr	and dist expression not or persistence scope select_class xor contained
syn keyword cf3CommandsAttr args contain module contained
syn keyword cf3ProcessesAttr process_count process_select contained
syn keyword cf3ProcessesAttr process_stop restart_class signals contained
syn keyword cf3PackagesAttr	package_architectures package_method package_policy contained
syn keyword cf3PackagesAttr	package_select package_version package_module contained
syn keyword cf3GuestEnvAttr	environment_host environment_interface contained
syn keyword cf3GuestEnvAttr	environment_resources environment_state contained
syn keyword cf3GuestEnvAttr	environment_type contained
syn keyword cf3TopicsAttr	association synonyms generalizations contained
syn keyword cf3ServicesAttr	service_policy service_dependencies service_method contained
syn keyword cf3DatabasesAttr	database_server database_type contained
syn keyword cf3DatabasesAttr	database_operation database_columns contained
syn keyword cf3DatabasesAttr	database_rows registry_exclude contained
syn keyword cf3DefaultsAttr	if_match_regex contained
syn keyword cf3StorageAttr	mount volume  contained
syn keyword cf3FilesAttr	acl changes copy_from create delete depth_search contained
syn keyword cf3FilesAttr	edit_defaults edit_line edit_template edit_xml file_select contained
syn keyword cf3FilesAttr	link_from move_obstructions pathtype perms contained
syn keyword cf3FilesAttr	rename repository template_method template_data touch transformer contained
syn keyword cf3AccessAttr	admit_ips admit_hostnames admit_keys admit deny deny_ips deny_hostnames deny_keys maproot contained
syn keyword cf3AccessAttr	ifencrypted resource_type contained
syn keyword cf3MeasurementsAttr	stream_type data_type history_type contained
syn keyword cf3MeasurementsAttr	units match_value contained
syn keyword cf3ReportsAttr	friend_pattern intermittency lastseen contained
syn keyword cf3ReportsAttr	printfile report_to_file showstate contained
syn keyword cf3ReportsAttr	bundle_return_value_index contained

" Bodies
syn keyword cf3EditLineAttr	replace_with edit_field whitespace_policy location contained
syn keyword cf3EditLineAttr	insert_select insert_type expand_scalars not_matching contained
syn keyword cf3EditLineAttr	delete_select select_region contained
syn keyword cf3EditFieldAttr	allow_blank_fields extend_fields field_operation contained
syn keyword cf3EditFieldAttr	field_separator field_value select_field contained
syn keyword cf3EditFieldAttr	start_fields_from_zero value_separator contained
syn keyword cf3ReplaceWithAttr	occurrences replace_value contained
syn keyword cf3SelectRegionAttr	include_start_delimiter include_end_delimiter contained
syn keyword cf3SelectRegionAttr	select_start select_end contained
syn keyword cf3ProcCountAttr	in_range_define match_range out_of_range_define contained
syn keyword cf3ProcSelectAttr	command pid ppid pgid priority process_owner contained
syn keyword cf3ProcSelectAttr 	process_result rsize status stime_range ttime_range contained
syn keyword cf3ProcSelectAttr   tty threads vsize contained
syn keyword cf3EditDefAttr		edit_backup empty_file_before_editing max_file_size recognize_join contained
syn keyword cf3LocationAttr 	before_after first_last select_line_matching contained
syn keyword cf3BodyFileSelectAttr 	leaf_name path_name search_mode search_size search_owners contained
syn keyword cf3BodyFileSelectAttr 	search_groups search_bsdflags ctime mtime atime contained
syn keyword cf3BodyFileSelectAttr 	exec_regex exec_program file_types issymlinkto file_result contained
syn keyword cf3BodyClassesAttr 	promise_repaired repair_failed repair_denied contained
syn keyword cf3BodyClassesAttr 	repair_timeout promise_kept cancel_kept cancel_repaired contained
syn keyword cf3BodyClassesAttr 	cancel_notkept kept_returncodes repaired_returncodes contained
syn keyword cf3BodyClassesAttr 	failed_returncodes persist_time scope timer_policy contained
syn keyword cf3BodyLinkFromAttr	copy_patterns link_children link_type source contained
syn keyword cf3BodyLinkFromAttr	when_linking_children when_no_source contained
syn keyword cf3BodyPermsAttr	bsdflags groups mode owners rxdirs contained
syn keyword cf3BodyACLAttr		aces acl_directory_inherit acl_method acl_type specify_inherit_aces contained
syn keyword cf3BodyDepthSearchAttr	depth exclude_dirs include_basedir include_dirs contained
syn keyword cf3BodyDepthSearchAttr	rmdeadlinks traverse_links xdev contained
syn keyword cf3BodyDeleteAttr	dirlinks rmdirs contained
syn keyword cf3BodyRenameAttr	disable disable_mode disable_suffix newname rotate contained
syn keyword cf3BodyChangesAttr	hash report_changes update_hashes report_diffs contained
syn keyword cf3BodyPackageModuleAttr	default_options query_installed_ifelapsed contained
syn keyword cf3BodyPackageModuleAttr	query_updates_ifelapsed contained
syn keyword cf3BodyPackageMethodAttr	package_add_command package_arch_regex contained
syn keyword cf3BodyPackageMethodAttr	package_changes package_delete_command contained
syn keyword cf3BodyPackageMethodAttr	package_delete_convention package_file_repositories contained
syn keyword cf3BodyPackageMethodAttr	package_installed_regex package_list_arch_regex contained
syn keyword cf3BodyPackageMethodAttr	package_list_command package_list_name_regex contained
syn keyword cf3BodyPackageMethodAttr	package_list_update_command package_list_update_ifelapsed contained
syn keyword cf3BodyPackageMethodAttr	package_list_version_regex package_name_convention contained
syn keyword cf3BodyPackageMethodAttr	package_name_regex package_noverify_regex contained
syn keyword cf3BodyPackageMethodAttr	package_noverify_returncode package_patch_arch_regex contained
syn keyword cf3BodyPackageMethodAttr	package_patch_command package_patch_installed_regex contained
syn keyword cf3BodyPackageMethodAttr	package_patch_list_command package_patch_name_regex contained
syn keyword cf3BodyPackageMethodAttr	package_patch_version_regex package_update_command contained
syn keyword cf3BodyPackageMethodAttr	package_verify_command package_version_regex contained
syn keyword cf3BodyPackageMethodAttr	package_version_less_command package_version_equal_command contained
syn keyword cf3BodyPackageMethodAttr	package_multiline_start contained
syn keyword cf3BodyActionAttr	action_policy ifelapsed expireafter log_string contained
syn keyword cf3BodyActionAttr	log_level log_kept log_priority log_repaired contained
syn keyword cf3BodyActionAttr	log_failed value_kept value_repaired value_notkept contained
syn keyword cf3BodyActionAttr	audit background report_level contained
syn keyword cf3BodyActionAttr	measurement_class contained
syn keyword cf3BodyContainAttr	useshell umask exec_owner exec_group exec_timeout contained
syn keyword cf3BodyContainAttr	chdir chroot preview no_output contained
syn keyword cf3BodyCopyFromAttr	source servers collapse_destination_dir contained
syn keyword cf3BodyCopyFromAttr	compare copy_backup encrypt check_root contained
syn keyword cf3BodyCopyFromAttr	copylink_patterns copy_size findertype contained
syn keyword cf3BodyCopyFromAttr	linkcopy_patterns link_type force_update contained
syn keyword cf3BodyCopyFromAttr	force_ipv4 portnumber preserve protocol_version purge contained
syn keyword cf3BodyCopyFromAttr	stealth timeout trustkey type_check verify contained
syn keyword cf3BodyVolumeAttr	check_foreign freespace sensible_size contained
syn keyword cf3BodyVolumeAttr	sensible_count scan_arrivals contained
syn keyword cf3BodyMountAttr	edit_fstab mount_type mount_source contained
syn keyword cf3BodyMountAttr	mount_server mount_options unmount contained
syn keyword cf3BodyServiceMethodAttr	service_type service_args contained
syn keyword cf3BodyServiceMethodAttr	service_autostart_policy service_dependence_chain contained
syn keyword cf3BodyDatabaseServerAttr	 db_server_owner db_server_password contained
syn keyword cf3BodyDatabaseServerAttr	 db_server_host db_server_type contained
syn keyword cf3BodyDatabaseServerAttr	 db_server_connection_db contained
syn keyword cf3BodyEnvResourcesAttr	 env_cpus env_memory env_disk contained
syn keyword cf3BodyEnvResourcesAttr	 env_baseline env_spec_file env_spec contained
syn keyword cf3BodyMatchValueAttr	 select_line_matching select_line_number contained
syn keyword cf3BodyMatchValueAttr	 extraction_regex track_growing_file contained
syn keyword cf3BodyServiceMethodAttr	service_type service_args service_bundle contained
syn keyword cf3BodyServiceMethodAttr	service_autostart_policy service_dependence_chain contained
syn keyword cf3BodyEnvInterfaceAttr	env_addresses env_name env_network contained
syn keyword cf3BodyServerControlAttr	allowallconnects allowconnects allowlegacyconnects contained
syn keyword cf3BodyServerControlAttr	allowusers auditing bindtointerface contained
syn keyword cf3BodyServerControlAttr	cfruncommand denybadclocks denyconnects contained
syn keyword cf3BodyServerControlAttr	dynamicaddresses hostnamekeys keycacheTTL contained
syn keyword cf3BodyServerControlAttr	logallconnections logencryptedtransfers contained
syn keyword cf3BodyServerControlAttr	maxconnections port serverfacility contained
syn keyword cf3BodyServerControlAttr	skipverify trustkeysfrom contained
syn keyword cf3BodyAgentControlAttr	abortclasses abortbundleclasses addclasses contained
syn keyword cf3BodyAgentControlAttr	agentaccess agentfacility alwaysvalidate contained
syn keyword cf3BodyAgentControlAttr	auditing binarypaddingchar bindtointerface contained
syn keyword cf3BodyAgentControlAttr	hashupdates childlibpath checksum_alert_time contained
syn keyword cf3BodyAgentControlAttr	defaultcopytype dryrun editbinaryfilesize contained
syn keyword cf3BodyAgentControlAttr	editfilesize environment exclamation expireafter contained
syn keyword cf3BodyAgentControlAttr	files_single_copy files_auto_define hostnamekeys contained
syn keyword cf3BodyAgentControlAttr	ifelapsed inform intermittency max_children contained
syn keyword cf3BodyAgentControlAttr	maxconnections mountfilesystems nonalphanumfiles contained
syn keyword cf3BodyAgentControlAttr	repchar refresh_processes default_repository contained
syn keyword cf3BodyAgentControlAttr	secureinput sensiblecount sensiblesize contained
syn keyword cf3BodyAgentControlAttr	skipidentify suspiciousnames syslog verbose contained
syn keyword cf3BodyAgentControlAttr	track_value timezone default_timeout contained
syn keyword cf3BodyExecutorControlAttr splaytime mailfrom mailsubject mailto smtpserver contained
syn keyword cf3BodyExecutorControlAttr mailmaxlines schedule executorfacility contained
syn keyword cf3BodyExecutorControlAttr exec_command contained
syn keyword cf3BodyEditDefsAttr		edit_backup empty_file_before_editing contained
syn keyword cf3BodyEditDefsAttr		max_file_size recognize_join inherit contained
syn keyword cf3BodyDeleteSelectAttr	delete_if_startwith_from_list contained
syn keyword cf3BodyDeleteSelectAttr	delete_if_not_startwith_from_list contained
syn keyword cf3BodyDeleteSelectAttr	delete_if_match_from_list contained
syn keyword cf3BodyDeleteSelectAttr	delete_if_not_match_from_list contained
syn keyword cf3BodyDeleteSelectAttr	delete_if_contains_from_list contained
syn keyword cf3BodyDeleteSelectAttr	delete_if_not_contains_from_list contained
syn keyword cf3BodyInsertSelectAttr	insert_if_startwith_from_list contained
syn keyword cf3BodyInsertSelectAttr	insert_if_not_startwith_from_list contained
syn keyword cf3BodyInsertSelectAttr	insert_if_match_from_list contained
syn keyword cf3BodyInsertSelectAttr	insert_if_not_match_from_list contained
syn keyword cf3BodyInsertSelectAttr	insert_if_contains_from_list contained
syn keyword cf3BodyInsertSelectAttr	insert_if_not_contains_from_list contained
syn keyword cf3BodyMonitorControlAttr forgetrate monitorfacility histograms contained
syn keyword cf3BodyMonitorControlAttr tcpdump tcpdumpcommand contained
syn keyword cf3BodyPrintfileAttr	file_to_print number_of_lines contained

syn cluster cf3AttrCluster	contains=cf3CommonAttr,cf3ClassesAttr,cf3Identifier,
syn cluster cf3AttrCluster  add=cf3ProcessesAttr,cf3FilesAttr,cf3ReportsAttr
syn cluster cf3AttrCluster	add=cf3PackagesAttr,cf3GuestEnvAttr,cf3TopicsAttr
syn cluster cf3AttrCluster	add=cf3StorageAttr,cf3AccessAttr,cf3MeasurementsAttr
syn cluster cf3AttrCluster	add=cf3EditLineAttr,cf3EditFieldAttr,cf3ReplaceWithAttr
syn cluster cf3AttrCluster	add=cf3SelectRegionAttr,cf3ProcCountAttr,cf3ProcSelectAttr
syn cluster cf3AttrCluster	add=cf3EditDefAttr,cf3LocationAttr,cf3CommandsAttr,cf3BodyFileSelectAttr
syn cluster cf3AttrCluster	add=cf3ControlAttr,cf3MethodAttr,cf3BodyClassesAttr
syn cluster cf3AttrCluster	add=cf3ServicesAttr,cf3DatabasesAttr,cf3DefaultsAttr

syn cluster cf3AttrCluster	add=cf3BodyLinkFromAttr,cf3BodyPermsAttr,cf3BodyACLAttr
syn cluster cf3AttrCluster	add=cf3BodyDepthSearchAttr,cf3BodyDeleteAttr,cf3BodyRenameAttr
syn cluster cf3AttrCluster	add=cf3BodyChangesAttr,cf3BodyPackageMethodAttr,cf3BodyActionAttr
syn cluster cf3AttrCluster	add=cf3BodyPackageModuleAttr
syn cluster cf3AttrCluster	add=cf3BodyContainAttr,cf3BodyCopyFromAttr,cf3BodyVolumeAttr
syn cluster cf3AttrCluster	add=cf3BodyMountAttr,cf3BodyServiceMethodAttr,cf3BodyDatabaseServerAttr
syn cluster cf3AttrCluster	add=cf3BodyEnvResourcesAttr,cf3BodyMatchValueAttr,cf3BodyServiceMethodAttr
syn cluster cf3AttrCluster	add=cf3BodyEnvInterfaceAttr,cf3BodyServerControlAttr,cf3BodyEditDefsAttr
syn cluster cf3AttrCluster	add=cf3BodyAgentControlAttr,cf3BodyExecutorControlAttr
syn cluster cf3AttrCluster	add=cf3BodyDeleteSelectAttr,cf3BodyInsertSelectAttr
syn cluster cf3AttrCluster	add=cf3BodyMonitorControlAttr,cf3BodyPrintfileAttr
syn match	cf3Attributes	/\w\+\s*=>/ contains=@cf3AttrCluster

" }}}

if version >= 508 || !exists("did_cfg_syn_inits") " {{{
    if version < 508
        let did_cfg_syn_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

	hi cf3Context ctermfg=DarkGreen
	hi cf3Arrows ctermfg=DarkCyan
	hi cf3Type ctermfg=Magenta
	hi Identifier ctermfg=Blue
	hi Function ctermfg=DarkGreen
	hi Library ctermfg=DarkGrey
	hi cf3ClassBlock ctermfg=Yellow

    HiLink cf3Bundle        Statement
    HiLink cf3BundleTypes   Statement
    HiLink cf3BundleName	Function
    HiLink cf3BundleParams	Identifier

	HiLink cf3Body			Statement
	HiLink cf3BodyTypes		Statement
    HiLink cf3Comment	    Comment

	HiLink cf3BodyControl	Statement
	HiLink cf3BodyControlTypes	Statement
	HiLink cf3BodyControlName	Statement

    HiLink cf3Action	   Underlined
    HiLink cf3Class         cf3Context

	HiLink cf3String        String
	HiLink cf3BuiltIns		Function
   HiLink cf3Evolve_freelib Function
	HiLink cf3Stdlib		Library

    HiLink cf3Identifier    cf3Arrows
    HiLink cf3Esc           Special
    HiLink cf3Array         Special
    HiLink cf3Var           Identifier

    HiLink cf3Type         	cf3Type
    HiLink cf3CommonAttr	Statement
    HiLink cf3ClassesAttr	Statement
    HiLink cf3CommandsAttr	Statement
    HiLink cf3ProcessesAttr	Statement
    HiLink cf3FilesAttr		Statement
	HiLink cf3MethodAttr	cf3Type
    HiLink cf3PackagesAttr	Statement
	HiLink cf3ControlAttr	Statement
	HiLink cf3GuestEnvAttr	Statement
	HiLink cf3TopicsAttr	Statement
	HiLink cf3ServicesAttr	Statement
	HiLink cf3DatabasesAttr	Statement
	HiLink cf3DefaultsAttr	Statement
	HiLink cf3StorageAttr	Statement
	HiLink cf3AccessAttr	Statement
	HiLink cf3MeasurementsAttr Statement
	HiLink cf3ReportsAttr	Statement

    HiLink cf3EditLineAttr		Statement
    HiLink cf3EditFieldAttr		Statement
    HiLink cf3ReplaceWithAttr	Statement
    HiLink cf3SelectRegionAttr	Statement
    HiLink cf3ProcCountAttr		Statement
    HiLink cf3ProcSelectAttr	Statement
    HiLink cf3EditDefAttr		Statement
    HiLink cf3LocationAttr		Statement
	HiLink cf3BodyFileSelectAttr	Statement
	HiLink cf3BodyClassesAttr	Statement
	HiLink cf3BodyLinkFromAttr	Statement
	HiLink cf3BodyPermsAttr		Statement
	HiLink cf3BodyACLAttr		Statement
	HiLink cf3BodyDepthSearchAttr	Statement
	HiLink cf3BodyDeleteAttr	Statement
	HiLink cf3BodyRenameAttr	Statement
	HiLink cf3BodyChangesAttr	Statement
	HiLink cf3BodyPackageMethodAttr	Statement
	HiLink cf3BodyPackageModuleAttr	Statement
	HiLink cf3BodyActionAttr	Statement
	HiLink cf3BodyContainAttr	Statement
	HiLink cf3BodyCopyFromAttr	Statement
	HiLink cf3BodyVolumeAttr	Statement
	HiLink cf3BodyMountAttr	Statement
	HiLink cf3BodyServiceMethodAttr	Statement
	HiLink cf3BodyDatabaseServerAttr	Statement
	HiLink cf3BodyEnvResourcesAttr	Statement
	HiLink cf3BodyMatchValueAttr	Statement
	HiLink cf3BodyServiceMethodAttr Statement
	HiLink cf3BodyEnvInterfaceAttr Statement
	HiLink cf3BodyServerControlAttr Statement
	HiLink cf3BodyAgentControlAttr Statement
	HiLink cf3BodyExecutorControlAttr Statement
	HiLink cf3BodyEditDefsAttr Statement
	HiLink cf3BodyInsertSelectAttr Statement
	HiLink cf3BodyDeleteSelectAttr Statement
	HiLink cf3BodyMonitorControlAttr Statement
	HiLink cf3BodyPrintfileAttr Statement

    delcommand HiLink
endif
let b:current_syntax = "cf3"

" }}}

" Folding {{{

function! CF3Folds()
  let line = getline(v:lnum)

  " Don't include blank lines in previous fold {{{
  if line =~? '\v^\s*$'
    return '-1'
  endif
  " }}}

  " Don't include comments in the previous fold {{{
  if line =~? '\v^\s*#.*$'
    return '-1'
  endif
  " }}}

  " Fold bodies/bundles {{{
  let body_types = [
        \"^bundle",
        \"^body"
        \ ]
  for type in body_types
    if line =~ type
      return ">1"
    endif
  endfor
  " }}}

  " Fold promises {{{
  let promise_types = [
        \"meta:",
        \"vars:",
        \"defaults:",
        \"classes:",
        \"users:",
        \"files:",
        \"packages:",
        \"guest_environments:",
        \"methods:",
        \"processes:",
        \"services:",
        \"commands:",
        \"storage:",
        \"databases:",
        \"access:",
        \"roles:",
        \"measurements:",
        \"reports:",
        \ ]
  for promise_type in promise_types
    if line =~ promise_type
      return ">2"
    endif
  endfor
  " }}}

  " TODO:
  " - fold lists
  " - include trailing }'s in fdl 1

  " If nothing matches, keep the previous foldlevel
  return '='

endfunction

setlocal foldmethod=expr
setlocal foldexpr=CF3Folds()

" }}}

" CREDITS
" Neil Watson <neil@watson-wilson.ca>
" Aleksey Tsalolikhin
" John Coleman of Yale U
" Matt Lesko
" Ivan Pesin
" Zach Himsel
"
" vim_cf3 files (https://github.com/neilhwatson/vim_cf3)
" Copyright (C) 2011 Neil H. Watson <neil@watson-wilson.ca>
"
" This program is free software: you can redistribute it and/or modify it under
" the terms of the GNU General Public License as published by the Free Software
" Foundation, either version 3 of the License, or (at your option) any later
" version.
"
" This program is distributed in the hope that it will be useful, but WITHOUT ANY
" WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
" PARTICULAR PURPOSE.  See the GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License along with
" this program.  If not, see <http://www.gnu.org/licenses/>.

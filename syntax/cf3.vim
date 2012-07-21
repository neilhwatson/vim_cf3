" Vim syntax file
" Language:     Cfengine version 3
" Maintainer:   Neil Watson <neil@watson-wilson.ca>
" Last Change:  Jul 21 2012
" Location:
"
" TODO: 
"	- would be great to know current promise type
"
" This is my first attempt at a syntax file.  Feel free to send me correctsion
" or improvements.  I'll give you a credit.
"
" USAGE
" There is already a vim file that uses 'cf' as a file extention.  You can use
" cf3 for your cf3 file extentions or identify via your vimrc file:
" au BufRead,BufNewFile *.cf set ft=cf3
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
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
syn keyword cf3BodyTypes edit_defaults file_select contained nextgroup=cf3BundleName skipwhite
syn keyword cf3BodyTypes link_from perms rename tcp_ip contained nextgroup=cf3BundleName skipwhite
syn keyword cf3BodyTypes package_method process_count contained nextgroup=cf3BundleName skipwhite 
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

syn match cf3Action /\<\(vars\|classes\|reports\|meta\):/
syn match cf3Action /\<\(commands\|databases\|files\|interfaces\|methods\|packages\|storage\):/
syn match cf3Action /\<\(access\|measurements\|roles\|topics\|occurrences\|defaults\):/
syn match cf3Action /\<\(control\|guest_environments\|outputs\|processes\|services\|things\):/
syn match cf3Action /\<\(delete_lines\|field_edits\|insert_lines\|replace_patterns\):/

syn match   cf3Class        /[^ "\t:#]\+::/

syn keyword TODO todo TODO FIXME TBD NOTE contained
syn match   cf3Comment      /#.*/ contains=TODO

syn match   cf3Identifier   /=>/

" Escape sequences in regexes
syn match   cf3Esc          /\\\\[sSdD+][\+\*]*/ contained
" Array indexes contained in [].  Does not seems to be working.
syn region  cf3Array        start=/\(\\\)\@<!\[/ end=/\]/ contained contains=cf3Var
" Variables wrapped in {} or ()
syn region  cf3Var          start=/[$@][{(]/ end=/[})]/ contains=cf3Var,cf3Array
syn region  cf3String       start=/\z\("\|'\)/ skip=/\\\z1/ end=/\z1/ contains=cf3Var,cf3Esc,cf3Array
syn region  cf3Fold 	    start="{" end="}" transparent fold

syn keyword cf3Type			string int real slist ilist rlist policy

syn keyword cf3BuiltIns		accessedbefore accumulated ago and contained
syn keyword cf3BuiltIns		canonify concat changedbefore classify contained
syn keyword cf3BuiltIns		classmatch countclassesmatching contained
syn keyword cf3BuiltIns		countlinesmatching diskfree escape execresult contained 
syn keyword cf3BuiltIns		fileexists filesexist filesize getenv getfields contained
syn keyword cf3BuiltIns		getgid getindices getuid getusers getvalues grep contained
syn keyword cf3BuiltIns		groupexists hash hashmatch host2ip ip2host contained
syn keyword cf3BuiltIns		hostinnetgroup hostrange hostsseen hubknowledge contained
syn keyword cf3BuiltIns		iprange irange isdir isexecutable isgreaterthan contained
syn keyword cf3BuiltIns		islessthan islink isnewerthan isplain isvariable contained
syn keyword cf3BuiltIns		join lastnode laterthan ldaparray ldaplist contained
syn keyword cf3BuiltIns		ldapvalue not now on or parseintarray contained 
syn keyword cf3BuiltIns		parserealarray parsestringarray parsestringarrayidx contained
syn keyword cf3BuiltIns		peers peerleader peerleaders product randomint contained
syn keyword cf3BuiltIns		readfile readintarray readintlist readrealarray contained
syn keyword cf3BuiltIns		readreallist readstringarray readstringarrayidx contained
syn keyword cf3BuiltIns		readstringlist readtcp regarray regcmp regextract contained
syn keyword cf3BuiltIns		registryvalue regline reglist regldap remotescalar contained
syn keyword cf3BuiltIns		remoteclassesmatching returnszero rrange selectservers contained
syn keyword cf3BuiltIns		splayclass splitstring strcmp sum translatepath contained
syn keyword cf3BuiltIns		usemodule userexists maplist contained

" Stdlib: -rw-r--r--  1 ivan  staff  59012 Jun 27 18:05
" /Users/ivan/Downloads/cfengine_stdlib.cf
" 
syn keyword cf3Stdlib insert_lines insert_file comment_lines_matching uncomment_lines_matching  contained
syn keyword cf3Stdlib comment_lines_containing uncomment_lines_containing delete_lines_matching contained
syn keyword cf3Stdlib warn_lines_matching append_if_no_line  contained
syn keyword cf3Stdlib append_if_no_lines replace_line_end append_to_line_end contained
syn keyword cf3Stdlib resolvconf manage_variable_values_ini  contained
syn keyword cf3Stdlib set_variable_values_ini set_variable_values set_config_values contained
syn keyword cf3Stdlib set_config_values_matching maintain_key_values  contained
syn keyword cf3Stdlib append_users_starting append_groups_starting set_colon_field contained
syn keyword cf3Stdlib set_user_field append_user_field  contained
syn keyword cf3Stdlib expand_template replace_or_add cronjob quoted_var col  contained
syn keyword cf3Stdlib line value INI_section std_defs empty  contained
syn keyword cf3Stdlib no_backup start after before comment  contained
syn keyword cf3Stdlib uncomment if_elapsed if_elapsed_day measure_performance warn_only  contained
syn keyword cf3Stdlib bg ifwin_bg immediate policy log_repaired  contained
syn keyword cf3Stdlib log_verbose silent in_dir in_dir_shell silent_in_dir  contained
syn keyword cf3Stdlib in_shell in_shell_bg in_shell_and_silent in_dir_shell_and_silent setuid  contained
syn keyword cf3Stdlib setuid_sh setuidgid_sh jail if_repaired if_else  contained
syn keyword cf3Stdlib cf2_if_else if_notkept if_ok if_ok_cancel cmd_repair  contained
syn keyword cf3Stdlib state_repaired enumerate always secure_cp remote_cp  contained
syn keyword cf3Stdlib remote_dcp local_cp local_dcp perms_cp backup_local_cp  contained
syn keyword cf3Stdlib seed_cp sync_cp no_backup_cp no_backup_dcp no_backup_rcp  contained
syn keyword cf3Stdlib ln_s linkchildren m mo mog  contained
syn keyword cf3Stdlib og owner access_generic ntfs strict  contained
syn keyword cf3Stdlib recurse recurse_ignore include_base tidy disable  contained
syn keyword cf3Stdlib rotate to name_age days_old size_range  contained
syn keyword cf3Stdlib exclude plain dirs by_name ex_list  contained
syn keyword cf3Stdlib all detect_all_change detect_content noupdate diff  contained
syn keyword cf3Stdlib diff_noupdate zypper apt dpkg_version rpm_version  contained
syn keyword cf3Stdlib windows_feature msi_implicit msi_explicit yum yum_rpm  contained
syn keyword cf3Stdlib rpm_filebased ips solaris create_solaris_admin_file freebsd  contained
syn keyword cf3Stdlib emerge generic min_free_space nfs nfs_p  contained
syn keyword cf3Stdlib unmount exclude_procs days_older_than any_count check_range  contained
syn keyword cf3Stdlib bootstart force_deps standard_services local_mysql local_postgresql  contained
syn keyword cf3Stdlib kvm scan_log scan_changing_file single_value line_match_value  contained
syn keyword cf3Stdlib sample_rate contained

"syn	match	cf3Function		/\w\+[,;(\>]/ contains=cf3BuiltIns,cf3Stdlib
syn	match	cf3Function		/\<\w\+[,;()]/ contains=cf3BuiltIns,cf3Stdlib

syn keyword cf3ControlAttr	bundlesequence goal_categories contained
syn keyword cf3ControlAttr	ignore_missing_bundles ignore_missing_inputs inputs contained
syn keyword cf3ControlAttr	version lastseenexpireafter output_prefix domain contained
syn keyword cf3ControlAttr	require_comments host_licenses_paid site_classes contained
syn keyword cf3ControlAttr	syslog_host syslog_port fips_mode contained
syn keyword cf3MethodAttr	usebundle inherit contained
syn keyword cf3CommonAttr	action classes ifvarclass handle depends_on comment contained
syn keyword cf3ClassesAttr	or and xor dist expression not select_class contained
syn keyword cf3CommandsAttr args contain module contained
syn keyword cf3ProcessesAttr process_count process_select contained
syn keyword cf3ProcessesAttr process_stop restart_class signals contained
syn keyword cf3PackagesAttr	package_architectures package_method package_policy contained
syn keyword cf3PackagesAttr	package_select package_version contained
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
syn keyword cf3FilesAttr	edit_line edit_xml edit_defaults file_select contained
syn keyword cf3FilesAttr	link_from move_obstructions pathtype perms contained
syn keyword cf3FilesAttr	rename repository touch transformer contained
syn keyword cf3AccessAttr	admit deny maproot contained
syn keyword cf3AccessAttr	ifencrypted resource_type contained
syn keyword cf3MeasurementsAttr	stream_type data_type history_type contained
syn keyword cf3MeasurementsAttr	units match_value contained
syn keyword cf3ReportsAttr	friend_pattern intermittency lastseen contained
syn keyword cf3ReportsAttr	printfile report_to_file showstate contained

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
syn keyword cf3BodyClassesAttr 	failed_returncodes persist_time timer_policy contained
syn keyword cf3BodyLinkFromAttr	copy_patterns link_children link_type source contained
syn keyword cf3BodyLinkFromAttr	when_linking_children when_no_source contained
syn keyword cf3BodyPermsAttr	bsdflags groups mode owners rxdirs contained
syn keyword cf3BodyACLAttr		aces acl_directory_inherit acl_method acl_type specify_inherit_aces contained
syn keyword cf3BodyDepthSearchAttr	depth exclude_dirs include_basedir include_dirs contained
syn keyword cf3BodyDepthSearchAttr	rmdeadlinks traverse_links xdev contained
syn keyword cf3BodyDeleteAttr	dirlinks rmdirs contained
syn keyword cf3BodyRenameAttr	disable disable_mode disable_suffix newname rotate contained
syn keyword cf3BodyChangesAttr	hash report_changes update_hashes report_diffs contained
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
syn keyword cf3BodyCopyFromAttr	force_ipv4 portnumber preserve purge stealth contained
syn keyword cf3BodyCopyFromAttr	timeout trustkey type_check verify contained
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
syn keyword cf3BodyServerControlAttr	allowallconnects allowconnects contained
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
syn keyword cf3BodyExecutorControlAttr splaytime mailfrom mailto smtpserver contained
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
syn cluster cf3AttrCluster	add=cf3BodyContainAttr,cf3BodyCopyFromAttr,cf3BodyVolumeAttr
syn cluster cf3AttrCluster	add=cf3BodyMountAttr,cf3BodyServiceMethodAttr,cf3BodyDatabaseServerAttr
syn cluster cf3AttrCluster	add=cf3BodyEnvResourcesAttr,cf3BodyMatchValueAttr,cf3BodyServiceMethodAttr
syn cluster cf3AttrCluster	add=cf3BodyEnvInterfaceAttr,cf3BodyServerControlAttr,cf3BodyEditDefsAttr
syn cluster cf3AttrCluster	add=cf3BodyAgentControlAttr,cf3BodyExecutorControlAttr
syn cluster cf3AttrCluster	add=cf3BodyDeleteSelectAttr,cf3BodyInsertSelectAttr
syn cluster cf3AttrCluster	add=cf3BodyMonitorControlAttr,cf3BodyPrintfileAttr
syn match	cf3Attributes	/\w\+\s*=>/ contains=@cf3AttrCluster


if version >= 508 || !exists("did_cfg_syn_inits")
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
	HiLink cf3Stdlib		Function

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

set foldmethod=syntax

" CREDITS
" Neil Watson <neil@watson-wilson.ca>
" Aleksey Tsalolikhin
" John Coleman of Yale U
" Matt Lesko
" Ivan Pesin
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

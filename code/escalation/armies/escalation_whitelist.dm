/proc/init_whitelist()
	whitelisted_escalation.Cut()
	var/list/whitelist_file = file2list("config/whitelist_escalation.txt")
	var/check_roles = 0
	var/checked_key = null
	var/list/local_wl = list()
	for(var/lines in whitelist_file)
		if(findtext(lines, "}") && check_roles)
			check_roles = 0

		if(!check_roles && checked_key)
			whitelisted_escalation[checked_key] = local_wl.Copy()
			local_wl.Cut()
			checked_key = null
			continue

		if(!length(lines))
			continue

		if(copytext(lines,1,2) == "#")
			continue

		if(findtext(lines, "= {"))
			checked_key = ckey(replace_characters(lines, list("= {" = "", " " = "")))
			check_roles = 1
			continue

		if(check_roles && checked_key)
			local_wl.Add(lines)
			continue

/proc/add_player_to_escalation_whitelist(var/need_key, var/need_rank)
	var/list/whitelist_file = file2list("config/whitelist_escalation.txt")

	var/l = 0
	var/find_key = 0
	var/find_role = 0
	var/change_file = 0
	for(var/lines in whitelist_file)
		l++

		if(!length(lines))
			continue

		if(copytext(lines,1,2) == "#")
			continue

		if(findtext(lines, need_key))
			find_key = 1
			continue

		if(findtext(lines, need_rank) && find_key)
			find_role = 1
			break

		if(findtext(lines, "}") && (find_key && !find_role))
			whitelist_file.Insert(l, need_rank)
			change_file = 1
			break

	if(find_key && find_role)
		return 1

	if(!find_key)
		var/new_line = "\n[need_key] = {\n[need_rank]\n}"
		text2file(new_line, "config/whitelist_escalation.txt")
		return 1

	if(change_file)
		var/new_line = list2text(whitelist_file, "\n")
		var/F = file("config/whitelist_escalation.txt")
		fdel(F)
		text2file(new_line, "config/whitelist_escalation.txt")
		return 1

/proc/check_player_in_whitelist(var/key, var/rank)
	var/ckey = ckey(key)
	if(!ckey)
		return 0

	var/list/aviable_roles = whitelisted_escalation[ckey]
	if(!length(aviable_roles))
		return 0

	if("::ALL::" in aviable_roles)
		return 1

	if(rank in aviable_roles)
		return 1

/hook/startup/proc/loadCkeyWhitelist()
	load_ckey_whitelist()
	return 1

/proc/load_ckey_whitelist()
	log_admin("Loading ckey_whitelist")
	ckey_whitelist = list()
	var/list/Lines = file2list("config/ckeywhitelist.txt")
	for(var/line in Lines)
		if(!length(line))
			continue

		var/ascii = text2ascii(line,1)
		
		if(copytext(line,1,2) == "#" || ascii == 32)
			continue

		ckey_whitelist.Add(line)

	if(!ckey_whitelist.len)
		log_admin("ckey_whitelist: empty or missing.")
		ckey_whitelist = null
	else
		log_admin("ckey_whitelist: [ckey_whitelist.len] entrie(s).")

/proc/check_ckey_whitelisted(var/ckey)
	return (ckey_whitelist && (ckey in ckey_whitelist) )

/datum/admins/proc/ToggleCkeyWhitelist()
	set category = "Server"
	set name = "Toggle ckey Whitelist"
	set desc="Toggles the ckey Whitelist on and off."

	config.useckeywhitelist = !config.useckeywhitelist
	if(config.useckeywhitelist)
		load_ckey_whitelist()
		to_world("<B>Non-whitelisted connections can no longer be established.</B>")
		log_admin("[key_name(usr)] enabled the ckey whitelist.")
	else
		ckey_whitelist = null
		to_world("<B>Non-whitelisted connections can now be established.</B>")
		log_admin("[key_name(usr)] disabled the ckey whitelist.")

/datum/admins/proc/ReloadCkeyWhitelist()
	set category = "EscAdmin"
	set name = "Reload ckey Whitelist"
	set desc="Reloads the ckey Whitelist."

	load_ckey_whitelist()
	log_and_message_admins("[key_name(usr)] has reloaded the ckey whitelist.")

#undef CKEYWHITELIST

//see professions titles like CCCP Strelok etc
//replace and make a var in armies datum like isWhitelisted and then just seek thro all job datums and this var
var/global/list/protected_from_whitelist = list(
null
	)
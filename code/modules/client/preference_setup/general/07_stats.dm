datum/preferences
	var/str = 8
	var/int = 8
	var/dex = 8
	var/soc =8
	var/end = 8
/*
/datum/category_item/player_setup_item/general/stats
	name = "Stats"
	sort_order = 7

/datum/category_item/player_setup_item/general/stats/sanitize_character()
	pref.str = sanitize_integer(pref.str, 1,15, initial(pref.str))
	pref.int = sanitize_integer(pref.int, 1,15, initial(pref.int))
	pref.dex = sanitize_integer(pref.dex, 1,15, initial(pref.dex))
	pref.end = sanitize_integer(pref.end, 1,15, initial(pref.end))
	pref.soc = sanitize_integer(pref.soc, 1,15, initial(pref.soc))

/datum/category_item/player_setup_item/general/stats/content(var/mob/user)
	. += "<b>Stats</b><br>"
	. += "<b>Strength</b>: <a href='?src=\ref[src];str=1'>[pref.str]</a><br>"
	. += "<b>Intelligence</b>: <a href='?src=\ref[src];int=1'>[pref.int]</a><br>"
	. += "<b>Dexterity</b>: <a href='?src=\ref[src];dex=1'>[pref.dex]</a><br>"
	. += "<b>Endurance</b>: <a href='?src=\ref[src];end=1'>[pref.end]</a><br>"
	. += "<b>Sociality</b>: <a href='?src=\ref[src];soc=1'>[pref.soc]</a><br>"

/datum/category_item/player_setup_item/general/stats/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["str"])
		var/new_str = input(user, "Choose your strength from list", "Character Preference", pref.str) as null|anything in pref.player.rolllist
		if(!new_str)
			new_str = 1
		pref.player.rolllist.Add(pref.str)
		pref.player.rolllist.Remove(new_str)
		pref.str = new_str
		return TOPIC_REFRESH

	else if(href_list["int"])
		var/new_int = input(user, "Choose your intellect from list", "Character Preference", pref.int) as null|anything in pref.player.rolllist
		if(!new_int)
			new_int = 1
		pref.player.rolllist.Add(pref.int)
		pref.player.rolllist.Remove(new_int)
		pref.int = new_int
		return TOPIC_REFRESH

	else if(href_list["dex"])
		var/new_dex = input(user, "Choose your dexterity from list", "Character Preference", pref.dex) as null|anything in pref.player.rolllist
		if(!new_dex)
			new_dex = 1
		pref.player.rolllist.Add(pref.dex)
		pref.player.rolllist.Remove(new_dex)
		pref.dex = new_dex
		return TOPIC_REFRESH

	else if(href_list["soc"])
		var/new_soc = input(user, "Choose your sociality from list", "Character Preference", pref.soc) as null|anything in pref.player.rolllist
		if(!new_soc)
			new_soc = 1
		pref.player.rolllist.Add(pref.soc)
		pref.player.rolllist.Remove(new_soc)
		pref.soc = new_soc
		return TOPIC_REFRESH

	else if(href_list["end"])
		var/new_end = input(user, "Choose your endurance from list", "Character Preference", pref.end) as null|anything in pref.player.rolllist
		if(!new_end)
			new_end = 1
		pref.player.rolllist.Add(pref.end)
		pref.player.rolllist.Remove(new_end)
		pref.end = new_end
		return TOPIC_REFRESH

*/
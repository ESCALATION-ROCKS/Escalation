//King of the Hill. What more do I have to say?

#define NATO_VICTORY "NATO_VICTORY"
#define WP_VICTORY "WP_VICTORY"

#define NATO_FACTION "NATO"
#define WP_FACTION "WARPACT"

/datum/game_mode/koth
	name = "King of the Hill"
	config_tag = "koth"
	required_players = 2
	round_description = "Teams battle for control of a contested point."
	extended_round_description = "Psody sucks."
	ert_disabled = 1
	addantag_allowed = ADDANTAG_ADMIN 
	wargames = 1 //yea......... still a 1983 mode technically
	autobalance = 1
	admin_enabled_joining = 0 
	var/nato_tickets = 50
	var/wp_tickets = 50

/datum/game_mode/koth/announce() //kaka mode
	to_world("<B>The current game mode is [capitalize(name)]!</B> [round_description]")
	if(teams.len)
		to_world("The teams fighting are: ")
		for(var/datum/army_faction/T in teams)
			if(T.group_name)
				to_world("[T.group_name] - <B>[T.name]</b>")
			else
				to_world("<B>[T.name]</b>")
	if(neutral_teams.len)
		to_world("The neutral teams are: ")
		for(var/datum/army_faction/N in neutral_teams)
			if(N) to_world("<B>[N.name]</b>")
	return

/datum/game_mode/koth/startRequirements()
	if(teams.len < minimum_teams)
		return "Not enough fighting teams have been selected! Required teams - [minimum_teams]."
	if(neutral_teams.len < minimum_neutrals)
		return "Not enough neutral teams have been selected! Required teams - [minimum_teams]."

	//Add # of players joined requirements here

	return 0

/datum/game_mode/koth/pre_setup()
	return

/datum/game_mode/koth/post_setup()
	feedback_set_details("round_start","[time2text(world.realtime)]")
	if(ticker && ticker.mode)
		feedback_set_details("game_mode","[ticker.mode]")
	feedback_set_details("server_ip","[world.internet_address]:[world.port]")
	return 1

/datum/game_mode/koth/announce_ert_disabled()
	return

/datum/game_mode/koth/check_finished()
	if(ticker.force_ending)
		return 1
	if(station_was_nuked) return 1
	return admin_ended_round


//HANDLE DEATHS FOR REINFORCEMENTS

// /mob/living/carbon/human/proc/handle_koth_death()
// 	if(!iskoth())
// 		return
// 	if(src in SSwarfare.nato.team)//If in the team.
// 		SSwarfare.nato.left--//Take out a life.
// 	if(src in SSwarfare.wp.team)//Same here.
// 		SSwarfare.wp.left--

//TYPE CHECK

/proc/iskoth()
    return (istype(ticker.mode, /datum/game_mode/koth) || master_mode=="warfare")


//PROCESS

// /datum/game_mode/koth/proc/cap_tickets(faction, tickets)
// 	if(faction == )
// 		nato_tickets += tickets
// 	if(faction == )
// 		wp_tickets += tickets

/datum/game_mode/koth/process()
	. = ..()
	for(var/obj/machinery/capbeacon/C in global.cps)
		if(C.controlled_by == /datum/army_faction/nato)
			wp_tickets -= C.ppm / 30
		else if(C.controlled_by == /datum/army_faction/warpact) //super fucking shitcodey, but theres no easy way to do this
			nato_tickets -= C.ppm / 30

	if(nato_tickets <= 0) //|| SSescal.nato.nuked || SSescal.nato.left <= 0
		round_finished = WP_VICTORY
	else if(wp_tickets <= 0) //|| SSescal.wp.nuked || SSescal.wp.left <= 0
		round_finished = NATO_VICTORY

/datum/game_mode/lescal/check_finished()
	if(round_finished)
		return TRUE


//COMPLETION

/datum/game_mode/koth/declare_completion()
	. = ..()
	var/winner
	var/win_condition

	switch(round_finished)
		if(NATO_VICTORY)
			winner = NATO_FACTION
			if(nato_tickets / initial(nato_tickets) >= 0.6)
				win_condition = "OVERWHELMING VICTORY!"
				// S = sound(pick('sound/theme/neutral_hopeful1.ogg','sound/theme/neutral_hopeful2.ogg'), channel = CHANNEL_CINEMATIC)
			else if(nato_tickets / initial(nato_tickets) <= 0.4)
				win_condition = "PHYRRIC VICTORY"
				// S = sound(pick('sound/theme/neutral_hopeful1.ogg','sound/theme/neutral_hopeful2.ogg'), channel = CHANNEL_CINEMATIC)
			else
				win_condition = "VICTORY"
				// S = sound(pick('sound/theme/neutral_hopeful1.ogg','sound/theme/neutral_hopeful2.ogg'), channel = CHANNEL_CINEMATIC)

		if(WP_VICTORY)
			winner = WP_FACTION
			if(wp_tickets / initial(wp_tickets) >= 0.6)
				win_condition = "OVERWHELMING VICTORY!"
				// S = sound(pick('sound/theme/neutral_hopeful1.ogg','sound/theme/neutral_hopeful2.ogg'), channel = CHANNEL_CINEMATIC)
			else if(wp_tickets / initial(wp_tickets) <= 0.4)
				win_condition = "PHYRRIC VICTORY"
				// S = sound(pick('sound/theme/neutral_hopeful1.ogg','sound/theme/neutral_hopeful2.ogg'), channel = CHANNEL_CINEMATIC)
			else
				win_condition = "VICTORY"
				// S = sound(pick('sound/theme/neutral_hopeful1.ogg','sound/theme/neutral_hopeful2.ogg'), channel = CHANNEL_CINEMATIC)

	to_chat(world, "<span class='round_header'>|Round Complete|</span>")
	to_chat(world, "<span class='round_body'>The [winner] is victorious.</span>")
	to_chat(world,"<span class='round_body'>[win_condition]</span>")

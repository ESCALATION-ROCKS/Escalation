/decl/emote/visible
	key ="blink"
	emote_message_3p = "USER blinks."
	message_type = VISIBLE_MESSAGE

/decl/emote/visible/scratch
	key = "scratch"
	check_restraints = TRUE
	emote_message_3p = "USER scratches."

/decl/emote/visible/drool
	key ="drool"
	emote_message_3p = "USER drools."
	conscious = 0

/decl/emote/visible/nod
	key ="nod"
	emote_message_3p = "USER nods."

/decl/emote/visible/dance
	key ="dance"
	check_restraints = TRUE
	emote_message_3p = "USER dances around happily."

/decl/emote/visible/shake
	key ="shake"
	emote_message_3p = "USER shakes USER_THEIR head."

/decl/emote/visible/jump
	key ="jump"
	emote_message_3p = "USER jumps!"

/decl/emote/visible/shiver
	key ="shiver"
	emote_message_3p = "USER shivers."
	conscious = 0

/decl/emote/visible/airguitar
	key = "airguitar"
	check_restraints = TRUE
	emote_message_3p = "USER is strumming the air and headbanging like a safari chimp."

/decl/emote/visible/blink_r
	key = "blink_r"
	emote_message_3p = "USER blinks rapidly."

/decl/emote/visible/bow
	key = "bow"
	emote_message_3p_target = "USER bows to TARGET."
	emote_message_3p = "USER bows."

/decl/emote/visible/salute
	key = "salute"
	emote_message_3p_target = "USER salutes to TARGET."
	emote_message_3p = "USER salutes."

/decl/emote/visible/eyebrow
	key = "eyebrow"
	emote_message_3p = "USER raises an eyebrow."

/decl/emote/visible/twitch
	key = "twitch"
	emote_message_3p = "USER twitches."
	conscious = 0

/decl/emote/visible/twitch_v
	key = "twitch_v"
	emote_message_3p = "USER twitches violently."
	conscious = 0

/decl/emote/visible/faint
	key = "faint"
	emote_message_3p = "USER faints."

/decl/emote/visible/faint/do_extra(var/mob/user)
	if(istype(user) && user.sleeping <= 0)
		user.sleeping += 10

/decl/emote/visible/frown
	key = "frown"
	emote_message_3p = "USER frowns."

/decl/emote/visible/blush
	key = "blush"
	emote_message_3p = "USER blushes."

/decl/emote/visible/wave
	key = "wave"
	emote_message_3p = "USER waves."
	emote_message_3p_target = "USER waves at TARGET."

/decl/emote/visible/glare
	key = "glare"
	emote_message_3p = "USER glares at TARGET."
	emote_message_3p = "USER glares."

/decl/emote/visible/stare
	key = "stare"
	emote_message_3p = "USER stares at TARGET."
	emote_message_3p = "USER stares."

/decl/emote/visible/look
	key = "look"
	emote_message_3p = "USER looks at TARGET."
	emote_message_3p = "USER looks around."

/decl/emote/visible/point
	key = "point"
	check_restraints = TRUE
	emote_message_3p = "USER points."
	emote_message_3p_target = "USER points to TARGET."

/decl/emote/visible/raise
	key = "raise"
	check_restraints = TRUE
	emote_message_3p = "USER raises a hand."

/decl/emote/visible/grin
	key = "grin"
	emote_message_3p = "USER grins."

/decl/emote/visible/shrug
	key = "shrug"
	emote_message_3p = "USER shrugs."

/decl/emote/visible/smile
	key = "smile"
	emote_message_3p = "USER smiles."

/decl/emote/visible/wink
	key = "wink"
	emote_message_3p = "USER winks."

/decl/emote/visible/hug
	key = "hug"
	check_restraints = TRUE
	emote_message_3p = "USER hugs USER_THEMself."
	emote_message_3p_target = "USER hugs TARGET."

/decl/emote/visible/signal
	key = "signal"
	check_restraints = TRUE
	emote_message_3p = "USER signals."

/decl/emote/visible/signal/check_user(var/atom/user)
	return ismob(user)

/decl/emote/visible/handshake
	key = "handshake"
	check_restraints = TRUE
	emote_message_3p = "USER shakes hands with USER_THEMself."
	emote_message_3p_target = "USER shakes hands with TARGET."
	message_type = VISIBLE_MESSAGE

/decl/emote/visible/handshake/get_emote_message_3p(var/atom/user, var/atom/target, var/extra_params)
	if(target && !user.Adjacent(target))
		return "USER holds out USER_HIS hand out to TARGET."
	return ..()

/decl/emote/visible/signal
	key = "signal"
	emote_message_3p = "USER signals."
	emote_message_3p_target = "USER signals at TARGET."
	message_type = VISIBLE_MESSAGE

/decl/emote/visible/signal/get_emote_message_3p(var/mob/user, var/atom/target, var/extra_params)
	if(istype(user) && !(user.r_hand && user.l_hand))
		var/t1 = round(text2num(extra_params))
		if(isnum(t1) && t1 <= 5)
			return "USER raises [t1] finger\s."
	return .. ()
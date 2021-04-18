/atom/movable/proc/get_mob()
	return

/obj/mecha/get_mob()
	return occupant

/obj/vehicle/train/get_mob()
	return buckled_mob

/mob/get_mob()
	return src

/mob/living/bot/mulebot/get_mob()
	if(load && istype(load, /mob/living))
		return list(src, load)
	return src

//helper for inverting armor blocked values into a multiplier
#define blocked_mult(blocked) max(1 - (blocked/100), 0)

/proc/mobs_in_view(var/range, var/source)
	var/list/mobs = list()
	for(var/atom/movable/AM in view(range, source))
		var/M = AM.get_mob()
		if(M)
			mobs += M

	return mobs

proc/esc_random_name(gender, faction)
	if(!faction)
		return random_name(gender)

	switch(faction)
		if("usmc")
			if(gender == FEMALE)
				return capitalize(pick(first_names_female_usmc)) + " " + capitalize(pick(last_names_usmc))
			else
				return capitalize(pick(first_names_male_usmc)) + " " + capitalize(pick(last_names_usmc))

		if("bund")
			if(gender == FEMALE)
				return capitalize(pick(first_names_female_bund)) + " " + capitalize(pick(last_names_bund))
			else
				return capitalize(pick(first_names_male_bund)) + " " + capitalize(pick(last_names_bund))

		if("nvaddr")
			if(gender == FEMALE)
				return capitalize(pick(first_names_female_bund)) + " " + capitalize(pick(last_names_bund))
			else
				return capitalize(pick(first_names_male_bund)) + " " + capitalize(pick(last_names_bund))

		if("cccp")
			if(gender == FEMALE)
				return capitalize(pick(first_names_female_cccp)) + " " + capitalize(pick(last_names_female_cccp))
			else
				return capitalize(pick(first_names_male_cccp)) + " " + capitalize(pick(last_names_cccp))

		if("usa")
			if(gender == FEMALE)
				return capitalize(pick(first_names_female_usmc)) + " " + capitalize(pick(last_names_usmc))
			else
				return capitalize(pick(first_names_male_usmc)) + " " + capitalize(pick(last_names_usmc))

		if("baf")
			if(gender == FEMALE)
				return capitalize(pick(first_names_female_usmc)) + " " + capitalize(pick(last_names_usmc))
			else
				return capitalize(pick(first_names_male_usmc)) + " " + capitalize(pick(last_names_usmc))

		if("finn")
			if(gender == FEMALE)
				return capitalize(pick(first_names_female_finn)) + " " + capitalize(pick(last_names_finn))
			else
				return capitalize(pick(first_names_male_finn)) + " " + capitalize(pick(last_names_finn))

		if("csla")
			if(gender == FEMALE)
				return capitalize(pick(first_names_female_csla)) + " " + capitalize(pick(last_names_female_csla))
			else
				return capitalize(pick(first_names_male_csla)) + " " + capitalize(pick(last_names_csla))

		if("heer")
			if(gender == FEMALE)
				return capitalize(pick(first_names_female_bund)) + " " + capitalize(pick(last_names_bund))
			else
				return capitalize(pick(first_names_male_bund)) + " " + capitalize(pick(last_names_bund))

		if("esp")
			if(gender == FEMALE)
				return capitalize(pick(first_names_female_esp)) + " " + capitalize(pick(last_names_esp))
			else
				return capitalize(pick(first_names_male_esp)) + " " + capitalize(pick(last_names_esp))

		if("fra")
			if(gender == FEMALE)
				return capitalize(pick(first_names_female_fra)) + " " + capitalize(pick(last_names_fra))
			else
				return capitalize(pick(first_names_male_fra)) + " " + capitalize(pick(last_names_fra))


proc/random_hair_style(gender, species = SPECIES_HUMAN)
	var/h_style = "Bald"

	var/list/valid_hairstyles = list()
	for(var/hairstyle in hair_styles_list)
		var/datum/sprite_accessory/S = hair_styles_list[hairstyle]

		if(gender != NEUTER && gender != PLURAL)
			if(gender == MALE && S.gender == FEMALE)
				continue
			if(gender == FEMALE && S.gender == MALE)
				continue

		if( !(species in S.species_allowed))
			continue
		valid_hairstyles[hairstyle] = hair_styles_list[hairstyle]

	if(valid_hairstyles.len)
		h_style = pick(valid_hairstyles)

	return h_style

proc/random_facial_hair_style(gender, species = SPECIES_HUMAN)
	var/f_style = "Shaved"

	var/list/valid_facialhairstyles = list()
	for(var/facialhairstyle in facial_hair_styles_list)
		var/datum/sprite_accessory/S = facial_hair_styles_list[facialhairstyle]

		if(gender != NEUTER && gender != PLURAL)
			if(gender == MALE && S.gender == FEMALE)
				continue
			if(gender == FEMALE && S.gender == MALE)
				continue

		if( !(species in S.species_allowed))
			continue

		valid_facialhairstyles[facialhairstyle] = facial_hair_styles_list[facialhairstyle]

	if(valid_facialhairstyles.len)
		f_style = pick(valid_facialhairstyles)

		return f_style

proc/sanitize_name(name, species = SPECIES_HUMAN)
	var/datum/species/current_species
	if(species)
		current_species = all_species[species]

	return current_species ? current_species.sanitize_name(name) : sanitizeName(name)

proc/random_name(gender, species = SPECIES_HUMAN)

	var/datum/species/current_species
	if(species)
		current_species = all_species[species]

	if(!current_species)
		if(gender==FEMALE)
			return capitalize(pick(GLOB.first_names_female)) + " " + capitalize(pick(GLOB.last_names))
		else
			return capitalize(pick(GLOB.first_names_male)) + " " + capitalize(pick(GLOB.last_names))
	else
		return current_species.get_random_name(gender)

proc/random_skin_tone()
	switch(pick(60;"caucasian", 15;"afroamerican", 10;"african", 10;"latino", 5;"albino"))
		if("caucasian")		. = -10
		if("afroamerican")	. = -115
		if("african")		. = -165
		if("latino")		. = -55
		if("albino")		. = 34
		else				. = rand(-185,34)
	return min(max( .+rand(-25, 25), -185),34)

proc/skintone2racedescription(tone)
	switch (tone)
		if(30 to INFINITY)		return "albino"
		if(20 to 30)			return "pale"
		if(5 to 15)				return "light skinned"
		if(-10 to 5)			return "white"
		if(-25 to -10)			return "tan"
		if(-45 to -25)			return "darker skinned"
		if(-65 to -45)			return "brown"
		if(-INFINITY to -65)	return "black"
		else					return "unknown"

proc/age2agedescription(age)
	switch(age)
		if(0 to 1)			return "infant"
		if(1 to 3)			return "toddler"
		if(3 to 13)			return "child"
		if(13 to 18)		return "teenager"
		if(18 to 24)		return "young adult"
		if(24 to 45)		return "adult"
		if(45 to 60)		return "middle-aged"
		if(60 to 70)		return "aging"
		if(70 to INFINITY)	return "elderly"
		else				return "unknown"


proc/ageAndGender2Desc(age, gender)//Used for the radio
	if(gender == FEMALE)
		switch(age)
			if(0 to 18)			return "Girl"
			if(18 to 24)		return "Young Woman"
			if(24 to 45)		return "Woman"
			if(45 to INFINITY)	return "Old Woman"
			else				return "Unknown"
	else
		switch(age)
			if(0 to 18)			return "Boy"
			if(18 to 24)		return "Young Man"
			if(24 to 45)		return "Man"
			if(45 to INFINITY)	return "Old Man"
			else				return "Unknown"

/proc/RoundHealth(health)
	var/list/icon_states = icon_states('icons/mob/hud_med.dmi')
	for(var/icon_state in icon_states)
		if(health >= text2num(icon_state))
			return icon_state
	return icon_states[icon_states.len] // If we had no match, return the last element

//checks whether this item is a module of the robot it is located in.
/proc/is_robot_module(var/obj/item/thing)
	if (!thing || !istype(thing.loc, /mob/living/silicon/robot))
		return 0
	var/mob/living/silicon/robot/R = thing.loc
	return (thing in R.module.modules)

/proc/get_exposed_defense_zone(var/atom/movable/target)
	return pick(BP_HEAD, BP_L_HAND, BP_R_HAND, BP_L_FOOT, BP_R_FOOT, BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_CHEST, BP_GROIN)

/proc/do_mob(mob/user , mob/target, time = 30, target_zone = 0, uninterruptible = 0, progress = 1)
	if(!user || !target)
		return 0
	var/user_loc = user.loc
	var/target_loc = target.loc

	var/holding = user.get_active_hand()
	var/datum/progressbar/progbar
	if (progress)
		progbar = new(user, time, target)

	var/endtime = world.time+time
	var/starttime = world.time
	. = 1
	while (world.time < endtime)
		sleep(1)
		if (progress)
			progbar.update(world.time - starttime)
		if(!user || !target)
			. = 0
			break
		if(uninterruptible)
			continue

		if(!user || user.incapacitated(INCAPACITATION_STUNNED|INCAPACITATION_RESTRAINED|INCAPACITATION_KNOCKOUT) || user.loc != user_loc)
			. = 0
			break

		if(target.loc != target_loc)
			. = 0
			break

		if(user.get_active_hand() != holding)
			. = 0
			break

		if(target_zone && user.zone_sel.selecting != target_zone)
			. = 0
			break

	if (progbar)
		qdel(progbar)

/proc/do_after(mob/user, delay, atom/target = null, needhand = 1, progress = 1, var/incapacitation_flags = INCAPACITATION_STUNNED|INCAPACITATION_RESTRAINED|INCAPACITATION_KNOCKOUT, var/same_direction = 0)
	if(!user)
		return 0
	var/atom/target_loc = null
	var/target_type = null

	var/original_dir = user.dir

	if(target)
		target_loc = target.loc
		target_type = target.type

	var/atom/original_loc = user.loc

	var/holding = user.get_active_hand()

	var/datum/progressbar/progbar
	if (progress)
		progbar = new(user, delay, target)

	var/endtime = world.time + delay
	var/starttime = world.time
	. = 1
	while (world.time < endtime)
		sleep(1)
		if (progress)
			progbar.update(world.time - starttime)

		if(!user || user.incapacitated(incapacitation_flags) || user.loc != original_loc || (same_direction && user.dir != original_dir))
			. = 0
			break

		if(target_loc && (!target || QDELETED(target) || target_loc != target.loc || target_type != target.type))
			. = 0
			break

		if(needhand)
			if(user.get_active_hand() != holding)
				. = 0
				break

	if (progbar)
		qdel(progbar)

/proc/able_mobs_in_oview(var/origin)
	var/list/mobs = list()
	for(var/mob/living/M in oview(origin)) // Only living mobs are considered able.
		if(!M.is_physically_disabled())
			mobs += M
	return mobs

// Returns true if M was not already in the dead mob list
/mob/proc/switch_from_living_to_dead_mob_list()
	remove_from_living_mob_list()
	. = add_to_dead_mob_list()

// Returns true if M was not already in the living mob list
/mob/proc/switch_from_dead_to_living_mob_list()
	remove_from_dead_mob_list()
	. = add_to_living_mob_list()

// Returns true if the mob was in neither the dead or living list
/mob/proc/add_to_living_mob_list()
	return FALSE
/mob/living/add_to_living_mob_list()
	if((src in GLOB.living_mob_list_) || (src in GLOB.dead_mob_list_))
		return FALSE
	GLOB.living_mob_list_ += src
	return TRUE

// Returns true if the mob was removed from the living list
/mob/proc/remove_from_living_mob_list()
	return GLOB.living_mob_list_.Remove(src)

// Returns true if the mob was in neither the dead or living list
/mob/proc/add_to_dead_mob_list()
	return FALSE
/mob/living/add_to_dead_mob_list()
	if((src in GLOB.living_mob_list_) || (src in GLOB.dead_mob_list_))
		return FALSE
	GLOB.dead_mob_list_ += src
	return TRUE

// Returns true if the mob was removed form the dead list
/mob/proc/remove_from_dead_mob_list()
	return GLOB.dead_mob_list_.Remove(src)

//Find a dead mob with a brain and client.
/proc/find_dead_player(var/find_key, var/include_observers = 0)
	if(isnull(find_key))
		return

	var/mob/selected = null

	if(include_observers)
		for(var/mob/M in GLOB.player_list)
			if((M.stat != DEAD) || (!M.client))
				continue
			if(M.ckey == find_key)
				selected = M
				break
	else
		for(var/mob/living/M in GLOB.player_list)
			//Dead people only thanks!
			if((M.stat != DEAD) || (!M.client))
				continue
			//They need a brain!
			if(istype(M, /mob/living/carbon/human))
				var/mob/living/carbon/human/H = M
				if(H.should_have_organ(BP_BRAIN) && !H.has_brain())
					continue
			if(M.ckey == find_key)
				selected = M
				break
	return selected
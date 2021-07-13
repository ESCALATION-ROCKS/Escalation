/obj/item
	var/list/armor = list(melee = 0, \
					bullet = 0, \
					laser = 0,\
					energy = 0, \
					bomb = 0, \
					bio = 0, \
					rad = 0)
	var/list/armor_fullblock = list(melee = 0, \
					bullet = 0, \
					laser = 0, \
					energy = 0, \
					bomb = 0, \
					bio = 0, \
					rad = 0)
	var/list/armor_integrity = list() //bodypart bitflag to integrity
	var/sound_armor_damaged = list('sound/bullet/projectile_impact/blt_s_metal1.ogg', \
							'sound/bullet/projectile_impact/blt_s_metal2.ogg', \
							'sound/bullet/projectile_impact/blt_s_metal3.ogg')
	var/sound_armor_broke = list('sound/bullet/projectile_impact/blt_s_metal5.ogg')

/obj/item/New()
	. = ..()
	InitializeArmorIntegrity()

/obj/item/proc/InitializeArmorIntegrity()
	if(length(armor_integrity))
		return
	var/static/list/all_parts
	if(!all_parts)
		all_parts = list(HEAD, FACE, EYES, UPPER_TORSO, LOWER_TORSO, \
					ARM_LEFT, HAND_LEFT, ARM_RIGHT, HAND_RIGHT, \
					LEG_LEFT, FOOT_LEFT, LEG_RIGHT, FOOT_RIGHT)
	for(var/bitpart in all_parts)
		if(body_parts_covered & bitpart)
			armor_integrity["[bitpart]"] = 100

/obj/item/proc/damage_armor(damage, zone)
	if(!zone)
		for(var/zonesex in armor_integrity)
			armor_integrity[zonesex] = max(0, armor_integrity["[zonesex]"] - damage)
	else
		var/old_armor = armor_integrity["[zone]"]
		if(isnull(old_armor))
			return
		armor_integrity["[zone]"] = max(0, armor_integrity["[zone]"] - damage)
		if(old_armor < armor_integrity[zone])
			if((armor_integrity < 0) && length(sound_armor_broke))
				var/sound_damage = pick(sound_armor_broke)
				playsound(src, sound_damage, 85, 0, 3)
			else if(length(sound_armor_damaged))
				var/sound_damage = pick(sound_armor_damaged)
				playsound(src, sound_damage, 75, 0, 2)

/obj/item/proc/heal_armor(heal_amt, zone)
	if(!zone)
		for(var/zonesex in armor_integrity)
			armor_integrity[zonesex] = max(0, armor_integrity[zonesex] + heal_amt)
	else
		var/old_armor = armor_integrity["[zone]"]
		if(isnull(old_armor))
			return
		armor_integrity[zone] = max(0, armor_integrity["[zone]"] + heal_amt)

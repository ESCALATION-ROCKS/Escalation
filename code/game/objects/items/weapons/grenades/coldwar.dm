//sovok granades//
//////////////////
/obj/item/weapon/grenade/frag/f1
	name = "F1 frag grenade"
	desc = "A defensive grenade used by the Soviet Army. Meant to be thrown from behind the cover."
	icon_state = "f1grenade"
	throw_speed = 2
	throw_range = 10
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/offensive)
	num_fragments = 290  //total number of fragments produced by the grenade
	explosion_size = 2

/obj/item/weapon/grenade/frag/rgd5
	name = "RGD-5 grenade"
	desc = "An offensive grenade used by the Soviet Army. Meant to be thrown against enemy positions during a push."
	icon_state = "rgd5grenade"
	throw_speed = 3
	throw_range = 13
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/defensive)
	num_fragments = 170  //total number of fragments produced by the grenade
	explosion_size = 4

///muricane granades////
////////////////////////

/obj/item/weapon/grenade/frag/m67
	name = "M67 frag grenade"
	desc = "A fragmentation grenade used by NATO armies, dubbed 'Pineapple'."
	icon_state = "m67grenade"
	throw_speed = 2
	throw_range = 10
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/defensive)
	num_fragments = 190  //total number of fragments produced by the grenade
	explosion_size = 2

/obj/item/weapon/grenade/frag/m26
	name = "M26 frag grenade"
	desc = "A fragmentation grenade used by US forces, dubbed 'Lemon'."
	icon_state = "m26grenade"
	throw_speed = 3
	throw_range = 8
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/offensive)
	num_fragments = 290  //total number of fragments produced by the grenade
	explosion_size = 3

///bund//////////////////////
/////////////////////////////
/obj/item/weapon/grenade/frag/dm51
	name = "DM51 grenade (offensive)"
	desc = "A dual purpose grenade used by the Bundeswehr. This one does not have a fragmentation jacket."
	icon_state = "dm51offensive"
	throw_speed = 4
	throw_range = 13
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/offensive)
	num_fragments = 190  //total number of fragments produced by the grenade
	explosion_size = 3

/obj/item/weapon/grenade/frag/dm51/def
	name = "DM51 grenade (defensive)"
	icon_state = "dm51grenade"
	desc = "A dual purpose grenade used by the Bundeswehr. This one has it's fragmentation jacket on."
	throw_speed = 3
	throw_range = 10
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/defensive)
	num_fragments = 270  //total number of fragments produced by the grenade
	explosion_size = 2

///heer//////////////////////
/////////////////////////////
/obj/item/weapon/grenade/frag/hdgr78
	name = "HDGr. 78 grenade"
	desc = "A dual purpose grenade used by the Bundesheer."
	icon_state = "hdgr78"
	throw_speed = 4
	throw_range = 13
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/offensive)
	num_fragments = 190  //total number of fragments produced by the grenade
	explosion_size = 3

/obj/item/weapon/grenade/frag/hdgr73
	name = "HDGr. 73 grenade"
	icon_state = "hdgr73"
	desc = "An outdated defensive grenade used by the Bundesheer."
	throw_speed = 3
	throw_range = 10
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/defensive)
	num_fragments = 270  //total number of fragments produced by the grenade
	explosion_size = 2

//////czech/////////
////////////////////

/obj/item/weapon/grenade/frag/rg42
	name = "RG-42 grenade"
	desc = "That's an offensive grenade used by Czech army."
	icon_state = "rg42"
	throw_speed = 3
	throw_range = 13
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/defensive)
	num_fragments = 170  //total number of fragments produced by the grenade
	explosion_size = 4

/obj/item/weapon/grenade/frag/urg86
	name = "URG-86 grenade"
	desc = "That's a defensive grenade used by Czech army. Has a weird shape."
	icon_state = "urg86"
	throw_speed = 2
	throw_range = 10
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/offensive)
	num_fragments = 290  //total number of fragments produced by the grenade
	explosion_size = 2

//////british/////////
////////////////////

/obj/item/weapon/grenade/frag/mills
	name = "mills bomb"
	desc = "An outdated grenade used by the BAF."
	icon_state = "mills"
	throw_speed = 2
	throw_range = 10
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/defensive)
	num_fragments = 190  //total number of fragments produced by the grenade
	explosion_size = 2

/obj/item/weapon/grenade/frag/l2
	name = "L2 frag grenade"
	desc = "A fragmentation grenade used by British forces."
	icon_state = "l2grenade"
	throw_speed = 3
	throw_range = 8
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/offensive)
	num_fragments = 290  //total number of fragments produced by the grenade
	explosion_size = 3

//////finnish/////////
////////////////////
/obj/item/weapon/grenade/frag/sirpalem43
	name = "Sirpalekasikranaatti M43"
	desc = "A fragmentation grenade used by the Finnish Army."
	icon_state = "sirpalem43"
	throw_speed = 2
	throw_range = 10
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/offensive)
	num_fragments = 180  //total number of fragments produced by the grenade
	explosion_size = 2

/obj/item/weapon/grenade/frag/sirpalem41
	name = "Sirpalekasikranaatti M41"
	desc = "An outdated fragmentation grenade used by the Finnish Army."
	icon_state = "sirpalem41"
	throw_speed = 3
	throw_range = 12
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/defensive)
	num_fragments = 220  //total number of fragments produced by the grenade
	explosion_size = 2


//////satchels/////////
////////////////////

/obj/item/weapon/grenade/frag/satchelnato
	name = "C4 explosive satchel"
	desc = "A pack of high explosives, used by NATO armies."
	w_class = 3
	icon_state = "satchelnato"
	throw_speed = 1
	throw_range = 2
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/offensive)
	num_fragments = 70  //total number of fragments produced by the grenade
	det_time = 100
	explosion_size = 4

/obj/item/weapon/grenade/frag/satchelnato/on_explosion(var/turf/O)
	if(explosion_size)
		explosion(O, 2, 3, explosion_size, round(explosion_size/3), 0)

/obj/item/weapon/grenade/frag/satchelnato/attack_self(mob/user)
	if (roundstarted == 0)
		to_chat(user, "<span class='warning'>There is nothing to blow up yet!</span>")
		return
	else
		message_admins("[key_name_admin(user)] activated a satchel charge. ([src.name]).")
		log_game("[key_name_admin(user)] activated a satchel charge.")
		..()

/obj/item/weapon/grenade/frag/satchelnato/New()
	..()
	slowdown_per_slot[slot_l_hand] = 1.5
	slowdown_per_slot[slot_r_hand] = 1.5

/obj/item/weapon/grenade/frag/satchelwp
	name = "explosive satchel"
	desc = "A pack of high explosives, used by WP armies."
	w_class = 3
	icon_state = "satchelwp"
	throw_speed = 1
	throw_range = 2
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/offensive)
	num_fragments = 70  //total number of fragments produced by the grenade
	det_time = 100
	explosion_size = 4

/obj/item/weapon/grenade/frag/satchelwp/on_explosion(var/turf/O)
	if(explosion_size)
		explosion(O, 2, 3, explosion_size, round(explosion_size/3), 0)

/obj/item/weapon/grenade/frag/satchelwp/attack_self(mob/user)
	if (roundstarted == 0)
		to_chat(user, "<span class='warning'>There is nothing to blow up yet!</span>")
		return
	else
		message_admins("[key_name_admin(user)] activated a satchel charge. ([src.name]).")
		log_game("[key_name_admin(user)] activated a satchel charge.")
		..()

/obj/item/weapon/grenade/frag/satchelwp/New()
	..()
	slowdown_per_slot[slot_l_hand] = 1.5
	slowdown_per_slot[slot_r_hand] = 1.5

////////////////////////////////////////////////////////////////////////////////////////////
/////////////////GP's vogs for soviet and muricans//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/weapon/grenade/frag/ugl/shell40mm
	name = "40x46mm 'M381 HE' grenade shell"
	desc = "Cannot be thrown as the usual grenade, by the way."
	icon_state = "M406"
	num_fragments = 130
	throw_speed = 2
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/ugl)
	explosion_size = 1
	throw_range = 30
	sharp = 1
	edge =  1
	arm_sound = 'sound/weapons/gunshot/m203.ogg'


/obj/item/weapon/grenade/frag/ugl/shell40mm/attack_self(mob/user)
	return

/obj/item/weapon/grenade/frag/ugl/vog25
	name = "40x103mm 'VOG-25' grenade shell"
	desc = "Cannot be thrown as the usual grenade, by the way."
	icon_state = "40x103mmshell"
	num_fragments = 160
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/ugl)
	explosion_size = 1
	throw_speed = 2
	throw_range = 30
	sharp = 1
	edge =  1
	arm_sound = 'sound/weapons/gunshot/vog25.ogg'

/obj/item/weapon/grenade/frag/ugl/vog25/attack_self(mob/user)
	return

////////Note to future person - don't rebalance grenades around "bullet" armor value as the vest would then make them immune to shrapnel.

/obj/item/projectile/bullet/pellet/fragment/defensive
	agony = 12
	armor_penetration = -4
	check_armour = "bomb"
	kill_count = 13

	New()
		damage = rand(11, 33)

/obj/item/projectile/bullet/pellet/fragment/offensive
	agony = 9
	armor_penetration = -5
	check_armour = "bomb"
	kill_count = 6

	New()
		damage = rand(8, 29)

/obj/item/projectile/bullet/pellet/fragment/ugl
	agony = 8
	armor_penetration = -5
	check_armour = "bomb"
	kill_count = 6

	New()
		damage = rand(5, 27)





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
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/offensive)
	num_fragments = 270  //total number of fragments produced by the grenade
	explosion_size = 2

//////czech/////////
////////////////////

//they used f1 also as a offensive grenade

/obj/item/weapon/grenade/frag/rg42
	name = "RG-42 grenade"
	desc = "That's a defensive grenade used by Czech army."
	icon_state = "rg42grenade"
	throw_speed = 2
	throw_range = 8
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/strong)
	num_fragments = 230  //total number of fragments produced by the grenade
	explosion_size = 2

////////////////////////////////////////////////////////////////////////////////////////////
/////////////////GP's vogs for soviet and muricans//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/weapon/grenade/frag/shell40mm
	name = "40x46mm 'M381 HE' grenade shell"
	desc = "Cannot be thrown as the usual grenade, by the way."
	icon_state = "M406"
	num_fragments = 130 //less powerful than a regular frag grenade
	//arm_sound = 'sound/weapons/gunshot/grenadelaunch.ogg'
	throw_speed = 2
	throw_range = 30
	arm_sound = 'sound/weapons/grenlauncher.wav'


/obj/item/weapon/grenade/frag/shell40mm/attack_self(mob/user)
	return

/obj/item/weapon/grenade/frag/vog25
	name = "40x103mm 'VOG-25' grenade shell"
	desc = "Cannot be thrown as the usual grenade, by the way."
	icon_state = "40x103mmshell"
	num_fragments = 160 //less powerful than a regular frag grenade
	//arm_sound = 'sound/weapons/gunshot/grenadelaunch.ogg'
	throw_speed = 2
	throw_range = 30
	arm_sound = 'sound/weapons/grenlauncher.wav'

/obj/item/weapon/grenade/frag/vog25/attack_self(mob/user)
	return


/obj/item/projectile/bullet/pellet/fragment/defensive
	damage = 10
	agony = 7
	armor_penetration = -5
	check_armour = "bomb"

	kill_count = 13

/obj/item/projectile/bullet/pellet/fragment/offensive
	damage = 12
	agony = 14
	armor_penetration = -10
	check_armour = "bomb"

	kill_count = 6





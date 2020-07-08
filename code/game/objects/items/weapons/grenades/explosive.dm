/obj/item/projectile/bullet/pellet/fragment
	damage = 7
	range_step = 2 //controls damage falloff with distance. projectiles lose a "pellet" each time they travel this distance. Can be a non-integer.

	base_spread = 0 //causes it to be treated as a shrapnel explosion instead of cone
	spread_step = 20

	silenced = 1
	fire_sound = null
	no_attack_log = 1
	muzzle_type = null
	check_armour = "bomb"



/obj/item/projectile/bullet/pellet/fragment/strong
	damage = 15
	check_armour = "bomb"


/obj/item/weapon/grenade/frag
	name = "fragmentation grenade"
	desc = "A military fragmentation grenade, designed to explode in a deadly shower of fragments, while avoiding massive structural damage."
	icon_state = "frggrenade"

	var/list/fragment_types = list(/obj/item/projectile/bullet/pellet/fragment = 1)
	var/num_fragments = 72  //total number of fragments produced by the grenade
	var/explosion_size = 2   //size of the center explosion

	//The radius of the circle used to launch projectiles. Lower values mean less projectiles are used but if set too low gaps may appear in the spread pattern
	var/spread_range = 7 //leave as is, for some reason setting this higher makes the spread pattern have gaps close to the epicenter

/obj/item/weapon/grenade/frag/detonate()
	..()

	var/turf/O = get_turf(src)
	if(!O) return

	if(explosion_size)
		on_explosion(O)

	src.fragmentate(O, num_fragments, spread_range, fragment_types)

	qdel(src)


/obj/proc/fragmentate(var/turf/T=get_turf(src), var/fragment_number = 30, var/spreading_range = 5, var/list/fragtypes=list(/obj/item/projectile/bullet/pellet/fragment/))
	set waitfor = 0
	var/list/target_turfs = getcircle(T, spreading_range)
	var/fragments_per_projectile = round(fragment_number/target_turfs.len)

	for(var/turf/O in target_turfs)
		sleep(0)
		var/fragment_type = pickweight(fragtypes)
		var/obj/item/projectile/bullet/pellet/fragment/P = new fragment_type(T)
		P.pellets = fragments_per_projectile
		P.shot_from = src.name

		P.launch(O)

		//Make sure to hit any mobs in the source turf
		for(var/mob/living/M in T)
			//lying on a frag grenade while the grenade is on the ground causes you to absorb most of the shrapnel.
			//you will most likely be dead, but others nearby will be spared the fragments that hit you instead.
			if(M.lying && isturf(src.loc))
				P.attack_mob(M, 0, 5)
			else if(!M.lying && src.loc != get_turf(src)) //if it's not on the turf, it must be in the mob!
				P.attack_mob(M, 0, 25) //you're holding a grenade, dude!
			else
				P.attack_mob(M, 0, 100) //otherwise, allow a decent amount of fragments to pass



/obj/item/weapon/grenade/frag/proc/on_explosion(var/turf/O)
	if(explosion_size)
		explosion(O, -1, -1, explosion_size, round(explosion_size/2), 0)

/obj/item/weapon/grenade/frag/shell
	name = "fragmentation grenade"
	desc = "A light fragmentation grenade, designed to be fired from a launcher. It can still be activated and thrown by hand if necessary."
	icon_state = "fragshell"

	num_fragments = 50 //less powerful than a regular frag grenade

/obj/item/weapon/grenade/frag/high_yield
	name = "fragmentation bomb"
	desc = "Larger and heavier than a standard fragmentation grenade, this device is extremely dangerous. It cannot be thrown as far because of its weight."
	icon_state = "frag"

	w_class = ITEM_SIZE_NORMAL
	throw_speed = 3
	throw_range = 5 //heavy, can't be thrown as far

	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment=1,/obj/item/projectile/bullet/pellet/fragment/strong=4)
	num_fragments = 200  //total number of fragments produced by the grenade
	explosion_size = 3

/obj/item/weapon/grenade/frag/high_yield/on_explosion(var/turf/O)
	if(explosion_size)
		explosion(O, -1, round(explosion_size/2), explosion_size, round(explosion_size/2), 0) //has a chance to blow a hole in the floor

////////////////////////////////////////////////////////////////////////////////////////////
/////////////////Mortar Shell Values//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/mortar_shell
	name = "\improper 80mm mortar shell"
	desc = "An unlabeled 80mm mortar shell, probably a casing."
	icon = 'icons/Marine/mortar.dmi'
	icon_state = "mortar_ammo_cas"
	w_class = 5
	var/list/fragment_types = list(/obj/item/projectile/bullet/pellet/fragment = 1)
	var/num_fragments = 5  //total number of fragments produced by the grenad
	//The radius of the circle used to launch projectiles. Lower values mean less projectiles are used but if set too low gaps may appear in the spread pattern
	var/spread_range = 7 //leave as is, for some reason setting this higher makes the spread pattern have gaps close to the epicenter

/obj/item/mortar_shell/proc/detonate(var/turf/T)

	forceMove(T)

obj/item/mortar_shell/he
	name = "\improper 80mm High Explosive mortar shell"
	desc = "An 80mm mortar shell, loaded with a Highly Explosive Charge."
	icon = 'icons/Marine/mortar.dmi'
	icon_state = "mortar_ammo_he"
	spread_range = 0

/obj/item/mortar_shell/he/detonate(var/turf/T)

	explosion(T, 0, 3, 5, 7)

obj/item/mortar_shell/frag
	name = "\improper 80mm Fragmentation mortar shell"
	desc = "An 80mm mortar shell, loaded with a small charge surrounded by Deadly Metal Pellets."
	icon = 'icons/Marine/mortar.dmi'
	icon_state = "mortar_ammo_he"
	fragment_types = list(/obj/item/projectile/bullet/pellet/fragment/offensive = 1)
	num_fragments = 290  //total number of fragments produced by the grenade
	spread_range = 8

/obj/item/mortar_shell/frag/detonate(var/turf/T)

	explosion(T, 0, 1, 2, 7)
	fragmentate(T, 290, 8, list(/obj/item/projectile/bullet/pellet/fragment/offensive = 1))

/obj/item/mortar_shell/smoke
	name = "\improper 80mm smoke mortar shell"
	desc = "An 80mm mortar shell, loaded with smoke dispersal agents."
	icon_state = "mortar_ammo_smk"
	var/datum/effect/effect/system/smoke_spread/bad/smoke

	New()
		..()
		smoke = new /datum/effect/effect/system/smoke_spread/bad()
		smoke.attach(src)

/obj/item/mortar_shell/smoke/detonate(var/turf/T)

	explosion(T, 0, 1, 2, 7)
	playsound(T, 'sound/effects/smoke.ogg', 25, 1, 4)
	forceMove(T) //AAAAAAAA
	smoke.set_up(6, 0, T, null, 6)
	smoke.start()
	smoke = null
	qdel(src)

/obj/item/mortar_shell/flare
	name = "\improper 80mm flare mortar shell"
	desc = "An 80mm mortar shell, loaded with an illumination flare."
	icon_state = "mortar_ammo_flr"


/obj/item/mortar_shell/flare/detonate(var/turf/T)
//WIP

/obj/structure/closet/crate/mortar_ammo/mortar_kit
	name = "\improper M402 mortar kit"
	desc = "A crate containing a basic set of a mortar and some shells, to get an engineer started."

/obj/structure/closet/crate/mortar_ammo/mortar_kit/New()
	..()
	new /obj/item/mortar_kit(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/device/binoculars/nato/range(src)

/obj/structure/closet/crate/mortar_ammo/mortar_ammo_offensive/New()
	..()
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/he(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)
	new /obj/item/mortar_shell/frag(src)

/obj/structure/closet/crate/mortar_ammo/mortar_ammo_support/New()
	..()
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/flare(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)
	new /obj/item/mortar_shell/smoke(src)


//Will have to create WP versions if sprites differ between both factions.

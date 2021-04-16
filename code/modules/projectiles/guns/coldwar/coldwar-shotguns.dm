////NOTE: All shotguns can hold +1 in the chamber, so if you want 8 total capacity the max_shells is 7.

/////////////////////////bayonet code port for shotguns///////////////////////

/obj/item/weapon/gun/projectile/shotgun
	var/bayonet_type = null
	var/recentload = 0
	var/bayonet_attachable = 0
	var/obj/item/weapon/material/knife/bayonet/knife = null

/obj/item/weapon/gun/projectile/shotgun/New()
	..()
	src.verbs -= /obj/item/weapon/gun/projectile/shotgun/verb/remove_bayonet

/obj/item/weapon/gun/projectile/shotgun/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, src.bayonet_type) && bayonet_attachable)
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp += W.sharp
		src.force += W.force
		bayonet_attachable = 0
		to_chat(user, "<span class='notice'>You attach [knife.name] to the [src].</span>")
		src.verbs += /obj/item/weapon/gun/projectile/shotgun/verb/remove_bayonet
		update_icon()
	..()

/obj/item/weapon/gun/projectile/shotgun/update_icon()
	..()
	if(knife)
		var/image/I = image('icons/obj/bayonets.dmi', src, knife.icon_state)
		I.pixel_x += 10
		I.pixel_y += 10
		overlays += I
	else
		overlays.Cut()

/obj/item/weapon/gun/projectile/shotgun/verb/remove_bayonet()
	set name = "Detach Bayonet"
	set category = "Object"
	set popup_menu = 1
	set src in usr

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = FALSE
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		bayonet_attachable = 1
		to_chat(usr, "<span class='notice'>You detach the bayonet from the [src].</span>")
		src.verbs -= /obj/item/weapon/gun/projectile/shotgun/verb/remove_bayonet
		update_icon()

///////////////////////bayonet code ends here//////////////////////////

///////////////////shell loading cooldown/////////////////////
/obj/item/weapon/gun/projectile/shotgun/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(world.time >= recentload + 4)
		recentload = world.time
		if(istype(W, /obj/item/ammo_casing/ga12/))
			..()
		if(istype(W, /obj/item/ammo_magazine/box/clip/ga12))
			..()
	else
		to_chat(user, "<span class='warning'>[src] is not ready to be loaded again!</span>")


//////Coldwar pump shotguns

/obj/item/weapon/gun/projectile/shotgun/pump/r870
	name = "Remington 870"
	desc = "An outdated pump-action shotgun used by the USMC. Chambers seven 12ga shells and one in the chamber."
	icon_state = "shotgunplaceholder-empty" ///Empty item state so it shows that they start empty, icons dont update until you pump
	item_state = "shotgunplaceholder"
	wielded_item_state = "shotgunplaceholder-wielded"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = null
	magazine_type = null
	caliber = "12ga"
	w_class = ITEM_SIZE_HUGE
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	max_shells = 7 //+1
	one_hand_penalty = 5
	force = 15
	accuracy = 3.4
	jam_chance = 0.010
	slowdown_general = 0.20
	bayonet_type = /obj/item/weapon/material/knife/bayonet/usmc
	bayonet_attachable = 1
	fire_sound = 'sound/weapons/gunshot/r870.ogg'
	picksound = 'sound/items/interactions/rifle_draw.ogg'
	drop_sound = 'sound/items/interactions/drop_gun.ogg'
	reload_sound = 'sound/weapons/gunporn/r870_shell_insert.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/r870_dist.ogg'
	empty_sound = 'sound/weapons/gunhandling/gen_empty.ogg'


/obj/item/weapon/gun/projectile/shotgun/pump/r870/pump(mob/M as mob)
	playsound(M, 'sound/weapons/gunporn/r870_pump.ogg', 60, 1)

	if(chambered)//We have a shell in the chamber - Only updates icon_state because who gives a fuck otherwise
		chambered.forceMove(get_turf(src))//Eject casing
		if(LAZYLEN(chambered.casing_sound))
			playsound(loc, chambered.casing_sound, 50, 1)
		icon_state = "shotgunplaceholder-empty"
		item_state = "shotgunplaceholder-empty"
		wielded_item_state = "shotgunplaceholder-wielded-empty"
		chambered = null

	if(loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		icon_state = "shotgunplaceholder"
		item_state = "shotgunplaceholder"
		wielded_item_state = "shotgunplaceholder-wielded"
		chambered = AC

	update_icon()
	update_held_icon()


/obj/item/weapon/gun/projectile/shotgun/pump/r870/load_ammo(var/obj/item/A, mob/user)
	..()
	var/obj/item/ammo_magazine/AM = user.get_active_hand(A)

	if(AM.stored_ammo.len == 0)
		qdel(AM)
		return

	else return

/obj/item/weapon/gun/projectile/shotgun/pump/toz194
	name = "TOZ-194"
	desc = "A pump-action shotgun used by the SA. Chambers six 12ga shells and one in the chamber."
	icon_state = "shotgunplaceholder-empty" ///Empty item state so it shows that they start empty, icons dont update until you pump
	item_state = "shotgunplaceholder"
	wielded_item_state = "shotgunplaceholder-wielded"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = null
	magazine_type = null
	caliber = "12ga"
	w_class = ITEM_SIZE_HUGE
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	max_shells = 6 //+1
	one_hand_penalty = 5
	force = 15
	accuracy = 3.4
	jam_chance = 0.010
	slowdown_general = 0.20
	bayonet_type = null
	bayonet_attachable = 0
	fire_sound = 'sound/weapons/gunshot/toz194.ogg'
	picksound = 'sound/items/interactions/rifle_draw.ogg'
	drop_sound = 'sound/items/interactions/drop_gun.ogg'
	reload_sound = 'sound/weapons/gunporn/toz194_shell_insert.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/toz194_dist.ogg'
	empty_sound = 'sound/weapons/gunhandling/gen_empty.ogg'


/obj/item/weapon/gun/projectile/shotgun/toz194/pump/proc/pump(mob/M as mob)
	playsound(M, 'sound/weapons/gunporn/toz194_pump.ogg', 60, 1)

	if(chambered)//We have a shell in the chamber - Only updates icon_state because who gives a fuck otherwise
		chambered.forceMove(get_turf(src))//Eject casing
		if(LAZYLEN(chambered.casing_sound))
			playsound(loc, chambered.casing_sound, 50, 1)
		icon_state = "shotgunplaceholder-empty"
		item_state = "shotgunplaceholder-empty"
		wielded_item_state = "shotgunplaceholder-wielded-empty"
		chambered = null

	if(loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		icon_state = "shotgunplaceholder"
		item_state = "shotgunplaceholder"
		wielded_item_state = "shotgunplaceholder-wielded"
		chambered = AC

	update_icon()
	update_held_icon()


/obj/item/weapon/gun/projectile/shotgun/toz194/load_ammo(var/obj/item/A, mob/user)
	..()
	var/obj/item/ammo_magazine/AM = user.get_active_hand(A)

	if(AM.stored_ammo.len == 0)
		qdel(AM)
		return

	else return


/////DOUBLE BARRELS AKA LE HOUSE SHOTGUN
/obj/item/weapon/gun/projectile/shotgun/doublebarrel/r1894
	name = "Remington 1894"
	desc = "A true classic. Chambers two 12ga shells."
	icon_state = "dshotgunplaceholder"
	item_state = "shotgunplaceholder"
	wielded_item_state = "shotgunplaceholder-wielded"
	load_method = SINGLE_CASING|SPEEDLOADER
	handle_casings = CYCLE_CASINGS
	max_shells = 2
	w_class = ITEM_SIZE_HUGE
	force = 15
	flags =  CONDUCT
	ammo_type = null
	caliber = "12ga"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 1)
	one_hand_penalty = 5
	force = 15
	accuracy = 3.4
	jam_chance = 0.010
	slowdown_general = 0.20
	bayonet_type = null
	bayonet_attachable = 0
	fire_sound = 'sound/weapons/gunshot/toz194.ogg'
	picksound = 'sound/items/interactions/rifle_draw.ogg'
	drop_sound = 'sound/items/interactions/drop_gun.ogg'
	reload_sound = 'sound/weapons/gunporn/toz194_shell_insert.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/toz194_dist.ogg'
	empty_sound = 'sound/weapons/gunhandling/gen_empty.ogg'
	burst_delay = 0
	firemodes = list(
		list(mode_name="fire one barrel at a time", burst=1),
		list(mode_name="fire both barrels at once", burst=2),
		)


/obj/item/weapon/gun/projectile/shotgun/doublebarrel/r1894/load_ammo(var/obj/item/A, mob/user)
	..()
	var/obj/item/ammo_magazine/AM = user.get_active_hand(A)

	if(AM.stored_ammo.len == 0)
		qdel(AM)
		return

	else return
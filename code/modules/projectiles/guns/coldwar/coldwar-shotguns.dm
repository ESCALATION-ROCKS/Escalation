/////////---------------BOLT ACTIONS

/obj/item/weapon/gun/projectile/rifle/pumpaction/
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	var/bolt_open = 0
	var/bayonet_type = null
	var/bayonet_attachable = 0
	var/recentload = 0
	var/obj/item/weapon/material/knife/bayonet/knife = null

/obj/item/weapon/gun/projectile/rifle/pumpaction/New()
	..()
	src.verbs -= /obj/item/weapon/gun/projectile/rifle/pumpaction/verb/remove_bayonet

/obj/item/weapon/gun/projectile/rifle/pumpaction/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, src.bayonet_type) && bayonet_attachable)
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp += W.sharp
		src.force += W.force
		bayonet_attachable = 0
		to_chat(user, "<span class='notice'>You attach [knife.name] to the [src].</span>")
		src.verbs += /obj/item/weapon/gun/projectile/rifle/pumpaction/verb/remove_bayonet
		update_icon()
	if(istype(W, /obj/item/ammo_magazine/box/paper))
		return
	..()

/obj/item/weapon/gun/projectile/rifle/pumpaction/update_icon()
	..()
	if(knife)
		var/image/I = image('icons/obj/coldwar/bayonets.dmi', src, knife.icon_state)
		I.pixel_x += 10
		I.pixel_y += 10
		overlays += I
	else
		overlays.Cut()

/obj/item/weapon/gun/projectile/rifle/pumpaction/verb/remove_bayonet()
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
		src.verbs -= /obj/item/weapon/gun/projectile/rifle/pumpaction/verb/remove_bayonet
		update_icon()

//bayonet for pumpactions

/////////////////////////////////////////
//bolt-action operation mechanics below//
/////////////////////////////////////////

/obj/item/weapon/gun/projectile/rifle/pumpaction/consume_next_projectile() //necessary to chamber properly
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/rifle/pumpaction/attack_self(mob/living/user as mob) //the bolt action operation itself
	bolt_open = !bolt_open
	if(do_after(user, 2, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltback.ogg', 50, 1)

			if(chambered)//We have a shell in the chamber
				chambered.forceMove(get_turf(src))//Eject casing
				if(LAZYLEN(chambered.casing_sound))
					playsound(loc, chambered.casing_sound, 50, 1)
				chambered = null
				to_chat(user, "<span class='notice'>You pump the chamber open, ejecting a shell!</span>")
			else
				to_chat(user, "<span class='notice'>You pump the chamber open.</span>")
		else
			to_chat(user, "<span class='notice'>You pump the chamber closed.</span>")
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltforward.ogg', 50, 1)
			bolt_open = 0
			if(loaded.len)
				var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
				loaded -= AC //Remove casing from loaded list.
				chambered = AC

		add_fingerprint(user)
		update_icon()

/obj/item/weapon/gun/projectile/rifle/pumpaction/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the chamber is open!</span>")
		return 0
	return ..()

/*/obj/item/weapon/gun/projectile/rifle/pumpaction/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()*/ //Shotguns can be loaded with the chamber open or closed.

/obj/item/weapon/gun/projectile/rifle/pumpaction/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		to_chat(user, "<span class='warning'>You can't unload from the tube while the chamber is closed!</span>")
		return
	..()



//////Coldwar pump shotguns

/obj/item/weapon/gun/projectile/rifle/pumpaction/r870
	name = "Remington 870"
	desc = "An outdated pump action shotgun used by the USMC. Holds seven 12ga shells and one in the chamber."
	icon_state = "r870-empty"
	item_state = "r870"
	force = 15
	caliber = "12ga"
	wielded_item_state = "r870-wielded"
	w_class = ITEM_SIZE_LARGE
	screen_shake = 1 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|AMMO_BOX
	max_shells = 7
	ammo_type = null
	one_hand_penalty = 6
	accuracy = 2.5
	cocked_sound = null ///Plays right after inserting a shell, unnecesary for shotguns
	fire_sound = 'sound/weapons/gunshot/r870.ogg'
	picksound = 'sound/items/interactions/rifle_draw.ogg'
	drop_sound = 'sound/items/interactions/drop_gun.ogg'
	reload_sound = 'sound/weapons/gunporn/r870_shell_insert.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/r870_dist.ogg'
	empty_sound = 'sound/weapons/gunhandling/gen_empty.ogg'
	unload_sound = 'sound/weapons/gunporn/m203_openbarrel.ogg'
	jam_chance = 0.010
	slowdown_general = 0.25
	bayonet_attachable = 1
	bayonet_type = /obj/item/weapon/material/knife/bayonet/usmc/

/obj/item/weapon/gun/projectile/rifle/pumpaction/r870/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/rifle/pumpaction/r870/attack_self(mob/living/user as mob)
	bolt_open = !bolt_open
	if(do_after(user, 2, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/r870_pumpback.ogg', 50, 1)

			if(chambered)//We have a shell in the chamber
				chambered.forceMove(get_turf(src))//Eject casing
				if(LAZYLEN(chambered.casing_sound))
					playsound(loc, chambered.casing_sound, 50, 1)
				chambered = null
				to_chat(user, "<span class='notice'>You pump the chamber open, ejecting a shell!</span>")
			else
				to_chat(user, "<span class='notice'>You pump the chamber open.</span>")
		else
			to_chat(user, "<span class='notice'>You pump the chamber closed.</span>")
			playsound(src.loc, 'sound/weapons/gunporn/r870_pumpforward.ogg', 50, 1)
			bolt_open = 0
			if(loaded.len)
				var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
				loaded -= AC //Remove casing from loaded list.
				chambered = AC

		add_fingerprint(user)
		update_icon()

/obj/item/weapon/gun/projectile/rifle/pumpaction/r870/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the chamber is open!</span>")
		return 0
	return ..()

/*/obj/item/weapon/gun/projectile/rifle/pumpaction/r870/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()*/ //Shotguns can be loaded with the chamber open or closed.

/obj/item/weapon/gun/projectile/rifle/pumpaction/r870/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		to_chat(user, "<span class='warning'>You can't unload from the tube while the chamber is closed!</span>")
		return
	..()

/obj/item/weapon/gun/projectile/rifle/pumpaction/r870/update_icon()
	..()
	if(bolt_open)
		icon_state = "r870-open"
	else
		icon_state = "r870"


/obj/item/weapon/gun/projectile/rifle/pumpaction/r870/load_ammo(var/obj/item/A, mob/user)
	if(world.time >= recentload + 2) ////Number determines shell load speed
		recentload = world.time
		var/obj/item/ammo_magazine/AM = user.get_active_hand(A)
		..()

		if(AM.stored_ammo.len == 0)
			qdel(AM)
			return

	else
		to_chat(user, "<span class='warning'>[src] is not ready to be loaded again!</span>")



/obj/item/weapon/gun/projectile/rifle/pumpaction/ks23
	name = "KS-23"
	desc = "A pump action carbine used by the Soviet special units. Holds three 6ga shells and one in the chamber."
	icon_state = "ks23-empty"
	item_state = "ks23"
	force = 15
	caliber = "6ga"
	wielded_item_state = "ks23-wielded"
	w_class = ITEM_SIZE_LARGE
	screen_shake = 2 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|AMMO_BOX
	max_shells = 3
	ammo_type = null
	one_hand_penalty = 12
	accuracy = 2.1
	cocked_sound = null ///Plays right after inserting a shell, unnecesary for shotguns
	fire_sound = 'sound/weapons/gunshot/ks23.ogg'
	picksound = 'sound/items/interactions/rifle_draw.ogg'
	drop_sound = 'sound/items/interactions/drop_gun.ogg'
	reload_sound = 'sound/weapons/gunporn/ks23_shell_insert.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/toz194_dist.ogg'
	empty_sound = 'sound/weapons/gunhandling/gen_empty.ogg'
	unload_sound = 'sound/weapons/gunporn/gp25_openbarrel.ogg'
	jam_chance = 0.010
	slowdown_general = 0.25
	bayonet_attachable = 0
	bayonet_type = null

/obj/item/weapon/gun/projectile/rifle/pumpaction/ks23/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/rifle/pumpaction/ks23/attack_self(mob/living/user as mob)
	bolt_open = !bolt_open
	if(do_after(user, 2, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/ks23_pumpback.ogg', 50, 1)

			if(chambered)//We have a shell in the chamber
				chambered.forceMove(get_turf(src))//Eject casing
				if(LAZYLEN(chambered.casing_sound))
					playsound(loc, chambered.casing_sound, 50, 1)
				chambered = null
				to_chat(user, "<span class='notice'>You pump the chamber open, ejecting a shell!</span>")
			else
				to_chat(user, "<span class='notice'>You pump the chamber open.</span>")
		else
			to_chat(user, "<span class='notice'>You pump the chamber closed.</span>")
			playsound(src.loc, 'sound/weapons/gunporn/ks23_pumpforward.ogg', 50, 1)
			bolt_open = 0
			if(loaded.len)
				var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
				loaded -= AC //Remove casing from loaded list.
				chambered = AC

		add_fingerprint(user)
		update_icon()

/obj/item/weapon/gun/projectile/rifle/pumpaction/ks23/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the chamber is open!</span>")
		return 0
	return ..()

/*/obj/item/weapon/gun/projectile/rifle/pumpaction/ks23/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()*/ //Shotguns can be loaded with the chamber open or closed.

/obj/item/weapon/gun/projectile/rifle/pumpaction/ks23/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		to_chat(user, "<span class='warning'>You can't unload from the tube while the chamber is closed!</span>")
		return
	..()

/obj/item/weapon/gun/projectile/rifle/pumpaction/ks23/update_icon()
	..()
	if(bolt_open)
		icon_state = "ks23-open"
	else
		icon_state = "ks23"


/obj/item/weapon/gun/projectile/rifle/pumpaction/ks23/load_ammo(var/obj/item/A, mob/user)
	if(world.time >= recentload + 2) ////Number determines shell load speed
		recentload = world.time
		var/obj/item/ammo_magazine/AM = user.get_active_hand(A)
		..()

		if(AM.stored_ammo.len == 0)
			qdel(AM)
			return

	else
		to_chat(user, "<span class='warning'>[src] is not ready to be loaded again!</span>")



/obj/item/weapon/gun/projectile/rifle/pumpaction/toz194 ///Unused
	name = "TOZ-194"
	desc = "A pump action shotgun used by the SA. Holds six 12ga shells and one in the chamber."
	icon_state = "toz194-empty"
	item_state = "toz194"
	force = 15
	caliber = "12ga"
	wielded_item_state = "toz194-wielded"
	w_class = ITEM_SIZE_LARGE
	screen_shake = 1 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|AMMO_BOX
	max_shells = 6
	ammo_type = null
	one_hand_penalty = 6
	accuracy = 2.3
	cocked_sound = null ///Plays right after inserting a shell, unnecesary for shotguns
	fire_sound = 'sound/weapons/gunshot/toz194.ogg'
	picksound = 'sound/items/interactions/rifle_draw.ogg'
	drop_sound = 'sound/items/interactions/drop_gun.ogg'
	reload_sound = 'sound/weapons/gunporn/toz194_shell_insert.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/toz194_dist.ogg'
	empty_sound = 'sound/weapons/gunhandling/gen_empty.ogg'
	unload_sound = 'sound/weapons/gunporn/gp25_openbarrel.ogg'
	jam_chance = 0.010
	slowdown_general = 0.25
	bayonet_attachable = 0
	bayonet_type = null

/obj/item/weapon/gun/projectile/rifle/pumpaction/toz194/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/rifle/pumpaction/toz194/attack_self(mob/living/user as mob)
	bolt_open = !bolt_open
	if(do_after(user, 2, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/toz194_pumpback.ogg', 50, 1)

			if(chambered)//We have a shell in the chamber
				chambered.forceMove(get_turf(src))//Eject casing
				if(LAZYLEN(chambered.casing_sound))
					playsound(loc, chambered.casing_sound, 50, 1)
				chambered = null
				to_chat(user, "<span class='notice'>You pump the chamber open, ejecting a shell!</span>")
			else
				to_chat(user, "<span class='notice'>You pump the chamber open.</span>")
		else
			to_chat(user, "<span class='notice'>You pump the chamber closed.</span>")
			playsound(src.loc, 'sound/weapons/gunporn/toz194_pumpforward.ogg', 50, 1)
			bolt_open = 0
			if(loaded.len)
				var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
				loaded -= AC //Remove casing from loaded list.
				chambered = AC

		add_fingerprint(user)
		update_icon()

/obj/item/weapon/gun/projectile/rifle/pumpaction/toz194/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the chamber is open!</span>")
		return 0
	return ..()

/*/obj/item/weapon/gun/projectile/rifle/pumpaction/toz194/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()*/ //Shotguns can be loaded with the chamber open or closed.

/obj/item/weapon/gun/projectile/rifle/pumpaction/toz194/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		to_chat(user, "<span class='warning'>You can't unload from the tube while the chamber is closed!</span>")
		return
	..()

/obj/item/weapon/gun/projectile/rifle/pumpaction/toz194/update_icon()
	..()
	if(bolt_open)
		icon_state = "toz194-open"
	else
		icon_state = "toz194"


/obj/item/weapon/gun/projectile/rifle/pumpaction/toz194/load_ammo(var/obj/item/A, mob/user)
	if(world.time >= recentload + 2) ////Number determines shell load speed
		recentload = world.time
		var/obj/item/ammo_magazine/AM = user.get_active_hand(A)
		..()

		if(AM.stored_ammo.len == 0)
			qdel(AM)
			return

	else
		to_chat(user, "<span class='warning'>[src] is not ready to be loaded again!</span>")








/////i'll make doublebarrels later. maybe never. -severepwnage
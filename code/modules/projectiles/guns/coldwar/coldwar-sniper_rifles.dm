/obj/item/weapon/gun/projectile/automatic/rifle/m21
	name = "M21"
	desc = "A standard-issue USMC marksman rifle."
	icon_state = "m21scoped"
	item_state = "m21"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	screen_shake = 2
	w_class = 5
	accuracy = 5
	force = 15
	caliber = "762x51"
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51s, /obj/item/ammo_magazine/c762x51m)
	load_method = MAGAZINE
	magazine_type = null
	wielded_item_state = "m21-wielded"
	bayonet_attachable = 1
	bayonet_type = /obj/item/weapon/material/knife/bayonet/usmc/
	jam_chance = 0.4
	dist_shot_sound = 'sound/weapons/gunshot/dist/rifle_dist.ogg'
	slowdown_general = 0.5
	fire_sound = 'sound/weapons/gunshot/m14.ogg'
	wielded_item_state = "m21-wielded"
	unload_sound = 'sound/weapons/gunporn/m14_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/m14_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m14_charge.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/rifle_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=8.5,    move_delay=null, one_hand_penalty=10, burst_accuracy=null, dispersion=null),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/m21/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "m21scoped"
		wielded_item_state = "m21-wielded"
	else
		icon_state = "m21scoped-empty"
		wielded_item_state = "m21-wielded-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/m21/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 3)

/obj/item/weapon/gun/projectile/automatic/rifle/svd
	name = "SVD"
	desc = "A standard-issue Soviet Army and NVA DDR marksman rifle. Chambers 7.62x54mmR rounds."
	icon_state = "svd"
	item_state = "svd"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	w_class = 5
	force = 15
	max_shells = 10
	screen_shake = 2
	caliber = "762x54"
	ammo_type = null
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x54s
	one_hand_penalty = 10
	bayonet_attachable = 1
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h3/
	accuracy = 5
	fire_sound = 'sound/weapons/gunshot/svd.ogg'
	wielded_item_state = "svd-wielded"
	unload_sound = 'sound/weapons/gunporn/svd_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/svd_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/svd_boltback.ogg'
	jam_chance = 0.360
	dist_shot_sound = 'sound/weapons/gunshot/dist/rifle_dist.ogg'
	slowdown_general = 0.30

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=7,    move_delay=null, one_hand_penalty=10, burst_accuracy=null, dispersion=null),
		)


/obj/item/weapon/gun/projectile/automatic/rifle/svd/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "svd"
		wielded_item_state = "svd-wielded"
	else
		icon_state = "svd-empty"
		wielded_item_state = "svd-wielded-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/svd/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 3)

/obj/item/weapon/gun/projectile/automatic/rifle/g3sg1
	name = "G3SG1"
	desc = "A scoped Bundeswehr combat rifle. Chambers 7.62x51 rounds."
	icon_state = "g3sg1"
	item_state = "g3sg1"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x51"
	force = 15
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = null
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51s, /obj/item/ammo_magazine/c762x51m)
	magazine_type = null
	screen_shake = 2
	one_hand_penalty = 5
	bayonet_type = /obj/item/weapon/material/knife/bayonet/bdw/
	bayonet_attachable = 1
	accuracy = 4.7
	wielded_item_state = "g3sg1-wielded"
	fire_sound = 'sound/weapons/gunshot/g3sg1.ogg'
	unload_sound = 'sound/weapons/gunporn/g3_magout.ogg' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/g3_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/g3_boltpull.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/g3_dist.ogg'
	jam_chance = 0.25
	slowdown_general = 0.30

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=8.5,    move_delay=null, one_hand_penalty=10, burst_accuracy=null, dispersion=null),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/g3sg1/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "g3sg1"
		wielded_item_state = "g3sg1-wielded"
	else
		icon_state = "g3sg1-empty"
		wielded_item_state = "g3sg1-wielded-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/g3sg1/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 3)

/obj/item/weapon/gun/projectile/automatic/rifle/ssg58
	name = "SSG 58"
	desc = "The sniper configuration of an outdated Bundesheer combat rifle. Chambers 7.62x51 rounds."
	icon_state = "ssg58"
	item_state = "ssg58"
	force = 15
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x51"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = null
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51s, /obj/item/ammo_magazine/c762x51m)
	magazine_type = null
	screen_shake = 2
	one_hand_penalty = 5
	bayonet_type = /obj/item/weapon/material/knife/bayonet/bdw/
	bayonet_attachable = 1
	accuracy = 4.7
	wielded_item_state = "ssg58-wielded"
	fire_sound = 'sound/weapons/gunshot/fnfal.ogg'
	unload_sound = 'sound/weapons/gunporn/fnfal_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/fnfal_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/fnfal_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/fnfal_dist.ogg'
	jam_chance = 0.25
	slowdown_general = 0.30

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=8.5,    move_delay=null, one_hand_penalty=10, burst_accuracy=null, dispersion=null),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/ssg58/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "ssg58"
		wielded_item_state = "ssg58-wielded"
	else
		icon_state = "ssg58-empty"
		wielded_item_state = "ssg58-wielded-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/ssg58/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 3)


/obj/item/weapon/gun/projectile/automatic/rifle/wa2000
	name = "WA2000"
	desc = "An incredibly rare and accurate semi-automatic bullpup sniper rifle. Chambers 7.62x51 rounds."
	icon_state = "wa2000"
	item_state = "wa2000"
	w_class = 5
	force = 15
	screen_shake = 1
	max_shells = 6
	load_method = MAGAZINE
	caliber = "762x51"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	bayonet_type = /obj/item/weapon/material/knife/bayonet/bdw/
	bayonet_attachable = 1
	ammo_type = null
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51wa)
	magazine_type = null
	one_hand_penalty = 6
	accuracy = 6
	wielded_item_state = "wa2000-wielded"
	fire_sound = 'sound/weapons/gunshot/g3sg1.ogg'
	unload_sound = 'sound/weapons/gunporn/g3_magout.ogg' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/g3_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/g3_boltpull.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/g3_dist.ogg'
	jam_chance = 0.25
	slowdown_general = 0.30

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=9,    move_delay=null, one_hand_penalty=6, burst_accuracy=null,          dispersion=null,           automatic = 0)
	)
/obj/item/weapon/gun/projectile/automatic/rifle/wa2000/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "wa2000"
		wielded_item_state = "wa2000-wielded"
	else
		icon_state = "wa2000-empty"
		wielded_item_state = "wa2000-wielded-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/wa2000/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 3)


/obj/item/weapon/gun/projectile/automatic/rifle/barrett
	name = "Barrett M82"
	desc = "A powerful and recognized anti material rifle. Chambers .50 rounds."
	icon = 'icons/obj/coldwar/guns48x48.dmi'
	icon_state = "barrett"
	item_state = "heavysniper"
	w_class = 5
	force = 15
	max_shells = 10
	load_method = MAGAZINE
	caliber = ".50"
	screen_shake = 5
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = null
	allowed_magazines = list(/obj/item/ammo_magazine/c50cals)
	magazine_type = null
	one_hand_penalty = 10
	accuracy = 8
	wielded_item_state = "heavysniper-wielded"
	fire_sound = 'sound/weapons/gunshot/barrett.ogg'
	unload_sound = 'sound/weapons/gunporn/barrett_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/barrett_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/barrett_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/50cal_dist.ogg'
	jam_chance = 0.15
	slowdown_general = 1.5
	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=16,    move_delay=null, one_hand_penalty=6, burst_accuracy=null,          dispersion=null,           automatic = 0)
	)

/obj/item/weapon/gun/projectile/automatic/rifle/m82/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "barrett"
		wielded_item_state = "heavysniper-wielded"
	else
		icon_state = "barrett-empty"
		wielded_item_state = "heavysniper-wielded-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/barrett/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 5)

/////////---------------BOLT ACTIONS

/obj/item/weapon/gun/projectile/rifle/boltaction/
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	var/bolt_open = 0
	var/bayonet_type = null
	var/bayonet_attachable = 0
	var/obj/item/weapon/material/knife/bayonet/knife = null

/obj/item/weapon/gun/projectile/rifle/boltaction/New()
	..()
	src.verbs -= /obj/item/weapon/gun/projectile/rifle/boltaction/verb/remove_bayonet

/obj/item/weapon/gun/projectile/rifle/boltaction/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, src.bayonet_type) && bayonet_attachable)
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp += W.sharp
		src.force += W.force
		bayonet_attachable = 0
		to_chat(user, "<span class='notice'>You attach [knife.name] to the [src].</span>")
		src.verbs += /obj/item/weapon/gun/projectile/rifle/boltaction/verb/remove_bayonet
		update_icon()
	if(istype(W, /obj/item/ammo_magazine/box/paper))
		return
	..()

/obj/item/weapon/gun/projectile/rifle/boltaction/update_icon()
	..()
	if(knife)
		var/image/I = image('icons/obj/coldwar/bayonets.dmi', src, knife.icon_state)
		I.pixel_x += 10
		I.pixel_y += 10
		overlays += I
	else
		overlays.Cut()

/obj/item/weapon/gun/projectile/rifle/boltaction/verb/remove_bayonet()
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
		src.verbs -= /obj/item/weapon/gun/projectile/rifle/boltaction/verb/remove_bayonet
		update_icon()

//bayonet for boltactions

/////////////////////////////////////////
//bolt-action operation mechanics below//
/////////////////////////////////////////

/obj/item/weapon/gun/projectile/rifle/boltaction/consume_next_projectile() //necessary to chamber properly
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/rifle/boltaction/attack_self(mob/living/user as mob) //the bolt action operation itself
	bolt_open = !bolt_open
	if(do_after(user, 6.5, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltback.ogg', 50, 1)

			if(chambered)//We have a shell in the chamber
				chambered.forceMove(get_turf(src))//Eject casing
				if(LAZYLEN(chambered.casing_sound))
					playsound(loc, chambered.casing_sound, 50, 1)
				chambered = null
				to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
			else
				to_chat(user, "<span class='notice'>You work the bolt open.</span>")
		else
			to_chat(user, "<span class='notice'>You work the bolt closed.</span>")
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltforward.ogg', 50, 1)
			bolt_open = 0
			if(loaded.len)
				var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
				loaded -= AC //Remove casing from loaded list.
				chambered = AC

		add_fingerprint(user)
		update_icon()

/obj/item/weapon/gun/projectile/rifle/boltaction/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the bolt is open!</span>")
		return 0
	return ..()

/obj/item/weapon/gun/projectile/rifle/boltaction/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/rifle/boltaction/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/automatic/rifle/l96
	name = "L96A1"
	desc = "A standard-issue British sniper rifle. Chambers 7.62x51 rounds."
	icon = 'icons/obj/coldwar/guns48x48.dmi'
	icon_state = "l96"
	item_state = "l96"
	force = 15
	caliber = "762x51"
	load_method = MAGAZINE
	ammo_type = null
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51l)
	wielded_item_state = "l96-wielded"
	w_class = ITEM_SIZE_HUGE
	handle_casings = HOLD_CASINGS
	screen_shake = 3 //extra kickback
	max_shells = 10
	one_hand_penalty = 8
	accuracy = 6
	var/bolt_open = 0
	fire_sound = 'sound/weapons/gunshot/l96.ogg'
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg'
	cocked_sound = 'sound/weapons/gunporn/m40a1_boltlatch.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/m40a1_dist.ogg'
	jam_chance = 0.360
	slowdown_general = 0.45
	bayonet_attachable = 0

/obj/item/weapon/gun/projectile/automatic/rifle/l96/update_icon()
	..()
	if(bolt_open)
		icon_state = "l96-open"
	else
		icon_state = "l96"

/obj/item/weapon/gun/projectile/automatic/rifle/l96/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 3)

/obj/item/weapon/gun/projectile/automatic/rifle/l96/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/automatic/rifle/l96/attack_self(mob/living/user as mob)
	bolt_open = !bolt_open
	if(do_after(user, 6.5, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltback.ogg', 50, 1)

			if(chambered) //We have a shell in the chamber
				chambered.forceMove(get_turf(src)) //Eject casing
				if(LAZYLEN(chambered.casing_sound))
					playsound(loc, chambered.casing_sound, 50, 1)
				chambered = null
				to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
			else
				to_chat(user, "<span class='notice'>You work the bolt open.</span>")
		else
			to_chat(user, "<span class='notice'>You work the bolt closed.</span>")
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltforward.ogg', 50, 1)
			bolt_open = 0
			if(!chambered)
				chambered = ammo_magazine.stored_ammo[1]
				ammo_magazine.stored_ammo -= chambered

		add_fingerprint(user)
		update_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/l96/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the bolt is open!</span>")
		return 0
	return ..()


/obj/item/weapon/gun/projectile/automatic/rifle/frf2
	name = "FR F2"
	desc = "A standard-issue French sniper rifle. Chambers 7.62x51 rounds."
	icon = 'icons/obj/coldwar/guns48x48.dmi'
	icon_state = "frf2"
	item_state = "frf2"
	force = 15
	caliber = "762x51"
	load_method = MAGAZINE
	ammo_type = null
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51f)
	wielded_item_state = "frf2-wielded"
	w_class = ITEM_SIZE_HUGE
	handle_casings = HOLD_CASINGS
	screen_shake = 3 //extra kickback
	max_shells = 10
	one_hand_penalty = 8
	accuracy = 6
	var/bolt_open = 0
	fire_sound = 'sound/weapons/gunshot/l96.ogg'
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg'
	cocked_sound = 'sound/weapons/gunporn/m40a1_boltlatch.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/m40a1_dist.ogg'
	jam_chance = 0.360
	slowdown_general = 0.45
	bayonet_attachable = 0

/obj/item/weapon/gun/projectile/automatic/rifle/frf2/update_icon()
	..()
	if(bolt_open)
		icon_state = "frf2-open"
	else
		icon_state = "frf2"

/obj/item/weapon/gun/projectile/automatic/rifle/frf2/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 3)

/obj/item/weapon/gun/projectile/automatic/rifle/frf2/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/automatic/rifle/frf2/attack_self(mob/living/user as mob)
	bolt_open = !bolt_open
	if(do_after(user, 6.5, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltback.ogg', 50, 1)

			if(chambered) //We have a shell in the chamber
				chambered.forceMove(get_turf(src)) //Eject casing
				if(LAZYLEN(chambered.casing_sound))
					playsound(loc, chambered.casing_sound, 50, 1)
				chambered = null
				to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
			else
				to_chat(user, "<span class='notice'>You work the bolt open.</span>")
		else
			to_chat(user, "<span class='notice'>You work the bolt closed.</span>")
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltforward.ogg', 50, 1)
			bolt_open = 0
			if(!chambered)
				chambered = ammo_magazine.stored_ammo[1]
				ammo_magazine.stored_ammo -= chambered

		add_fingerprint(user)
		update_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/frf2/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the bolt is open!</span>")
		return 0
	return ..()

/obj/item/weapon/gun/projectile/rifle/boltaction/tkiv
	name = "7.62 Tkiv 85"
	desc = "A standard issue Finnish sniper rifle. Chambers 7.62X53mmR rounds."
	icon = 'icons/obj/coldwar/guns48x48.dmi'
	icon_state = "tkiv"
	item_state = "tkiv"
	force = 15
	caliber = "762x53"
	wielded_item_state = "tkiv-wielded"
	w_class = ITEM_SIZE_LARGE
	screen_shake = 3 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER | AMMO_BOX
	max_shells = 5
	ammo_type = null
	one_hand_penalty = 6
	accuracy = 6
	fire_sound = 'sound/weapons/gunshot/tkiv.ogg'
	reload_sound = 'sound/weapons/gunporn/tkiv_bulletin.ogg'
	cocked_sound = 'sound/weapons/gunporn/tkiv_boltlatch.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/tkiv_dist.ogg'
	jam_chance = 0.360
	slowdown_general = 0.35
	bayonet_attachable = 0

/obj/item/weapon/gun/projectile/rifle/boltaction/tkiv/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/rifle/boltaction/tkiv/attack_self(mob/living/user as mob)
	bolt_open = !bolt_open
	if(do_after(user, 6.5, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/tkiv_boltback.ogg', 50, 1)

			if(chambered)//We have a shell in the chamber
				chambered.forceMove(get_turf(src))//Eject casing
				if(LAZYLEN(chambered.casing_sound))
					playsound(loc, chambered.casing_sound, 50, 1)
				chambered = null
				to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
			else
				to_chat(user, "<span class='notice'>You work the bolt open.</span>")
		else
			to_chat(user, "<span class='notice'>You work the bolt closed.</span>")
			playsound(src.loc, 'sound/weapons/gunporn/tkiv_boltforward.ogg', 50, 1)
			bolt_open = 0
			if(loaded.len)
				var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
				loaded -= AC //Remove casing from loaded list.
				chambered = AC

		add_fingerprint(user)
		update_icon()

/obj/item/weapon/gun/projectile/rifle/boltaction/tkiv/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the bolt is open!</span>")
		return 0
	return ..()

/obj/item/weapon/gun/projectile/rifle/boltaction/tkiv/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/rifle/boltaction/tkiv/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/rifle/boltaction/tkiv/update_icon()
	..()
	if(bolt_open)
		icon_state = "tkiv-open"
	else
		icon_state = "tkiv"

/obj/item/weapon/gun/projectile/rifle/boltaction/tkiv/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 3)

/obj/item/weapon/gun/projectile/automatic/rifle/ssg82
	name = "SSG 82"
	desc = "The Scharfschützengewehr 82, a rare East German bolt action rifle. Chambers 5.45x39mm rounds."
	icon = 'icons/obj/coldwar/guns48x48.dmi'
	icon_state = "ssg82"
	item_state = "ssg82"
	force = 15
	caliber = "545x39"
	load_method = MAGAZINE
	ammo_type = null
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39s)
	wielded_item_state = "ssg82-wielded"
	w_class = ITEM_SIZE_HUGE
	handle_casings = HOLD_CASINGS
	screen_shake = 3 //extra kickback
	max_shells = 5
	one_hand_penalty = 8
	accuracy = 6
	var/bolt_open = 0
	fire_sound = 'sound/weapons/gunshot/tkiv.ogg'
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg'
	cocked_sound = 'sound/weapons/gunporn/m40a1_boltlatch.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/tkiv_dist.ogg'
	jam_chance = 0.360
	slowdown_general = 0.360
	bayonet_attachable = 0

/obj/item/weapon/gun/projectile/automatic/rifle/ssg82/update_icon()
	..()
	if(bolt_open && ammo_magazine)
		icon_state = "ssg82-open"
		item_state = "ssg82"
		wielded_item_state = "ssg82-wielded"
	if(bolt_open && !ammo_magazine)
		icon_state = "ssg82-open-empty"
		item_state = "ssg82-empty"
		wielded_item_state = "ssg82-wielded-empty"
	if(!bolt_open && ammo_magazine)
		icon_state = "ssg82"
		item_state = "ssg82"
		wielded_item_state = "ssg82-wielded"
	if(!bolt_open && !ammo_magazine)
		icon_state = "ssg82-empty"
		item_state = "ssg82-empty"
		wielded_item_state = "ssg82-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/ssg82/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 3)

/obj/item/weapon/gun/projectile/automatic/rifle/ssg82/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/automatic/rifle/ssg82/attack_self(mob/living/user as mob)
	bolt_open = !bolt_open
	if(do_after(user, 6.5, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltback.ogg', 50, 1)

			if(chambered)//We have a shell in the chamber
				chambered.forceMove(get_turf(src))//Eject casing
				if(LAZYLEN(chambered.casing_sound))
					playsound(loc, chambered.casing_sound, 50, 1)
				chambered = null
				to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
			else
				to_chat(user, "<span class='notice'>You work the bolt open.</span>")
		else
			to_chat(user, "<span class='notice'>You work the bolt closed.</span>")
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltforward.ogg', 50, 1)
			bolt_open = 0
			if(!chambered)
				chambered = ammo_magazine.stored_ammo[1]
				ammo_magazine.stored_ammo -= chambered

		add_fingerprint(user)
		update_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/ssg82/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the bolt is open!</span>")
		return 0
	return ..()

/obj/item/weapon/gun/projectile/rifle/boltaction/m40a1
	name = "M40A1"
	desc = "A standard issue American sniper rifle. Chambers 7.62X51 rounds."
	icon = 'icons/obj/coldwar/guns48x48.dmi'
	icon_state = "m40a1"
	item_state = "m40a1"
	force = 15
	caliber = "762x51"
	wielded_item_state = "m40a1-wielded"
	w_class = ITEM_SIZE_LARGE
	screen_shake = 3 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | AMMO_BOX
	max_shells = 5
	ammo_type = null
	one_hand_penalty = 6
	accuracy = 6
	fire_sound = 'sound/weapons/gunshot/m40a1.ogg'
	reload_sound = 'sound/weapons/gunporn/m40a1_bulletin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m40a1_boltlatch.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/m40a1_dist.ogg'
	jam_chance = 0.360
	slowdown_general = 0.35
	bayonet_attachable = 0

/obj/item/weapon/gun/projectile/rifle/boltaction/m40a1/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/rifle/boltaction/m40a1/attack_self(mob/living/user as mob)
	bolt_open = !bolt_open
	if(do_after(user, 6.5, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltback.ogg', 50, 1)

			if(chambered)//We have a shell in the chamber
				chambered.forceMove(get_turf(src))//Eject casing
				if(LAZYLEN(chambered.casing_sound))
					playsound(loc, chambered.casing_sound, 50, 1)
				chambered = null
				to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
			else
				to_chat(user, "<span class='notice'>You work the bolt open.</span>")
		else
			to_chat(user, "<span class='notice'>You work the bolt closed.</span>")
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltforward.ogg', 50, 1)
			bolt_open = 0
			if(loaded.len)
				var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
				loaded -= AC //Remove casing from loaded list.
				chambered = AC

		add_fingerprint(user)
		update_icon()

/obj/item/weapon/gun/projectile/rifle/boltaction/m40a1/special_check(mob/user)
	if(bolt_open)
		to_chat(user, "<span class='warning'>You can't fire [src] while the bolt is open!</span>")
		return 0
	return ..()

/obj/item/weapon/gun/projectile/rifle/boltaction/m40a1/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/rifle/boltaction/m40a1/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/rifle/boltaction/m40a1/update_icon()
	..()
	if(bolt_open)
		icon_state = "m40a1-open"
	else
		icon_state = "m40a1"

/obj/item/weapon/gun/projectile/rifle/boltaction/m40a1/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 3)

/obj/item/weapon/gun/projectile/rifle/boltaction/m40a1/load_ammo(var/obj/item/A, mob/user)
	..()
	var/obj/item/ammo_magazine/AM = user.get_active_hand(A)

	if(AM.stored_ammo.len == 0)
		qdel(AM)
		return

	else return

/obj/item/weapon/gun/projectile/rifle/boltaction/enfield
	name = "Enfield SMLE"
	desc = "A standard issue British sniper rifle. Chambers .303 rounds."
	icon = 'icons/obj/coldwar/guns48x48.dmi'
	icon_state = "enfield"
	item_state = "enfield"
	force = 15
	caliber = "303"
	wielded_item_state = "tkiv-wielded"
	w_class = ITEM_SIZE_LARGE
	screen_shake = 3 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | SPEEDLOADER | AMMO_BOX
	max_shells = 5
	ammo_type = null
	one_hand_penalty = 6
	accuracy = 6
	fire_sound = 'sound/weapons/gunshot/762boltifle.ogg'
	reload_sound = 'sound/weapons/gunporn/tkiv_bulletin.ogg'
	cocked_sound = 'sound/weapons/gunporn/tkiv_boltlatch.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/tkiv_dist.ogg'
	jam_chance = 0.360
	slowdown_general = 0.35
	bayonet_attachable = 0

/obj/item/weapon/gun/projectile/rifle/boltaction/enfield/update_icon()
	..()
	if(bolt_open)
		icon_state = "enfield-open"
	else
		icon_state = "enfield"

/obj/item/weapon/gun/projectile/rifle/boltaction/enfield/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 3)

/obj/item/weapon/gun/projectile/rifle/boltaction/mosin
	name = "Mosin-Nagant M39"
	desc = "An outdated Finnish rifle. Chambers 7.62x53mmR rounds."
	icon = 'icons/obj/coldwar/guns48x48.dmi'
	icon_state = "mosin"
	item_state = "enfield"
	force = 15
	caliber = "762x53"
	wielded_item_state = "mosin-wielded"
	w_class = ITEM_SIZE_LARGE
	screen_shake = 3 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING | AMMO_BOX
	max_shells = 5
	ammo_type = null
	one_hand_penalty = 6
	accuracy = 6
	fire_sound = 'sound/weapons/gunshot/762boltifle.ogg'
	reload_sound = 'sound/weapons/gunporn/tkiv_bulletin.ogg'
	cocked_sound = 'sound/weapons/gunporn/tkiv_boltlatch.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/tkiv_dist.ogg'
	jam_chance = 0.360
	slowdown_general = 0.35
	bayonet_attachable = 0

/obj/item/weapon/gun/projectile/rifle/boltaction/mosin/update_icon()
	..()
	if(bolt_open)
		icon_state = "enfield-open"
	else
		icon_state = "enfield"
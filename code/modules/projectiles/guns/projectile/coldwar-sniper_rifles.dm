/obj/item/weapon/gun/projectile/automatic/rifle/m14/scoped
	name = "M21"
	desc = "A standard-issue USMC marksman rifle."
	icon_state = "m14scoped"
	item_state = "m21"
	screen_shake = 2
	accuracy = 5
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51s, /obj/item/ammo_magazine/c762x51m)
	wielded_item_state = "m21-wielded"
	bayonet_attachable = 1
	bayonet_type = /obj/item/weapon/material/knife/bayonet/usmc/
	jam_chance = 0.6
	dist_shot_sound = 'sound/weapons/gunshot/dist/rifle_dist.ogg'
	slowdown_general = 0.5

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=8.5,    move_delay=null, one_hand_penalty=10, burst_accuracy=null, dispersion=null),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/m14/scoped/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "m14scoped"
		wielded_item_state = "m21-wielded"
	else
		icon_state = "m14scoped-empty"
		wielded_item_state = "m21-wielded-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/m14/scoped/verb/scope()
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
	slot_flags = SLOT_BACK_GUN
	w_class = 5
	force = 10
	max_shells = 10
	screen_shake = 2
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
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
	slowdown_general = 0.5

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
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a762x51
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
	slowdown_general = 0.5

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=8,    move_delay=null, one_hand_penalty=4, burst_accuracy=null,          dispersion=null,           automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=0.4,  move_delay=3,    one_hand_penalty=8, burst_accuracy=null, dispersion=list(0.6, 0.8 ),         automatic = 0.4)
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

/obj/item/weapon/gun/projectile/automatic/rifle/wa2000
	name = "WA2000"
	desc = "An incredibly rare and accurate semi-automatic bullpup sniper rifle. Chambers 7.62x51 rounds."
	icon_state = "wa2000"
	item_state = "wa2000"
	w_class = 5
	force = 10
	screen_shake = 1
	max_shells = 6
	load_method = MAGAZINE
	caliber = "762x51"
	slot_flags = SLOT_BACK_GUN
	bayonet_type = /obj/item/weapon/material/knife/bayonet/bdw/
	bayonet_attachable = 1
	ammo_type = /obj/item/ammo_casing/a762x51
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51wa, /obj/item/ammo_magazine/c762x51wa/ap)
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
	slowdown_general = 0.5

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


/obj/item/weapon/gun/projectile/automatic/rifle/m82
	name = "Barret M82"
	desc = "A powerful and recognized anti material rifle chambered in .50. Manufactured in 1982."
	icon_state = "heavysniper"
	item_state = "heavysniper"
	w_class = 5
	force = 15
	max_shells = 10
	load_method = MAGAZINE
	caliber = ".50"
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a50cal
	allowed_magazines = list(/obj/item/ammo_magazine/c50cals)
	magazine_type = null
	one_hand_penalty = 10
	accuracy = 6
	wielded_item_state = "heavysniper-wielded"
	fire_sound = 'sound/weapons/gunshot/m2hb.ogg'
	unload_sound = 'sound/weapons/gunporn/svd_magout.ogg' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/svd_magin.ogg'
	cocked_sound = 'sound/weapons/flipblade.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/50cal_dist.ogg'
	jam_chance = 0.1
	slowdown_general = 0.8

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=12,    move_delay=null, one_hand_penalty=6, burst_accuracy=null,          dispersion=null,           automatic = 0)
	)
/obj/item/weapon/gun/projectile/automatic/rifle/m82/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "heavysniper"
		wielded_item_state = "heavysniper-wielded"
	else
		icon_state = "heavysniper-empty"
		wielded_item_state = "heavysniper-wielded-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/m82/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 3.4)

/////////---------------BOLT ACTIONS

/obj/item/weapon/gun/projectile/rifle/boltaction/
	slot_flags = SLOT_BACK_GUN
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
	..()

/obj/item/weapon/gun/projectile/rifle/boltaction/update_icon()
	..()
	if(knife)
		var/image/I = image('icons/obj/bayonets.dmi', src, knife.icon_state)
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

/obj/item/weapon/gun/projectile/rifle/boltaction/attack_self(mob/user as mob)
	bolt_open = !bolt_open
	if(do_after(user, 6.5, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltback.ogg', 50, 1)
			if(chambered)
				to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
				chambered.loc = get_turf(src)
				loaded -= chambered
				chambered = null
			else
				to_chat(user, "<span class='notice'>You work the bolt open.</span>")
		else
			to_chat(user, "<span class='notice'>You work the bolt closed.</span>")
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltforward.ogg', 50, 1)
			bolt_open = 0
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
	icon = 'icons/obj/boltactions.dmi'
	icon_state = "l96"
	item_state = "l96" 
	force = 10
	caliber = "762x51"
	load_method = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a762x51
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

/obj/item/weapon/gun/projectile/automatic/rifle/l96/attack_self(mob/user as mob)
	bolt_open = !bolt_open
	if(do_after(user, 6.5, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltback.ogg', 50, 1)
			if(chambered)
				to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
				chambered.loc = get_turf(src)
				loaded -= chambered
				chambered = null
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
	
/obj/item/weapon/gun/projectile/rifle/boltaction/tkiv
	name = "7.62 Tkiv 85"
	desc = "A standard issue Finnish sniper rifle. Chambers 7.62X53mmR rounds."
	icon = 'icons/obj/boltactions.dmi'
	icon_state = "tkiv"
	item_state = "tkiv" 
	force = 8
	caliber = "762x53"
	wielded_item_state = "tkiv-wielded"
	w_class = ITEM_SIZE_LARGE
	screen_shake = 3 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 5
	ammo_type = /obj/item/ammo_casing/a762x53
	one_hand_penalty = 6
	accuracy = 6
	fire_sound = 'sound/weapons/gunshot/tkiv.ogg'
	reload_sound = 'sound/weapons/gunporn/tkiv_bulletin.ogg'
	cocked_sound = 'sound/weapons/gunporn/tkiv_boltlatch.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/tkiv_dist.ogg'
	jam_chance = 0.360
	slowdown_general = 0.35
	bayonet_attachable = 0

/obj/item/weapon/gun/projectile/rifle/boltaction/tkiv/attack_self(mob/user as mob)
	bolt_open = !bolt_open
	if(do_after(user, 6.5, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/tkiv_boltback.ogg', 50, 1)
			if(chambered)
				to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
				chambered.loc = get_turf(src)
				loaded -= chambered
				chambered = null
			else
				to_chat(user, "<span class='notice'>You work the bolt open.</span>")
		else
			to_chat(user, "<span class='notice'>You work the bolt closed.</span>")
			playsound(src.loc, 'sound/weapons/gunporn/tkiv_boltforward.ogg', 50, 1)
			bolt_open = 0
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

/obj/item/weapon/gun/projectile/rifle/boltaction/m40a1
	name = "M40A1"
	desc = "A standard issue American sniper rifle. Chambers 7.62X51 rounds."
	icon = 'icons/obj/boltactions.dmi'
	icon_state = "m40a1"
	item_state = "m40a1" 
	force = 8
	caliber = "762x51"
	wielded_item_state = "m40a1-wielded"
	w_class = ITEM_SIZE_LARGE
	screen_shake = 3 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 5
	ammo_type = /obj/item/ammo_casing/a762x51
	one_hand_penalty = 6
	accuracy = 6
	fire_sound = 'sound/weapons/gunshot/m40a1.ogg'
	reload_sound = 'sound/weapons/gunporn/m40a1_bulletin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m40a1_boltlatch.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/m40a1_dist.ogg'
	jam_chance = 0.360
	slowdown_general = 0.35
	bayonet_attachable = 0

/obj/item/weapon/gun/projectile/rifle/boltaction/m40a1/attack_self(mob/user as mob)
	bolt_open = !bolt_open
	if(do_after(user, 6.5, src))
		if(bolt_open)
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltback.ogg', 50, 1)
			if(chambered)
				to_chat(user, "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>")
				chambered.loc = get_turf(src)
				loaded -= chambered
				chambered = null
			else
				to_chat(user, "<span class='notice'>You work the bolt open.</span>")
		else
			to_chat(user, "<span class='notice'>You work the bolt closed.</span>")
			playsound(src.loc, 'sound/weapons/gunporn/m40a1_boltforward.ogg', 50, 1)
			bolt_open = 0
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
	icon = 'icons/obj/boltactions.dmi'
	icon_state = "enfield"
	item_state = "enfield" 
	force = 8
	caliber = "303"
	wielded_item_state = "tkiv-wielded"
	w_class = ITEM_SIZE_LARGE
	screen_shake = 3 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 5
	ammo_type = /obj/item/ammo_casing/a303
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
	icon = 'icons/obj/boltactions.dmi'
	icon_state = "mosin"
	item_state = "enfield" 
	force = 8
	caliber = "762x53"
	wielded_item_state = "mosin-wielded"
	w_class = ITEM_SIZE_LARGE
	screen_shake = 3 //extra kickback
	handle_casings = HOLD_CASINGS
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 5
	ammo_type = /obj/item/ammo_casing/a762x53
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
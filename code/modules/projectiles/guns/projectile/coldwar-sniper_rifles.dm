//you are not so stupid to attach bayonet to marksman riffles, aren't you? -- close quarters sniping
/* Rifles should have a jam chance between 1 and 4 (scales in 100) */

/obj/item/weapon/gun/projectile/automatic/rifle/m14/scoped
	name = "M21"
	desc = "A standard-issue USMC marksman rifle."
	icon_state = "m14scoped"
	item_state = "m21"
	accuracy = 5
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51s, /obj/item/ammo_magazine/c762x51m)
	fire_delay = 4.5
	wielded_item_state = "m21-wielded"
	jam_chance = 2
	dist_shot_sound = 'sound/weapons/gunshot/dist/rifle_dist.wav'
	slowdown_general = 0.5

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=2,    move_delay=null, one_hand_penalty=10, burst_accuracy=null, dispersion=null),
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

	src.toggle_scope(usr, 2.4)

/obj/item/weapon/gun/projectile/automatic/svd
	name = "SVD"
	desc = "A standard-issue Soviet Army and NVA DDR marksman rifle. Chambers 7.62x54 rounds."
	icon_state = "svd"
	item_state = "svd"
	slot_flags = SLOT_BACK_GUN
	w_class = 5
	force = 10
	max_shells = 10
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x54s
	one_hand_penalty = 10
	accuracy = 5
	fire_delay = 4.5
	fire_sound = 'sound/weapons/gunshot/svd.ogg'
	wielded_item_state = "svd-wielded"
	unload_sound = 'sound/weapons/gunporn/svd_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/svd_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/svd_boltback.ogg'
	jam_chance = 2
	dist_shot_sound = 'sound/weapons/gunshot/dist/rifle_dist.wav'
	slowdown_general = 0.5

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=2,    move_delay=null, one_hand_penalty=10, burst_accuracy=null, dispersion=null),
		)


/obj/item/weapon/gun/projectile/automatic/svd/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "svd"
		wielded_item_state = "svd-wielded"
	else
		icon_state = "svd-empty"
		wielded_item_state = "svd-wielded-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/svd/verb/scope()
	set name = "Use Scope"
	set category = "Object"
	set src in usr
	set popup_menu = 0

	src.toggle_scope(usr, 2.4)

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
	one_hand_penalty = 5
	accuracy = 4.5
	fire_delay = 3
	wielded_item_state = "g3sg1-wielded"
	fire_sound = 'sound/weapons/gunshot/g3sg1.ogg'
	unload_sound = 'sound/weapons/gunporn/g3_magout.wav' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/g3_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/g3_boltpull.wav'
	dist_shot_sound = 'sound/weapons/gunshot/dist/g3_dist.wav'
	jam_chance = 4
	slowdown_general = 0.5

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=4,    move_delay=null, one_hand_penalty=4, burst_accuracy=null,          dispersion=null,           automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=0.4,  move_delay=3,    one_hand_penalty=8, burst_accuracy=null, dispersion=list(0.3, 0.6 ),         automatic = 0.4)
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

	src.toggle_scope(usr, 2.4)

/obj/item/weapon/gun/projectile/automatic/rifle/wa2000
	name = "WA2000"
	desc = "An incredibly rare and accurate semi-automatic bullpup sniper rifle. Chambers 7.62x51 rounds."
	icon_state = "wa2000"
	item_state = "wa2000"
	w_class = 5
	force = 10
	max_shells = 6
	load_method = MAGAZINE
	caliber = "762x51"
	slot_flags = SLOT_BACK_GUN
	ammo_type = /obj/item/ammo_casing/a762x51
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51wa, /obj/item/ammo_magazine/c762x51wa/ap)
	magazine_type = null
	one_hand_penalty = 6
	accuracy = 6
	fire_delay = 5
	wielded_item_state = "wa2000-wielded"
	fire_sound = 'sound/weapons/gunshot/g3sg1.ogg'
	unload_sound = 'sound/weapons/gunporn/g3_magout.wav' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/g3_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/g3_boltpull.wav'
	dist_shot_sound = 'sound/weapons/gunshot/dist/g3_dist.wav'
	jam_chance = 0
	slowdown_general = 0.5

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=4,    move_delay=null, one_hand_penalty=6, burst_accuracy=null,          dispersion=null,           automatic = 0)
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

	src.toggle_scope(usr, 2.4)


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
	fire_delay = 12
	wielded_item_state = "heavysniper-wielded"
	fire_sound = 'sound/weapons/gunshot/m2hb.ogg' 
	unload_sound = 'sound/weapons/gunporn/svd_magout.ogg' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/svd_magin.ogg'
	cocked_sound = 'sound/weapons/flipblade.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/50cal_dist.wav'
	jam_chance = 2
	slowdown_general = 0.8

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=4,    move_delay=null, one_hand_penalty=6, burst_accuracy=null,          dispersion=null,           automatic = 0)
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
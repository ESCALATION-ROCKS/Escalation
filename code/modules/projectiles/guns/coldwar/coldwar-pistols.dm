
//COLD WAR GUNS
/obj/item/weapon/gun/projectile/berettam9
	name = "Beretta M9"
	desc = "That's a Beretta M9. Chambers 9x19mm cartridges."
	icon_state = "berettam9"
	item_state = "glock"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x19"
	fire_delay = 2.2
	accuracy = 2.5
	load_method = MAGAZINE
	jam_chance = 0.9
	magazine_type = /obj/item/ammo_magazine/m9x19
	allowed_magazines = /obj/item/ammo_magazine/m9x19
	fire_sound = 'sound/weapons/gunshotnew/glock.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.ogg'

/obj/item/weapon/gun/projectile/berettam9/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "berettam9"
	else
		icon_state = "berettam9-empty"

/obj/item/weapon/gun/projectile/makarov
	name = "Makarov PM"
	desc = "That's a Pistolet Makarova. Chambers 9x18mm cartridges."
	icon_state = "makarov"
	item_state = "pm"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x18"
	fire_delay = 2.7
	accuracy = 2.1
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x18
	allowed_magazines = /obj/item/ammo_magazine/a9x18
	fire_sound = 'sound/weapons/gunshot/makarov.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	jam_chance = 0.9
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.ogg'


/obj/item/weapon/gun/projectile/makarov/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "makarov"
	else
		icon_state = "makarov-empty"


/obj/item/weapon/gun/projectile/aps
	name = "Stechkin APS"
	desc = "That's an Avtomaticheskiy Pistolet Stechkina. Chambers 9x18mm cartridges."
	icon_state = "aps"
	item_state = "pm"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x18"
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x18b
	allowed_magazines = /obj/item/ammo_magazine/a9x18b
	accuracy = 1.8
	fire_sound = 'sound/weapons/gunshot/makarov.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	jam_chance = 1.15
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=2.9,    move_delay=null, one_hand_penalty=2, burst_accuracy=null,              dispersion=null,                          automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=0.3,  move_delay=null, one_hand_penalty=2, burst_accuracy=null,              dispersion=list(0.5, 0.7, 0.8),                     automatic = 0.3),
		)

/obj/item/weapon/gun/projectile/aps/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "aps"
	else
		icon_state = "aps-empty"


/obj/item/weapon/gun/projectile/cz82
	name = "CZ82"
	desc = "That's a CZ82. Uses 9x18 ammunition."
	icon_state = "cz82"
	item_state = "glock"
	w_class = 2
	caliber = "9x18"
	fire_delay = 2.6
	accuracy = 2.6
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/cz9x18
	allowed_magazines = /obj/item/ammo_magazine/cz9x18
	fire_sound = 'sound/weapons/gunshot/makarov.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.ogg'

/obj/item/weapon/gun/projectile/cz82/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "cz82"
	else
		icon_state = "cz82-empty"

/obj/item/weapon/gun/projectile/colt911
	name = "Colt M1911A1"
	desc = "A solid classic. Chambers .45 ACP cartridges."
	icon_state = "colt" //fix
	item_state = "m1911"
	w_class = ITEM_SIZE_NORMAL
	caliber = ".45"
	fire_delay = 3.7
	accuracy = 2.3
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a45
	allowed_magazines = /obj/item/ammo_magazine/a45
	fire_sound = 'sound/weapons/gunshot/m1911.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.ogg'
	jam_chance = 0.55

/obj/item/weapon/gun/projectile/colt911/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "colt"
	else
		icon_state = "colt-empty"

/obj/item/weapon/gun/projectile/walther
	name = "P1"
	desc = "A modified Walther P38 with a politically correct name. Chambers 9x19mm cartridges."
	icon_state = "p1" //fix
	item_state = "m1911"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x19"
	fire_delay = 3.1
	accuracy = 2.5
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x19
	allowed_magazines = /obj/item/ammo_magazine/a9x19
	fire_sound = 'sound/weapons/gunshot/waltherp1.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	jam_chance = 1
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.ogg'

/obj/item/weapon/gun/projectile/walther/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "p1"
	else
		icon_state = "p1-empty"


/obj/item/weapon/gun/projectile/glock17
	name = "P80"
	desc = "A state-of-the-art Glock 17 pistol, designated as P80 by the Bundesheer. Chambers 9x19mm cartridges."
	icon_state = "glock" //fix
	item_state = "glock"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x19"
	fire_delay = 3.1
	accuracy = 2.7
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x19g
	allowed_magazines = /obj/item/ammo_magazine/a9x19g
	fire_sound = 'sound/weapons/gunshotnew/glock.ogg'
	unload_sound = 'sound/weapons/gunporn/glock_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/glock_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/glock_cock.ogg'
	jam_chance = 1
	dist_shot_sound = 'sound/weapons/gunshot/dist/glock_dist.ogg'

/obj/item/weapon/gun/projectile/glock17/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "glock"
	else
		icon_state = "glock-empty"

/obj/item/weapon/gun/projectile/lahti
	name = "Lahti"
	desc = "A Finnish standard issue handgun. Chambers 9x19mm cartridges."
	icon_state = "lahti" //fix
	item_state = "m1911"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x19"
	fire_delay = 3.5
	accuracy = 2.2
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x19
	allowed_magazines = /obj/item/ammo_magazine/a9x19
	fire_sound = 'sound/weapons/gunshot/waltherp1.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	jam_chance = 0.75
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.ogg'

/obj/item/weapon/gun/projectile/lahti/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "lahti"
	else
		icon_state = "lahti-empty"

/obj/item/weapon/gun/projectile/waltherppk
	name = "Walther PPK"
	desc = "Issued to the Stasi officers, this Walther PPK is a rare sight to its victims. Has a suppressor thread on its barrel. Chambers 9x19mm cartridges."
	icon_state = "waltherppk"
	item_state = "pm"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x18"
	accuracy = 2.3
	fire_delay = 2.7
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x18
	allowed_magazines = /obj/item/ammo_magazine/a9x18
	fire_sound = 'sound/weapons/gunshot/makarov.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	jam_chance = 0.9
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.ogg'


/obj/item/weapon/gun/projectile/waltherppk/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "waltherppk"
	else
		icon_state = "waltherppk-empty"

/obj/item/weapon/gun/projectile/hipower
	name = "Browning Hi-Power"
	desc = "A dated yet reliable design. Chambers 9x19mm cartridges."
	icon_state = "hipower"
	item_state = "m1911"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x19"
	fire_delay = 3.2
	accuracy = 2.5
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x19b
	allowed_magazines = /obj/item/ammo_magazine/a9x19b
	fire_sound = 'sound/weapons/gunshot/m1911.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	jam_chance = 0.65
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.ogg'

/obj/item/weapon/gun/projectile/hipower/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "hipower"
	else
		icon_state = "hipower-empty"


/obj/item/weapon/gun/projectile/star
	name = "Star 28"
	desc = "A standard issue Spanish service pistol. Chambers 9x19mm cartridges."
	icon_state = "star"
	item_state = "m1911"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x19"
	fire_delay = 3.2
	accuracy = 2.5
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x19b
	allowed_magazines = /obj/item/ammo_magazine/a9x19b
	fire_sound = 'sound/weapons/gunshot/star.ogg'
	unload_sound = 'sound/weapons/gunporn/star_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/star_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/star_sliderelease.ogg'
	jam_chance = 0.65
	dist_shot_sound = 'sound/weapons/gunshot/dist/star_dist.ogg'

/obj/item/weapon/gun/projectile/star/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "star"
	else
		icon_state = "star-empty"


/obj/item/weapon/gun/projectile/mac50
	name = "MAC 50"
	desc = "A standard issue French service pistol. Chambers 9x19mm cartridges."
	icon_state = "mac50"
	item_state = "m1911"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x19"
	fire_delay = 3.2
	accuracy = 2.5
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x19m
	allowed_magazines = /obj/item/ammo_magazine/a9x19m
	fire_sound = 'sound/weapons/gunshot/mac50.ogg'
	unload_sound = 'sound/weapons/gunporn/mac50_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/mac50_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/mac50_sliderelease.ogg'
	jam_chance = 0.65
	dist_shot_sound = 'sound/weapons/gunshot/dist/mac50_dist.ogg'

/obj/item/weapon/gun/projectile/mac50/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "mac50"
	else
		icon_state = "mac50-empty"
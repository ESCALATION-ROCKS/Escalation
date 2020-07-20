
//COLD WAR GUNS
/obj/item/weapon/gun/projectile/berettam9
	name = "Beretta M9"  // DO NOT USE
	desc = "That's the Italian-made pistol. Uses 9x19 ammo."
	icon_state = "berettam9"
	item_state = "gun"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x19"
	fire_delay = 1
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x19
	allowed_magazines = /obj/item/ammo_magazine/a9x19
	fire_sound = 'sound/weapons/gunshot/waltherp1.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.wav'

/obj/item/weapon/gun/projectile/berettam9/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "berettam9"
	else
		icon_state = "berettam9-empty"

/obj/item/weapon/gun/projectile/gluger
	name = "Gluger 19"  // DO NOT USE
	desc = "That's the glory gluger."
	icon_state = "gluger"
	item_state = "gun"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x19"
	fire_delay = 1
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x19
	allowed_magazines = /obj/item/ammo_magazine/a9x19
	fire_sound = 'sound/weapons/gunshot/waltherp1.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.wav'

/obj/item/weapon/gun/projectile/gluger/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "gluger"
	else
		icon_state = "gluger-empty"

/obj/item/weapon/gun/projectile/locc
	name = "Locc"  // DO NOT USE
	desc = "That's the modern locc, everyone got one of these."
	icon_state = "locc"
	item_state = "gun"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x19"
	fire_delay = 1
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x19
	allowed_magazines = /obj/item/ammo_magazine/a9x19
	fire_sound = 'sound/weapons/gunshot/waltherp1.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.wav'

/obj/item/weapon/gun/projectile/locc/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "locc"
	else
		icon_state = "locc-empty"

/obj/item/weapon/gun/projectile/makarov
	name = "Makarov PM"
	desc = "That's Pistolet Makarova. Uses 9x18ammo."
	icon_state = "makarov"
	item_state = "gun"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x18"
	fire_delay = 1
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x18
	allowed_magazines = /obj/item/ammo_magazine/a9x18
	fire_sound = 'sound/weapons/gunshot/makarov.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	jam_chance = 5
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.wav'


/obj/item/weapon/gun/projectile/makarov/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "makarov"
	else
		icon_state = "makarov-empty"


/obj/item/weapon/gun/projectile/aps
	name = "Stechkin APS"
	desc = "That's Avtomaticheskiy Pistolet Stechkina. Uses 9x18ammo."
	icon_state = "aps"
	item_state = "gun"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x18"
	fire_delay = 1
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x18b
	allowed_magazines = /obj/item/ammo_magazine/a9x18b
	fire_sound = 'sound/weapons/gunshot/makarov.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	jam_chance = 5
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.wav'

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=2,    move_delay=null, one_hand_penalty=2, burst_accuracy=null,              dispersion=null,                          automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=0.5,  move_delay=null, one_hand_penalty=2, burst_accuracy=null,              dispersion=list(0.2),                     automatic = 0.8),
		)

/obj/item/weapon/gun/projectile/aps/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "aps"
	else
		icon_state = "aps-empty"


/obj/item/weapon/gun/projectile/cz82
	name = "CZ82"
	desc = "That's CZ82. Uses 9x18ammo."
	icon_state = "cz82"
	item_state = "gun"
	w_class = 2
	caliber = "9x18"
	fire_delay = 1
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/cz9x18
	allowed_magazines = /obj/item/ammo_magazine/cz9x18
	fire_sound = 'sound/weapons/gunshot/makarov.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.wav'

/obj/item/weapon/gun/projectile/colt911
	name = "Colt M1911A1"
	desc = "Solid classic. Uses .45 ammo."
	icon_state = "colt" //fix
	item_state = "gun"
	w_class = ITEM_SIZE_NORMAL
	caliber = ".45"
	fire_delay = 1
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/c45m
	allowed_magazines = /obj/item/ammo_magazine/c45m
	fire_sound = 'sound/weapons/gunshot/m1911.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.wav'
	jam_chance = 1

/obj/item/weapon/gun/projectile/colt911/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "colt"
	else
		icon_state = "colt-empty"

/obj/item/weapon/gun/projectile/walther
	name = "P1"
	desc = "A bit modified Walther P38 with politically correct name. Uses 9x19 ammo"
	icon_state = "p1" //fix
	item_state = "gun"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x19"
	fire_delay = 1
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x19
	allowed_magazines = /obj/item/ammo_magazine/a9x19
	fire_sound = 'sound/weapons/gunshot/waltherp1.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	jam_chance = 2
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.wav'

/obj/item/weapon/gun/projectile/lahti
	name = "Lahti"
	desc = "A Finnish standard issue handgun. Uses 9x19 ammo"
	icon_state = "lahti" //fix
	item_state = "gun"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9x19"
	fire_delay = 1
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x19
	allowed_magazines = /obj/item/ammo_magazine/a9x19
	fire_sound = 'sound/weapons/gunshot/waltherp1.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.ogg'
	jam_chance = 2
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.wav'
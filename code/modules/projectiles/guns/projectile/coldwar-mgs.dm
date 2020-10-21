/obj/item/weapon/gun/projectile/automatic/vz59 //Do not use
	name = "Vz. 59"
	desc = "A standard-issue CSLA squad support weapon. Chambers 7.62x54 rounds."
	icon_state = "vz59"
	item_state = "vz59"
	w_class = 5
	force = 15
	slot_flags = SLOT_BACK_GUN | SLOT_BACK
	max_shells = 200
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x39v
	one_hand_penalty = 9
	wielded_item_state = "kk62-wielded"
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.ogg'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.ogg'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/mg_dist.ogg'
	automatic = 0
	slowdown_general = 0.8

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=2,    move_delay=null, one_hand_penalty=7, burst_accuracy=null,              dispersion=null,                          automatic = 0),
		list(mode_name="automatic",    burst=1, fire_delay=0.2, move_delay=3,       one_hand_penalty = 8, burst_accuracy=null,     dispersion=list(0.25, 0.45, 0.75),                  automatic = 0.4),
		)

	var/cover_opened = FALSE


/obj/item/weapon/gun/projectile/automatic/vz59/special_check(mob/user)
	if(cover_opened)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/automatic/vz59/proc/toggle_cover(mob/user)
	cover_opened = !cover_opened
	to_chat(user, "<span class='notice'>You [cover_opened ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/vz59/attack_self(mob/user as mob)
	if(cover_opened)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/vz59/attack_hand(mob/user as mob)
	if(!cover_opened && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/vz59/load_ammo(var/obj/item/A, mob/user)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/vz59/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/vz59/update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/c762x54b/csla))
		icon_state = "vz59[cover_opened ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 200)]"
	else
		icon_state = "vz59[cover_opened ? "open" : "closed"]-empty"
	update_held_icon()


/obj/item/weapon/gun/projectile/automatic/mg3
	name = "MG3"
	desc = "A standard-issue Bundeswehr squad support weapon. Chambers 7.62x51 rounds."
	icon_state = "mg3"
	item_state = "m60"
	w_class = 5
	force = 15
	accuracy = 2.3
	slot_flags = SLOT_BACK_GUN | SLOT_BACK
	max_shells = 100
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51b/bdw, /obj/item/ammo_magazine/c762x51b/bdw/drum)
	one_hand_penalty = 9
	wielded_item_state = "m60-wielded" //change
	fire_sound = 'sound/weapons/gunshot/mg3.ogg'
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.ogg'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.ogg'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.ogg'
	jam_chance = 0.3
	dist_shot_sound = 'sound/weapons/gunshot/dist/mg_dist.ogg'
	slowdown_general = 0.8

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=6,    move_delay=null, one_hand_penalty=8, burst_accuracy=null,          dispersion=list(0.1),                        automatic = 0),
		list(mode_name="automatic",     burst=1,  fire_delay=0.05, move_delay=3,       one_hand_penalty=10, burst_accuracy = null,  dispersion=list(0.15, 0.25, 0.55),                  automatic = 0.2)
	)

	var/cover_opened = FALSE


/obj/item/weapon/gun/projectile/automatic/mg3/special_check(mob/user)
	if(cover_opened)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/automatic/mg3/proc/toggle_cover(mob/user)
	cover_opened = !cover_opened
	to_chat(user, "<span class='notice'>You [cover_opened ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/mg3/attack_self(mob/user as mob)
	if(cover_opened)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/mg3/attack_hand(mob/user as mob)
	if(!cover_opened && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/mg3/load_ammo(var/obj/item/A, mob/user)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/mg3/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/mg3/update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/c762x51b/bdw))
		icon_state = "mg3[cover_opened ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 100)]"
	else
		icon_state = "mg3[cover_opened ? "open" : "closed"]-empty"
	update_held_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/m60
	name = "M60E1"
	desc = "A standard-issue USMC squad support weapon. Chambers 7.62x51 rounds."
	icon_state = "m60"
	item_state = "m60"
	w_class = 5
	force = 15
	accuracy = 2.3
	slot_flags = SLOT_BACK_GUN | SLOT_BACK
	max_shells = 200
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x51b
	one_hand_penalty = 9
	dist_shot_sound = 'sound/weapons/gunshot/dist/g3_dist.ogg'
	jam_chance = 0.45
	slowdown_general = 0.8

	wielded_item_state = "m60-wielded"
	fire_sound = 'sound/weapons/gunshot/m60.ogg'
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.ogg'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.ogg'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.ogg'

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=6,    move_delay=null, one_hand_penalty=8, burst_accuracy=null,         dispersion=list(0.1),                        automatic = 0),
		list(mode_name="automatic",     burst=1, fire_delay=0.2, move_delay=3,       one_hand_penalty = 10, burst_accuracy=null, dispersion=list(0.15, 0.25, 0.55),                  automatic = 0.2)
		)

	var/cover_opened = FALSE


/obj/item/weapon/gun/projectile/automatic/m60/special_check(mob/user)
	if(cover_opened)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/automatic/m60/proc/toggle_cover(mob/user)
	cover_opened = !cover_opened
	to_chat(user,"<span class='notice'>You [cover_opened ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/m60/attack_self(mob/user as mob)
	if(cover_opened)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/m60/attack_hand(mob/user as mob)
	if(!cover_opened && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/m60/load_ammo(var/obj/item/A, mob/user)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/m60/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/m60/update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/c762x51b))
		icon_state = "m60[cover_opened ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 200)]"
	else
		icon_state = "m60[cover_opened ? "open" : "closed"]-empty"
	..()

/* this thing needs to accept 30-20 rnd STANAG mags too*/
/obj/item/weapon/gun/projectile/automatic/xm249
	name = "XM249"
	desc = "A standard-issue USMC squad support weapon. Chambers 5.56x45 rounds."
	icon_state = "xm249"
	item_state = "m60"
	w_class = 5
	force = 15
	slot_flags = SLOT_BACK_GUN | SLOT_BACK
	caliber = "556x45"
	ammo_type = /obj/item/ammo_casing/a556x45
	load_method = MAGAZINE
	allowed_magazines = /obj/item/ammo_magazine/c556x45b
	one_hand_penalty = 9
	dist_shot_sound = 'sound/weapons/gunshot/dist/g3_dist.ogg'
	jam_chance = 0.35
	slowdown_general = 0.6
	accuracy = 2.6

	wielded_item_state = "m60-wielded"
	fire_sound = 'sound/weapons/gunshot/m249.ogg'
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.ogg'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.ogg'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.ogg'

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=4.3,    move_delay=null, one_hand_penalty=7, burst_accuracy=null,           dispersion=list(0.075),                    automatic = 0),
		list(mode_name="automatic",     burst=1, fire_delay=0.1, move_delay=3,       one_hand_penalty = 8, burst_accuracy=null,        dispersion=list(0.1, 0.2, 0.45),           automatic = 0.1)
		)

	var/cover_opened = FALSE


/obj/item/weapon/gun/projectile/automatic/xm249/special_check(mob/user)
	if(cover_opened)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/automatic/xm249/proc/toggle_cover(mob/user)
	cover_opened = !cover_opened
	to_chat(user,"<span class='notice'>You [cover_opened ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/xm249/attack_self(mob/user as mob)
	if(cover_opened)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/xm249/attack_hand(mob/user as mob)
	if(!cover_opened && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/xm249/load_ammo(var/obj/item/A, mob/user)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/xm249/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/xm249/update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/c762x51b))
		icon_state = "xm249[cover_opened ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 200)]"
	else
		icon_state = "xm249[cover_opened ? "open" : "closed"]-empty"
	..()

//true kalashnikov's machinegun - standart soviet lmg
//same with bayonet as RPK
/obj/item/weapon/gun/projectile/automatic/pkm
	name = "PKM"
	desc = "A standard-issue Soviet Army general purpose machine gun. Chambers 7.62x54 rounds."
	icon_state = "pkm"
	item_state = "vz59"
	w_class = 5
	force = 15
	accuracy = 2.3
	slot_flags = SLOT_BACK_GUN | SLOT_BACK
	max_shells = 200
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x54b
	one_hand_penalty = 9
	automatic = FALSE
	jam_chance = 0.2
	slowdown_general = 0.8

	wielded_item_state = "vz59-wielded"
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.ogg'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.ogg'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/mg_dist.ogg'
	fire_sound = 'sound/weapons/gunshot/pkm.ogg'

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=6,    move_delay=null, one_hand_penalty=8, burst_accuracy=null,              dispersion=list(0.15),                          automatic = 0),
		list(mode_name="automatic",     burst=1, fire_delay=0.3, move_delay=3,       one_hand_penalty = 10, burst_accuracy=null,   dispersion=list(0.25, 0.35, 0.55),                  automatic = 0.2)
		)

	var/cover_opened = FALSE


/obj/item/weapon/gun/projectile/automatic/pkm/special_check(mob/user)
	if(cover_opened)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/automatic/pkm/proc/toggle_cover(mob/user)
	cover_opened = !cover_opened
	to_chat(user, "<span class='notice'>You [cover_opened ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/pkm/attack_self(mob/user as mob)
	if(cover_opened)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/pkm/attack_hand(mob/user as mob)
	if(!cover_opened && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/pkm/load_ammo(var/obj/item/A, mob/user)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/pkm/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/pkm/update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/c762x54b))
		icon_state = "pkm[cover_opened ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 200)]"
	else
		icon_state = "pkm[cover_opened ? "open" : "closed"]-empty"
	update_held_icon()
	..()

////////////// the l7a2 //////////////////////////
/obj/item/weapon/gun/projectile/automatic/l7a2
	name = "L7A2"
	desc = "A standard-issue Royal Marines general purpose machine gun. Chambers 7.62x51 rounds."
	icon_state = "l7a2"
	item_state = "l7a2"
	w_class = 5
	force = 15
	accuracy = 2.3
	slot_flags = SLOT_BACK_GUN | SLOT_BACK
	max_shells = 200
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x51b/en
	one_hand_penalty = 9
	automatic = FALSE
	jam_chance = 0.25
	slowdown_general = 0.8

	wielded_item_state = "l7a2-wielded"
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.ogg'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.ogg'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/mg_dist.ogg'
	fire_sound = 'sound/weapons/gunshot/pkm.ogg'

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=6,    move_delay=null, one_hand_penalty=8, burst_accuracy=null,              dispersion=list(0.1),                           automatic = 0),
		list(mode_name="automatic",     burst=1, fire_delay=0.3, move_delay=3,       one_hand_penalty = 9, burst_accuracy=null,   dispersion=list(0.15, 0.25, 0.55),                  automatic = 0.2)
		)

	var/cover_opened = FALSE


/obj/item/weapon/gun/projectile/automatic/l7a2/special_check(mob/user)
	if(cover_opened)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/automatic/l7a2/proc/toggle_cover(mob/user)
	cover_opened = !cover_opened
	to_chat(user, "<span class='notice'>You [cover_opened ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/l7a2/attack_self(mob/user as mob)
	if(cover_opened)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/l7a2/attack_hand(mob/user as mob)
	if(!cover_opened && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/l7a2/load_ammo(var/obj/item/A, mob/user)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/l7a2/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/l7a2/update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/c762x54b))
		icon_state = "l7a2[cover_opened ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 200)]"
	else
		icon_state = "l7a2[cover_opened ? "open" : "closed"]-empty"
	update_held_icon()
	..()


//heavily ak-74 version, have a little bit faster bullets and larger barrel - ~750m\sec against of ak's 715m\sec
//have bipods on bayonet's slot
/obj/item/weapon/gun/projectile/automatic/rpk74
	name = "RPK-74"
	desc = "A standard-issue Soviet Army squad support weapon. Chambers 5.45x39 rounds."
	icon_state = "rpk74"
	item_state = "rpk"
	slot_flags = SLOT_BACK_GUN | SLOT_BACK
	w_class = 5
	force = 10
	max_shells = 45
	caliber = "545x39"
	ammo_type = /obj/item/ammo_casing/a545x39
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	one_hand_penalty = 6
	accuracy = 3.1
	wielded_item_state = "rpk-wielded"
	slowdown_general = 0.45
	jam_chance = 0.3

	fire_sound = 'sound/weapons/gunshot/rpk74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'


	firemodes = list(
		list(mode_name="semiauto",      burst=1, fire_delay=3.5,   move_delay=null,    one_hand_penalty=5, burst_accuracy=null,   dispersion=list(0.0,0.1,0.2),                            automatic = 0),
		list(mode_name="automatic",     burst=1, fire_delay=0.5, move_delay=3,       one_hand_penalty=6, burst_accuracy=null,   dispersion=list(0.1, 0.2, 0.4),                 automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rpk74/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "rpk74"
	else
		icon_state = "rpk74-empty"
	update_held_icon()


//heavily ak-74 version, have a little bit faster bullets and larger barrel - ~750m\sec against of ak's 715m\sec
//have bipods on bayonet's slot
/obj/item/weapon/gun/projectile/automatic/nvarpk
	name = "IMG-K"
	desc = "A standard-issue Nationale Volksarmee squad support weapon. Chambers 7.62x39 rounds."
	icon_state = "nvarpk"
	item_state = "nvarpk"
	slot_flags = SLOT_BACK_GUN | SLOT_BACK
	w_class = 5
	force = 10
	max_shells = 75
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = list(/obj/item/ammo_magazine/c762x39m, /obj/item/ammo_magazine/c762x39b, /obj/item/ammo_magazine/c762x39k)
	one_hand_penalty = 6
	accuracy = 2.9
	wielded_item_state = "nvarpk-wielded"
	slowdown_general = 0.45
	jam_chance = 0.225

	fire_sound = 'sound/weapons/gunshot/akm.ogg'
	unload_sound = 'sound/weapons/gunporn/ak47_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak47_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak47_boltback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'


	firemodes = list(
		list(mode_name="semiauto",      burst=1, fire_delay=4,   move_delay=null,    one_hand_penalty=5, burst_accuracy=null,   dispersion=list(0.0,0.1,0.2),                            automatic = 0),
		list(mode_name="automatic",     burst=1, fire_delay=0.7, move_delay=3,       one_hand_penalty=6, burst_accuracy=null,   dispersion=list(0.25, 0.35, 0.5),              automatic = 0.6),
		)

/obj/item/weapon/gun/projectile/automatic/nvarpk/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "nvarpk"
		wielded_item_state = "nvarpk-wielded"
	else
		icon_state = "nvarpk-empty"
		wielded_item_state = "nvarpk-wielded-empty"
	update_held_icon()



/obj/item/weapon/gun/projectile/automatic/rpd //Do not use
	name = "RPD"
	desc = "That's the Ruchnoi Pulemet Degtyaryova, an outdated machine gun which is still used by NVA DDR."
	icon_state = "rpd"
	item_state = "rpd"
	w_class = 5
	force = 15
	slot_flags = SLOT_BACK_GUN | SLOT_BACK
	max_shells = 100
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x39d
	one_hand_penalty = 9
	automatic = FALSE
	jam_chance = 0.275
	slowdown_general = 0.8

	wielded_item_state = "rpd-wielded"
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.ogg'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.ogg'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/mg_dist.ogg'
	fire_sound = 'sound/weapons/gunshot/rpd.ogg'

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=2,    move_delay=null, one_hand_penalty=7, burst_accuracy=null,              dispersion=null,                          automatic = 0),
		list(mode_name="automatic",     burst=1, fire_delay=0.5, move_delay=3,       one_hand_penalty = 8, burst_accuracy=null,   dispersion=list(0.5, 0.8),                  automatic = 0.5)
		)

	var/cover_opened = FALSE


/obj/item/weapon/gun/projectile/automatic/rpd/special_check(mob/user)
	if(cover_opened)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/automatic/rpd/proc/toggle_cover(mob/user)
	cover_opened = !cover_opened
	to_chat(user, "<span class='notice'>You [cover_opened ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/rpd/attack_self(mob/user as mob)
	if(cover_opened)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/rpd/attack_hand(mob/user as mob)
	if(!cover_opened && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/rpd/load_ammo(var/obj/item/A, mob/user)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/rpd/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/rpd/update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/c762x39d))
		icon_state = "rpd[cover_opened ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 100)]"
	else
		icon_state = "rpd[cover_opened ? "open" : "closed"]-empty"
	update_held_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/kk62
	name = "KK62"
	desc = "A standard-issue Finnish light machine gun. Chambers 7.62x39 rounds."
	icon_state = "kk62"
	item_state = "kk62"
	w_class = 5
	force = 12.5
	accuracy = 2.3
	slot_flags = SLOT_BACK_GUN | SLOT_BACK
	max_shells = 100
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	load_method = MAGAZINE
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x39v
	one_hand_penalty = 9
	automatic = FALSE
	jam_chance = 0.25
	slowdown_general = 0.8

	wielded_item_state = "kk62-wielded"
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.ogg'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.ogg'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/mg_dist.ogg'
	fire_sound = 'sound/weapons/gunshot/pkm.ogg'

	firemodes = list(
		list(mode_name="semiauto",     burst=1, fire_delay=5,    move_delay=null, one_hand_penalty=7, burst_accuracy=null,              dispersion=list(0.1),                          automatic = 0),
		list(mode_name="automatic",     burst=1, fire_delay=0.2, move_delay=3,       one_hand_penalty = 8, burst_accuracy=null,   dispersion=list(0.15, 0.25, 0.55),                  automatic = 0.2)
		)

	var/cover_opened = FALSE


/obj/item/weapon/gun/projectile/automatic/kk62/special_check(mob/user)
	if(cover_opened)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
		return FALSE
	return ..()

/obj/item/weapon/gun/projectile/automatic/kk62/proc/toggle_cover(mob/user)
	cover_opened = !cover_opened
	to_chat(user, "<span class='notice'>You [cover_opened ? "open" : "close"] [src]'s cover.</span>")
	update_icon()

/obj/item/weapon/gun/projectile/automatic/kk62/attack_self(mob/user as mob)
	if(cover_opened)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/kk62/attack_hand(mob/user as mob)
	if(!cover_opened && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/kk62/load_ammo(var/obj/item/A, mob/user)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to load that into [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/kk62/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_opened)
		to_chat(user, "<span class='warning'>You need to open the cover to unload [src].</span>")
		return
	..()

/obj/item/weapon/gun/projectile/automatic/kk62/update_icon()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/c762x39v))
		icon_state = "kk62[cover_opened ? "open" : "closed"][round(ammo_magazine.stored_ammo.len, 100)]"
	else
		icon_state = "kk62[cover_opened ? "open" : "closed"]-empty"
	update_held_icon()
	..()
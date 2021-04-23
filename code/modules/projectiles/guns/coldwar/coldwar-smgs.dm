/////////////////////////some smgs have bayonets so im just porting it here -le severepwnage///////////////////////

/obj/item/weapon/gun/projectile/automatic/smg
	var/bayonet_type = null
	var/bayonet_attachable = 0
	var/obj/item/weapon/material/knife/bayonet/knife = null

/obj/item/weapon/gun/projectile/automatic/smg/New()
	..()
	src.verbs -= /obj/item/weapon/gun/projectile/automatic/smg/verb/remove_bayonet

/obj/item/weapon/gun/projectile/automatic/smg/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, src.bayonet_type) && bayonet_attachable)
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp += W.sharp
		src.force += W.force
		bayonet_attachable = 0
		to_chat(user, "<span class='notice'>You attach [knife.name] to the [src].</span>")
		src.verbs += /obj/item/weapon/gun/projectile/automatic/smg/verb/remove_bayonet
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/smg/update_icon()
	..()
	if(knife)
		var/image/I = image('icons/obj/coldwar/bayonets.dmi', src, knife.icon_state)
		I.pixel_x += 10
		I.pixel_y += 10
		overlays += I
	else
		overlays.Cut()

/obj/item/weapon/gun/projectile/automatic/smg/verb/remove_bayonet()
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
		src.verbs -= /obj/item/weapon/gun/projectile/automatic/smg/verb/remove_bayonet
		update_icon()


/obj/item/weapon/gun/projectile/automatic/smg/sterling
	name = "Sterling SMG"
	desc = "A submachine gun used by the Royal Marines. Chambers 9x19 rounds."
	icon_state = "sterling"
	item_state = "sterling"
	w_class = 5
	load_method = MAGAZINE
	caliber = "9x19"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a9x19
	allowed_magazines = /obj/item/ammo_magazine/a9x19s
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 1.4
	bayonet_type = /obj/item/weapon/material/knife/bayonet/baf/
	bayonet_attachable = 1
	jam_chance = 0.725
	slowdown_general = 0.15
	wielded_item_state = "sterling-wielded"
	fire_sound = 'sound/weapons/gunshot/sterling.ogg'
	unload_sound = 'sound/weapons/gunporn/sterling_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/sterling_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/sterling_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/sterling_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.7, move_delay=1, one_hand_penalty=3, burst_accuracy=null, dispersion=list(0.2, 0.3, 0.4), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/smg/sterling/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "sterling"
		wielded_item_state = "sterling-wielded"
	else
		icon_state = "sterling-empty"
		wielded_item_state = "sterling-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/smg/kp31
	name = "Suomi KP/-31"
	desc = "A submachine gun used by the Finnish Army. Chambers 9x19 rounds."
	icon_state = "kp31"
	item_state = "kp31"
	w_class = 5
	load_method = MAGAZINE
	caliber = "9x19"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a9x19
	allowed_magazines = /obj/item/ammo_magazine/a9x19k
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 1.4
	bayonet_type = /obj/item/weapon/material/knife/bayonet/baf/
	bayonet_attachable = 1
	jam_chance = 0.725
	slowdown_general = 0.15
	wielded_item_state = "kp31-wielded"
	fire_sound = 'sound/weapons/gunshot/waltherp1.ogg'
	unload_sound = 'sound/weapons/gunporn/sterling_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/sterling_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/sterling_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/sterling_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.3, move_delay=1, one_hand_penalty=3, burst_accuracy=null, dispersion=list(0.2, 0.3, 0.4), automatic = 0.4),
		)

/obj/item/weapon/gun/projectile/automatic/smg/kp31/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "kp31"
		wielded_item_state = "sterling-wielded"
	else
		icon_state = "kp31-empty"
		wielded_item_state = "sterling-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/smg/mp5
	name = "MP5"
	desc = "A submachine gun used by the Bundeswehr. Chambers 9x19 rounds."
	icon_state = "mp5"
	item_state = "mp5"
	w_class = 5
	load_method = MAGAZINE
	caliber = "9x19"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a9x19
	allowed_magazines = /obj/item/ammo_magazine/a9x19s
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 1.4
	bayonet_type = /obj/item/weapon/material/knife/bayonet/bdw/
	bayonet_attachable = 0
	jam_chance = 0.725
	slowdown_general = 0.15
	wielded_item_state = "mp5-wielded"
	fire_sound = 'sound/weapons/gunshot/scorpion.ogg' /////////change all sounds
	unload_sound = 'sound/weapons/gunporn/ak47_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak47_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/fnfal_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/pistol_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.7, move_delay=1, one_hand_penalty=3, burst_accuracy=null, dispersion=list(0.2, 0.3, 0.4), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/smg/mp5/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "mp5"
		wielded_item_state = "mp5-wielded"
	else
		icon_state = "mp5-empty"
		wielded_item_state = "mp5-wielded-empty"


/obj/item/weapon/gun/projectile/automatic/smg/z84
	name = "Star Modelo Z84"
	desc = "A submachine gun used by the Republican Army. Chambers 9x19 rounds."
	icon_state = "z84"
	item_state = "z84"
	w_class = 5
	load_method = MAGAZINE
	caliber = "9x19"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a9x19
	allowed_magazines = /obj/item/ammo_magazine/a9x19z
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 1.4
	bayonet_attachable = 0
	jam_chance = 0.725
	slowdown_general = 0.15
	wielded_item_state = "z84-wielded"
	fire_sound = 'sound/weapons/gunshot/z84.ogg' /////////change all sounds
	unload_sound = 'sound/weapons/gunporn/z84_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/z84_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/z84_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/z84_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.7, move_delay=1, one_hand_penalty=3, burst_accuracy=null, dispersion=list(0.2, 0.3, 0.4), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/smg/z84/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "z84"
		wielded_item_state = "z84-wielded"
	else
		icon_state = "z84-empty"
		wielded_item_state = "z84-wielded-empty"


/obj/item/weapon/gun/projectile/automatic/smg/mat49
	name = "MAT-49"
	desc = "A submachine gun used by the ADT. Chambers 9x19 rounds."
	icon_state = "mat49"
	item_state = "mat49"
	w_class = 5
	load_method = MAGAZINE
	caliber = "9x19"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a9x19
	allowed_magazines = /obj/item/ammo_magazine/a9x19t
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 1.4
	bayonet_attachable = 0
	jam_chance = 0.725
	slowdown_general = 0.15
	wielded_item_state = "mat49-wielded"
	fire_sound = 'sound/weapons/gunshot/mat49.ogg' /////////change all sounds
	unload_sound = 'sound/weapons/gunporn/mat49_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/mat49_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/mat49_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/mat49_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=2, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.7, move_delay=1, one_hand_penalty=3, burst_accuracy=null, dispersion=list(0.2, 0.3, 0.4), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/smg/mat49/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "mat49"
		wielded_item_state = "mat49-wielded"
	else
		icon_state = "mat49-empty"
		wielded_item_state = "mat49-wielded-empty"
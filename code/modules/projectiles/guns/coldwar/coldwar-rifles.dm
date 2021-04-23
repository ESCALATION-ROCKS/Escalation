/////////////////////////some bayonet code///////////////////////

/obj/item/weapon/gun/projectile/automatic/rifle/
	var/bayonet_type = null
	var/bayonet_attachable = 0
	var/obj/item/weapon/material/knife/bayonet/knife = null

/obj/item/weapon/gun/projectile/automatic/rifle/New()
	..()
	src.verbs -= /obj/item/weapon/gun/projectile/automatic/rifle/verb/remove_bayonet

/obj/item/weapon/gun/projectile/automatic/rifle/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, src.bayonet_type) && bayonet_attachable)
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp += W.sharp
		src.force += W.force
		bayonet_attachable = 0
		to_chat(user, "<span class='notice'>You attach [knife.name] to the [src].</span>")
		src.verbs += /obj/item/weapon/gun/projectile/automatic/rifle/verb/remove_bayonet
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/rifle/update_icon()
	..()
	if(knife)
		var/image/I = image('icons/obj/coldwar/bayonets.dmi', src, knife.icon_state)
		I.pixel_x += 10
		I.pixel_y += 10
		overlays += I
	else
		overlays.Cut()

/obj/item/weapon/gun/projectile/automatic/rifle/verb/remove_bayonet()
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
		src.verbs -= /obj/item/weapon/gun/projectile/automatic/rifle/verb/remove_bayonet
		update_icon()


///////////////////////bayonet code ends here//////////////////////////

/obj/item/weapon/gun/projectile/automatic/rifle/ak74
	name = "AK-74"
	desc = "A standard-issue Soviet Army combat rifle. Chambers 5.45x39 rounds."
	icon_state = "ak74"
	item_state = "ak74"
	w_class = 5
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	magazine_type = null
	one_hand_penalty = 5
	force = 15
	accuracy = 2.8
	wielded_item_state = "ak74-wielded"
	jam_chance = 0.285
	slowdown_general = 0.27
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h4/
	bayonet_attachable = 1
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.5, move_delay=2, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.15, 0.25, 0.45), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/ak74/update_icon()
	..()

	if(ammo_magazine)
		icon_state = "ak74"
		item_state = "ak74"
		wielded_item_state = "ak74-wielded"
	else
		icon_state = "ak74-empty"
		item_state = "ak74-empty"
		wielded_item_state = "ak74-wielded-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/ak74/black
	desc = "AK-74 with polymer kit and dim finish. Chambers 5.45x39 rounds."
	icon_state = "ak74black"

/obj/item/weapon/gun/projectile/automatic/rifle/ak74/black/update_icon()
	..()

	if(ammo_magazine)
		icon_state = "ak74black"
	else
		icon_state = "ak74black-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/aek971
	name = "AEK-971"
	desc = "An experimental prototype assault rifle. This isn't a common sight. Chambers 5.45x39 rounds."
	icon_state = "aek971"
	item_state = "aek971"
	w_class = 5
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	magazine_type = null
	one_hand_penalty = 5
	force = 15
	accuracy = 2.8
	wielded_item_state = "aek971-wielded"
	jam_chance = 0.285
	slowdown_general = 0.27
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h4/
	bayonet_attachable = 1
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=1.5, move_delay=2, one_hand_penalty=5, burst_accuracy=list(2,1,1), dispersion=list(0.1, 0.3, 0.4)),
		list(mode_name="automatic", burst=1, fire_delay=0.5, move_delay=2, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.15, 0.25, 0.45), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/aek971/update_icon()
	..()

	if(ammo_magazine)
		icon_state = "aek971"
		item_state = "aek971"
		wielded_item_state = "aek971-wielded"
	else
		icon_state = "aek971-empty"
		item_state = "aek971-empty"
		wielded_item_state = "aek971-wielded-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/aks74
	name = "AKS-74"
	desc = "A lighter version of the standard-issue Soviet Army combat rifle. Chambers 5.45x39 rounds."
	icon_state = "aks74"
	item_state = "aks"
	w_class = 4
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	magazine_type = null
	one_hand_penalty = 5
	force = 15
	accuracy = 2.7
	jam_chance = 0.285
	slowdown_general = 0.27
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h4/
	bayonet_attachable = 1
	wielded_item_state = "aks-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.5, move_delay=2, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.2, 0.3, 0.6), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/aks74/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "aks74"
		wielded_item_state = "aks-wielded"
	else
		icon_state = "aks74-empty"
		wielded_item_state = "aks-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/aks74u
	name = "AKS-74U"
	desc = "A standard issue carbine used by the Soviet Army. Chambers 5.45x39 rounds."
	icon_state = "aks74u"
	item_state = "aks"
	w_class = 4
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	magazine_type = null
	one_hand_penalty = 5
	force = 15
	accuracy = 2.6
	jam_chance = 0.285
	slowdown_general = 0.27
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h4/
	bayonet_attachable = 0
	wielded_item_state = "aks-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/aks74u_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/aks74u_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/aks74u_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/aks74u_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.4, move_delay=1, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.15, 0.25, 0.45), automatic = 0.5),
		)


/obj/item/weapon/gun/projectile/automatic/rifle/aks74u/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "aks74u"
		wielded_item_state = "aks-wielded"
	else
		icon_state = "aks74u-empty"
		wielded_item_state = "aks-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/ak74gl
	name = "AK-74"
	desc = "A standard-issue Soviet Army combat rifle with a GP-25 launcher attached. Chambers 5.45x39 rounds."
	icon_state = "ak74gl"
	item_state = "ak74gl"
	w_class = 5
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	magazine_type = null
	one_hand_penalty = 3
	force = 15
	accuracy = 2.8
	bayonet_attachable = 0
	wielded_item_state = "ak74gl-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'
	jam_chance = 0.285
	slowdown_general = 0.27

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/gp25/launcher

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.5, move_delay=2, one_hand_penalty=6, burst_accuracy=null, dispersion=list(0.15, 0.25, 0.45), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/ak74gl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/rifle/ak74gl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//load check it for it's type
		playsound(src, 'sound/weapons/gunporn/gp25_insertgrenade.ogg', 50, 1)
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/ak74gl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		playsound(src, 'sound/weapons/gunporn/gp25_openbarrel.ogg', 50, 1)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/ak74gl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher && !roundstarted)
		to_chat(user, "<span class='warning'>There is no reason to fire an underbarrel grenade!</span>")
		return
	if(use_launcher && roundstarted)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
			playsound(src, 'sound/weapons/gunporn/gp25_empty.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/ak74gl/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "ak74gl"
		wielded_item_state = "ak74gl-wielded"
	else
		icon_state = "ak74gl-empty"
		wielded_item_state = "ak74gl-wielded-empty"


/obj/item/weapon/gun/projectile/automatic/rifle/ak74gl/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr

	if(launcher)
		use_launcher = !use_launcher
		if(do_after(usr, 1, src))
			to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")
			playsound(src, 'sound/weapons/gunporn/gp25_select.ogg', 50, 1)

/obj/item/weapon/gun/projectile/automatic/rifle/aks74gl
	name = "AKS-74 w/ GP25"
	desc = "A Soviet Army combat rifle with a folding stock and a GP-25 launcher attached. Chambers 5.45x39 rounds."
	icon_state = "aks74gl"
	item_state = "aks74gl"
	w_class = 5
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	magazine_type = null
	one_hand_penalty = 3
	force = 15
	accuracy = 2.8
	bayonet_attachable = 0
	wielded_item_state = "ak74gl-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'
	jam_chance = 0.285
	slowdown_general = 0.27

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/gp25/launcher

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.5, move_delay=2, one_hand_penalty=6, burst_accuracy=null, dispersion=list(0.15, 0.25, 0.45), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/aks74gl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/rifle/aks74gl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//load check it for it's type
		playsound(src, 'sound/weapons/gunporn/gp25_insertgrenade.ogg', 50, 1)
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/aks74gl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		playsound(src, 'sound/weapons/gunporn/gp25_openbarrel.ogg', 50, 1)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/aks74gl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher && !roundstarted)
		to_chat(user, "<span class='warning'>There is no reason to fire an underbarrel grenade!</span>")
		return
	if(use_launcher && roundstarted)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
			playsound(src, 'sound/weapons/gunporn/gp25_empty.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/aks74gl/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "aks74gl"
		wielded_item_state = "aks74gl-wielded"
	else
		icon_state = "aks74gl-empty"
		wielded_item_state = "aks74gl-wielded-empty"


/obj/item/weapon/gun/projectile/automatic/rifle/aks74gl/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr

	if(launcher)
		use_launcher = !use_launcher
		if(do_after(usr, 1, src))
			to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")
			playsound(src, 'sound/weapons/gunporn/gp25_select.ogg', 50, 1)

/obj/item/weapon/gun/projectile/automatic/rifle/akm
	name = "AKM"
	desc = "An outdated Soviet rifle used by a large number of militaries. Chambers 7.62x39 rounds."
	icon_state = "akm"
	item_state = "mpi"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x39"
	force = 15
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = list(/obj/item/ammo_magazine/c762x39m, /obj/item/ammo_magazine/c762x39b, /obj/item/ammo_magazine/c762x39k)
	magazine_type = null
	one_hand_penalty = 5
	accuracy = 2.7
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h3
	bayonet_attachable = 1
	jam_chance = 0.45
	slowdown_general = 0.27

	wielded_item_state = "mpi-wielded"
	fire_sound = 'sound/weapons/gunshot/ak47.ogg'
	unload_sound = 'sound/weapons/gunporn/ak47_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak47_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak47_boltback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3.5, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.7, move_delay=2, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.3, 0.4, 0.6), automatic = 0.6),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/akm/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "akm"
		wielded_item_state = "mpi-wielded"
	else
		icon_state = "akm-empty"
		wielded_item_state = "mpi-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/akms
	name = "AKMS"
	desc = "An outdated Soviet rifle with a folding stock. Chambers 7.62x39 rounds."
	icon_state = "akms"
	item_state = "mpi"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = list(/obj/item/ammo_magazine/c762x39m, /obj/item/ammo_magazine/c762x39b, /obj/item/ammo_magazine/c762x39k)
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 2.6
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h3
	bayonet_attachable = 1
	jam_chance = 0.475
	slowdown_general = 0.15

	wielded_item_state = "mpi-wielded"
	fire_sound = 'sound/weapons/gunshot/akm.ogg'
	unload_sound = 'sound/weapons/gunporn/ak47_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak47_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak47_boltback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3.5, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.7, move_delay=1, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.35, 0.45, 0.7), automatic = 0.7),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/akms/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "akms"
		wielded_item_state = "mpi-wielded"
	else
		icon_state = "akms-empty"
		wielded_item_state = "mpi-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/akmgl
	name = "AKM w/ GP-25"
	desc = "An outdated Soviet rifle. There's a GP-25 attached to it. Chambers 7.62x39 rounds."
	icon_state = "akmgl"
	item_state = "mpigl"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = list(/obj/item/ammo_magazine/c762x39m, /obj/item/ammo_magazine/c762x39b, /obj/item/ammo_magazine/c762x39k)
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 2.7
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h3
	bayonet_attachable = 0
	jam_chance = 0.45
	slowdown_general = 0.25

	wielded_item_state = "mpigl-wielded"
	fire_sound = 'sound/weapons/gunshot/ak47.ogg'
	unload_sound = 'sound/weapons/gunporn/ak47_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak47_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak47_boltback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.6, move_delay=1, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.4, 0.5, 0.75), automatic = 0.8),
		)

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/gp25/launcher

/obj/item/weapon/gun/projectile/automatic/rifle/akmgl/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "akmgl"
		wielded_item_state = "mpigl-wielded"
	else
		icon_state = "akmgl-empty"
		wielded_item_state = "mpigl-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/akmgl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/rifle/akmgl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//load check it for it's type
		playsound(src, 'sound/weapons/gunporn/m203_insertgrenade.ogg', 50, 1)
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/akmgl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		playsound(src, 'sound/weapons/gunporn/m203_openbarrel.ogg', 50, 1)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/akmgl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
			playsound(src, 'sound/weapons/gunporn/m203_empty.ogg', 50, 1)
	else
		..()


/obj/item/weapon/gun/projectile/automatic/rifle/akmgl/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr

	if(launcher)
		use_launcher = !use_launcher
		if(do_after(usr, 1, src))
			to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")
			playsound(src, 'sound/weapons/gunporn/m203_select.ogg', 50, 1)

/obj/item/weapon/gun/projectile/automatic/rifle/m16a2
	name = "M16A2"
	desc = "A standard-issue USMC combat rifle. Chambers 5.56x39 rounds."
	icon_state = "m16a2"
	item_state = "m16"
	w_class = 5
	load_method = MAGAZINE
	caliber = "556x45"
	force = 15
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45m)
	magazine_type = null
	one_hand_penalty = 4
	accuracy = 3
	bayonet_type = /obj/item/weapon/material/knife/bayonet/usmc/
	bayonet_attachable = 1
	jam_chance = 0.325
	slowdown_general = 0.27
	wielded_item_state = "m16-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/m16_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=1.5, move_delay=2, one_hand_penalty=5, burst_accuracy=list(2,1,1), dispersion=list(0.1, 0.3, 0.4), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/m16a2/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "m16a2"
		wielded_item_state = "m16-wielded"
	else
		icon_state = "m16a2-empty"
		wielded_item_state = "m16-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/m14 //do not use
	name = "M14"
	desc = "A former standard-issue USMC combat rifle. Chambers 7.62x51 rounds."
	icon_state = "m14"
	item_state = "m14"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	w_class = 5
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	load_method = MAGAZINE
	force = 15
	magazine_type = null
	allowed_magazines = /obj/item/ammo_magazine/c762x51s
	screen_shake = 1
	one_hand_penalty = 4
	accuracy = 3.8
	bayonet_type = /obj/item/weapon/material/knife/bayonet/usmc/
	bayonet_attachable = 1
	jam_chance = 0.65
	slowdown_general = 0.35

	fire_sound = 'sound/weapons/gunshot/m14.ogg'
	wielded_item_state = "m14-wielded"
	unload_sound = 'sound/weapons/gunporn/m14_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/m14_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m14_charge.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/rifle_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=8.7, move_delay=null, one_hand_penalty=8, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.2, move_delay=3, one_hand_penalty=9, burst_accuracy=null, dispersion=list(0.7, 0.8, 1.2), automatic = 0.2),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/m14/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "m14"
		wielded_item_state = "m14-wielded"
	else
		icon_state = "m14-empty"
		wielded_item_state = "m14-wielded-empty"


/obj/item/weapon/gun/projectile/automatic/rifle/m16a1
	name = "M16A1"
	desc = "A standard-issue USMC combat rifle. Chambers 5.56x45 rounds."
	icon_state = "m16a1"
	item_state = "m16"
	w_class = 5
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45m)
	magazine_type = null
	force = 15
	one_hand_penalty = 4
	accuracy = 3
	bayonet_type = /obj/item/weapon/material/knife/bayonet/usmc/
	bayonet_attachable = 1
	jam_chance = 0.425
	slowdown_general = 0.27
	wielded_item_state = "m16-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/m16_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3.2, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.9, move_delay=2, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.2, 0.3, 0.5), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/m16a1/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "m16a1"
		wielded_item_state = "m16-wielded"
	else
		icon_state = "m16a1-empty"
		wielded_item_state = "m16-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/xm177
	name = "XM177"
	desc = "A standard-issue USMC carbine."
	icon_state = "xm177"
	item_state = "m16"
	w_class = 5
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45m)
	magazine_type = null
	force = 15
	one_hand_penalty = 4
	accuracy = 2.3
	bayonet_type = /obj/item/weapon/material/knife/bayonet/usmc/
	bayonet_attachable = 0
	jam_chance = 1
	slowdown_general = 0.15
	wielded_item_state = "m16-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/m16_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3.2, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.8, move_delay=2, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.3, 0.4, 0.6), automatic = 0.9),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/xm177/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "xm177"
		wielded_item_state = "m16-wielded"
	else
		icon_state = "xm177-empty"
		wielded_item_state = "m16-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/m16a3
	name = "M16A3"
	desc = "A prototype USMC combat rifle. Chambers 5.56x45 rounds."
	icon_state = "m16a2"
	item_state = "m16"
	w_class = 5
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45m)
	magazine_type = null
	force = 15
	one_hand_penalty = 4
	accuracy = 3.2
	bayonet_type = /obj/item/weapon/material/knife/bayonet/usmc/
	bayonet_attachable = 1
	jam_chance = 0.425
	slowdown_general = 0.27
	wielded_item_state = "m16-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/m16_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3.2, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.9, move_delay=2, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.2, 0.3, 0.4), automatic = 0.4),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/m16a3/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "m16a2"
		wielded_item_state = "m16-wielded"
	else
		icon_state = "m16a2-empty"
		wielded_item_state = "m16-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/m16a1gl
	name = "M16A1 w/ M203"
	desc = "A standard-issue USMC combat rifle with a M203 launcher attached. Chambers 5.56x45 rounds."
	icon_state = "m16a1gl"
	item_state = "m16gl"
	w_class = 5
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45m)
	magazine_type = null
	force = 15
	one_hand_penalty = 4
	bayonet_attachable = 1
	accuracy = 3
	jam_chance = 0.425
	slowdown_general = 0.27
	wielded_item_state = "m16gl-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/m16_dist.ogg'

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/m203/launcher

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3.2, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.9, move_delay=2, one_hand_penalty=6, burst_accuracy=null, dispersion=list(0.2, 0.3, 0.5), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/m16a1gl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/rifle/m16a1gl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//launcher.load check it for it's type and handles all another things so don't worry
		launcher.load(I, user)
		playsound(src, 'sound/weapons/gunporn/m203_insertgrenade.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/m16a1gl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
		playsound(src, 'sound/weapons/gunporn/m203_openbarrel.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/m16a1gl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher && !roundstarted)
		to_chat(user, "<span class='warning'>There is no reason to fire an underbarrel grenade!</span>")
		return
	if(use_launcher && roundstarted)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
			playsound(src, 'sound/weapons/gunporn/m203_empty.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/m16a1gl/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "m16a1gl"
		wielded_item_state = "m16gl-wielded"
	else
		icon_state = "m16a1gl-empty"
		wielded_item_state = "m16gl-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/m16a1gl/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr
	set popup_menu = 1

	if(launcher)
		use_launcher = !use_launcher
		if(do_after(usr, 1, src))
			to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")
			playsound(src, 'sound/weapons/gunporn/m203_select.ogg', 50, 1)

/obj/item/weapon/gun/projectile/automatic/rifle/m16a2gl
	name = "M16A2 w/ M203"
	desc = "A standard-issue USMC combat rifle with a M203 launcher attached. Chambers 5.56x39 rounds."
	icon_state = "m16a2gl"
	item_state = "m16gl"
	w_class = 5
	load_method = MAGAZINE
	caliber = "556x45"
	force = 15
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45m)
	magazine_type = null
	one_hand_penalty = 4
	accuracy = 3
	bayonet_type = /obj/item/weapon/material/knife/bayonet/usmc/
	bayonet_attachable = 1
	jam_chance = 0.325
	slowdown_general = 0.27
	wielded_item_state = "m16a2gl-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/m16_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/m16_dist.ogg'

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/m203/launcher

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3,2, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="3-round bursts", burst=3, fire_delay=1.5, move_delay=2, one_hand_penalty=5, burst_accuracy=list(2,1,1), dispersion=list(0.1, 0.3, 0.4), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/m16a2gl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/rifle/m16a2gl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//launcher.load check it for it's type and handles all another things so don't worry
		launcher.load(I, user)
		playsound(src, 'sound/weapons/gunporn/m203_insertgrenade.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/m16a2gl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
		playsound(src, 'sound/weapons/gunporn/m203_openbarrel.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/m16a2gl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher && !roundstarted)
		to_chat(user, "<span class='warning'>There is no reason to fire an underbarrel grenade!</span>")
		return
	if(use_launcher && roundstarted)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
			playsound(src, 'sound/weapons/gunporn/m203_empty.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/m16a2gl/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "m16a2gl"
		wielded_item_state = "m16gl-wielded"
	else
		icon_state = "m16a2gl-empty"
		wielded_item_state = "m16gl-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/m16a2gl/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr
	set popup_menu = 1

	if(launcher)
		use_launcher = !use_launcher
		if(do_after(usr, 1, src))
			to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")
			playsound(src, 'sound/weapons/gunporn/m203_select.ogg', 50, 1)


/obj/item/weapon/gun/projectile/automatic/rifle/g3a3
	name = "G3A3"
	desc = "A standard-issue Bundeswehr combat rifle. Chambers 7.62x51 rounds."
	icon_state = "g3a3"
	item_state = "g3a3"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x51"
	force = 15
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x51
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51s, /obj/item/ammo_magazine/c762x51m)
	magazine_type = null
	one_hand_penalty = 5
	accuracy = 2.9
	screen_shake = 1
	bayonet_type = /obj/item/weapon/material/knife/bayonet/bdw/
	bayonet_attachable = 1
	jam_chance = 0.360
	slowdown_general = 0.27
	wielded_item_state = "g3a3-wielded"
	fire_sound = 'sound/weapons/gunshot/g3a3.ogg'
	unload_sound = 'sound/weapons/gunporn/g3_magout.ogg' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/g3_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/g3_boltpull.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/g3_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=4, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.4, move_delay=3, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.3, 0.6, 0.9), automatic = 0.7),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/g3a3/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "g3a3"
		wielded_item_state = "g3a3-wielded"
	else
		icon_state = "g3a3-empty"
		wielded_item_state = "g3a3-wielded-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/g3a3/old
	desc = "G3A3 Battle Rifle. This one has a wooden kit and shows signs of extended use. Chambers 7.62x51 rounds."
	icon_state = "g3a3-old"

/obj/item/weapon/gun/projectile/automatic/rifle/g3a3/old/update_icon()
	..()

	if(ammo_magazine)
		icon_state = "g3a3-old"
	else
		icon_state = "g3a3-old-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/g3ka4
	name = "G3KA4"
	desc = "A standard-issue Bundeswehr carbine. Chambers 7.62x51 rounds."
	icon_state = "g3ka4"
	item_state = "g3a3"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x51"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x51
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51s, /obj/item/ammo_magazine/c762x51m)
	magazine_type = null
	one_hand_penalty = 5
	force = 15
	accuracy = 2.9
	screen_shake = 1
	bayonet_type = /obj/item/weapon/material/knife/bayonet/bdw/
	bayonet_attachable = 1
	jam_chance = 0.360
	slowdown_general = 0.27
	wielded_item_state = "g3a3-wielded"
	fire_sound = 'sound/weapons/gunshot/g3a3.ogg'
	unload_sound = 'sound/weapons/gunporn/g3_magout.ogg' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/g3_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/g3_boltpull.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/g3_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=4, move_delay=null, one_hand_penalty=6, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.3, move_delay=3, one_hand_penalty=8, burst_accuracy=null, dispersion=list(0.4, 0.7, 1), automatic = 0.8),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/g3ka4/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "g3ka4"
		wielded_item_state = "g3a3-wielded"
	else
		icon_state = "g3ka4-empty"
		wielded_item_state = "g3a3-wielded-empty"
	update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rifle/g3tgs
	name = "G3A3 w/ HK79"
	desc = "A standard-issue Bundeswehr combat rifle with an HK79 launcher attached. Chambers 7.62x51 rounds."
	icon_state = "g3tgs"
	item_state = "g3tgs"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x51"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x51
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51s, /obj/item/ammo_magazine/c762x51m)
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 2.9
	bayonet_attachable = 0
	screen_shake = 1
	jam_chance = 0.360
	slowdown_general = 0.27

	wielded_item_state = "g3tgs-wielded"
	fire_sound = 'sound/weapons/gunshot/g3a3.ogg'
	unload_sound = 'sound/weapons/gunporn/g3_magout.ogg' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/g3_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/g3_boltpull.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/g3_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=4, move_delay=null, one_hand_penalty=6, burst_accuracy=null, dispersion=list(0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.4,  move_delay=3, one_hand_penalty=8, burst_accuracy=null, dispersion=list(0.4, 0.7, 1), automatic = 0.8),
		)

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/m203/launcher

/obj/item/weapon/gun/projectile/automatic/rifle/g3tgs/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/rifle/g3tgs/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//launcher.load check it for it's type and handles all another things so don't worry
		launcher.load(I, user)
		playsound(src, 'sound/weapons/gunporn/m203_insertgrenade.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/g3tgs/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
		playsound(src, 'sound/weapons/gunporn/m203_openbarrel.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/g3tgs/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher && !roundstarted)
		to_chat(user, "<span class='warning'>There is no reason to fire an underbarrel grenade!</span>")
		return
	if(use_launcher && roundstarted)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
			playsound(src, 'sound/weapons/gunporn/m203_empty.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/g3tgs/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "g3tgs"
		wielded_item_state = "g3tgs-wielded"
	else
		icon_state = "g3tgs-empty"
		wielded_item_state = "g3tgs-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/g3tgs/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr
	set popup_menu = 1

	if(launcher)
		use_launcher = !use_launcher
		if(do_after(usr, 1, src))
			to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")
			playsound(src, 'sound/weapons/gunporn/m203_select.ogg', 50, 1)

/obj/item/weapon/gun/projectile/automatic/rifle/auga1
	name = "StG 77"
	desc = "A standard-issue BDH assault rifle. Chambers 5.56x45 rounds."
	icon_state = "auga1"
	item_state = "aug"
	w_class = 5
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45g)
	magazine_type = null
	force = 15
	one_hand_penalty = 4
	accuracy = 2.9
	bayonet_type = /obj/item/weapon/material/knife/bayonet/heer/
	bayonet_attachable = 1
	jam_chance = 0.450
	slowdown_general = 0.25

	wielded_item_state = "aug-wielded"
	fire_sound = 'sound/weapons/gunshotnew/aug.ogg'
	unload_sound = 'sound/weapons/gunporn/aug_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/aug_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/aug_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/aug_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=2.8, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.6, move_delay=2, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.3, 0.4, 0.5), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/auga1/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "auga1"
		wielded_item_state = "aug-wielded"
	else
		icon_state = "auga1-empty"
		wielded_item_state = "aug-wielded-empty"


/obj/item/weapon/gun/projectile/automatic/rifle/auga1gl
	name = "StG 77 w/ M203"
	desc = "A standard-issue BDH assault rifle with a M203 launcher attached. Chambers 5.56x45 rounds."
	icon_state = "auggl"
	item_state = "auggl"
	w_class = 5
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45g)
	magazine_type = null
	force = 15
	one_hand_penalty = 4
	bayonet_attachable = 0
	accuracy = 3
	jam_chance = 0.450
	slowdown_general = 0.25
	wielded_item_state = "auggl-wielded"
	fire_sound = 'sound/weapons/gunshotnew/aug.ogg'
	unload_sound = 'sound/weapons/gunporn/aug_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/aug_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/aug_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/aug_dist.ogg'

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/m203/launcher

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=2.8, move_delay=null, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.6, move_delay=2, one_hand_penalty=6, burst_accuracy=null, dispersion=list(0.3, 0.4, 0.5), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/auga1gl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/rifle/auga1gl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//launcher.load check it for it's type and handles all another things so don't worry
		launcher.load(I, user)
		playsound(src, 'sound/weapons/gunporn/m203_insertgrenade.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/auga1gl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
		playsound(src, 'sound/weapons/gunporn/m203_openbarrel.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/auga1gl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher && !roundstarted)
		to_chat(user, "<span class='warning'>There is no reason to fire an underbarrel grenade!</span>")
		return
	if(use_launcher && roundstarted)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
			playsound(src, 'sound/weapons/gunporn/m203_empty.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/auga1gl/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "auggl"
		wielded_item_state = "auggl-wielded"
	else
		icon_state = "auggl-empty"
		wielded_item_state = "auggl-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/auga1gl/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr
	set popup_menu = 1

	if(launcher)
		use_launcher = !use_launcher
		if(do_after(usr, 1, src))
			to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")
			playsound(src, 'sound/weapons/gunporn/m203_select.ogg', 50, 1)

/obj/item/weapon/gun/projectile/automatic/rifle/vz58
	name = "Sa vz.58"
	desc = "A standard-issue CSLA combat rifle. Chambers 7.62x39 rounds."
	icon_state = "vz58"
	item_state = "mpi"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x39"
	force = 15
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = list(/obj/item/ammo_magazine/c762x39m, /obj/item/ammo_magazine/c762x39b, /obj/item/ammo_magazine/c762x39k)
	magazine_type = null
	one_hand_penalty = 5
	accuracy = 2.6
	bayonet_type = /obj/item/weapon/material/knife/bayonet/csla
	bayonet_attachable = 1
	jam_chance = 0.36
	slowdown_general = 0.23

	wielded_item_state = "mpi-wielded"
	fire_sound = 'sound/weapons/gunshot/vz58.ogg'
	unload_sound = 'sound/weapons/gunporn/ak47_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak47_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak47_boltback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3.8, move_delay=null, one_hand_penalty=3, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.7, move_delay=1, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.35, 0.45, 0.7), automatic = 0.7),
		)


/obj/item/weapon/gun/projectile/automatic/rifle/vz58/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "vz58"
	else
		icon_state = "vz58-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/vz58v
	name = "Sa vz.58 V"
	desc = "A standard-issue CSLA combat rifle with a folding stock. Chambers 7.62x39 rounds."
	icon_state = "vz58v"
	item_state = "mpi"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = list(/obj/item/ammo_magazine/c762x39m, /obj/item/ammo_magazine/c762x39b, /obj/item/ammo_magazine/c762x39k)
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 2.6
	bayonet_type = /obj/item/weapon/material/knife/bayonet/csla
	bayonet_attachable = 1
	jam_chance = 0.36
	slowdown_general = 0.20

	wielded_item_state = "mpi-wielded"
	fire_sound = 'sound/weapons/gunshot/vz58.ogg'
	unload_sound = 'sound/weapons/gunporn/ak47_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak47_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak47_boltback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3.8, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.7, move_delay=1, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.35, 0.45, 0.7), automatic = 0.7),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/vz58v/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "vz58v"
		wielded_item_state = "mpi-wielded"
	else
		icon_state = "vz58v-empty"
		wielded_item_state = "mpi-wielded-empty"


/obj/item/weapon/gun/projectile/automatic/rifle/vz58gl
	name = "Sa vz.58 w/ GP-25"
	desc = "A standard-issue CSLA combat rifle with a folding stock. There's a GP-25 attached to it. Chambers 7.62x39 rounds."
	icon_state = "vz58gl"
	item_state = "mpigl"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = list(/obj/item/ammo_magazine/c762x39m, /obj/item/ammo_magazine/c762x39b, /obj/item/ammo_magazine/c762x39k)
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 2.6
	bayonet_type = /obj/item/weapon/material/knife/bayonet/csla/
	bayonet_attachable = 0
	jam_chance = 0.36
	slowdown_general = 0.26

	wielded_item_state = "mpigl-wielded"
	fire_sound = 'sound/weapons/gunshot/vz58.ogg'
	unload_sound = 'sound/weapons/gunporn/ak47_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak47_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak47_boltback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3.8, move_delay=null, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.1), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.7, move_delay=2, one_hand_penalty=6, burst_accuracy=null, dispersion=list(0.4, 0.5, 0.7), automatic = 0.6),
		)


	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/gp25/launcher

/obj/item/weapon/gun/projectile/automatic/rifle/vz58gl/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "vz58gl"
		wielded_item_state = "mpigl-wielded"
	else
		icon_state = "vz58gl-empty"
		wielded_item_state = "mpigl-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/vz58gl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/rifle/vz58gl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//load check it for it's type
		playsound(src, 'sound/weapons/gunporn/gp25_insertgrenade.ogg', 50, 1)
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/vz58gl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		playsound(src, 'sound/weapons/gunporn/gp25_openbarrel.ogg', 50, 1)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/vz58gl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher && !roundstarted)
		to_chat(user, "<span class='warning'>There is no reason to fire an underbarrel grenade!</span>")
		return
	if(use_launcher && roundstarted)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
			playsound(src, 'sound/weapons/gunporn/gp25_empty.ogg', 50, 1)
	else
		..()


/obj/item/weapon/gun/projectile/automatic/rifle/vz58gl/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr

	if(launcher)
		use_launcher = !use_launcher
		if(do_after(usr, 1, src))
			to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")
			playsound(src, 'sound/weapons/gunporn/gp25_select.ogg', 50, 1)

/obj/item/weapon/gun/projectile/automatic/rifle/mpikm
	name = "MPi-KM"
	desc = "A standard-issue NVA DDR rifle. Chambers 7.62x39 rounds."
	icon_state = "mpikm"
	item_state = "mpi"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x39"
	force = 15
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = list(/obj/item/ammo_magazine/c762x39m, /obj/item/ammo_magazine/c762x39b, /obj/item/ammo_magazine/c762x39k)
	magazine_type = null
	one_hand_penalty = 5
	accuracy = 2.7
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h3/ddr/
	bayonet_attachable = 1
	jam_chance = 0.45
	slowdown_general = 0.27

	wielded_item_state = "mpi-wielded"
	fire_sound = 'sound/weapons/gunshot/ak47.ogg'
	unload_sound = 'sound/weapons/gunporn/ak47_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak47_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak47_boltback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3.5, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.7, move_delay=2, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.3, 0.4, 0.6), automatic = 0.6),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/mpikm/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "mpikm"
		wielded_item_state = "mpi-wielded"
	else
		icon_state = "mpikm-empty"
		wielded_item_state = "mpi-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/mpikms
	name = "MPi-KMS"
	desc = "A standard-issue NVA DDR rifle with a folding stock. Chambers 7.62x39 rounds."
	icon_state = "mpikms"
	item_state = "mpi"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = list(/obj/item/ammo_magazine/c762x39m, /obj/item/ammo_magazine/c762x39b, /obj/item/ammo_magazine/c762x39k)
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 2.6
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h3/ddr/
	bayonet_attachable = 1
	jam_chance = 0.475
	slowdown_general = 0.15

	wielded_item_state = "mpi-wielded"
	fire_sound = 'sound/weapons/gunshot/akm.ogg'
	unload_sound = 'sound/weapons/gunporn/ak47_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak47_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak47_boltback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3.5, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.7, move_delay=1, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.35, 0.45, 0.7), automatic = 0.7),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/mpikms/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "mpikms"
		wielded_item_state = "mpi-wielded"
	else
		icon_state = "mpikms-empty"
		wielded_item_state = "mpi-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/mpiakmk
	name = "MPi-AKM-K"
	desc = "A standard-issue NVA DDR carbine. Chambers 7.62x39 rounds."
	icon_state = "mpiakmk"
	item_state = "aks"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = list(/obj/item/ammo_magazine/c762x39m, /obj/item/ammo_magazine/c762x39b, /obj/item/ammo_magazine/c762x39k)
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 2.6
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h3/ddr/
	bayonet_attachable = 0
	jam_chance = 0.475
	slowdown_general = 0.15

	wielded_item_state = "mpi-wielded"
	fire_sound = 'sound/weapons/gunshot/akm.ogg'
	unload_sound = 'sound/weapons/gunporn/aks74u_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/aks74u_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/aks74u_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3.5, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.7, move_delay=1, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.4, 0.5, 0.75), automatic = 0.8),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/mpiakmk/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "mpiakmk"
		wielded_item_state = "aks-wielded"
	else
		icon_state = "mpiakmk-empty"
		wielded_item_state = "aks-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/mpikmgl
	name = "MPi-KM w/ GP-25"
	desc = "A standard-issue NVA DDR rifle. There's a GP-25 attached to it. Chambers 7.62x39 rounds."
	icon_state = "mpikmgp"
	item_state = "mpigl"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = list(/obj/item/ammo_magazine/c762x39m, /obj/item/ammo_magazine/c762x39b, /obj/item/ammo_magazine/c762x39k)
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 2.7
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h3/ddr/
	bayonet_attachable = 0
	jam_chance = 0.45
	slowdown_general = 0.25

	wielded_item_state = "mpigl-wielded"
	fire_sound = 'sound/weapons/gunshot/ak47.ogg'
	unload_sound = 'sound/weapons/gunporn/ak47_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak47_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak47_boltback.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.6, move_delay=1, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.4, 0.5, 0.75), automatic = 0.8),
		)

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/gp25/launcher

/obj/item/weapon/gun/projectile/automatic/rifle/mpikmgl/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "mpikmgp"
		wielded_item_state = "mpigl-wielded"
	else
		icon_state = "mpikmgp-empty"
		wielded_item_state = "mpigl-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/mpikmgl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/rifle/mpikmgl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//load check it for it's type
		playsound(src, 'sound/weapons/gunporn/gp25_insertgrenade.ogg', 50, 1)
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/mpikmgl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		playsound(src, 'sound/weapons/gunporn/gp25_openbarrel.ogg', 50, 1)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/mpikmgl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher && !roundstarted)
		to_chat(user, "<span class='warning'>There is no reason to fire an underbarrel grenade!</span>")
		return
	if(use_launcher && roundstarted)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
			playsound(src, 'sound/weapons/gunporn/gp25_empty.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/mpikmgl/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr

	if(launcher)
		use_launcher = !use_launcher
		if(do_after(usr, 1, src))
			to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")
			playsound(src, 'sound/weapons/gunporn/gp25_select.ogg', 50, 1)

/obj/item/weapon/gun/projectile/automatic/rifle/mpiak74n
	name = "MPi-AK-74N"
	desc = "A standard-issue NVA DDR rifle. Chambers 5.45x39 rounds."
	icon_state = "mpik74"
	item_state = "mpik74"
	w_class = 5
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	magazine_type = null
	one_hand_penalty = 5
	force = 15
	accuracy = 2.8
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h4/ddr/
	bayonet_attachable = 1
	jam_chance = 0.285
	slowdown_general = 0.25
	wielded_item_state = "mpik74-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.5, move_delay=2, one_hand_penalty=6, burst_accuracy=null, dispersion=list(0.15, 0.25, 0.45), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/mpiak74n/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "mpik74"
		item_state = "mpik74"
		wielded_item_state = "mpik74-wielded"
	else
		icon_state = "mpik74-empty"
		item_state = "mpik74-empty"
		wielded_item_state = "mpik74-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/mpiak74gl
	name = "MPi-AK-74N w/ GP-25"
	desc = "A standard-issue NVA DDR rifle with a GP-25 launcher attached. Chambers 5.45x39 rounds."
	icon_state = "mpik74gp"
	item_state = "ak74gl"
	w_class = 5
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	magazine_type = null
	force = 15
	one_hand_penalty = 3
	accuracy = 2.8
	bayonet_attachable = 0
	wielded_item_state = "ak74gl-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'
	jam_chance = 0.285
	slowdown_general = 0.27

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/gp25/launcher

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=3, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.5, move_delay=1, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.15, 0.25, 0.45), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/mpiak74gl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/rifle/mpiak74gl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//load check it for it's type
		playsound(src, 'sound/weapons/gunporn/gp25_insertgrenade.ogg', 50, 1)
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/mpiak74gl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		playsound(src, 'sound/weapons/gunporn/gp25_openbarrel.ogg', 50, 1)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/mpiak74gl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher && !roundstarted)
		to_chat(user, "<span class='warning'>There is no reason to fire an underbarrel grenade!</span>")
		return
	if(use_launcher && roundstarted)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
			playsound(src, 'sound/weapons/gunporn/gp25_empty.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/mpiak74gl/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "mpik74gp"
		wielded_item_state = "ak74gl-wielded"
	else
		icon_state = "mpik74gp-empty"
		wielded_item_state = "ak74gl-wielded-empty"


/obj/item/weapon/gun/projectile/automatic/rifle/mpiak74gl/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr

	if(launcher)
		use_launcher = !use_launcher
		if(do_after(usr, 1, src))
			to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")
			playsound(src, 'sound/weapons/gunporn/gp25_select.ogg', 50, 1)

/obj/item/weapon/gun/projectile/automatic/rifle/mpiaks74n
	name = "MPi-AKS-74N"
	desc = "A standard-issue NVA DDR rifle with a folding stock. Chambers 5.45x39 rounds."
	icon_state = "mpik74s"
	item_state = "aks"
	w_class = 5
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 2.7
	fire_delay = 2
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h4/ddr/
	bayonet_attachable = 1
	jam_chance = 0.285
	slowdown_general = 0.15

	wielded_item_state = "aks-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=3, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.5, move_delay=1, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.2, 0.3, 0.6), automatic = 0.5),
		)


/obj/item/weapon/gun/projectile/automatic/rifle/mpiaks74n/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "mpik74s"
		wielded_item_state = "aks-wielded"
	else
		icon_state = "mpik74s-empty"
		wielded_item_state = "aks-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/mpiaks74nk
	name = "MPi-AKS-74NK"
	desc = "A standard issue carbine used by the NVA DDR. Chambers 5.45x39 rounds."
	icon_state = "mpik74snk"
	item_state = "aks"
	w_class = 4
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39m, /obj/item/ammo_magazine/c545x39b)
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 2.5
	bayonet_type = /obj/item/weapon/material/knife/bayonet/sa/a6h4/ddr/
	bayonet_attachable = 0
	jam_chance = 0.285
	slowdown_general = 0.15

	wielded_item_state = "aks-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/aks74u_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/aks74u_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/aks74u_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/aks74u_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=3, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.44, move_delay=1, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.3, 0.4, 0.7), automatic = 0.6),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/mpiaks74nk/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "mpik74snk"
		wielded_item_state = "aks-wielded"
	else
		icon_state = "mpik74snk-empty"
		wielded_item_state = "aks-wielded-empty"


/obj/item/weapon/gun/projectile/automatic/rifle/rk62
	name = "RK62"
	desc = "A standard-issue Finnish assault rifle. Chambers 7.62x39 rounds."
	icon_state = "rk62"
	item_state = "rk62"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x39"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = list(/obj/item/ammo_magazine/c762x39m, /obj/item/ammo_magazine/c762x39b, /obj/item/ammo_magazine/c762x39k)
	magazine_type = null
	force = 15
	one_hand_penalty = 3
	accuracy = 2.7
	bayonet_type = /obj/item/weapon/material/knife/bayonet/finn/
	bayonet_attachable = 1
	jam_chance = 0.360
	slowdown_general = 0.27
	wielded_item_state = "rk62-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3.6, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.6, move_delay=2, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.3, 04, 0.6), automatic = 0.6),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/rk62/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "rk62"
		wielded_item_state = "rk62-wielded"
	else
		icon_state = "rk62-empty"
		wielded_item_state = "rk62-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/l1a1
	name = "L1A1"
	desc = "A standard-issue Royal Marines combat rifle. Chambers 7.62x51 rounds."
	icon_state = "l1a1"
	item_state = "l1a1"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x51"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x51
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51s, /obj/item/ammo_magazine/c762x51m)
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 3.2
	bayonet_type = /obj/item/weapon/material/knife/bayonet/baf/
	bayonet_attachable = 1
	jam_chance = 0.360
	slowdown_general = 0.27
	wielded_item_state = "l1a1-wielded"
	fire_sound = 'sound/weapons/gunshot/fnfal.ogg'
	unload_sound = 'sound/weapons/gunporn/fnfal_magout.ogg' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/fnfal_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/fnfal_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/fnfal_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, move_delay=null, one_hand_penalty=6, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="quickfire", burst=1, fire_delay=1.5, move_delay=1, one_hand_penalty=8, burst_accuracy=null, dispersion=list(0.8, 1.1, 1.3), automatic = 1.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/l1a1/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "l1a1"
		wielded_item_state = "l1a1-wielded"
	else
		icon_state = "l1a1-empty"
		wielded_item_state = "l1a1-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/stg58
	name = "StG 58"
	desc = "An outdated Bundesheer combat rifle. Chambers 7.62x51 rounds."
	icon_state = "stg58"
	item_state = "stg58"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x51"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x51
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51s, /obj/item/ammo_magazine/c762x51m)
	magazine_type = null
	force = 15
	one_hand_penalty = 5
	accuracy = 3.2
	bayonet_type = /obj/item/weapon/material/knife/bayonet/heer/
	bayonet_attachable = 1
	jam_chance = 0.360
	slowdown_general = 0.27
	wielded_item_state = "stg58-wielded"
	fire_sound = 'sound/weapons/gunshot/fnfal.ogg'
	unload_sound = 'sound/weapons/gunporn/fnfal_magout.ogg' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/fnfal_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/fnfal_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/fnfal_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=4, move_delay=null, one_hand_penalty=6, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.6, move_delay=3, one_hand_penalty=8, burst_accuracy=null, dispersion=list(0.5, 0.7, 1), automatic = 0.9)
		)

/obj/item/weapon/gun/projectile/automatic/rifle/stg58/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "stg58"
		wielded_item_state = "stg58-wielded"
	else
		icon_state = "stg58-empty"
		wielded_item_state = "stg58-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/famas
	name = "FAMAS F1"
	desc = "A standard-issue ADT assault rifle. Chambers 5.56x45 rounds."
	icon_state = "famas"
	item_state = "famas"
	w_class = 5
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45s)
	magazine_type = null
	force = 15
	one_hand_penalty = 4
	accuracy = 2.9
	bayonet_type = /obj/item/weapon/material/knife/bayonet/fra/
	bayonet_attachable = 1
	jam_chance = 0.450
	slowdown_general = 0.25

	wielded_item_state = "famas-wielded"
	fire_sound = 'sound/weapons/gunshotnew/aug.ogg'
	unload_sound = 'sound/weapons/gunporn/aug_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/aug_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/aug_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/aug_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=2.8, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.6, move_delay=2, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.3, 0.4, 0.5), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/famas/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "famas"
		wielded_item_state = "famas-wielded"
	else
		icon_state = "famas-empty"
		wielded_item_state = "famas-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/famasgl
	name = "FAMAS F1 w/ M203"
	desc = "A standard-issue ADT assault rifle with a M203 launcher attached. Chambers 5.56x45 rounds."
	icon_state = "famasgl"
	item_state = "famasgl"
	w_class = 5
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45s)
	magazine_type = null
	force = 15
	one_hand_penalty = 4
	bayonet_attachable = 0
	accuracy = 3
	jam_chance = 0.450
	slowdown_general = 0.25
	wielded_item_state = "famasgl-wielded"
	fire_sound = 'sound/weapons/gunshotnew/aug.ogg'
	unload_sound = 'sound/weapons/gunporn/aug_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/aug_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/aug_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/aug_dist.ogg'

	var/use_launcher = FALSE
	var/obj/item/weapon/gun/launcher/grenade/underslung/m203/launcher

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=2.8, move_delay=null, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.6, move_delay=2, one_hand_penalty=6, burst_accuracy=null, dispersion=list(0.3, 0.4, 0.5), automatic = 0.5),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/famasgl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/rifle/famasgl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))//launcher.load check it for it's type and handles all another things so don't worry
		launcher.load(I, user)
		playsound(src, 'sound/weapons/gunporn/m203_insertgrenade.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/famasgl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
		playsound(src, 'sound/weapons/gunporn/m203_openbarrel.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/famasgl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher && !roundstarted)
		to_chat(user, "<span class='warning'>There is no reason to fire an underbarrel grenade!</span>")
		return
	if(use_launcher && roundstarted)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
			playsound(src, 'sound/weapons/gunporn/m203_empty.ogg', 50, 1)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/rifle/famasgl/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "famasgl"
		wielded_item_state = "famasgl-wielded"
	else
		icon_state = "famasgl-empty"
		wielded_item_state = "famasgl-wielded-empty"

/obj/item/weapon/gun/projectile/automatic/rifle/famasgl/verb/set_gp()
	set name = "Grenade Launcher"
	set category = "Object"
	set src in usr
	set popup_menu = 1

	if(launcher)
		use_launcher = !use_launcher
		if(do_after(usr, 1, src))
			to_chat(usr, "<span class='notice'>You [use_launcher ? "prepare the [launcher.name]." : " take your gun back."]</span>")
			playsound(src, 'sound/weapons/gunporn/m203_select.ogg', 50, 1)

/obj/item/weapon/gun/projectile/automatic/rifle/cetmec
	name = "CETME Modelo C"
	desc = "A standard-issue ERE combat rifle. Chambers 7.62x51 rounds."
	icon_state = "cetmec"
	item_state = "cetmec"
	w_class = 5
	load_method = MAGAZINE
	caliber = "762x51"
	force = 15
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x51
	allowed_magazines = list(/obj/item/ammo_magazine/c762x51s, /obj/item/ammo_magazine/c762x51m)
	magazine_type = null
	one_hand_penalty = 5
	accuracy = 2.9
	screen_shake = 1
	bayonet_type = /obj/item/weapon/material/knife/bayonet/bdw/
	bayonet_attachable = 1
	jam_chance = 0.360
	slowdown_general = 0.27
	wielded_item_state = "cetmec-wielded"
	fire_sound = 'sound/weapons/gunshot/g3a3.ogg'
	unload_sound = 'sound/weapons/gunporn/g3_magout.ogg' // NEED TO CHANGE SOUNDS
	reload_sound = 'sound/weapons/gunporn/g3_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/g3_boltpull.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/g3_dist.ogg'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=4, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="automatic", burst=1, fire_delay=0.4, move_delay=3, one_hand_penalty=5, burst_accuracy=null, dispersion=list(0.3, 0.6, 0.9), automatic = 0.7),
		)

/obj/item/weapon/gun/projectile/automatic/rifle/cetmec/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "cetmec"
		wielded_item_state = "cetmec-wielded"
	else
		icon_state = "cetmec-empty"
		wielded_item_state = "cetmec-wielded-empty"
	update_held_icon()

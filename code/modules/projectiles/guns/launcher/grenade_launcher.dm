/obj/item/weapon/gun/launcher/grenade
	name = "grenade launcher"
	desc = "A bulky pump-action grenade launcher. Holds up to 6 grenades in a revolving magazine."
	icon_state = "riotgun"
	item_state = "riotgun"
	w_class = ITEM_SIZE_HUGE
	force = 10

	fire_sound = null
	fire_sound_text = "a metallic thunk"
	screen_shake = 0
	throw_distance = 7
	release_force = 5
	safety = FALSE

	var/obj/item/weapon/grenade/chambered
	var/list/grenades = new/list()
	var/max_grenades = 5 //holds this + one in the chamber
	var/whitelisted_grenades = list(
		/obj/item/weapon/grenade/frag/shell)

	var/blacklisted_grenades = list(
		/obj/item/weapon/grenade/flashbang/clusterbang,
		/obj/item/weapon/grenade/frag)

	matter = list(DEFAULT_WALL_MATERIAL = 2000)

obj/item/weapon/gun/launcher/grenade/process_projectile(obj/item/projectile, mob/user, atom/target, var/target_zone, var/params=null, var/pointblank=0, var/reflex=0)
	update_release_force(projectile)
	projectile.loc = get_turf(user)
	projectile.throw_at(target, throw_distance, release_force, user)
	play_fire_sound(user,projectile)
	return 1


/obj/item/weapon/gun/launcher/grenade/examine(mob/user)
	if(..(user, 2))
		var/grenade_count = grenades.len + (chambered? 1 : 0)
		to_chat(user, "Has [grenade_count] grenade\s remaining.")
		if(chambered)
			to_chat(user, "\A [chambered] is chambered.")

/obj/item/weapon/gun/launcher/grenade/proc/load(obj/item/weapon/grenade/G, mob/user)
	if(!can_load_grenade_type(G, user))
		return

	if(grenades.len >= max_grenades)
		to_chat(user, "<span class='warning'>\The [src] is full.</span>")
		return
	user.drop_from_inventory(G, src)
	grenades.Insert(1, G) //add to the head of the list, so that it is loaded on the next pump

/obj/item/weapon/gun/launcher/grenade/proc/unload(mob/user)
	if(grenades.len)
		var/obj/item/weapon/grenade/G = grenades[grenades.len]
		grenades.len--
		user.put_in_hands(G)
	else
		to_chat(user, "<span class='warning'>\The [src] is empty.</span>")

/obj/item/weapon/gun/launcher/grenade/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))
		load(I, user)
	else
		..()

/obj/item/weapon/gun/launcher/grenade/attack_hand(mob/user)
	if(user.get_inactive_hand() == src)
		unload(user)
	else
		..()

/obj/item/weapon/gun/launcher/grenade/consume_next_projectile()
	if(chambered)
		chambered.det_time = 10
		chambered.activate(null)
	return chambered

/obj/item/weapon/gun/launcher/grenade/handle_post_fire(mob/user)
	message_admins("[key_name_admin(user)] fired a grenade ([chambered.name]) from a grenade launcher ([src.name]).")
	log_game("[key_name_admin(user)] used a grenade ([chambered.name]).")
	chambered = null
	..()

/obj/item/weapon/gun/launcher/grenade/proc/can_load_grenade_type(obj/item/weapon/grenade/G, mob/user)
	if(is_type_in_list(G, blacklisted_grenades) && ! is_type_in_list(G, whitelisted_grenades))
		to_chat(user, "<span class='warning'>\The [G] doesn't seem to fit in \the [src]!</span>")
		return FALSE
	return TRUE

// For uplink purchase, comes loaded with a random assortment of grenades
/obj/item/weapon/gun/launcher/grenade/loaded/New()
	..()

	var/list/grenade_types = list(
		/obj/item/weapon/grenade/anti_photon = 2,
		/obj/item/weapon/grenade/smokebomb = 2,
		/obj/item/weapon/grenade/chem_grenade/teargas = 2,
		/obj/item/weapon/grenade/flashbang = 3,
		/obj/item/weapon/grenade/empgrenade = 3,
		/obj/item/weapon/grenade/frag/shell = 1,
		)

	var/grenade_type = pickweight(grenade_types)
	chambered = new grenade_type(src)
	for(var/i in 1 to max_grenades)
		grenade_type = pickweight(grenade_types)
		grenades += new grenade_type(src)

//Underslung grenade launcher to be used with the Z8
/obj/item/weapon/gun/launcher/grenade/underslung
	name = "underslung grenade launcher"
	desc = "Not much more than a tube and a firing mechanism, this grenade launcher is designed to be fitted to a rifle."
	w_class = ITEM_SIZE_NORMAL
	force = 5
	max_grenades = 0

/obj/item/weapon/gun/launcher/grenade/underslung/attack_self()
	return

//load and unload directly into chambered
/obj/item/weapon/gun/launcher/grenade/underslung/load(obj/item/weapon/grenade/G, mob/user)
	if(!can_load_grenade_type(G, user))
		return

	if(chambered)
		to_chat(user, "<span class='warning'>\The [src] is already loaded.</span>")
		return
	user.drop_from_inventory(G, src)
	chambered = G

/obj/item/weapon/gun/launcher/grenade/underslung/unload(mob/user)
	if(chambered)
		user.put_in_hands(chambered)
		chambered = null
	else
		to_chat(user, "<span class='warning'>\The [src] is empty.</span>")

//////////////////////////////////////////////////
/////ESCALATION LAUNCHERS/////////////////////////
//////////////////////////////////////////////////

////////////////////////////underslug/gp////////////////////////////

//murucan&bund
/obj/item/weapon/gun/launcher/grenade/underslung/m203
	name = "M203 grenade launcher"
	release_force = 2
	throw_distance = 40
	desc = "Not much more than a tube and a firing mechanism, this grenade launcher is designed to be fitted to a rifle."
	whitelisted_grenades = list(
		/obj/item/weapon/grenade/frag/ugl/shell40mm,
		/obj/item/weapon/grenade/smokebomb/ugl/shell40mm,
		/*/obj/item/device/grenade/flare/ugl/m203flare*/
		)

	blacklisted_grenades = list(
		/obj/item/weapon/grenade/frag/ugl/vog25,
		/obj/item/weapon/grenade/smokebomb/ugl/vog25,
		/obj/item/weapon/grenade/frag,
		/obj/item/weapon/grenade/smokebomb
		)

//soviet&czhech
/obj/item/weapon/gun/launcher/grenade/underslung/gp25
	name = "GP-25 'Koster' grenade launcher"
	release_force = 2
	throw_distance = 40
	desc = "Not much more than a tube and a firing mechanism, this grenade launcher is designed to be fitted to a rifle."
	whitelisted_grenades = list(
		/obj/item/weapon/grenade/frag/ugl/vog25,
		/obj/item/weapon/grenade/smokebomb/ugl/vog25,
		/*/obj/item/device/grenade/flare/ugl/gp25flare*/
		)
	blacklisted_grenades = list(
		/obj/item/weapon/grenade/frag/ugl/shell40mm,
		/obj/item/weapon/grenade/smokebomb/ugl/shell40mm,
		/obj/item/weapon/grenade/frag,
		/obj/item/weapon/grenade/smokebomb
		)

/obj/item/weapon/gun/launcher/grenade/hk69

	name = "HK69A1 grenade launcher"
	desc = "That's a rifle grenade launcher used by Bundeswehr"
	whitelisted_grenades = list(
		/obj/item/weapon/grenade/frag/ugl/shell40mm,
		/obj/item/weapon/grenade/smokebomb/ugl/shell40mm
		/*/obj/item/device/grenade/flare/ugl/m203flare*/
		)
	blacklisted_grenades = list(
		/obj/item/weapon/grenade/frag/ugl/vog25,
		/obj/item/weapon/grenade/smokebomb/ugl/vog25,
		/obj/item/weapon/grenade/frag,
		/obj/item/weapon/grenade/smokebomb
		)
	icon = 'icons/obj/coldwar/guns32x32.dmi'
	icon_state = "hk69"
	item_state = "hk69"
	w_class = 4
	max_grenades = 0
	screen_shake = 1
	safety = 1
	release_force = 2
	throw_distance = 40
	slot_flags =  SLOT_HOLSTER | SLOT_GUN_SLOT | SLOT_BACK
	var/cover_opened = FALSE

/obj/item/weapon/gun/launcher/grenade/hk69/Initialize()
	..()
	update_icon()

/obj/item/weapon/gun/launcher/grenade/hk69/consume_next_projectile()
	if(!cover_opened)
		return ..()
	else if(chambered | cover_opened)
		chambered.det_time = 10
		chambered.activate(null)
	return chambered | cover_opened

//load and unload directly into chambered
/obj/item/weapon/gun/launcher/grenade/hk69/load(obj/item/weapon/grenade/G, mob/user)
	if(!can_load_grenade_type(G, user))
		return

	if(!cover_opened)
		return
	if(chambered)
		return

	user.drop_from_inventory(G, src)
	chambered = G
	playsound(src, 'sound/weapons/gunporn/m203_insertgrenade.ogg', 50, 1)
	update_icon()

/obj/item/weapon/gun/launcher/grenade/hk69/unload(mob/user)
	if(cover_opened)
		playsound(src, 'sound/weapons/gunporn/m203_empty.ogg', 50, 1)

	if(chambered)
		user.put_in_hands(chambered)
		playsound(src, 'sound/weapons/gunporn/m203_insertgrenade.ogg', 50, 1)
		chambered = null
		update_icon()
	else
		to_chat(user, "<span class='warning'>\The [src] is empty.</span>")

/obj/item/weapon/gun/launcher/grenade/hk69/proc/toggle_cover(mob/user)
	cover_opened = !cover_opened
	playsound(src, 'sound/weapons/gunporn/m203_openbarrel.ogg', 50, 1)
	update_icon()

/obj/item/weapon/gun/launcher/grenade/hk69/attack_self(mob/user as mob)
	if(cover_opened)
		toggle_cover(user) //close the cover
		//playsound(user, 'sound/weapons/gunporn/m249_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/launcher/grenade/hk69/attack_hand(mob/user as mob)
	if(!cover_opened && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		//playsound(user, 'sound/weapons/gunporn/m249_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/launcher/grenade/hk69/update_icon()
	..()
	if(cover_opened)//opened
		if(chambered)//and with shell
			icon_state = "hk69-open"
		else//opened but without shell :'(
			icon_state = "hk69-empty"
	else
		icon_state = "hk69"//closed
//Coldwar proj launchers

/obj/item/weapon/gun/launcher/rpg7
	name = "RPG7"
	desc = "A grenade launcher, standard-issued by the Soviet Army."
	icon = 'icons/obj/coldwar/guns48x48.dmi'
	icon_state = "rpg" ///change
	item_state = "rpg1" ///change
	slowdown_general = 0.5
	w_class = 5
	throw_speed = 3
	one_hand_penalty = 100
	throw_range = 40
	force = 5.0
	flags =  CONDUCT
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)
	fire_sound = 'sound/weapons/gunshot/rpg_fire.ogg'
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK

	release_force = 40
	throw_distance = 30
	var/max_rockets = 1
	var/is_used = FALSE
	var/list/rockets = new/list(/obj/item/ammo_casing/rpg_missile)
	var/datum/effect/effect/system/smoke_spread/puff

/obj/item/weapon/gun/launcher/rpg7/New()
	..()
	puff = new /datum/effect/effect/system/smoke_spread()
	puff.attach(src)
	update_icon()

/obj/item/weapon/gun/launcher/rpg7/update_icon()
	..()
	if(rockets.len)
		icon = 'icons/obj/coldwar/guns48x48.dmi'
		icon_state = "rpg" ///change
		item_state = "rpg1"
	else
		icon = 'icons/obj/coldwar/guns48x48.dmi'
		icon_state = "rpg-empty" ///change
		item_state = "rpg1-empty"
	update_held_icon()

/obj/item/weapon/gun/launcher/rpg7/examine(mob/user)
	if(!..(user, 2))
		return
	to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")

/obj/item/weapon/gun/launcher/rpg7/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rpg_missile))
		if(rockets.len < max_rockets)
			playsound(src.loc,'sound/weapons/gunporn/rpgreload.ogg',80, 0)
			if(do_after(usr, 30, src))
				user.drop_item()
				I.loc = src
				rockets += I
				update_icon()
		else
			to_chat(user, "\red [src] cannot hold more rockets.")
			update_icon()


/obj/item/weapon/gun/launcher/rpg7/consume_next_projectile(mob/user)
	if(rockets.len)
		var/obj/item/ammo_casing/rpg_missile/I = rockets[1]
		var/obj/item/projectile/bullet/rpgrocket/he/M = new (src)
		//M.primed = TRUE
		rockets -= I
		return M
	return null

/obj/item/weapon/gun/launcher/rpg7/handle_post_fire(mob/user, atom/target)
	sleep(1)
	var/smoke_dir = user.dir
	if(user)
		switch(smoke_dir) //We want the opposite of their direction.
			if(2,8)
				smoke_dir /= 2
			if(1,4)
				smoke_dir *= 2
	puff.set_up(1,,,smoke_dir)
	puff.start()

/obj/item/weapon/gun/launcher/smaw
	name = "SMAW"
	desc = "A standard issue rocket launcher used by the United Stated Armed Forces."
	icon_state = "smaw" ///change
	item_state = "smaw" ///change
	slowdown_general = 0.5
	w_class = 5
	throw_speed = 3
	one_hand_penalty = 100
	throw_range = 40
	force = 5.0
	flags =  CONDUCT
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)
	fire_sound = 'sound/weapons/gunshot/rpg_fire.ogg'
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK

	release_force = 40
	throw_distance = 30
	var/max_rockets = 1
	var/is_used = FALSE
	var/list/rockets = new/list(/obj/item/ammo_casing/rpg_missile/smaw)
	var/datum/effect/effect/system/smoke_spread/puff

/obj/item/weapon/gun/launcher/smaw/New()
	..()
	puff = new /datum/effect/effect/system/smoke_spread()
	puff.attach(src)
	update_icon()

/obj/item/weapon/gun/launcher/smaw/update_icon()
	..()
	if(rockets.len)
		icon_state = "smaw"
		item_state = "smaw"
	else
		icon_state = "smaw-empty"
		item_state = "smaw-empty"
	update_held_icon()

/obj/item/weapon/gun/launcher/smaw/examine(mob/user)
	if(!..(user, 2))
		return
	to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")

/obj/item/weapon/gun/launcher/smaw/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rpg_missile))
		if(rockets.len < max_rockets)
			playsound(src.loc,'sound/weapons/gunporn/rpgreload.ogg',80, 0)
			if(do_after(usr, 30, src))
				user.drop_item()
				I.loc = src
				rockets += I
				update_icon()
		else
			to_chat(user, "\red [src] cannot hold more rockets.")
			update_icon()


/obj/item/weapon/gun/launcher/smaw/consume_next_projectile(mob/user)
	if(rockets.len)
		var/obj/item/ammo_casing/rpg_missile/I = rockets[1]
		var/obj/item/projectile/bullet/rpgrocket/he/M = new (src)
		//M.primed = TRUE
		rockets -= I
		return M
	return null

/obj/item/weapon/gun/launcher/smaw/handle_post_fire(mob/user, atom/target)
	sleep(1)
	var/smoke_dir = user.dir
	if(user)
		switch(smoke_dir) //We want the opposite of their direction.
			if(2,8)
				smoke_dir /= 2
			if(1,4)
				smoke_dir *= 2
	puff.set_up(1,,,smoke_dir)
	puff.start()

////////////recoilless rifles///////////
/obj/item/weapon/gun/launcher/carlgustaf
	name = "Carl Gustaf recoilless rifle"
	desc = "A recoilless rifle, standard-issued by the British Armed Forces."
	icon = 'icons/obj/coldwar/guns48x48.dmi'
	icon_state = "carlgustaf"
	item_state = "carlgustaf"
	slowdown_general = 0.5
	w_class = 5
	throw_speed = 3
	one_hand_penalty = 100
	throw_range = 40
	force = 5.0
	flags =  CONDUCT
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)
	fire_sound = 'sound/weapons/gunshot/gustaf_fire.ogg'
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK

	release_force = 40
	throw_distance = 30
	var/max_rockets = 1
	var/is_used = FALSE
	var/list/rockets = new/list(/obj/item/ammo_casing/rpg_missile/recoilless)
	var/datum/effect/effect/system/smoke_spread/puff

/obj/item/weapon/gun/launcher/carlgustaf/New()
	..()
	puff = new /datum/effect/effect/system/smoke_spread()
	puff.attach(src)
	update_icon()

/obj/item/weapon/gun/launcher/carlgustaf/update_icon()
	..()
	if(rockets.len)
		icon = 'icons/obj/coldwar/guns48x48.dmi'
		icon_state = "carlgustaf"
		item_state = "carlgustaf"
	else
		icon = 'icons/obj/coldwar/guns48x48.dmi'
		icon_state = "carlgustaf-empty"
		item_state = "carlgustaf-empty"
	update_held_icon()

/obj/item/weapon/gun/launcher/carlgustaf/examine(mob/user)
	if(!..(user, 2))
		return
	to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")

/obj/item/weapon/gun/launcher/carlgustaf/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rpg_missile/recoilless))
		if(rockets.len < max_rockets)
			playsound(src.loc,'sound/weapons/gunporn/gustafreload.ogg',80, 0)
			if(do_after(usr, 30, src))
				user.drop_item()
				I.loc = src
				rockets += I
				update_icon()
		else
			to_chat(user, "\red [src] cannot hold more rockets.")
			update_icon()


/obj/item/weapon/gun/launcher/carlgustaf/consume_next_projectile(mob/user)
	if(rockets.len)
		var/obj/item/ammo_casing/rpg_missile/recoilless/I = rockets[1]
		var/obj/item/projectile/bullet/rpgrocket/gustaf/M = new (src)
		//M.primed = TRUE
		rockets -= I
		return M
	return null

/*/obj/item/weapon/gun/launcher/carlgustaf/handle_post_fire(mob/user, atom/target)
	sleep(1)
	var/smoke_dir = user.dir
	if(user)
		switch(smoke_dir) //We want the opposite of their direction.
			if(2,8)
				smoke_dir /= 2                        carl gustaf does not make smoke -severe
			if(1,4)
				smoke_dir *= 2
	puff.set_up(1,,,smoke_dir)
	puff.start()*/

/obj/item/weapon/gun/launcher/finnrpg
	name = "55 S 55"
	desc = "A recoilless rifle, standard-issued by the Finnish Army."
	icon = 'icons/obj/coldwar/guns48x48.dmi'
	icon_state = "finnrpg" ///change
	item_state = "finnrpg" ///change
	slowdown_general = 0.5
	w_class = 5
	throw_speed = 3
	one_hand_penalty = 100
	throw_range = 40
	force = 5.0
	flags =  CONDUCT
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)
	fire_sound = 'sound/weapons/gunshot/finnrpg_fire.ogg'
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK

	release_force = 40
	throw_distance = 30
	var/max_rockets = 1
	var/is_used = FALSE
	var/list/rockets = new/list(/obj/item/ammo_casing/rpg_missile/finn)
	var/datum/effect/effect/system/smoke_spread/puff

/obj/item/weapon/gun/launcher/finnrpg/New()
	..()
	puff = new /datum/effect/effect/system/smoke_spread()
	puff.attach(src)
	update_icon()

/obj/item/weapon/gun/launcher/finnrpg/update_icon()
	..()
	if(rockets.len)
		icon = 'icons/obj/coldwar/guns48x48.dmi'
		icon_state = "finnrpg" ///change
		item_state = "finnrpg"
	else
		icon = 'icons/obj/coldwar/guns48x48.dmi'
		icon_state = "finnrpg-empty" ///change
		item_state = "finnrpg-empty"
	update_held_icon()

/obj/item/weapon/gun/launcher/finnrpg/examine(mob/user)
	if(!..(user, 2))
		return
	to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")

/obj/item/weapon/gun/launcher/finnrpg/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rpg_missile/finn))
		if(rockets.len < max_rockets)
			playsound(src.loc,'sound/weapons/gunporn/rpgreload.ogg',80, 0)
			if(do_after(usr, 30, src))
				user.drop_item()
				I.loc = src
				rockets += I
				update_icon()
		else
			to_chat(user, "\red [src] cannot hold more rockets.")
			update_icon()


/obj/item/weapon/gun/launcher/finnrpg/consume_next_projectile(mob/user)
	if(rockets.len)
		var/obj/item/ammo_casing/rpg_missile/finn/I = rockets[1]
		var/obj/item/projectile/bullet/rpgrocket/finn/M = new (src) /////////////////////////this is what determines the projectile type
		//M.primed = TRUE
		rockets -= I
		return M
	return null

/*/obj/item/weapon/gun/launcher/finnrpg/handle_post_fire(mob/user, atom/target)
	sleep(1)
	var/smoke_dir = user.dir
	if(user)
		switch(smoke_dir) //We want the opposite of their direction.
			if(2,8)
				smoke_dir /= 2                            this shouldnt make any smoke either -severe
			if(1,4)
				smoke_dir *= 2
	puff.set_up(1,,,smoke_dir)
	puff.start() */


///////////////////Not ours///////////////////////////////////////////////
/obj/item/weapon/gun/launcher/oneuse/
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	var/folded = 1

/obj/item/weapon/gun/launcher/oneuse/attack_self(mob/user)
	if(folded)
		playsound(src.loc,'sound/weapons/gunporn/rpgoneuse_deploying.ogg',80, 0)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		if(do_after(usr, 30, src))
			usr.visible_message("<span class='notice'>\The [usr] extends [src].</span>", "<span class='notice'>You deploy the [src]</span>")
			folded = 0
			icon_state = "[icon_state]-deployed"
			item_state = "[item_state]-deployed"
			slot_flags = null
	else
		playsound(src.loc,'sound/weapons/gunporn/rpgoneuse_deploying.ogg',80, 0)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		if(do_after(usr, 30, src))
			usr.visible_message("<span class='notice'>\The [usr] folds the [src].</span>", "<span class='notice'>You fold the [src]</span>")
			folded = 1
			icon_state = initial(icon_state)
			item_state = initial(item_state)
			slot_flags = SLOT_GUN_SLOT | SLOT_BACK

/obj/item/weapon/gun/launcher/oneuse/special_check(mob/user)
	if(folded == 1)
		to_chat(user, "I have to deploy it first.")
		return 0
	return ..()


/obj/item/weapon/gun/launcher/oneuse/rpg18
	name = "RPG-18 'Mukha'"
	desc = "Single-use rocket launcher used by the Soviet Army. Also known as 'Mukha'."
	icon_state = "rpg18"
	item_state = "rpg18"
	slowdown_general = 0.5
	w_class = 5
	throw_speed = 2
	one_hand_penalty = 100
	throw_range = 10
	force = 5.0
	flags =  CONDUCT
	fire_sound = 'sound/weapons/gunshot/rpg22.ogg'
	release_force = 25
	throw_distance = 40
	var/max_rockets = 1
	var/is_used = FALSE
	var/list/rockets = new/list(/obj/item/ammo_casing/rpg_missile)
	var/datum/effect/effect/system/smoke_spread/puff

/obj/item/weapon/gun/launcher/oneuse/rpg18/New()
	..()
	rockets += new /obj/item/ammo_casing/rpg_missile(src)
	puff = new /datum/effect/effect/system/smoke_spread()
	puff.attach(src)
	update_icon()

/obj/item/weapon/gun/launcher/oneuse/rpg18/handle_post_fire(mob/user, atom/target)
	..()
	sleep(1)
	var/smoke_dir = user.dir
	if(user)
		switch(smoke_dir) //We want the opposite of their direction.
			if(2,8)
				smoke_dir /= 2
			if(1,4)
				smoke_dir *= 2
	puff.set_up(1,,,smoke_dir)
	puff.start()
	name += " (Used)"
	is_used = TRUE

/obj/item/weapon/gun/launcher/oneuse/rpg18/examine(mob/user)
	if(!..(user, 2))
		return
	to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")

/obj/item/weapon/gun/launcher/oneuse/rpg18/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rpg_missile))
		if(!is_used)
			if(rockets.len < max_rockets)
				user.drop_item()
				I.loc = src
				rockets += I
				to_chat(user, "\blue You put the rocket in [src].")
				to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")
			else
				to_chat(user, "\red [src] cannot hold more rockets.")
		else
			to_chat(user, "\red This one has been used.")

/obj/item/weapon/gun/launcher/oneuse/rpg18/consume_next_projectile()
	if(rockets.len)
		var/obj/item/ammo_casing/rpg_missile/I = rockets[1]
		var/obj/item/projectile/bullet/rpgrocket/he/M = new (src)
		//M.primed = TRUE
		rockets -= I
		return M
	return null


/obj/item/weapon/gun/launcher/oneuse/rpg18/rpg22
	name = "RPG-22 'Netto'"
	desc = "Single-use rocket launcher used by the Soviet Army. Also known as 'Netto'."
	icon_state = "rpg22"
	item_state = "rpg22"

/obj/item/weapon/gun/launcher/oneuse/rpg18/rpg75
	name = "RPG-75"
	desc = "Single-use rocket launcher used by the CSLA."
	icon_state = "rpg75"
	item_state = "rpg75"

/obj/item/weapon/gun/launcher/oneuse/rpg18/m72
	name = "M72 LAW"
	desc = "A single-use rocket launcher used by NATO forces. Fires a 66mm HEAT shell."
	icon_state = "m72"
	item_state = "m72"
	fire_sound = 'sound/weapons/gunshot/m72.ogg'


/obj/item/weapon/gun/launcher/oneuse/rpg18/c90
	name = "C90-CR"
	desc = "A single-use rocket launcher used by the ERE."
	icon_state = "c90"
	item_state = "c90"

/obj/item/weapon/gun/launcher/oneuse/rpg18/at4
	name = "AT-4"
	desc = "A single-use rocket launcher used by NATO forces. Fires a 84mm HEAT shell."
	icon_state = "at4"
	item_state = "at4"
	fire_sound = 'sound/weapons/gunshot/m72.ogg'


/obj/item/weapon/gun/launcher/oneuse/rpg18/at4/attack_self(mob/user)
	if(folded)
		playsound(src.loc,'sound/weapons/gunporn/at4_deploy.ogg',80, 0)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		if(do_after(usr, 30, src))
			usr.visible_message("<span class='notice'>\The [usr] extends [src].</span>", "<span class='notice'>You deploy the [src]</span>")
			folded = 0
			icon_state = "[icon_state]-deployed"
			item_state = "[item_state]-deployed"
			slot_flags = null
	else
		playsound(src.loc,'sound/weapons/gunporn/at4_deploy.ogg',80, 0)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		if(do_after(usr, 30, src))
			usr.visible_message("<span class='notice'>\The [usr] folds the [src].</span>", "<span class='notice'>You fold the [src]</span>")
			folded = 1
			icon_state = initial(icon_state)
			item_state = initial(item_state)
			slot_flags = SLOT_GUN_SLOT | SLOT_BACK

/////No longer used for streamlining code, kept for redundancys sake.
/*/obj/item/weapon/gun/launcher/oneuse/m72
	name = "M72 LAW"
	desc = "A single-use rocket launcher used by NATO forces. Fires a 66mm HEAT shell."
	icon_state = "m72"
	item_state = "m72"
	slowdown_general = 0.5
	one_hand_penalty = 100
	w_class = 5
	throw_speed = 2
	throw_range = 10
	force = 5.0
	flags =  CONDUCT
	fire_sound = 'sound/weapons/gunshot/m72.ogg'
	release_force = 25
	throw_distance = 40
	var/max_rockets = 1
	var/is_used = FALSE
	var/list/rockets = new/list(/obj/item/ammo_casing/rpg_missile)
	var/datum/effect/effect/system/smoke_spread/puff

/obj/item/weapon/gun/launcher/oneuse/m72/attack_self(mob/user)
	if(folded)
		playsound(src.loc,'sound/weapons/gunporn/rpgoneuse_deploying.ogg',80, 0)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		if(do_after(usr, 30, src))
			usr.visible_message("<span class='notice'>\The [usr] extends [src].</span>", "<span class='notice'>You deploy the [src]</span>")
			folded = 0
			icon_state = "[icon_state]-deployed"
			item_state = "[item_state]-deployed"
			slot_flags = null
	else
		playsound(src.loc,'sound/weapons/gunporn/rpgoneuse_deploying.ogg',80, 0)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		if(do_after(usr, 30, src))
			usr.visible_message("<span class='notice'>\The [usr] folds the [src].</span>", "<span class='notice'>You fold the [src]</span>")
			folded = 1
			icon_state = initial(icon_state)
			item_state = initial(item_state)
			slot_flags = SLOT_GUN_SLOT | SLOT_BACK

/obj/item/weapon/gun/launcher/oneuse/m72/special_check(mob/user)
	if(folded == 1)
		to_chat(user, "I have to deploy it first.")
		return 0
	return ..()

/obj/item/weapon/gun/launcher/oneuse/m72/New()
	..()
	rockets += new /obj/item/ammo_casing/rpg_missile(src)
	puff = new /datum/effect/effect/system/smoke_spread()
	puff.attach(src)
	update_icon()

/obj/item/weapon/gun/launcher/oneuse/m72/handle_post_fire(mob/user, atom/target)
	..()
	sleep(1)
	var/smoke_dir = user.dir
	if(user)
		switch(smoke_dir) //We want the opposite of their direction.
			if(2,8)
				smoke_dir /= 2
			if(1,4)
				smoke_dir *= 2
	puff.set_up(1,,,smoke_dir)
	puff.start()
	name += " (Used)"
	is_used = TRUE

/obj/item/weapon/gun/launcher/oneuse/m72/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rpg_missile))
		if(!is_used)
			if(rockets.len < max_rockets)
				user.drop_item()
				I.loc = src
				rockets += I
				to_chat(user, "\blue You put the rocket in [src].")
				to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")
			else
				to_chat(user, "\red [src] cannot hold more rockets.")
		else
			to_chat(user, "\red This one has been used.")

/obj/item/weapon/gun/launcher/oneuse/m72/consume_next_projectile()
	if(rockets.len)
		var/obj/item/ammo_casing/rpg_missile/I = rockets[1]
		var/obj/item/projectile/bullet/rpgrocket/he/M = new (src)
		//M.primed = TRUE
		rockets -= I
		return M
	return null*/
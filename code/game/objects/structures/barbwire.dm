/obj/structure/barbwire
	name = "barbwire"
	icon = 'icons/obj/structures.dmi'
	icon_state = "barbwire"
	anchored = 1
	layer = 5
	explosion_resistance = 1

/obj/structure/barbwire/ex_act(severity)
	switch (severity)
		if (3.0)
			if (prob(50))
				qdel(src)
		else
			qdel(src)

/obj/structure/barbwire/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	return 1


/obj/structure/barbwire/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover = get_turf(src)
	if(!cover)
		return 1
	if (get_dist(P.starting, loc) <= 1) //Tables won't help you if people are THIS close
		return 1

/obj/structure/barbwire/Crossed(AM as mob|obj)
	if(ismob(AM))
		var/mob/M = AM
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if (prob (33))
				//playsound(src.loc, 'sound/effects/glass_step.ogg', 50, 1)
				var/obj/item/organ/external/affecting = H.get_organ(pick("l_foot", "r_foot", "l_leg", "r_leg"))
				if(affecting.status & ORGAN_ROBOT)
					return
				if(affecting.take_damage(10, 0))
					H.UpdateDamageIcon()
				H.updatehealth()
				if(!(H.species && (H.species.flags)))
					H.Weaken(4)
				to_chat(M, "\red <B>Your [affecting.name] gets slightly cut by \the [src]!</B>")
				return ..()
			if (prob (33))
				//playsound(src.loc, 'sound/effects/glass_step.ogg', 50, 1)
				var/obj/item/organ/external/affecting = H.get_organ(pick("l_foot", "r_foot", "l_leg", "r_leg"))
				if(affecting.status & ORGAN_ROBOT)
					return
				if(affecting.take_damage(20, 0))
					H.UpdateDamageIcon()
				H.updatehealth()
				if(!(H.species && (H.species.flags)))
					H.Weaken(6)
				to_chat(M, "\red <B>Your [affecting.name] gets cut by \the [src]!</B>")
				return ..()
			if (prob (33))
				//playsound(src.loc, 'sound/effects/glass_step.ogg', 50, 1)
				var/obj/item/organ/external/affecting = H.get_organ(pick("l_foot", "r_foot", "l_leg", "r_leg"))
				if(affecting.status & ORGAN_ROBOT)
					return
				if(affecting.take_damage(30, 0))
					H.UpdateDamageIcon()
				H.updatehealth()
				if(!(H.species && (H.species.flags)))
					H.Weaken(10)
				to_chat(M, "\red <B>Your [affecting.name] gets deeply cut by \the [src]!</B>")
				return ..()
	..()

/obj/structure/barbwire/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/wirecutters))
		if(anchored)
			user.visible_message("\blue \The [user] starts to cut through \the [src] with [W].")
			if(!do_after(user,60))
				user.visible_message("\blue \The [user] decides not to cut through the \the [src].")
				return
			user.visible_message("\blue \The [user] finishes cutting through \the [src]!")
			playsound(src.loc, 'sound/items/Wirecutter.ogg', 50, 1)
			qdel(src)
			return
	/*if(istype(W, /obj/item/weapon/material/knife/bayonet/))
		if(anchored)
			user.visible_message("\blue \The [user] starts to cut through \the [src] with [W].")
			if(!do_after(user,120))
				user.visible_message("\blue \The [user] couldn't cut through the \the [src].")
				return
			user.visible_message("\blue \The [user] finishes cutting through \the [src]!")
			playsound(src.loc, 'sound/items/Wirecutter.ogg', 50, 1)
			qdel(src)
			return*/
	else
		return


//deployable barbwire
/obj/item/stack/barbwire_coil //taken from /obj/item/stack/metalcoil
	name = "barbwire coil"
	desc = "Barbwire coil used for setting up barbwire."
	singular_name = "barbwire coil"
	icon = 'icons/obj/coldwar/items.dmi'
	icon_state = "barbwire"
	item_state = "rods"
	flags = CONDUCT
	w_class = ITEM_SIZE_LARGE
	force = 2.0
	throwforce = 5
	throw_speed = 5
	throw_range = 5
	matter = list(DEFAULT_WALL_MATERIAL = 1875)
	amount = 10 //starting amount, I put it at 10 since its a starting item
	max_amount = 10
	center_of_mass = null
	attack_verb = list("hit", "bludgeoned", "whacked")

//checking to see there are no barbwire on the turf, prevents stacking barbwire
/obj/item/stack/barbwire_coil/proc/check4barbwire(mob/user as mob)
	if(locate(/obj/structure/barbwire) in user.loc.contents)
		to_chat(user, "<span class='warning'>There is already some barbwire there.</span>")
		return 1
	return 0

/obj/item/stack/barbwire_coil/attack_self(mob/user as mob)
	if(check4barbwire(user)) //delete this and replace with the comment below to disable barbedwire being placed on top
//	if((check4barbwire(user) || check4sandbags(user) || check4struct(user))// 0 || 0 || 0
		return

	if(!isturf(user.loc)) //from sandbags
		to_chat(user, "<span class='warning'>Haha, not funny.</span>")
		return

	if(do_after(user, 30, src))
		to_chat(user, "<span class='notice'>You finish setting up the barbwire!</span>")
		use(1)
		var/obj/structure/barbwire/deployed = new(user.loc)//new (user.loc)
		deployed.set_dir(user.dir)
		return
		if(!src) return
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!do_mob(user, 30, src))
		to_chat(user, "<span class='warning'>You must stand still to do that.</span>")
		return

//deployable hedgehog
/obj/item/stack/hedgehog_rods
	name = "hedgehog rods"
	desc = "Bent metal rods used to assemble a hedgehog."
	singular_name = "hedgehog rod"
	icon = 'icons/obj/coldwar/items.dmi'
	icon_state = "hedgehog"
	item_state = "rods"
	flags = CONDUCT
	w_class = ITEM_SIZE_HUGE
	force = 2.0
	throwforce = 5
	throw_speed = 5
	throw_range = 5
	matter = list(DEFAULT_WALL_MATERIAL = 1875)
	amount = 3 //starting amount, I put it at 10 since its a starting item
	max_amount = 3
	center_of_mass = null
	attack_verb = list("hit", "bludgeoned", "whacked")

//checking to see there are no hedgehog on the turf, prevents stacking hedgehog
/obj/item/stack/hedgehog_rods/proc/check4hedgehog(mob/user as mob)
	if(locate(/obj/structure/hedgehog) in user.loc.contents)
		to_chat(user, "<span class='warning'>There is already a hedgehog there.</span>")
		return 1
	return 0

/obj/item/stack/hedgehog_rods/attack_self(mob/user as mob)
	if(check4hedgehog(user)) //delete this and replace with the comment below to hedgehog being placed on top
//	if((check4barbwire(user) || check4sandbags(user) || check4struct(user))// 0 || 0 || 0
		return

	if(!isturf(user.loc)) //from sandbags
		to_chat(user, "<span class='warning'>Haha, not funny.</span>")
		return

	if(do_after(user, 30, src))
		to_chat(user, "<span class='notice'>You finish setting up the hedgehog!</span>")
		use(1)
		var/obj/structure/hedgehog/deployed = new(user.loc)//new (user.loc)
		deployed.set_dir(user.dir)
		return
		if(!src) return
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!do_mob(user, 30, src))
		to_chat(user, "<span class='warning'>You must stand still to do that.</span>")
		return

/obj/item/stack/hedgehog_rods/New()
	..()
	slowdown_per_slot[slot_l_hand] = 1.5
	slowdown_per_slot[slot_r_hand] = 1.5

/obj/item/stack/hedgehog_rods/single
	amount = 1
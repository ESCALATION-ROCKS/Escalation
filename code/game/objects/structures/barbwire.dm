/obj/structure/barbwire
	name = "barbwire"
	icon = 'icons/obj/structures.dmi'
	icon_state = "barbwire"
	anchored = 1

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
				if(affecting.take_damage(5, 0))
					H.UpdateDamageIcon()
				H.updatehealth()
				if(!(H.species && (H.species.flags)))
					H.Weaken(2)
				to_chat(M, "\red <B>Your [affecting.name] gets slightly cut by \the [src]!</B>")
				return ..()
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
				to_chat(M, "\red <B>Your [affecting.name] gets cut by \the [src]!</B>")
				return ..()
			if (prob (33))
				//playsound(src.loc, 'sound/effects/glass_step.ogg', 50, 1)
				var/obj/item/organ/external/affecting = H.get_organ(pick("l_foot", "r_foot", "l_leg", "r_leg"))
				if(affecting.status & ORGAN_ROBOT)
					return
				if(affecting.take_damage(15, 0))
					H.UpdateDamageIcon()
				H.updatehealth()
				if(!(H.species && (H.species.flags)))
					H.Weaken(5)
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
	if(istype(W, /obj/item/weapon/material/knife/bayonet/))
		if(anchored)
			user.visible_message("\blue \The [user] starts to cut through \the [src] with [W].")
			if(!do_after(user,120))
				user.visible_message("\blue \The [user] couldn't cut through the \the [src].")
				return
			user.visible_message("\blue \The [user] finishes cutting through \the [src]!")
			playsound(src.loc, 'sound/items/Wirecutter.ogg', 50, 1)
			qdel(src)
			return
	else
		return
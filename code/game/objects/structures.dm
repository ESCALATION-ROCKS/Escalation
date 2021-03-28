/obj/structure
	icon = 'icons/obj/structures.dmi'
	w_class = ITEM_SIZE_NO_CONTAINER
	var/changey = 0
	var/pixeldisy = 12
	var/breakable
	var/parts
	explosion_resistance = 1

/obj/structure/Destroy()
	if(parts)
		new parts(loc)
	. = ..()

/obj/structure/attack_hand(mob/user)
	..()
	if(breakable)
		if(HULK in user.mutations)
			user.say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ))
			attack_generic(user,1,"smashes")
		else if(istype(user,/mob/living/carbon/human))
			var/mob/living/carbon/human/H = user
			if(H.species.can_shred(user))
				attack_generic(user,1,"slices")
	return ..()

/obj/structure/attack_tk()
	return

/obj/structure/Crossed(var/mob/living/M as mob)
	if(changey)
		M.pixel_y = src.pixeldisy

/obj/structure/Uncrossed(var/mob/living/M as mob)
	if(changey)
		M.pixel_y = 0

/obj/structure/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if(prob(50))
				qdel(src)
				return
		if(3.0)
			return

/obj/structure/attack_generic(var/mob/user, var/damage, var/attack_verb, var/wallbreaker)
	if(!breakable || !damage || !wallbreaker)
		return 0
	visible_message("<span class='danger'>[user] [attack_verb] the [src] apart!</span>")
	attack_animation(user)
	spawn(1) qdel(src)
	return 1

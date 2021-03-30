/obj/structure/hedgehog
	name = "hedgehog"
	desc = "A tank trap constructed out of three bent rods."
	icon = 'icons/obj/structures.dmi'
	icon_state = "tank_trap"
	density = 1
	throwpass = 1//we can throw grenades despite its density
	anchored = 1
	flags = OBJ_CLIMBABLE
	explosion_resistance = 1
	var/basic_chance = 2
	var/health = 200 //Actual health depends on snow layer
	var/reinforced = 0 //has there been a bridge built?


/obj/structure/hedgehog/New()
	..()
	flags |= ON_BORDER

/obj/structure/hedgehog/Destroy()
	basic_chance = null
	..()

/obj/structure/hedgehog/examine(mob/user)
	. = ..(user)
	switch(health)
		if(200 to INFINITY)
			to_chat(user, "It's intact.")
		if(150 to 200)
			to_chat(user, "It's slightly damaged.")
		if(100 to 150)
			to_chat(user, "<span class='warning'>It's badly damaged.</span>")
		if(50 to 100)
			to_chat(user, "<span class='warning'>It's heavily damaged.</span>")
		else
			to_chat(user, "<span class='warning'>It's falling apart!</span>")

/obj/structure/hedgehog/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile))
		var/obj/item/projectile/proj = mover

		if(proj.firer && Adjacent(proj.firer))
			return 1

		if (get_dist(proj.starting, loc) <= 30)//allows to fire from 1 tile away of sandbag
			return 1

		return check_cover(mover, target)

	else if(istype(mover, /obj))
		return 1

	else
		..()

//checks if projectile 'P' from turf 'from' can hit whatever is behind the table. Returns 1 if it can, 0 if bullet stops.
/obj/structure/hedgehog/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover = get_step(loc, get_dir(from, loc))
	if (get_dist(P.starting, loc) <= 30) //Barricades won't help you if people are THIS close
		return 1
	if (get_turf(P.original) == cover)
		var/chance = 2
		if (ismob(P.original))
			var/mob/M = P.original
			if (M.lying)
				chance += 2				//Lying down lets you catch less bullets
		if(prob(chance))
			health -= P.damage
			visible_message("<span class='warning'>[P] hits [src]!</span>")
			health_check()
			return 0
	return 1

/obj/structure/hedgehog/MouseDrop_T(obj/O as obj, mob/user as mob)
	..()
	if ((!( istype(O, /obj/item/weapon) ) || user.get_active_hand() != O))
		return
	if(isrobot(user))
		return
	//user.drop_item()
	if (O.loc != user.loc)
		to_chat(user, "you start climbing onto [O]...")
		step(O, get_dir(O, src))
	return

	//Check Health
/obj/structure/hedgehog/proc/health_check(var/die)
	if(health < 1 || die)
		visible_message("\red <B>[src] falls apart!</B>")
		qdel(src)

	//Explosion Act
/obj/structure/hedgehog/ex_act(severity)
	switch(severity)
		if(1.0)
			visible_message("\red <B>[src] is blown apart!</B>")
			qdel(src)
			return
		if(2.0)
			src.health -= rand(30,60)
			if (src.health <= 0)
				visible_message("\red <B>[src] is blown apart!</B>")
				qdel(src)
			return
		if(3.0)
			src.health -= rand(10,30)
			if (src.health <= 0)
				visible_message("\red <B>[src] is blown apart!</B>")
				qdel(src)
			return

/obj/structure/hedgehog/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/wrench) && health == 200)
		to_chat(user, "<span class='notice'>You start dismantling the hedgehog...</span>")
		playsound(src, 'sound/items/Ratchet.ogg', 50, 1)
		if(do_after(user, 60))
			if(!src) return
			to_chat(user, "<span class='notice'>You dismantle the hedgehog!</span>")
			new /obj/item/stack/hedgehog_rods/(src.loc)
			qdel(src)
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		if(!do_mob(user, 60))
			to_chat(user, "<span class='warning'>You must stand still to do that.</span>")
			return 0


/obj/structure/hedgehog/proc/check4struct(mob/user as mob)
	if((locate(/obj/structure/hedgehog) || \
		locate(/obj/structure/sandbag) || \
		locate(/obj/structure/brustwehr)|| \
		locate(/obj/structure/sandbag/concrete_block)) in src.loc.contents \
		)
		to_chat(user, "\red There is no more space.")
		return 0
	return 1


/obj/structure/hedgehog/ex_act(severity)
	switch(severity)
		if(1.0)
			new /obj/item/stack/rods(src.loc)
			qdel(src)
			return
		if(2.0)
			new /obj/item/stack/rods(src)
			qdel(src)
			return
		else
	return
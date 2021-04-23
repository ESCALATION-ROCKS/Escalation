/obj/structure/brustwehrincomplete
	name = "incomplete brustwehr"
	icon = 'icons/obj/structures.dmi'
	icon_state = "brustwehr_isntready"
	density = 0
	explosion_resistance = 1
	throwpass = 1//we can throw grenades despite its density
	anchored = 1
	flags = OBJ_CLIMBABLE
	var/digstage = 0

/obj/structure/brustwehrincomplete/Initialize(var/obj/structure/flora/F)
	if(locate(F) in src.loc.contents)
		qdel(F)

/obj/structure/brustwehrincomplete/attackby(obj/item/weapon/W as obj, mob/user as mob)

	if(istype(W,/obj/item/weapon/shovel))
		var/obj/item/weapon/shovel/C = W
		if(C.working)
			return
		C.working = 1
		if(!C.ground > 0)
			C.working = 0
			return
		playsound(src, 'sound/effects/empty_shovel.ogg', 50, 1)
		if(!do_after(user, 10,src))
			to_chat(user, "Hold still to do this.")
			C.working = 0
			return
		C.ground--
		digstage++
		C.working = 0
		to_chat(user, "You put some ground onto [src].")
		if(digstage <= 3)
			to_chat(user, "<span class='warning'>You need [4 - digstage] more piles.</span>")
		C.update_icon()
		update_stage()

	else
		return ..()

/obj/structure/brustwehrincomplete/proc/update_stage()
	if(digstage >= 4)
		new /obj/structure/brustwehr(src.loc)
		qdel(src)

/obj/structure/brustwehr
	name = "brustwehr"
	desc = "A breast-high earthwork structure meant to provide cover."
	icon = 'icons/obj/coldwar/sandbags.dmi'
	icon_state = "brustwehr_0"
	density = 1
	throwpass = 1//we can throw grenades despite its density
	anchored = 1
	explosion_resistance = 1
	flags = OBJ_CLIMBABLE
	var/basic_chance = 35
	var/health = 600 //Actual health depends on snow layer
	var/reinforced = 0 //has there been a bridge built?

/obj/structure/brustwehr/Initialize(var/obj/structure/flora/F)
	if(locate(F) in src.loc.contents)
		qdel(F)


/obj/structure/brustwehr/New()
	..()
	flags |= ON_BORDER
	update_nearby_icons()

/obj/structure/brustwehr/Destroy()
	basic_chance = null
	..()

/obj/structure/brustwehr/examine(mob/user)
	. = ..(user)
	switch(health)
		if(600 to INFINITY)
			to_chat(user, "It's intact.")
		if(450 to 600)
			to_chat(user, "It's slightly damaged.")
		if(200 to 450)
			to_chat(user, "<span class='warning'>It's badly damaged.</span>")
		if(50 to 200)
			to_chat(user, "<span class='warning'>It's heavily damaged.</span>")
		else
			to_chat(user, "<span class='warning'>It's falling apart!</span>")

/obj/structure/brustwehr/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile))
		var/obj/item/projectile/proj = mover

		if(proj.firer && Adjacent(proj.firer))
			return 1

		if (get_dist(proj.starting, loc) <= 1)//allows to fire from 1 tile away of sandbag
			return 1

		return check_cover(mover, target)

	else if(istype(mover, /obj))
		return 1

	else
		..()

//checks if projectile 'P' from turf 'from' can hit whatever is behind the table. Returns 1 if it can, 0 if bullet stops.
/obj/structure/brustwehr/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover = get_step(loc, get_dir(from, loc))
	if (get_dist(P.starting, loc) <= 4) //Barricades won't help you if people are THIS close
		return 1
	if (get_turf(P.original) == cover)
		var/chance = 70
		if (ismob(P.original))
			var/mob/M = P.original
			if (M.lying)
				chance += 20				//Lying down lets you catch less bullets
		if(prob(chance))
			health -= P.damage
			visible_message("<span class='warning'>[P] hits [src]!</span>")
			health_check()
			return 0
	return 1

/obj/structure/brustwehr/MouseDrop_T(obj/O as obj, mob/user as mob)
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
/obj/structure/brustwehr/proc/health_check(var/die)
	if(health < 1 || die)
		update_nearby_icons()
		visible_message("\red <B>[src] falls apart!</B>")
		qdel(src)

	//Explosion Act
/obj/structure/brustwehr/ex_act(severity)
	switch(severity)
		if(1.0)
			visible_message("\red <B>[src] is blown apart!</B>")
			src.update_nearby_icons()
			qdel(src)
			return
		if(2.0)
			src.health -= rand(30,60)
			if (src.health <= 0)
				visible_message("\red <B>[src] is blown apart!</B>")
				src.update_nearby_icons()
				qdel(src)
			return
		if(3.0)
			src.health -= rand(10,30)
			if (src.health <= 0)
				visible_message("\red <B>[src] is blown apart!</B>")
				src.update_nearby_icons()
				qdel(src)
			return

	//Update Sides
/obj/structure/brustwehr/proc/update_nearby_icons()
	update_icon()
	for(var/direction in GLOB.cardinal)
		for(var/obj/structure/brustwehr/B in get_step(src,direction))
			B.update_icon()

	//Update Icons
/obj/structure/brustwehr/update_icon()
	spawn(2)
		if(!src)
			return
		var/junction = 0 //will be used to determine from which side the barricade is connected to other barricades
		for(var/obj/structure/brustwehr/B in orange(src,1))
			if(abs(x-B.x)-abs(y-B.y) ) 		//doesn't count barricades, placed diagonally to src
				junction |= get_dir(src,B)

		icon_state = "brustwehr_[junction]"
		return

/////////////////////////////////////////////////////
////////////replacement for wood upgrades////////////
/////////////////////////////////////////////////////


/obj/machinery/deployable/brustwehr_cade
	name = "burstwehr wood barricade"
	desc = "Some wooden planks covering a brustwehr."
	icon = 'icons/obj/coldwar/sandbags.dmi'
	anchored = 1
	density = 1
	icon_state = "brustwehr_barricadeoverlay"
	//if(A.density && !A.throwpass) src.throw_impact(A,speed)
	throwpass = 0 //we can throw grenades despite its density
	var/basic_chance = 100
	var/health = 200 //Actual health depends on snow layer

/*/obj/machinery/deployable/barrier/brustwehr_cade/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)//So bullets will fly over and stuff.
	if(air_group || (height==0))
		return 0
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 0
	else
		return 0*/

/obj/machinery/deployable/brustwehr_cade/New(loc, direction)
	if(direction)
		dir = direction
	..()

/obj/machinery/deployable/brustwehr_cade/Initialize()
	. = ..()
	update_layers()
	//to_world(" New(). Dir:[dir]; Layer:[layer]; plane:[plane]")

/obj/machinery/deployable/brustwehr_cade/Destroy()
	basic_chance = null
	..()

/obj/machinery/deployable/brustwehr_cade/examine(mob/user)
	. = ..(user)
	switch(health)
		if(200 to INFINITY)
			to_chat(user, "It's intact.")
		if(150 to 200)
			to_chat(user, "It's slightly damaged.")
		if(75 to 150)
			to_chat(user, "<span class='warning'>It's badly damaged.</span>")
		if(40 to 75)
			to_chat(user, "<span class='warning'>It's heavily damaged.</span>")
		else
			to_chat(user, "<span class='warning'>It's falling apart!</span>")

/obj/machinery/deployable/brustwehr_cade/proc/update_layers()
	if(dir != SOUTH)
		layer = initial(layer) + 0.1
		plane = initial(plane)
	else
		layer = ABOVE_OBJ_LAYER + 0.1
		plane = ABOVE_HUMAN_PLANE

/obj/machinery/deployable/brustwehr_cade/set_dir()
	..()
	update_layers()

/obj/machinery/deployable/brustwehr_cade/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile))
		/*var/obj/item/projectile/proj = mover

		if(proj.firer && Adjacent(proj.firer))
			return 0

		if (get_dist(proj.starting, loc) <= 0)//allows to fire from 0 tile away of sandbag
			return 0*/

		return check_cover(mover, target)

	/*if(get_dir(get_turf(src), target) == dir)//turned in front of sandbag
		return 0*/

	else
		return 1

//checks if projectile 'P' from turf 'from' can hit whatever is behind the table. Returns 1 if it can, 0 if bullet stops.
/obj/machinery/deployable/brustwehr_cade/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover = get_turf(src)
	var/chance = basic_chance

	if(!cover)
		return 1

	if(prob(chance))
		visible_message("<span class='warning'>[P] hits \the [src]!</span>")
		health -= P.damage
		health_check()
		return 0

	return 1

	//Check cade
/obj/machinery/deployable/brustwehr_cade/proc/health_check(var/die)
	if(health < 1 || die)
		visible_message("\red <B>[src] falls apart!</B>")
		qdel(src)

/obj/machinery/deployable/brustwehr_cade/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/carpentry/axe) && health == 200)
		to_chat(user, "<span class='notice'>You start dismantling the barricade...</span>")
		playsound(src, 'sound/effects/chopchop.ogg', 50, 1)
		if(do_after(user, 80))
			if(!src) return
			to_chat(user, "<span class='notice'>You dismantle the barricade!</span>")
			new /obj/item/stack/material/r_wood/(src.loc)
			qdel(src)
			return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		if(!do_mob(user, 80))
			to_chat(user, "<span class='warning'>You must stand still to do that.</span>")
			return 0

/obj/structure/brustwehr/attackby(var/obj/item/stack/material/r_wood/R, mob/user as mob)

	if(!locate(/obj/machinery/deployable/brustwehr_cade) in src.loc.contents)//checks to see if there is one already planted, stacking brust cades is OP

		if(do_after(user, 50 ,src)) //wood from cutting trees
			if(R.amount >= 6)
				var /obj/machinery/deployable/brustwehr_cade/W = new(src.loc)
				to_chat(user, "<span class='notice'>You finish setting up the wooden barricade!</span>")
				R.use(6)
				W.throwpass = 0
				playsound(get_turf(loc), "rustle", 15, 1, -3)
				return
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		if(!do_mob(user, 50, src))
			to_chat(user, "<span class='warning'>You must stand still to do that.</span>")
			return 0



//reinforcement code, commented out to deactivate.
//Wooden upgrades are being replaced by spawning a special "wood barricade" on top of the brustwehr instead of upgrading the brustwehr itself now
/*/obj/structure/brustwehr/attackby(var/obj/item/I, mob/user as mob)
	if(istype(I, /obj/item/stack/material/wood))
		if(!reinforced)

			var/obj/item/stack/material/wood/R = I

			if(R.amount >= 3)
				if(!do_after(user, 20, src))
					return 0
				desc = "A brustwehr covered with some wooden planks."
				flags |= OBJ_CLIMBABLE
				R.use(3)
				health += 100
				reinforced = 1
				throwpass = 0
				playsound(get_turf(loc), "rustle", 15, 1, -3)
				basic_chance += 10
				density = 1
				src.overlays += image('icons/obj/sandbags.dmi', "brustwehr_barricadeoverlay", layer=3.1)
			else
				to_chat(user, "<span class='notice'>You do not have enough wood to reinforce the brustwehr.</span>")

	else if(istype(I, /obj/item/stack/material/r_wood))
		if(!reinforced)
			var/obj/item/stack/material/r_wood/R = I

			if(R.amount >= 3)
				if(!do_after(user, 20, src))
					return 0
				desc = "A brustwehr covered with some wooden planks."
				flags |= OBJ_CLIMBABLE
				basic_chance += 20
				R.use(3)
				health += 150
				playsound(get_turf(loc), "rustle", 15, 1, -3)
				throwpass = 0
				reinforced = 2
				density = 1
				src.overlays += image('icons/obj/sandbags.dmi', "brustwehr_barricadeoverlay", layer=3.1)
			else
				to_chat(user, "<span class='notice'>You do not have enough wood to reinforce the brustwehr.</span>")*/

	/*else if(istype(I, /obj/item/weapon/sandbag))
		if(!reinforced)
			var/obj/item/weapon/sandbag/R = I

			if(R.sand_amount >= 4)
				if(!do_after(user, 20, src))
					return 0
				desc = "A brustwehr covered with some sandbags."
				flags |= OBJ_CLIMBABLE
				basic_chance += 30
				health += 200
				qdel(R)
				playsound(get_turf(loc), "rustle", 15, 1, -4)
				reinforced = 3
				density = 1
				src.overlays += image('icons/obj/sandbags.dmi', "brustwehr_sandbagoverlay", layer=3.1)
			else
				to_chat(user, "<span class='notice'>The sandbag isn't full enough to reinforce the brustwehr.</span>")*/

/*	else if(istype(I, /obj/item/weapon/shovel))
		var/obj/item/weapon/shovel/S = I
		if(S.ground)
			to_chat(user, "<span class='notice'>The brustwehr is fully built.</span>")
			return 0
		if(reinforced)
			to_chat(user, "<span class='notice'>You begin to disassemble the reinforcement.</span>")
			if(!do_after(user, 20, src))
				return 0
			playsound(src, 'sound/items/Deconstruct.ogg', 50, 1)
			desc = "A breast-high earthwork structure meant to provide cover."
			src.overlays = null
			basic_chance = 20
			throwpass = 1
			switch(reinforced)
				if(1)
					var/obj/item/stack/material/wood/R =  new /obj/item/stack/material/wood(get_turf(src))
					R.amount = 3
					health = max(100, health - 100)
				if(2)
					var/obj/item/stack/material/r_wood/R =  new /obj/item/stack/material/r_wood(get_turf(src))
					R.amount = 3
					health = max(100, health - 150)
				if(3)
					var/obj/item/weapon/sandbag/R =  new /obj/item/weapon/sandbag(get_turf(src))
					R.sand_amount = 4
					R.w_class++
					R.update_icon()
					health = max(100, health - 200)
			reinforced = 0
		else
			to_chat(user, "<span class='notice'>You start to take down the brustwehr.</span>")
			playsound(src, 'sound/effects/empty_shovel.ogg', 50, 1)
			if(!do_after(user, 20, src))
				return 0
			for(var/i=0, i<5, i++)
				new /obj/item/weapon/ore/glass(src.loc)
			src.update_nearby_icons()
			qdel(src)*/



/*
/obj/item/weapon/ore/glass/attack_self(mob/user as mob)
	if(!isturf(user.loc))
		to_chat(user, "\red Haha. Nice try.")
		return

	if(!check4struct(user))
		return

	var/obj/structure/brustwehr/B = new(user.loc)
	B.set_dir(user.dir)
	user.drop_item()
	qdel(src)
*/
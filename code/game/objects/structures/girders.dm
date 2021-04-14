/obj/structure/girder
	icon_state = "girder"
	density = 1
	throwpass = 1
	anchored = 1
	flags = OBJ_CLIMBABLE
	plane = OBJ_PLANE
	layer = BELOW_OBJ_LAYER
	w_class = ITEM_SIZE_NO_CONTAINER
	var/state = 0
	var/health = 200
	var/basic_chance = 35
	var/material/reinf_material
	var/reinforcing = 0

/obj/structure/girder/displaced
	icon_state = "displaced"
	anchored = 0
	health = 50


/obj/structure/girder/New()
	..()
	flags |= ON_BORDER

/obj/structure/girder/Destroy()
	basic_chance = null
	..()


/obj/structure/girder/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile))
		var/obj/item/projectile/proj = mover

		if(proj.firer && Adjacent(proj.firer))
			return 1

		if (get_dist(proj.starting, loc) <= 2)//allows to fire from 1 tile away of sandbag
			return 1

		return check_cover(mover, target)

	else if(istype(mover, /obj))
		return 1

	else
		..()

//checks if projectile 'P' from turf 'from' can hit whatever is behind the table. Returns 1 if it can, 0 if bullet stops.
/obj/structure/girder/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover = get_step(loc, get_dir(from, loc))
	if (get_dist(P.starting, loc) <= 2) //Barricades won't help you if people are THIS close
		return 1
	if (get_turf(P.original) == cover)
		var/chance = 70
		if (ismob(P.original))
			var/mob/M = P.original
			if (M.lying)
				chance += 20				//Lying down lets you catch less bullets
		if(prob(chance))
			health -= P.damage/2
			visible_message("<span class='warning'>[P] hits [src]!</span>")
			health_check()
			return 0
	return 1

/obj/structure/girder/MouseDrop_T(obj/O as obj, mob/user as mob)
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
/obj/structure/girder/proc/health_check(var/die)
	if(health < 1 || die)
		visible_message("\red <B>[src] falls apart!</B>")
		qdel(src)

	//Explosion Act
/obj/structure/girder/ex_act(severity)
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

/obj/structure/girder/proc/reset_girder()
	anchored = 1
	health = min(health,initial(health))
	state = 0
	icon_state = initial(icon_state)
	reinforcing = 0
	if(reinf_material)
		reinforce_girder()

/obj/structure/girder/attack_generic(var/mob/user, var/damage, var/attack_message = "smashes apart", var/wallbreaker)
	if(!damage || !wallbreaker)
		return 0
	attack_animation(user)
	visible_message("<span class='danger'>[user] [attack_message] the [src]!</span>")
	spawn(1) dismantle()
	return 1

/obj/structure/girder/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/wrench) && state == 0)
		if(anchored && !reinf_material)
			playsound(src.loc, 'sound/items/Ratchet.ogg', 100, 1)
			to_chat(user, "<span class='notice'>Now disassembling the girder...</span>")
			if(do_after(user, 40 * W.toolspeed,src))
				if(!src) return
				to_chat(user, "<span class='notice'>You dissasembled the girder!</span>")
				dismantle()
		else if(!anchored)
			playsound(src.loc, 'sound/items/Ratchet.ogg', 100, 1)
			to_chat(user, "<span class='notice'>Now securing the girder...</span>")
			if(do_after(user, 40 * W.toolspeed,src))
				to_chat(user, "<span class='notice'>You secured the girder!</span>")
				reset_girder()

	else if(istype(W, /obj/item/weapon/pickaxe/plasmacutter))
		to_chat(user, "<span class='notice'>Now slicing apart the girder...</span>")
		if(do_after(user,30 * W.toolspeed,src))
			if(!src) return
			to_chat(user, "<span class='notice'>You slice apart the girder!</span>")
			dismantle()

	else if(istype(W, /obj/item/weapon/pickaxe/diamonddrill))
		to_chat(user, "<span class='notice'>You drill through the girder!</span>")
		dismantle()

	else if(istype(W, /obj/item/weapon/screwdriver))
		if(state == 2)
			playsound(src.loc, 'sound/items/Screwdriver.ogg', 100, 1)
			to_chat(user, "<span class='notice'>Now unsecuring support struts...</span>")
			if(do_after(user, 40 * W.toolspeed,src))
				if(!src) return
				to_chat(user, "<span class='notice'>You unsecured the support struts!</span>")
				state = 1
		else if(anchored && !reinf_material)
			playsound(src.loc, 'sound/items/Screwdriver.ogg', 100, 1)
			reinforcing = !reinforcing
			to_chat(user, "<span class='notice'>\The [src] can now be [reinforcing? "reinforced" : "constructed"]!</span>")

	else if(istype(W, /obj/item/weapon/wirecutters) && state == 1)
		playsound(src.loc, 'sound/items/Wirecutter.ogg', 100, 1)
		to_chat(user, "<span class='notice'>Now removing support struts...</span>")
		if(do_after(user, 40 * W.toolspeed,src))
			if(!src) return
			to_chat(user, "<span class='notice'>You removed the support struts!</span>")
			reinf_material.place_dismantled_product(get_turf(src))
			reinf_material = null
			reset_girder()

	else if(istype(W, /obj/item/weapon/crowbar) && state == 0 && anchored)
		playsound(src.loc, 'sound/items/Crowbar.ogg', 100, 1)
		to_chat(user, "<span class='notice'>Now dislodging the girder...</span>")
		if(do_after(user, 40 * W.toolspeed,src))
			if(!src) return
			to_chat(user, "<span class='notice'>You dislodged the girder!</span>")
			icon_state = "displaced"
			anchored = 0
			health = 50

	else if(istype(W, /obj/item/stack/material))
		if(reinforcing && !reinf_material)
			if(!reinforce_with_material(W, user))
				return ..()
		else
			if(!construct_wall(W, user))
				return ..()

	else
		return ..()

/obj/structure/girder/proc/construct_wall(obj/item/stack/material/S, mob/user)
	if(S.get_amount() < 2)
		to_chat(user, "<span class='notice'>There isn't enough material here to construct a wall.</span>")
		return 0

	var/material/M = name_to_material[S.default_type]
	if(!istype(M))
		return 0

	var/wall_fake
	add_hiddenprint(usr)

	if(M.integrity < 50)
		to_chat(user, "<span class='notice'>This material is too soft for use in wall construction.</span>")
		return 0

	to_chat(user, "<span class='notice'>You begin adding the plating...</span>")

	if(!do_after(user,40,src) || !S.use(2))
		return 1 //once we've gotten this far don't call parent attackby()

	if(anchored)
		to_chat(user, "<span class='notice'>You added the plating!</span>")
	else
		to_chat(user, "<span class='notice'>You create a false wall! Push on it to open or close the passage.</span>")
		wall_fake = 1

	var/turf/Tsrc = get_turf(src)
	Tsrc.ChangeTurf(/turf/simulated/wall)
	var/turf/simulated/wall/T = get_turf(src)
	T.set_material(M, reinf_material)
	if(wall_fake)
		T.can_open = 1
	T.add_hiddenprint(usr)
	qdel(src)
	return 1

/obj/structure/girder/proc/reinforce_with_material(obj/item/stack/material/S, mob/user) //if the verb is removed this can be renamed.
	if(reinf_material)
		to_chat(user, "<span class='notice'>\The [src] is already reinforced.</span>")
		return 0

	if(S.get_amount() < 2)
		to_chat(user, "<span class='notice'>There isn't enough material here to reinforce the girder.</span>")
		return 0

	var/material/M = name_to_material[S.default_type]
	if(!istype(M) || M.integrity < 50)
		to_chat(user, "You cannot reinforce \the [src] with that; it is too soft.")
		return 0

	to_chat(user, "<span class='notice'>Now reinforcing...</span>")
	if (!do_after(user, 40,src) || !S.use(2))
		return 1 //don't call parent attackby() past this point
	to_chat(user, "<span class='notice'>You added reinforcement!</span>")

	reinf_material = M
	reinforce_girder()
	return 1

/obj/structure/girder/proc/reinforce_girder()
	health = 500
	state = 2
	icon_state = "reinforced"
	reinforcing = 0

/obj/structure/girder/proc/dismantle()
	new /obj/item/stack/material/steel(get_turf(src))
	qdel(src)

/obj/structure/girder/attack_hand(mob/user as mob)
	if (HULK in user.mutations)
		visible_message("<span class='danger'>[user] smashes [src] apart!</span>")
		dismantle()
		return
	return ..()


/obj/structure/girder/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if (prob(30))
				dismantle()
			return
		if(3.0)
			if (prob(5))
				dismantle()
			return
		else
	return

/obj/structure/girder/cult
	icon= 'icons/obj/cult.dmi'
	icon_state= "cultgirder"
	health = 250

/obj/structure/girder/cult/dismantle()
	new /obj/item/remains/human(get_turf(src))
	qdel(src)

/obj/structure/girder/cult/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/wrench))
		playsound(src.loc, 'sound/items/Ratchet.ogg', 100, 1)
		to_chat(user, "<span class='notice'>Now disassembling the girder...</span>")
		if(do_after(user,40 * W.toolspeed,src))
			to_chat(user, "<span class='notice'>You dissasembled the girder!</span>")
			dismantle()

	else if(istype(W, /obj/item/weapon/pickaxe/plasmacutter))
		to_chat(user, "<span class='notice'>Now slicing apart the girder...</span>")
		if(do_after(user,30 * W.toolspeed,src))
			to_chat(user, "<span class='notice'>You slice apart the girder!</span>")
		dismantle()

	else if(istype(W, /obj/item/weapon/pickaxe/diamonddrill))
		to_chat(user, "<span class='notice'>You drill through the girder!</span>")
		new /obj/item/remains/human(get_turf(src))
		dismantle()


/obj/structure/girder/concrete
	name = "concrete wreckage"
	icon_state = "conwreckage"
	anchored = 1
	density = 0
	plane = OBJ_PLANE
	layer = BELOW_OBJ_LAYER
	w_class = ITEM_SIZE_NO_CONTAINER
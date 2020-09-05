var/list/turf_edge_cache = list()


/turf/Initialize()
	if(outdoors)
		SSplanets.addTurf(src)
	..()

/turf/Destroy()
	if(outdoors)
		SSplanets.removeTurf(src)
	return ..()

/turf/proc/make_outdoors()
	outdoors = TRUE
	SSplanets.addTurf(src)

/turf/proc/make_indoors()
	outdoors = FALSE
	SSplanets.removeTurf(src)

/turf/post_change()
	..()
	// If it was outdoors and still is, it will not get added twice when the planet controller gets around to putting it in.
	if(outdoors)
		make_outdoors()
	else
		make_indoors()


/turf/unsimulated/snow
	name = "snow"
	dynamic_lighting = 1
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"
	blend_with_neighbors = 3
	permit_ao = 0
	movement_delay = 3
	outdoors = 1    /* we need snow footstep sounds */
	footstep_sounds = list("human" = list(
		'sound/effects/footsteps/dirt1.wav',
		'sound/effects/footsteps/dirt2.wav',
		'sound/effects/footsteps/dirt3.wav',
		'sound/effects/footsteps/dirt4.wav',
		'sound/effects/footsteps/dirt5.wav',
		'sound/effects/footsteps/dirt6.wav',
		'sound/effects/footsteps/dirt7.wav',
		'sound/effects/footsteps/dirt8.wav'))
//	multiple_smooth_states = list(1, 2, 3, 4, 5)

	var/list/crossed_dirs = list()

	var/wasDug = FALSE
	var/dugIcon = null
	var/dug = 0
	var/pit = 0
	var/dig_stage = 0

/turf/unsimulated/snow/attackby(obj/item/C as obj, mob/user as mob)
	if (istype(C, /obj/item/stack/rods))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			return
		var/obj/item/stack/rods/R = C
		if (R.use(1))
			to_chat(user, "<span class='notice'>You lay down the support lattice.</span>")
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			new /obj/structure/lattice(locate(src.x, src.y, src.z))
		return

	if(istype(C, /obj/item/weapon/shovel))
		var/obj/item/weapon/shovel/S = C
		var/obj/structure/pit/P = locate(/obj/structure/pit) in src
		if(P)
			return
		if(S.working == 1)
			return
		if(S.ground > 0)
			S.ground -= 1
			new/obj/item/weapon/ore/snow(src)
			playsound(src, 'sound/effects/empty_shovel.ogg', 50, 1)
			S.update_icon()
			return

		if (dig_stage == 20)
			user << "\red You start digging a big pit."
			playsound(src, 'sound/effects/dig_shovel.ogg', 50, 1)

			if(!do_after(user,100, src))
				S.working = 0
				return
			gets_pit()

		else

			var/turf/T = user.loc
			if (!(istype(T)))
				return

			user << "\red You start digging."
			S.working = 1
			playsound(src, 'sound/effects/dig_shovel.ogg', 50, 1)

			if(!do_after(user,40, src))
				S.working = 0
				return

			user << "<span class='notice'>You dug some snow onto your shovel.</span>"
//			gets_dug()
			S.ground += S.max_ground
			dig_stage += S.max_ground
			S.update_icon()
			S.working = 0

	if (istype(C, /obj/item/stack/rods))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			return
		var/obj/item/stack/rods/R = C
		if (R.use(1))
			to_chat(user, "<span class='notice'>You lay down the support lattice.</span>")
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			new /obj/structure/lattice(locate(src.x, src.y, src.z))
		return

	if (istype(C, /obj/item/stack/tile))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			var/obj/item/stack/tile/floor/S = C
			if (S.get_amount() < 1)
				return
			qdel(L)
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			S.use(1)
			ChangeTurf(/turf/simulated/floor/airless)
			return
		else
			to_chat(user, "<span class='warning'>The plating is going to need some support.</span>")
	return

/turf/unsimulated/snow/ex_act(severity)
	switch(severity)
		if(3.0)
			return
		if(2.0)
			if (prob(70))
				gets_dug()
		if(1.0)
			gets_dug()
	return


/turf/unsimulated/snow/proc/gets_dug(obj/item/C, mob/user)
	new/obj/item/weapon/ore/snow(src)
	dug = 1


/turf/unsimulated/snow/proc/gets_pit(obj/item/C, mob/user)
	var/obj/structure/pit/P = locate(/obj/structure/pit) in src
	if(P)
		P.attackby(C, user)
	if(!(locate(/obj/structure/pit) in src))
		new /obj/structure/pit(src)

/turf/unsimulated/snow/gravsnow
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "gravsnow"
	blend_with_neighbors = 2
	movement_delay = 2

/turf/unsimulated/snow/permafrost
	name = "permafrost"
	icon = 'icons/turf/snow.dmi'
	icon_state = "permafrost"
	blend_with_neighbors = 2
	movement_delay = 2


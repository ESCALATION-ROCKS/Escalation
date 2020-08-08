/*
 * Platforms
 */
/obj/structure/platform
	name = "platform"
	desc = "A square metal surface resting on four legs."
	icon = 'icons/obj/platforms.dmi'
	icon_state = "platform"
	anchored = TRUE
	density = 1
	throwpass = 1 //You can throw objects over this, despite its density.
	layer = 1
	flags = ON_BORDER | OBJ_CLIMBABLE

/obj/structure/platform/New()
	var/image/I = image(icon, src, "platform_overlay", OBJ_LAYER - 0,1, dir)//ladder layer puts us just above weeds.
	switch(dir)
		if(SOUTH)
			layer = ABOVE_HUMAN_LAYER
			I.pixel_y = -16
		if(NORTH)
			I.pixel_y = 16
		if(EAST)
			I.pixel_x = 16
		if(WEST)
			I.pixel_x = -16
	overlays += I
	..()

/obj/structure/platform/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile))
		var/obj/item/projectile/proj = mover

		if(proj.firer && Adjacent(proj.firer))
			return 1

		if (get_dist(proj.starting, loc) <= 1)//allows to fire from 1 tile away of sandbag
			return 1

		return

	if(get_dir(get_turf(src), target) == dir)//turned in front of sandbag
		return 0

	else
		return 1

/obj/structure/platform/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASSTABLE))
		return 1
	if (get_dir(loc, target) == dir)
		return !density
	else
		return 1
	return 1

obj/structure/platform_decoration
	name = "platform"
	desc = "A square metal surface resting on four legs."
	icon = 'icons/obj/platforms.dmi'
	icon_state = "platform_deco"
	anchored = TRUE
	density = 0
	throwpass = TRUE
	layer = 3.5
	breakable = FALSE
	flags = ON_BORDER

/obj/structure/platform_decoration/New()
	switch(dir)
		if (NORTH)
			layer = ABOVE_HUMAN_LAYER
		if (SOUTH)
			layer = ABOVE_HUMAN_LAYER
		if (SOUTHEAST)
			layer = ABOVE_HUMAN_LAYER
		if (SOUTHWEST)
			layer = ABOVE_HUMAN_LAYER
	.. ()
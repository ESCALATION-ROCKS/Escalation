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
	layer = OBJ_LAYER
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

/obj/structure/platform/CheckExit(atom/movable/O, turf/target)
	if(O && O.throwing)
		return 1

	if(((flags & ON_BORDER) && get_dir(loc, target) == dir))
		return 0
	else
		return 1

/obj/structure/platform/CanPass(atom/movable/mover, turf/target)
	if(!mover)
		return 1
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	if(!(flags & ON_BORDER) || get_dir(loc, target) == dir)
		return 0
	else
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
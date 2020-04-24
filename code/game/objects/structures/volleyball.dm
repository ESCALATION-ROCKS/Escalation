//VOLEYBALL OBJECTS

/obj/item/weapon/beach_ball/holovolleyball
	icon = 'icons/obj/basketball.dmi'
	icon_state = "volleyball"
	name = "voleyball"
	item_state = "volleyball"
	desc = "You can be my wingman anytime."
	w_class = ITEM_SIZE_LARGE //Stops people from hiding it in their pockets

/obj/structure/holonet
	name = "net"
	desc = "Bullshit, you can be mine!"
	icon = 'icons/obj/basketball.dmi'
	icon_state = "volleynet_mid"
	density = 1
	anchored = 1
	layer = TABLE_LAYER
	throwpass = 1
	dir = 4

/obj/structure/holonet/end
	icon_state = "volleynet_end"

/obj/structure/holonet/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if (istype(mover,/obj/item) && mover.throwing)
		var/obj/item/I = mover
		if(istype(I, /obj/item/projectile))
			return
		if(prob(10))
			I.forceMove(get_turf(src))
			visible_message("<span class='notice'>Swish! \the [I] gets caught in \the [src].</span>", 3)
			return 0
		else
			return 1
	else
		return ..(mover, target, height, air_group)

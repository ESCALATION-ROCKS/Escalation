/obj/structure/tires
	name = "pile of tires"
	desc = "Can be used as a makeshift reinforcement. Probably."
	icon = 'icons/obj/decor.dmi'
	icon_state = "tires"
	opacity = 0
	density = 0
	anchored = 0
	var/pass_chance = 50

/obj/structure/tires/New()
	dir = pick(1,2,4,8)
	update_icon()
/obj/structure/tires/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile) && prob(pass_chance))
		return 1
	else
		return 0

/obj/structure/tires/big
	name = "pile of tires"
	desc = "Can be used as a makeshift reinforcement. Probably."
	icon_state = "tiresbig"
	appearance_flags = PIXEL_SCALE
	opacity = 0
	density = 1
	anchored = 1
	pass_chance = 85
/obj/structure/bed/chair/couch
	name = "couch"
	desc = "A couch. Looks pretty comfortable."
	icon = 'icons/obj/structures/couch.dmi'
	icon_state = "chair"
	color = rgb(255,255,255)
	var/image/armrest = null
	var/couchpart = 0 //0 = middle, 1 = left, 2 = right

/obj/structure/bed/chair/couch/update_icon()
	return

/obj/structure/bed/chair/couch/New(var/newloc,var/newmaterial)
//	..(newloc,"steel","black")

	if(couchpart == 1)
		armrest = image("icons/urist/structures&machinery/Nienplants&Couch.dmi", "armrest_left")
		armrest.plane = ABOVE_HUMAN_PLANE
		armrest.layer = ABOVE_HUMAN_LAYER
	else if(couchpart == 2)
		armrest = image("icons/urist/structures&machinery/Nienplants&Couch.dmi", "armrest_right")
		armrest.plane = ABOVE_HUMAN_PLANE
		armrest.layer = ABOVE_HUMAN_LAYER

	..()

	src.color = initial(color)


/obj/structure/bed/chair/couch/post_buckle_mob()
	if(buckled_mob)
		overlays += armrest
	else
		overlays -= armrest

/obj/structure/bed/chair/couch/left
	couchpart = 1
	icon_state = "couch_left"
	base_icon = "couch_left"

/obj/structure/bed/chair/couch/right
	couchpart = 2
	icon_state = "couch_right"
	base_icon = "couch_right"

/obj/structure/bed/chair/couch/middle
	icon_state = "couch_middle"
	base_icon = "couch_middle"

/obj/structure/bed/chair/couch/left/black
	color = rgb(167,164,153)

/obj/structure/bed/chair/couch/right/black
	color = rgb(167,164,153)

/obj/structure/bed/chair/couch/middle/black
	color = rgb(167,164,153)

/obj/structure/bed/chair/couch/left/teal
	color = rgb(0,255,255)

/obj/structure/bed/chair/couch/right/teal
	color = rgb(0,255,255)

/obj/structure/bed/chair/couch/middle/teal
	color = rgb(0,255,255)

/obj/structure/bed/chair/couch/left/beige
	color = rgb(255,253,195)

/obj/structure/bed/chair/couch/right/beige
	color = rgb(255,253,195)

/obj/structure/bed/chair/couch/middle/beige
	color = rgb(255,253,195)

/obj/structure/bed/chair/couch/left/brown
	color = rgb(255,113,0)

/obj/structure/bed/chair/couch/right/brown
	color = rgb(255,113,0)

/obj/structure/bed/chair/couch/middle/brown
	color = rgb(255,113,0)


/obj/structure/bed/chair/couch/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/wrench))
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		new /obj/item/stack/material/steel(src.loc)
		qdel(src)
	else
		..()


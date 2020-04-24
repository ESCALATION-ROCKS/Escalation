/obj/structure/table/rack
	name = "rack"
	desc = "Different from the Middle Ages version."
	icon = 'icons/obj/objects.dmi'
	icon_state = "rack"
	can_plate = 0
	can_reinforce = 0
	flipped = -1

	material = DEFAULT_TABLE_MATERIAL

/obj/structure/table/rack/New()
	..()
	verbs -= /obj/structure/table/verb/do_flip
	verbs -= /obj/structure/table/proc/do_put

/obj/structure/table/rack/Initialize()
	auto_align()
	. = ..()

/obj/structure/table/rack/update_connections()
	return

/obj/structure/table/rack/update_desc()
	return

/obj/structure/table/rack/update_icon()
	return

/obj/structure/table/rack/can_connect()
	return FALSE

/obj/structure/table/rack/holorack/dismantle(obj/item/weapon/wrench/W, mob/user)
	to_chat(user, "<span class='warning'>You cannot dismantle \the [src].</span>")
	return

/obj/structure/table/rack/shelf
	name = "shelf"
	desc = "You can put things on it, actually."
	icon = 'icons/obj/objects.dmi'
	icon_state = "shelf"
	can_plate = 0
	can_reinforce = 0
	flipped = -1

/obj/structure/table/rack/steriletable
	name = "sterile table"
	desc = "Used by *trained* medical staff for storage purposes."
	icon = 'icons/obj/objects.dmi'
	icon_state = "sterile_table"
	can_plate = 0
	anchored = 0
	can_reinforce = 0
	flipped = -1

/obj/structure/table/rack/smalltable
	name = "small wooden table"
	desc = "Pretty fancy."
	icon = 'icons/obj/objects.dmi'
	icon_state = "small_table"
	can_plate = 0
	can_reinforce = 0
	flipped = -1
	material = "wood"

/obj/structure/table/rack/foldtable
	name = "foldable table"
	desc = "Pretty fancy."
	icon = 'icons/obj/objects.dmi'
	icon_state = "foldable_table"
	can_plate = 0
	can_reinforce = 0
	flipped = -1

/obj/structure/table/rack/foldtable/attack_hand(mob/user as mob)
	playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
	if(do_after(user, 10))
		new /obj/item/weapon/table_parts/rack(src.loc)
		qdel(src)


/obj/structure/table/rack/pews
	name = "pews"
	desc = "Pretty fancy."
	icon = 'icons/obj/objects.dmi'
	icon_state = "pews"
	can_plate = 0
	can_reinforce = 0
	flipped = -1
	material = "wood"

/obj/structure/table/rack/pews/hori
	icon_state = "pewshori"
	material = "wood"

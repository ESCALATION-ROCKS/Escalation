/obj/item/weapon/table_parts
	name = "table parts"
	desc = "Parts of a table. Poor table."
	icon = 'icons/obj/items.dmi'
	icon_state = "table_parts"
	var/material_type = /obj/item/stack/material/steel/
	var/table_type = /obj/structure/table/steel
	var/delay = 60
	matter = list(DEFAULT_WALL_MATERIAL = 3000)

/obj/item/weapon/table_parts/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if (istype(W, /obj/item/weapon/wrench))
		new material_type(src.loc)
		//SN src = null
		qdel(src)

/obj/item/weapon/table_parts/attack_self(mob/user as mob)
	playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
	if(do_after(user, delay))
		new table_type(user.loc)
		qdel(src)
		return
	else
		return 0

/obj/item/weapon/table_parts/girder
	name = "girder parts"
	desc = "Parts of a girder."
	icon = 'icons/obj/items.dmi'
	icon_state = "girder_parts"
	table_type = /obj/structure/girder
	delay = 120
	matter = list(DEFAULT_WALL_MATERIAL = 4000)

/obj/item/weapon/table_parts/rack
	name = "rack parts"
	desc = "Parts of a rack."
	icon = 'icons/obj/items.dmi'
	icon_state = "rack_parts"
	table_type = /obj/structure/table/rack/
	delay = 40

/obj/item/weapon/table_parts/closet
	name = "closet parts"
	desc = "Parts of a closet."
	icon = 'icons/obj/items.dmi'
	icon_state = "closet_parts"
	table_type = /obj/structure/closet/
	delay = 80

/obj/item/weapon/table_parts/smalltable
	name = "folded table"
	desc = "Parts of a table."
	icon = 'icons/obj/objects.dmi'
	icon_state = "foldable_table_folded"
	table_type = /obj/structure/table/rack/
	delay = 40

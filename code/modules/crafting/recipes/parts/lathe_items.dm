/obj/item/reciever
	name = "Reciever"
	icon = 'icons/obj/crafting.dmi'
	w_class = ITEM_SIZE_NORMAL
	desc = "This is a reciever."
	icon_state = "reciever"
	matter = list(DEFAULT_WALL_MATERIAL = 25)

/obj/item/action
	name = "Action"
	icon = 'icons/obj/crafting.dmi'
	w_class = ITEM_SIZE_NORMAL
	desc = "This is a action."
	icon_state = "action"
	matter = list(DEFAULT_WALL_MATERIAL = 20)

/obj/item/metal_bar
	name = "Metal Bar"
	icon = 'icons/obj/crafting.dmi'
	w_class = ITEM_SIZE_NORMAL
	desc = "This is a metal bar.  Can be made into lots of stuff"
	icon_state = "metal_bar"
	matter = list(DEFAULT_WALL_MATERIAL = 15)

	mill()
		return /obj/item/pipe
	press()
		return /obj/item/weapon/crowbar

/obj/item/metal_shiv
	name = "Metal shiv"
	icon = 'icons/obj/crafting.dmi'
	w_class = ITEM_SIZE_NORMAL
	desc = "This is a metal shiv. It can be made into many things."
	icon_state = "metal_shiv"
	matter = list(DEFAULT_WALL_MATERIAL = 15)

	press()
		return /obj/item/screwdriver_head

/obj/item/screwdriver_head
	name = "Screwdriver head"
	icon = 'icons/obj/crafting.dmi'
	w_class = ITEM_SIZE_NORMAL
	desc = "This is the top of a screwdriver"
	icon_state = "screwdriver_head"

/obj/item/wrench_head
	name = "Top of a wrench"
	icon = 'icons/obj/crafting.dmi'
	w_class = ITEM_SIZE_NORMAL
	desc = "This is a top of a wrench."
	icon_state = "wrench_head"
	matter = list(DEFAULT_WALL_MATERIAL = 40)

/obj/item/glass_handle
	name = "Glass handle"
	icon = 'icons/obj/crafting.dmi'
	w_class = ITEM_SIZE_NORMAL
	desc = "This is a piece of glass.  It could be used as a handle"
	icon_state = "glass_handle"
	matter = list("glass" = 20)

/obj/item/cylinder
	var/chambers = 0
	name = "cylinder"
	icon = 'icons/obj/crafting.dmi'
	w_class = ITEM_SIZE_NORMAL
	desc = "This is a makeshift cylinder.  It has zero holes drilled into it"
	icon_state = "cylinder_0"
	matter = list(DEFAULT_WALL_MATERIAL = 25)

	mill(var/mob/user)
		switch(chambers)
			if(0)
				return /obj/item/cylinder/one_slot
			if(1)
				return /obj/item/cylinder/two_slot
			if(2)
				return /obj/item/cylinder/three_slot
			if(3)
				return /obj/item/cylinder/four_slot
			if(4)
				to_chat(usr, "<span class='notice'>You nick another hole, and the cylinder falls apart.</span>")
		return null

	press()
		return /obj/item/wrench_head

/obj/item/cylinder/one_slot
	chambers = 1
	icon_state = "cylinder_1"
	desc = "This is a makeshift cylinder.  It has one hole drilled into it"

/obj/item/cylinder/two_slot
	chambers = 2
	icon_state = "cylinder_2"
	desc = "This is a makeshift cylinder.  It has two holes drilled into it"

/obj/item/cylinder/three_slot
	chambers = 3
	icon_state = "cylinder_3"
	desc = "This is a makeshift cylinder.  It has three holes drilled into it"

/obj/item/cylinder/four_slot
	chambers = 4
	desc = "This is a makeshift cylinder.  It has four holes drilled into it"
	icon_state = "cylinder_4"

/obj/item/stock
	icon = 'icons/obj/crafting.dmi'
	w_class = ITEM_SIZE_NORMAL
	desc = "This is reciever."
	icon_state = "stock"

/obj/item/weapon/gun/projectile/revolver/zero_chamber
	max_shells = 0
	icon_state = "crafted_revolver"

/obj/item/weapon/gun/projectile/revolver/one_chamber
	max_shells = 1
	icon_state = "crafted_revolver"

/obj/item/weapon/gun/projectile/revolver/two_chamber
	max_shells = 2
	icon_state = "crafted_revolver"

/obj/item/weapon/gun/projectile/revolver/three_chamber
	max_shells = 3
	icon_state = "crafted_revolver"

/obj/item/weapon/gun/projectile/revolver/four_chamber
	max_shells = 4
	icon_state = "crafted_revolver"
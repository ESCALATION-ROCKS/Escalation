/*

Crafting parts storage. Basically, everything that can't really be used for purposes other than crafting goes here.


To do list:

*/


/obj/item/weapon/crafty
	name = "crafting frame"
	desc = "An unfinished frame of some kind."
	icon = 'icons/obj/ph_craft.dmi'
	icon_state = "crossbowframe"
	item_state = "syringe_kit"
	slot_flags = SLOT_BELT
	throwforce = 2
	w_class = 1.0
	throw_speed = 4
	throw_range = 10
	force = 1.0

	var/crafting_stage = 0

/obj/item/weapon/crafty/update_icon()
	icon_state = "[initial(icon_state)][crafting_stage]"


/obj/item/weapon/crafty/crossbowframe
	name = "crossbow frame"
	desc = "An unfinished crossbow frame."

/obj/item/weapon/crafty/zipgunframe
	name = "Zipgun frame"
	desc = "An unfinished handgun frame."
	icon_state = "zipframe"

/obj/item/weapon/crafty/rifleframe
	name = "Boomstick frame"
	desc = "An unfinished rifle frame."
	icon_state = "rifleframe"

/obj/item/weapon/crafty/craftgunframe
	name = "rifled barrel"
	desc = "A rifled barrel."
	icon_state = "hcgunframe"

/obj/item/weapon/crafty/knifeblade
	name = "stone blade"
	desc = "A sharpened rock, which can be used to craft various instruments."
	icon_state = "knifeblade"
	force = 2.0

/obj/item/weapon/crafty/nadeframe
	name = "grenade frame"
	desc = "An unfinished grenade frame."
	icon_state = "nadeframe"
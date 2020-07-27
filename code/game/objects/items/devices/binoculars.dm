/obj/item/device/binoculars

	name = "binoculars"
	desc = "A pair of binoculars."
	icon_state = "binoculars"

	flags = CONDUCT
	slot_flags = SLOT_BELT | SLOT_EARS
	force = 5.0
	w_class = ITEM_SIZE_SMALL
	throwforce = 5.0
	throw_range = 15
	throw_speed = 3


/obj/item/device/binoculars/proc/toggle_scope(mob/user, var/zoom_amount=14.0)
	var/zoom_offset = round(world.view * zoom_amount)
//	var/view_size = round(world.view + zoom_amount)

	zoom(user, zoom_offset, 9)

/obj/item/device/binoculars/attack_self(mob/user)
	toggle_scope(user, 4.0)//sniper rifles have 2.0 max

/obj/item/device/binoculars/wp
	name = "binoculars"
	desc = "A pair of binoculars."
	icon_state = "wp_bino"
	item_state = "wp_bino"

/obj/item/device/binoculars/wp/range
	name = "Rangefinder"
	desc = "A Rangefinder, used to find Latitude and Longitude."
	icon_state = "wp_bino"
	item_state = "wp_bino"

/obj/item/device/binoculars/nato
	name = "binoculars"
	desc = "A pair of binoculars."
	icon_state = "nato_bino"
	item_state = "nato_bino"

/obj/item/device/binoculars/nato/range
	name = "Rangefinder"
	desc = "A Rangefinder, used to find Latitude and Longitude."
	icon_state = "nato_bino"
	item_state = "nato_bino"
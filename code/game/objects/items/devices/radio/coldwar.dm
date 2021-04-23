var/global/list/army_channels_ph = list(
	null
)

/obj/item/device/radio/escalation
	icon = 'icons/obj/coldwar/radio.dmi'
	icon_state = "warpact_radio"
	item_state = "warpact_radio"
	flags = CONDUCT
	slot_flags = SLOT_BACK
	throw_speed = 2
	throw_range = 6
	w_class = ITEM_SIZE_HUGE

/obj/item/device/radio/escalation/New()
	..()
	internal_channels = army_channels_ph.Copy()

/obj/item/device/radio/escalation/warpac
	name = "R-105D headset"
	icon_state = "warpact_radio"
	item_state = "warpact_radio"
	frequency = 1545

/obj/item/device/radio/escalation/nato
	name = "AN/PRC-77 receiver"
	icon_state = "prc77-receiver"
	item_state = "prc77-receiver"
	frequency = 1256


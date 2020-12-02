/*
/datum/gear/mask
	slot = slot_mask
	sort_category = "Masks"
	category = /datum/gear/mask

/datum/gear/mask/tacticalmask
	display_name = "bandana selection"
	path = /obj/item/clothing/mask/tacticalmask

/datum/gear/mask/tacticalmask/New()
	..()
	var/bandanas = list()
	bandanas["tan bandana"] = /obj/item/clothing/mask/tacticalmask
	bandanas["green bandana"] = /obj/item/clothing/mask/tacticalmask/green
	bandanas["blue bandana"] = /obj/item/clothing/mask/tacticalmask/gray
	gear_tweaks += new/datum/gear_tweak/path(bandanas)

datum/gear/mask/balaclava
	display_name = "balaclava"
	path = obj/item/clothing/mask/balaclava
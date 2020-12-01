// Mask
 /datum/gear/head/bandana
	display_name = "bandana selection"
	path = /obj/item/clothing/mask/tacticalmask

/datum/gear/head/bandana/New()
	..()
	var/bandanas = list()
	bandanas["tan bandana"] = /obj/item/clothing/mask/tacticalmask
	bandanas["blue bandana"] = /obj/item/clothing/mask/tacticalmask/blue
	bandanas["green bandana"] = /obj/item/clothing/mask/tacticalmask/green
	gear_tweaks += new/datum/gear_tweak/path(bandanas)
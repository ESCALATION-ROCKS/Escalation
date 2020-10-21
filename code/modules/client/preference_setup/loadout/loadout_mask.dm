// Mask
/*

/datum/gear/mask
	display_name = "sterile mask"
	path = /obj/item/clothing/mask/surgical
	cost = 1
*/

/datum/gear/head/bandana
	display_name = "bandana selection"
	path = /obj/item/clothing/mask/bandana

/datum/gear/head/bandana/New()
	..()
	var/bandanas = list()
	bandanas["tan bandana"] = /obj/item/clothing/mask/bandana/tan
	bandanas["red bandana"] = /obj/item/clothing/mask/bandana/red
	bandanas["black bandana"] = /obj/item/clothing/mask/bandana
	gear_tweaks += new/datum/gear_tweak/path(bandanas)
// Mask
/*

/datum/gear/mask
	display_name = "sterile mask"
	path = /obj/item/clothing/mask/surgical
	cost = 1


/datum/gear/head/bandana
	display_name = "bandana selection"
	path = /obj/item/clothing

/datum/gear/head/bandana/New()
	..()
	var/glasses = list()
	glasses["tan bandana"] = /obj/item/clothing/mask/bandana/tan
	glasses["red bandana"] = /obj/item/clothing/mask/bandana/red
	glasses["black bandana"] = /obj/item/clothing/mask/bandana/
	gear_tweaks += new/datum/gear_tweak/path(glasses)
*/
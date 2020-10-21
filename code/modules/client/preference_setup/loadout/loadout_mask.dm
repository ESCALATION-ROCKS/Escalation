// Mask
/datum/gear/mask/tacticalmask
	display_name = "bandana selection"
	path = /obj/item/clothing/mask/tacticalmask

/datum/gear/head/tacticalmask/New()
	..()
	var/bandanas = list()
	bandanas["tan bandana"] = /obj/item/clothing/mask/tacticalmask
	bandanas["red bandana"] = /obj/item/clothing/mask/tacticalmask/red
	bandanas["green bandana"] = /obj/item/clothing/mask/tacticalmask/green
	bandanas["gray bandana"] = /obj/item/clothing/mask/tacticalmask/gray
	gear_tweaks += new/datum/gear_tweak/path(bandanas)
/*/datum/gear/eyes
	sort_category = "Glasses and Eyewear"
	category = /datum/gear/eyes
	slot = slot_glasses

/datum/gear/eyes/glasses
	display_name = "prescription glasses"
	path = /obj/item/clothing/glasses/regular

/datum/gear/eyes/glasses/hippie
	display_name = "Hippie glasses"
	path = /obj/item/clothing/glasses/hippie

/datum/gear/eyes/eyepatch
	display_name = "eyepatch"
	path = /obj/item/clothing/glasses/eyepatch

/datum/gear/eyes/fashionglasses
	display_name = "glasses"
	path = /obj/item/clothing/glasses

/datum/gear/eyes/fashionglasses/New()
	..()
	var/glasses = list()
	glasses["green glasses"] = /obj/item/clothing/glasses/gglasses
	glasses["glasses"] = /obj/item/clothing/glasses/regular/hipster
	gear_tweaks += new/datum/gear_tweak/path(glasses)

/datum/gear/eyes/shades/
	display_name = "sunglasses"
	path = /obj/item/clothing/glasses/sunglasses

/datum/gear/eyes/shades/big
	display_name = "shades"
	path = /obj/item/clothing/glasses/sunglasses/big*/
/*/datum/gear/clothing
	sort_category = "Clothing"
	category = /datum/gear/clothing

/datum/gear/clothing/gloves/leather
	display_name = "leather gloves"
	slot = slot_gloves
	path = /obj/item/clothing/gloves/bdw

/datum/gear/clothing/gloves/mittens
	display_name = "mittens"
	slot = slot_gloves
	path = /obj/item/clothing/gloves/mittens

/datum/gear/clothing/mask/tacticalmask
	display_name = "bandana selection"
	slot = slot_wear_mask
	path = /obj/item/clothing/mask/tacticalmask

/datum/gear/clothing/mask/tacticalmask/New()
	..()
	var/bandanas = list()
	bandanas["tan bandana"] = /obj/item/clothing/mask/tacticalmask
	bandanas["green bandana"] = /obj/item/clothing/mask/tacticalmask/green
	bandanas["blue bandana"] = /obj/item/clothing/mask/tacticalmask/blue
	gear_tweaks += new/datum/gear_tweak/path(bandanas)

/datum/gear/clothing/mask/balaclava
	display_name = "balaclava"
	slot = slot_wear_mask
	path = /obj/item/clothing/mask/balaclava

/datum/gear/clothing/hats/hbg
	display_name = "headband, green"
	slot = slot_head
	path = /obj/item/clothing/head/headband

/datum/gear/clothing/hats/hbr
	display_name = "headband, red"
	slot = slot_head
	path = 	/obj/item/clothing/head/headband/red*/
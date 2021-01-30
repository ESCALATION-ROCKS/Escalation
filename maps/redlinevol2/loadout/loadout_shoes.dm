// Shoelocker
/datum/gear/shoes
	display_name = "duty boots"
	path = /obj/item/clothing/shoes/dutyboots
	slot = slot_shoes
	sort_category = "Shoes and Footwear"
	cost = 2

/datum/gear/shoes/athletic
	display_name = "athletic shoes"
	path = /obj/item/clothing/shoes/athletic
	flags = GEAR_HAS_COLOR_SELECTION
	allowed_roles = CIVILIAN_ROLES

/datum/gear/shoes/boots
	display_name = "boot selection"
	path = /obj/item/clothing/shoes
	cost = 3

/datum/gear/shoes/boots/New()
	..()
	var/boots = list()
	boots["jackboots"] = /obj/item/clothing/shoes/jackboots
	boots["workboots"] = /obj/item/clothing/shoes/workboots
	boots["duty boots"] = /obj/item/clothing/shoes/dutyboots
	boots["jungle boots"] = /obj/item/clothing/shoes/jungleboots
	gear_tweaks += new/datum/gear_tweak/path(boots)

/datum/gear/shoes/color
	display_name = "shoe selection"
	path = /obj/item/clothing/shoes

/datum/gear/shoes/color/New()
	..()
	var/shoes = list()
	shoes["black shoes"] = /obj/item/clothing/shoes/black
	shoes["brown shoes"] = /obj/item/clothing/shoes/brown
	shoes["laceup shoes"] = /obj/item/clothing/shoes/laceup
	shoes["leather shoes"] = /obj/item/clothing/shoes/leather
	gear_tweaks += new/datum/gear_tweak/path(shoes)

/datum/gear/shoes/dress
	display_name = "dress shoes"
	path = /obj/item/clothing/shoes/dress
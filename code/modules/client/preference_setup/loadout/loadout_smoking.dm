
/datum/gear/matchbook
	display_name = "matchbook"
	path = /obj/item/weapon/storage/box/matches

/datum/gear/lighter
	display_name = "cheap lighter"
	path = /obj/item/weapon/flame/lighter

/datum/gear/zippo
	display_name = "zippo"
	path = /obj/item/weapon/flame/lighter/zippo

/datum/gear/cigarretes
	display_name = "Cigarrete Boxes"
	path = /obj/item/weapon/storage/fancy/cigarettes/luckystrikered

/datum/gear/cigarretes/New()
	..()
	var/cigarretes = list()
	cigarretes["Lucky Strike Red"] = /obj/item/weapon/storage/fancy/cigarettes/luckystrikered
	cigarretes["Lucky Strike Green"] = /obj/item/weapon/storage/fancy/cigarettes/luckystrikegreen
	cigarretes["Marlboro"] = /obj/item/weapon/storage/fancy/cigarettes/marlboro
	cigarretes["Prima"] = /obj/item/weapon/storage/fancy/cigarettes/prima
	cigarretes["Yava"] = /obj/item/weapon/storage/fancy/cigarettes/yava
	gear_tweaks += new/datum/gear_tweak/path(cigarretes)
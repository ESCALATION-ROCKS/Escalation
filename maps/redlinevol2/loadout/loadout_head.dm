/datum/gear/head
	path = /obj/item/clothing/head
	slot = slot_head
	sort_category = "Hats and Headwear"
	category = /datum/gear/head

/datum/gear/head/beret
	allowed_roles = CIVILIAN_ROLES
	display_name = "beret, colored"
	path = /obj/item/clothing/head/beret/plaincolor
	flags = GEAR_HAS_COLOR_SELECTION
	description = "A simple, solid color beret. This one has no emblems or insignia on it."

/datum/gear/head/bandana
	display_name = "bandana selection"
	path = /obj/item/clothing/head

/datum/gear/head/bandana/New()
	..()
	var/bandanas = list()
	bandanas["green bandana"] = /obj/item/clothing/head/greenbandana
	bandanas["orange bandana"] = /obj/item/clothing/head/orangebandana
	bandanas["pirate bandana"] = /obj/item/clothing/head/bandana
	gear_tweaks += new/datum/gear_tweak/path(bandanas)

/datum/gear/head/cap
	display_name = "cap selection"
	path = /obj/item/clothing/head
	allowed_roles = CIVILIAN_ROLES

/datum/gear/head/cap/New()
	..()
	var/caps = list()
	caps["black cap"] = /obj/item/clothing/head/soft/black
	caps["blue cap"] = /obj/item/clothing/head/soft/blue
	caps["flat cap"] = /obj/item/clothing/head/flatcap
	caps["green cap"] = /obj/item/clothing/head/soft/green
	caps["grey cap"] = /obj/item/clothing/head/soft/grey
	caps["orange cap"] = /obj/item/clothing/head/soft/orange
	caps["purple cap"] = /obj/item/clothing/head/soft/purple
	caps["red cap"] = /obj/item/clothing/head/soft/red
	caps["white cap"] = /obj/item/clothing/head/soft/mime
	caps["yellow cap"] = /obj/item/clothing/head/soft/yellow
	caps["major bill's shipping cap"] = /obj/item/clothing/head/soft/mbill
	gear_tweaks += new/datum/gear_tweak/path(caps)

/datum/gear/head/formalhat
	display_name = "formal hat selection"
	path = /obj/item/clothing/head
	allowed_roles = CIVILIAN_ROLES

/datum/gear/head/formalhat/New()
	..()
	var/formalhats = list()
	formalhats["boatsman hat"] = /obj/item/clothing/head/boaterhat
	formalhats["bowler hat"] = /obj/item/clothing/head/bowler
	formalhats["fedora"] = /obj/item/clothing/head/fedora //m'lady
	formalhats["feather trilby"] = /obj/item/clothing/head/feathertrilby
	formalhats["fez"] = /obj/item/clothing/head/fez
	formalhats["fedora, brown"] = /obj/item/clothing/head/det
	formalhats["fedora, grey"] = /obj/item/clothing/head/det/grey
	gear_tweaks += new/datum/gear_tweak/path(formalhats)

/datum/gear/head/informalhat
	display_name = "informal hat selection"
	path = /obj/item/clothing/head
	allowed_roles = CIVILIAN_ROLES

/datum/gear/head/informalhat/New()
	..()
	var/informalhats = list()
	informalhats["cowboy hat"] = /obj/item/clothing/head/cowboy_hat
	informalhats["ushanka"] = /obj/item/clothing/head/ushanka
	gear_tweaks += new/datum/gear_tweak/path(informalhats)

/datum/gear/head/hijab
	display_name = "hijab"
	path = /obj/item/clothing/head/hijab
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/kippa
	display_name = "kippa"
	path = /obj/item/clothing/head/kippa
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/turban
	display_name = "turban"
	path = /obj/item/clothing/head/turban
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/taqiyah
	display_name = "taqiyah"
	path = /obj/item/clothing/head/taqiyah
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/head/surgical
	display_name = "surgical cap"
	path = /obj/item/clothing/head/surgery
	allowed_roles = STERILE_ROLES

/datum/gear/head/surgical/New()
	..()
	var/capcolor = list()
	capcolor["black cap"] = /obj/item/clothing/head/surgery/black
	capcolor["blue cap"] = /obj/item/clothing/head/surgery/blue
	capcolor["green cap"] = /obj/item/clothing/head/surgery/green
	capcolor["navy blue cap"] = /obj/item/clothing/head/surgery/navyblue
	capcolor["purple cap"] = /obj/item/clothing/head/surgery/purple
	gear_tweaks += new/datum/gear_tweak/path(capcolor)
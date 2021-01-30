/datum/gear/accessory
	display_name = "locket"
	path = /obj/item/clothing/accessory/locket
	slot = slot_tie
	sort_category = "Accessories"

/datum/gear/accessory/vest
	display_name = "black vest"
	path = /obj/item/clothing/accessory/toggleable/vest
	allowed_roles = CIVILIAN_ROLES

/datum/gear/accessory/suspenders
	display_name = "suspenders"
	path = /obj/item/clothing/accessory/suspenders

/datum/gear/accessory/wcoat
	display_name = "waistcoat"
	path = /obj/item/clothing/accessory/wcoat
	allowed_roles = CIVILIAN_ROLES

/datum/gear/accessory/zhongshan
	display_name = "zhongshan jacket"
	path = /obj/item/clothing/accessory/toggleable/zhongshan
	allowed_roles = CIVILIAN_ROLES

/datum/gear/accessory/dashiki
	display_name = "dashiki selection"
	path = /obj/item/clothing/accessory/dashiki
	allowed_roles = CIVILIAN_ROLES

/datum/gear/accessory/thawb
	display_name = "thawb"
	path = /obj/item/clothing/accessory/thawb
	allowed_roles = CIVILIAN_ROLES

/datum/gear/accessory/sherwani
	display_name = "sherwani"
	path = /obj/item/clothing/accessory/sherwani
	allowed_roles = CIVILIAN_ROLES

/datum/gear/accessory/qipao
	display_name = "qipao blouse"
	path = /obj/item/clothing/accessory/qipao
	allowed_roles = CIVILIAN_ROLES
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/accessory/sweater
	display_name = "turtleneck sweater"
	path = /obj/item/clothing/accessory/sweater
	allowed_roles = CIVILIAN_ROLES
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/accessory/tangzhuang
	display_name = "tangzhuang jacket"
	path = /obj/item/clothing/accessory/tangzhuang
	allowed_roles = CIVILIAN_ROLES
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/accessory/necklace
	display_name = "necklace"
	path = /obj/item/clothing/accessory/necklace
	flags = GEAR_HAS_COLOR_SELECTION
	allowed_roles = CIVILIAN_ROLES

/datum/gear/accessory/bowtie/color
	display_name = "bowtie, colored"
	path = /obj/item/clothing/accessory/bowtie/color
	flags = GEAR_HAS_COLOR_SELECTION
	allowed_roles = CIVILIAN_ROLES


/datum/gear/accessory/wallet
	display_name = "wallet"
	path = /obj/item/weapon/storage/wallet
	flags = GEAR_HAS_COLOR_SELECTION
	cost = 2

/datum/gear/accessory/holster
	display_name = "holster selection"
	path = /obj/item/clothing/accessory/holster
	cost = 3
	allowed_roles = ARMED_ROLES
	flags = GEAR_HAS_TYPE_SELECTION

/datum/gear/accessory/tie
	display_name = "tie selection"
	path = /obj/item/clothing/accessory
	allowed_roles = CIVILIAN_ROLES

/datum/gear/accessory/tie/New()
	..()
	var/ties = list()
	ties["blue tie"] = /obj/item/clothing/accessory/blue
	ties["red tie"] = /obj/item/clothing/accessory/red
	ties["blue tie, clip"] = /obj/item/clothing/accessory/blue_clip
	ties["red long tie"] = /obj/item/clothing/accessory/red_long
	ties["black tie"] = /obj/item/clothing/accessory/black
	ties["yellow tie"] = /obj/item/clothing/accessory/yellow
	ties["navy tie"] = /obj/item/clothing/accessory/navy
	ties["brown tie"] = /obj/item/clothing/accessory/brown
	gear_tweaks += new/datum/gear_tweak/path(ties)
/datum/gear/accessory/stethoscope
	display_name = "stethoscope (medical)"
	path = /obj/item/clothing/accessory/stethoscope
	cost = 2
	allowed_roles = STERILE_ROLES

/datum/gear/accessory/brown_vest
	display_name = "webbing, brown"
	path = /obj/item/clothing/accessory/storage/brown_vest
	cost = 4

/datum/gear/accessory/black_vest
	display_name = "webbing, black"
	path = /obj/item/clothing/accessory/storage/black_vest
	cost = 4

/datum/gear/accessory/white_vest
	display_name = "webbing, white"
	path = /obj/item/clothing/accessory/storage/white_vest
	cost = 4

/datum/gear/accessory/brown_drop_pouches
	display_name = "drop pouches, brown"
	path = /obj/item/clothing/accessory/storage/drop_pouches/brown
	cost = 4

/datum/gear/accessory/black_drop_pouches
	display_name = "drop pouches, black"
	path = /obj/item/clothing/accessory/storage/drop_pouches/black
	cost = 4

/datum/gear/accessory/white_drop_pouches
	display_name = "drop pouches, white"
	path = /obj/item/clothing/accessory/storage/drop_pouches/white
	cost = 4

/datum/gear/accessory/webbing
	display_name = "webbing, simple"
	path = /obj/item/clothing/accessory/storage/webbing
	cost = 2

/datum/gear/accessory/webbing_large
	display_name = "webbing, large"
	path = /obj/item/clothing/accessory/storage/webbing_large
	cost = 3

/datum/gear/accessory/bandolier
	display_name = "bandolier"
	path = /obj/item/clothing/accessory/storage/bandolier
	cost = 4

/datum/gear/accessory/hawaii
	display_name = "hawaii shirt"
	path = /obj/item/clothing/accessory/toggleable/hawaii
	allowed_roles = CIVILIAN_ROLES

/datum/gear/accessory/hawaii/New()
	..()
	var/list/shirts = list()
	shirts["blue hawaii shirt"] = /obj/item/clothing/accessory/toggleable/hawaii
	shirts["red hawaii shirt"] = /obj/item/clothing/accessory/toggleable/hawaii/red
	shirts["random colored hawaii shirt"] = /obj/item/clothing/accessory/toggleable/hawaii/random
	gear_tweaks += new/datum/gear_tweak/path(shirts)

/datum/gear/accessory/scarf
	display_name = "scarf"
	path = /obj/item/clothing/accessory/scarf
	flags = GEAR_HAS_COLOR_SELECTION

/datum/gear/accessory/kneepads
	display_name = "kneepads"
	path = /obj/item/clothing/accessory/kneepads

/datum/gear/accessory/flannel
	display_name = "flannel (colorable)"
	path = /obj/item/clothing/accessory/toggleable/flannel
	slot = slot_tie
	flags = GEAR_HAS_COLOR_SELECTION
	sort_category = "Accessories"
	allowed_roles = CIVILIAN_ROLES
/obj/item/clothing/suit/armor/vest/coldwar
	wearable = 1
	armor_integrity_starting = 100

/obj/item/clothing/suit/storage/vest/coldwar
	wearable = 1
	armor_integrity_starting = 100

//Soviet armor
/obj/item/clothing/suit/storage/vest/coldwar/soviet
	w_class = ITEM_SIZE_LARGE
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	allowed = list(/obj/item/device/radio,/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/weapon/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs,/obj/item/weapon/gun/magnetic)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = UPPER_TORSO|LOWER_TORSO
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6

/obj/item/clothing/suit/storage/vest/coldwar/soviet/a6b3
	name = "6B3 armor vest"
	desc = "An uncommon armor vest with some pouches and titanium plates used by Soviet army."
	icon_state = "6b3green"
	item_state = "6b3green"
	armor = DEFAULT_ARMOR_NORMALBLOCK
	armor_fullblock = DEFAULT_ARMOR_FULLBLOCK
	sound_armor_damaged = ARMOR_DAMAGED_SOUNDS_METAL
	sound_armor_broke = ARMOR_BROKE_SOUNDS_METAL
	slowdown_general = 0.20

/obj/item/clothing/suit/storage/vest/coldwar/soviet/a6b3/New()
	..()
	pockets = new/obj/item/weapon/storage/internal/pockets(src, slots = 4, slot_size = 2)

/*
/obj/item/clothing/suit/storage/vest/coldwar/soviet/a6b2lifchik
	name = "6B2 vest w/ lifchik"
	desc = "An uncommon armor vest used by Soviet army. This one has a lifchik attached to it."
	icon_state = "6b2lifchik"
	item_state = "6b2lifchik"
	armor = DEFAULT_ARMOR_NORMALBLOCK
	armor_fullblock = DEFAULT_ARMOR_FULLBLOCK
	slowdown_general = 0.22

/obj/item/clothing/suit/storage/vest/coldwar/soviet/a6b2lifchik/New()
	..()
	pockets = new/obj/item/weapon/storage/internal/pockets(src, slots = 4, slot_size = 2)

/obj/item/clothing/suit/storage/vest/coldwar/soviet/a6b2lifchik/alt
	icon_state = "6b2lifchikalt"
	item_state = "6b2lifchikalt"

/obj/item/clothing/suit/storage/vest/coldwar/soviet/a6b2lifchik/alt/New()
	..()
	pockets = new/obj/item/weapon/storage/internal/pockets(src, slots = 2, slot_size = 3)
*/

/obj/item/clothing/suit/armor/vest/coldwar/a6b2
	name = "6B2 vest"
	desc = "An uncommon armor vest used by Soviet army."
	icon_state = "6b2green"
	item_state = "6b2green"
	w_class = ITEM_SIZE_LARGE
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	armor = DEFAULT_ARMOR_NORMALBLOCK
	armor_fullblock = DEFAULT_ARMOR_FULLBLOCK
	sound_armor_damaged = ARMOR_DAMAGED_SOUNDS_METAL
	sound_armor_broke = ARMOR_BROKE_SOUNDS_METAL
	possible_damage_states = 3
	slowdown_general = 0.20
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

//USMC
/obj/item/clothing/suit/armor/vest/coldwar/pasgt
	name = "PASGT M81 vest"
	desc = "A common kevlar vest used by U.S. army."
	icon_state = "pasgt_vest"
	item_state = "armor"
	w_class = ITEM_SIZE_LARGE
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	armor = DEFAULT_ARMOR_NORMALBLOCK
	armor_fullblock = DEFAULT_ARMOR_FULLBLOCK
	sound_armor_damaged = ARMOR_DAMAGED_SOUNDS_STANDARD
	sound_armor_broke = ARMOR_BROKE_SOUNDS_STANDARD
	slowdown_general = 0.20
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	possible_damage_states = 3

/obj/item/clothing/suit/armor/vest/coldwar/pasgt/woodland
	icon_state = "pasgt_vest_woodland"
	possible_damage_states = 3

/obj/item/clothing/suit/armor/vest/coldwar/flakvest
	name = "M69 flak vest"
	desc = "An outdated flak vest comonly used by Bundeswehr personnel."
	icon_state = "flakvest_nato"
	item_state = "armor"
	w_class = ITEM_SIZE_LARGE
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	armor = DEFAULT_ARMOR_NORMALBLOCK
	armor_fullblock = DEFAULT_ARMOR_FULLBLOCK
	sound_armor_damaged = ARMOR_DAMAGED_SOUNDS_STANDARD
	sound_armor_broke = ARMOR_BROKE_SOUNDS_STANDARD
	slowdown_general = 0.20
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	possible_damage_states = 3

/obj/item/clothing/suit/armor/vest/coldwar/heervest
	name = "KAZ03 flak vest"
	desc = "A flak vest used by Bundesheer personnel."
	icon_state = "flakvest_heer"
	item_state = "armor"
	w_class = ITEM_SIZE_LARGE
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	armor = DEFAULT_ARMOR_NORMALBLOCK
	armor_fullblock = DEFAULT_ARMOR_FULLBLOCK
	sound_armor_damaged = ARMOR_DAMAGED_SOUNDS_STANDARD
	sound_armor_broke = ARMOR_BROKE_SOUNDS_STANDARD
	slowdown_general = 0.20
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/suit/armor/vest/coldwar/coat
	allowed = list(/obj/item/device/radio,/obj/item/weapon/reagent_containers/spray/pepper,/obj/item/weapon/gun/projectile,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs,/obj/item/weapon/gun/magnetic)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	min_cold_protection_temperature = ARMOR_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	max_heat_protection_temperature = ARMOR_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6
	gender = NEUTER
	w_class = ITEM_SIZE_LARGE

/obj/item/clothing/suit/armor/vest/coldwar/coat/brit
	name = "british parka"
	desc = "A standard issue British Army winter coat."
	icon_state = "parkabrit"
	item_state = "parkabrit"
	/*down_icon_state = "parkabrit_t"*/
	/*down_icon_flags = BLOCKHAIR */
	/*down_body_parts_covered = HEAD*/
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 5, bio = 0, rad = 0)
	slowdown_general = 0.0
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)

/obj/item/clothing/suit/armor/vest/coldwar/coat/finn
	name = "finnish parka"
	desc = "A standard issue Finnish Army winter coat."
	icon_state = "parkafin"
	item_state = "parkafin"
	/*down_icon_state = "parkafin_t"*/
	/*down_icon_flags = BLOCKHAIR */
	/*down_body_parts_covered = HEAD*/
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 5, bio = 0, rad = 0)
	slowdown_general = 0.0
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)

/obj/item/clothing/suit/armor/vest/coldwar/coat/usa
	name = "us winter coat"
	desc = "A standard issue USMC winter coat."
	icon_state = "parkaus"
	item_state = "parkaus"
	/*down_icon_state = "parkaus_t"*/
	/*down_icon_flags = BLOCKHAIR */
	/*down_body_parts_covered = HEAD*/
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 5, bio = 0, rad = 0)
	slowdown_general = 0.0
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)

/obj/item/clothing/suit/armor/vest/coldwar/coat/bdw
	name = "bundeswehr parka"
	desc = "A standard issue Bundeswehr coat."
	icon_state = "parkabdw"
	item_state = "parkabdw"
	/*down_icon_state = "parkabdw_t"*/
	/*down_icon_flags = BLOCKHAIR */
	/*down_body_parts_covered = HEAD*/
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 5, bio = 0, rad = 0)
	slowdown_general = 0.0
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)

/obj/item/clothing/suit/armor/vest/coldwar/coat/fra
	name = "adt winter coat"
	desc = "A standard issue ADT winter coat."
	icon_state = "parkafra"
	item_state = "parkafra"
	/*down_icon_state = "parkaus_t"*/
	/*down_icon_flags = BLOCKHAIR */
	/*down_body_parts_covered = HEAD*/
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 5, bio = 0, rad = 0)
	slowdown_general = 0.0
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)

/obj/item/clothing/suit/armor/vest/coldwar/coat/bdwponcho
	name = "bundeswehr winter poncho"
	desc = "A standard issue Bundeswehr winter poncho."
	icon_state = "ponchobdw"
	item_state = "ponchobdw"
	/*down_icon_state = "ponchobdw_t"*/
	/*down_icon_flags = BLOCKHAIR */
	/*down_body_parts_covered = HEAD*/
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 5, bio = 0, rad = 0)
	slowdown_general = 0.0
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)

/obj/item/clothing/suit/armor/vest/coldwar/coat/nvaponcho
	name = "volksarmee zeltbahn poncho"
	desc = "A standard NVA zeltbahn pattern poncho."
	icon_state = "zeltbahn"
	item_state = "zeltbahn"
	/*down_icon_state = "zeltbahn_t"*/
	/*down_icon_flags = BLOCKHAIR */
	/*down_body_parts_covered = HEAD*/
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 5, bio = 0, rad = 0)
	slowdown_general = 0.0
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)

/obj/item/clothing/suit/armor/vest/coldwar/coat/nva
	name = "volksarmee winter parka"
	desc = "A standard issue parka, used during winter operations."
	icon_state = "ponchonva"
	item_state = "ponchonva"
	/*down_icon_state = "ponchonva_t"*/
	/*down_icon_flags = BLOCKHAIR */
	/*down_body_parts_covered = HEAD*/
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 5, bio = 0, rad = 0)
	slowdown_general = 0.0
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)

/obj/item/clothing/suit/armor/vest/coldwar/coat/sa
	name = "soviet coat"
	desc = "A standard issue Soviet Army winter coat."
	icon_state = "parkasa"
	item_state = "parkasa"
	/*down_icon_state = "parkafin_t"*/
	/*down_icon_flags = BLOCKHAIR */
	/*down_body_parts_covered = HEAD*/
	armor = list(melee = 5, bullet = 0, laser = 0, energy = 0, bomb = 5, bio = 0, rad = 0)
	slowdown_general = 0.0
	valid_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)
	restricted_accessory_slots = list(ACCESSORY_SLOT_ARMOR_S)

/obj/item/clothing/suit/armor/vest/coldwar/coat/sa/officer
	name = "soviet officer coat"
	desc = "An officer issue Soviet Army winter coat"
	icon_state = "parkasaofficer"
	item_state = "parkasaofficer"

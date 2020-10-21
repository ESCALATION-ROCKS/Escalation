//Pouches
/obj/item/clothing/accessory/storage/pouches
	name = "light storage pouches"
	desc = "A collection of black pouches that can be attached to a plate carrier. Carries up to two items."
	icon_override = 'icons/mob/modular_armor_new.dmi'
	icon = 'icons/obj/clothing/modular_armor.dmi'
	accessory_icons = list(slot_tie_str = 'icons/mob/modular_armor_new.dmi', slot_wear_suit_str = 'icons/mob/modular_armor_new.dmi')
	icon_state = "lpouches"
	gender = PLURAL
	slot = ACCESSORY_SLOT_ARMOR_S
	slots = 2
	armor_slowdown = 0.1

/obj/item/clothing/accessory/storage/pouches/navy
	desc = "A collection of navy blue pouches that can be attached to a plate carrier. Carries up to two items."
	icon_state = "lpouches_navy"

/obj/item/clothing/accessory/storage/pouches/green
	desc = "A collection of green pouches that can be attached to a plate carrier. Carries up to two items."
	icon_state = "lpouches_green"

/obj/item/clothing/accessory/storage/pouches/tan
	desc = "A collection of tan pouches that can be attached to a plate carrier. Carries up to two items."
	icon_state = "lpouches_tan"

/obj/item/clothing/accessory/storage/pouches/medium/
	name = "medium storage pouches"
	desc = "A collection of black pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "mpouches"
	slots = 4
	armor_slowdown = 0.3

/obj/item/clothing/accessory/storage/pouches/medium/navy
	desc = "A collection of navy blue pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "mpouches_navy"

/obj/item/clothing/accessory/storage/pouches/medium/green
	desc = "A collection of green pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "mpouches_green"

/obj/item/clothing/accessory/storage/pouches/medium/tan
	desc = "A collection of tan pouches that can be attached to a plate carrier. Carries up to four items."
	icon_state = "mpouches_tan"

/obj/item/clothing/accessory/storage/pouches/large
	name = "large storage pouches"
	desc = "A collection of black pouches that can be attached to a plate carrier. Carries up to six items."
	icon_state = "hpouches"
	slots = 6
	armor_slowdown = 0.5

/obj/item/clothing/accessory/storage/pouches/large/navy
	desc = "A collection of navy blue pouches that can be attached to a plate carrier. Carries up to six items."
	icon_state = "hpouches_navy"

/obj/item/clothing/accessory/storage/pouches/large/green
	desc = "A collection of green pouches that can be attached to a plate carrier. Carries up to six items."
	icon_state = "hpouches_green"

/obj/item/clothing/accessory/storage/pouches/large/tan
	desc = "A collection of tan pouches that can be attached to a plate carrier. Carries up to six items."
	icon_state = "hpouches_tan"

//Armor plates


/obj/item/clothing/accessory/armorplate
	desc = "A basic armor plate made."
	icon = 'icons/obj/clothing/modular_armor.dmi'
	body_parts_covered = UPPER_TORSO
	slot = ACCESSORY_SLOT_ARMOR_C
	var/fuckupchance = 0
	var/fuckedup = 0

/obj/item/clothing/accessory/armorplate/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(istype(damage_source, /obj/item/projectile/))
		if(prob(fuckupchance) && fuckedup == 0)
			src.overlays += "fuckedup"
			armor = list(melee = 5, bullet = 5, laser = 5, energy = 10, bomb = 10, bio = 0, rad = 0)
			playsound(loc, 'sound/effects/bhit_helmet-1.ogg', 50, 1)
			fuckedup = 1

/obj/item/clothing/accessory/armorplate/steel/
	name = "class II armsteel armor plate"
	desc = "A basic armor plate made of reinforced steel."
	icon_state = "steelplate_classii"
	armor = list(melee = 15, bullet = 15, laser = 20, energy = 10, bomb = 15, bio = 0, rad = 0)
	armor_slowdown = 0.3
	fuckupchance = 0.5
/obj/item/clothing/accessory/armorplate/steel/classiii
	name = "class III armsteel armor plate"
	icon_state = "steelplate_classiii"
	armor = list(melee = 25, bullet = 30, laser = 20, energy = 10, bomb = 25, bio = 0, rad = 0)
	armor_slowdown = 0.4

/obj/item/clothing/accessory/armorplate/steel/classiv
	name = "class IV armsteel armor plate"
	icon_state = "steelplate_classiv"
	armor = list(melee = 40, bullet = 40, laser = 20, energy = 10, bomb = 35, bio = 0, rad = 0)
	armor_slowdown = 0.5

/obj/item/clothing/accessory/armorplate/steel/classv
	name = "class V armsteel armor plate"
	icon_state = "steelplate_classv"
	armor = list(melee = 50, bullet = 50, laser = 20, energy = 10, bomb = 45, bio = 0, rad = 0)
	armor_slowdown = 0.6

/obj/item/clothing/accessory/armorplate/steel/classvi
	name = "class VI armsteel armor plate"
	icon_state = "steelplate_classvi"
	armor = list(melee = 55, bullet = 65, laser = 20, energy = 10, bomb = 55, bio = 0, rad = 0)
	armor_slowdown = 0.7

/obj/item/clothing/accessory/armorplate/ceramic
	name = "class IV ceramic armor plate"
	desc = "A basic armor plate made of ceramic."
	icon_state = "keraplate_classiv"
	armor = list(melee = 40, bullet = 40, laser = 20, energy = 10, bomb = 35, bio = 0, rad = 0)
	armor_slowdown = 0.2
	fuckupchance = 15

/obj/item/clothing/accessory/armorplate/ceramic/classv
	name = "class V ceramic armor plate"
	icon_state = "keraplate_classv"
	armor = list(melee = 50, bullet = 50, laser = 20, energy = 10, bomb = 45, bio = 0, rad = 0)
	armor_slowdown = 0.3

/obj/item/clothing/accessory/armorplate/ceramic/classvi
	name = "class VI ceramic armor plate"
	icon_state = "keraplate_classvi"
	armor = list(melee = 55, bullet = 65, laser = 20, energy = 10, bomb = 55, bio = 0, rad = 0)
	armor_slowdown = 0.3

/obj/item/clothing/accessory/armorplate/combinated
	name = "class III combinated armor plate"
	desc = "A basic combinated armor plate - half armsteel, half ceramic."
	icon_state = "combiplate_classiii"
	armor = list(melee = 25, bullet = 30, laser = 20, energy = 10, bomb = 25, bio = 0, rad = 0)
	armor_slowdown = 0.3
	fuckupchance = 7
/obj/item/clothing/accessory/armorplate/combinated/classiv
	name = "class IV combinated armor plate"
	icon_state = "combiplate_classiv"
	armor = list(melee = 40, bullet = 40, laser = 20, energy = 10, bomb = 35, bio = 0, rad = 0)
	armor_slowdown = 0.4

/obj/item/clothing/accessory/armorplate/combinated/classv
	name = "class V combinated armor plate"
	icon_state = "combiplate_classv"
	armor = list(melee = 50, bullet = 50, laser = 20, energy = 10, bomb = 45, bio = 0, rad = 0)
	armor_slowdown = 0.5

//Arm guards
/obj/item/clothing/accessory/armguards
	name = "arm guards"
	desc = "A pair of black arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_override = 'icons/mob/modular_armor_new.dmi'
	icon = 'icons/mob/modular_armor_new.dmi'
	accessory_icons = list(slot_tie_str = 'icons/mob/modular_armor_new.dmi', slot_wear_suit_str = 'icons/mob/modular_armor_new.dmi')
	icon_state = "larmguards"
	gender = PLURAL
	body_parts_covered = ARMS
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 25, bomb = 30, bio = 0, rad = 0)
	slot = ACCESSORY_SLOT_ARMOR_A
	armor_slowdown = 0.1


/obj/item/clothing/accessory/armguards/navy
	desc = "A pair of navy blue arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_state = "larmguards_navy"

/obj/item/clothing/accessory/armguards/green
	desc = "A pair of green arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_state = "larmguards_green"

/obj/item/clothing/accessory/armguards/tan
	desc = "A pair of tan arm pads reinforced with armor plating. Attaches to a plate carrier."
	icon_state = "larmguards_tan"

/obj/item/clothing/accessory/armguards/heavy
	name = "heavy arm guards"
	armor = list(melee = 40, bullet = 40, laser = 20, energy = 25, bomb = 30, bio = 0, rad = 0)
	icon_state = "harmguards"
	body_parts_covered = ARMS|HANDS
	armor_slowdown = 0.3

/obj/item/clothing/accessory/armguards/heavy/navy
	icon_state = "harmguards_navy"

/obj/item/clothing/accessory/armguards/heavy/green
	icon_state = "harmguards_green"

/obj/item/clothing/accessory/armguards/heavy/tan
	icon_state = "harmguards_tan"

//Leg guards
/obj/item/clothing/accessory/legguards
	name = "feet pads"
	desc = "A pair of armored leg pads in black. Attaches to a plate carrier."
	icon_override = 'icons/mob/modular_armor_new.dmi'
	icon = 'icons/mob/modular_armor_new.dmi'
	accessory_icons = list(slot_tie_str = 'icons/mob/modular_armor_new.dmi', slot_wear_suit_str = 'icons/mob/modular_armor_new.dmi')
	icon_state = "lfeetpads"
	gender = PLURAL
	body_parts_covered = LEGS
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 25, bomb = 30, bio = 0, rad = 0)
	slot = ACCESSORY_SLOT_ARMOR_L
	armor_slowdown = 0.2



/obj/item/clothing/accessory/legguards/navy
	desc = "A pair of armored leg pads in navy blue. Attaches to a plate carrier."
	icon_state = "lfeetpads_navy"

/obj/item/clothing/accessory/legguards/green
	desc = "A pair of armored leg pads in green. Attaches to a plate carrier."
	icon_state = "lfeetpads_green"

/obj/item/clothing/accessory/legguards/tan
	desc = "A pair of armored leg pads in tan. Attaches to a plate carrier."
	icon_state = "lfeetpads_tan"

/obj/item/clothing/accessory/legguards/heavy/
	name = "heavy leg guards"
	icon_state = "hfeetpads"
	armor = list(melee = 40, bullet = 40, laser = 20, energy = 25, bomb = 30, bio = 0, rad = 0)
	body_parts_covered = LEGS|FEET
	armor_slowdown = 0.5



/obj/item/clothing/accessory/legguards/heavy/navy
	icon_state = "hfeetpads_navy"

/obj/item/clothing/accessory/legguards/heavy/green
	icon_state = "hfeetpads_green"

/obj/item/clothing/accessory/legguards/heavy/tan
	icon_state = "hfeetpads_tan"

//neck guard

/obj/item/clothing/accessory/neckguard
	name = "neck guard"
	desc = "Just a protective neck pad."
	icon_override = 'icons/mob/modular_armor_new.dmi'
	icon = 'icons/mob/modular_armor_new.dmi'
	accessory_icons = list(slot_tie_str = 'icons/mob/modular_armor_new.dmi', slot_wear_suit_str = 'icons/mob/modular_armor_new.dmi')
	icon_state = "neckdef"
	gender = PLURAL
	body_parts_covered = HEAD|UPPER_TORSO
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0)
	slot = ACCESSORY_SLOT_ARMOR_N

/obj/item/clothing/accessory/neckguard/green
	icon_state = "neckdef_green"

/obj/item/clothing/accessory/neckguard/tan
	icon_state = "neckdef_tan"

/obj/item/clothing/accessory/neckguard/navy
	icon_state = "neckdef_navy"

/obj/item/clothing/accessory/groinplate
	name = "groin plate"
	desc = "Just a protective groin plate."
	icon_override = 'icons/mob/modular_armor_new.dmi'
	icon = 'icons/mob/modular_armor_new.dmi'
	accessory_icons = list(slot_tie_str = 'icons/mob/modular_armor_new.dmi', slot_wear_suit_str = 'icons/mob/modular_armor_new.dmi')
	icon_state = "groinplate"
	gender = PLURAL
	body_parts_covered = LOWER_TORSO
	armor = list(melee = 30, bullet = 30, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0)
	slot = ACCESSORY_SLOT_ARMOR_G
	armor_slowdown = 0.2


/obj/item/clothing/accessory/groinplate/green
	icon_state = "groinplate_green"

/obj/item/clothing/accessory/groinplate/tan
	icon_state = "groinplate_tan"

/obj/item/clothing/accessory/groinplate/navy
	icon_state = "groinplate_navy"

//Decorative attachments
/obj/item/clothing/accessory/armor/tag
	name = "\improper SCG Flag"
	desc = "An emblem depicting the Sol Central Government's flag."
	icon_override = 'icons/mob/modular_armor_new.dmi'
	icon = 'icons/obj/clothing/modular_armor.dmi'
	accessory_icons = list(slot_tie_str = 'icons/mob/modular_armor_new.dmi', slot_wear_suit_str = 'icons/mob/modular_armor_new.dmi')
	icon_state = "solflag"
	slot = ACCESSORY_SLOT_ARMOR_M

/obj/item/clothing/accessory/armor/tag/ec
	name = "\improper Expeditionary Corps crest"
	desc = "An emblem depicting the crest of the SCG Expeditionary Corps."
	icon_state = "ecflag"

/obj/item/clothing/accessory/armor/tag/sec
	name = "\improper POLICE tag"
	desc = "An armor tag with the word POLICE printed in silver lettering on it."
	icon_state = "sectag"

/obj/item/clothing/accessory/armor/tag/com
	name = "\improper SCG tag"
	desc = "An armor tag with the words SOL CENTRAL GOVERNMENT printed in gold lettering on it."
	icon_state = "comtag"

/obj/item/clothing/accessory/armor/tag/nt
	name = "\improper CORPORATE SECURITY tag"
	desc = "An armor tag with the words CORPORATE SECURITY printed in red lettering on it."
	icon_state = "nanotag"

/obj/item/clothing/accessory/armor/tag/pcrc
	name = "\improper PCRC tag"
	desc = "An armor tag with the words PROXIMA CENTAURI RISK CONTROL printed in cyan lettering on it."
	icon_state = "pcrctag"

/obj/item/clothing/accessory/armor/tag/saare
	name = "\improper SAARE tag"
	desc = "An armor tag with the acronym SAARE printed in olive-green lettering on it."
	icon_state = "saaretag"

/obj/item/clothing/accessory/armor/tag/opos
	name = "\improper O+ blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as O POSITIVE."
	icon_state = "opostag"

/obj/item/clothing/accessory/armor/tag/oneg
	name = "\improper O- blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as O NEGATIVE."
	icon_state = "onegtag"

/obj/item/clothing/accessory/armor/tag/apos
	name = "\improper A+ blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as A POSITIVE."
	icon_state = "apostag"

/obj/item/clothing/accessory/armor/tag/aneg
	name = "\improper A- blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as A NEGATIVE."
	icon_state = "anegtag"

/obj/item/clothing/accessory/armor/tag/bpos
	name = "\improper B+ blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as B POSITIVE."
	icon_state = "bpostag"

/obj/item/clothing/accessory/armor/tag/bneg
	name = "\improper B- blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as B NEGATIVE."
	icon_state = "bnegtag"

/obj/item/clothing/accessory/armor/tag/abpos
	name = "\improper AB+ blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as AB POSITIVE."
	icon_state = "abpostag"

/obj/item/clothing/accessory/armor/tag/abneg
	name = "\improper AB- blood patch"
	desc = "An embroidered patch indicating the wearer's blood type as AB NEGATIVE."
	icon_state = "abnegtag"

/obj/item/clothing/accessory/armor/helmcover
	name = "helmet cover"
	desc = "A fabric cover for armored helmets."
	icon_override = 'icons/mob/modular_armor_new.dmi'
	icon = 'icons/obj/clothing/modular_armor.dmi'
	accessory_icons = list(slot_tie_str = 'icons/mob/modular_armor_new.dmi', slot_head_str = 'icons/mob/modular_armor_new.dmi')
	icon_state = "null"
	slot = ACCESSORY_SLOT_HELM_C

/obj/item/clothing/accessory/armor/helmcover/blue
	name = "blue helmet cover"
	desc = "A fabric cover for armored helmets in a bright blue color."
	icon_state = "helmcover_blue"

/obj/item/clothing/accessory/armor/helmcover/navy
	name = "navy blue helmet cover"
	desc = "A fabric cover for armored helmets. This one is colored navy blue."
	icon_state = "helmcover_navy"

/obj/item/clothing/accessory/armor/helmcover/green
	name = "green helmet cover"
	desc = "A fabric cover for armored helmets. This one has a woodland camouflage pattern."
	icon_state = "helmcover_green"

/obj/item/clothing/accessory/armor/helmcover/tan
	name = "tan helmet cover"
	desc = "A fabric cover for armored helmets. This one has a desert camouflage pattern."
	icon_state = "helmcover_tan"

/obj/item/clothing/accessory/armor/helmcover/nt
	name = "\improper NanoTrasen helmet cover"
	desc = "A fabric cover for armored helmets. This one has NanoTrasen's colors."
	icon_state = "helmcover_nt"

/obj/item/clothing/accessory/armor/helmcover/pcrc
	name = "\improper PCRC helmet cover"
	desc = "A fabric cover for armored helmets. This one is colored navy blue and has a tag in the back with the words PROXIMA CENTAURI RISK CONTROL printed in cyan lettering on it."
	icon_state = "helmcover_pcrc"

/obj/item/clothing/accessory/armor/helmcover/saare
	name = "\improper SAARE helmet cover"
	desc = "A fabric cover for armored helmets. This one has SAARE's colors."
	icon_state = "helmcover_saare"
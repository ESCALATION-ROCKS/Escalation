/obj/item/weapon/storage/backpack/soviet_tabletbag
	name = "tablet bag"
	desc = "A leather tablet bag used by Warsaw Pact officers and other command staff."
	icon_state = "sa_officer_satchel"
	item_state = "sa_officer_satchel"
	reachable = 1
	max_storage_space = 6
	slot_flags = SLOT_BACK
	open_delay = 5

/obj/item/weapon/storage/backpack/bundes_med
	name = "medical bag"
	desc = "A leather tablet bag used by Bundeswehr medical personnel."
	icon_state = "bundes_med"
	item_state = "bundes_med"
	reachable = 1
	max_storage_space = 24
	open_delay = 5
	slot_flags = SLOT_BACK
	startswith = list(
			/obj/item/weapon/reagent_containers/glass/bottle/morphine,
			/obj/item/weapon/reagent_containers/glass/bottle/salbutamol,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocaproic,
			/obj/item/stack/medical/splint = 1,
			/obj/item/stack/medical/ointment/nato = 1,
			/obj/item/weapon/storage/fancy/syringe
			)
	can_hold = list(
			/obj/item/weapon/storage/box/pill_box,
			/obj/item/weapon/ampoule_pack,
			/obj/item/weapon/storage/box/ampoule_box,
			/obj/item/weapon/pill_pack,
			/obj/item/weapon/gauze_pack,
			/obj/item/stack/medical,
			/obj/item/stack/medical/tourniquet,
			/obj/item/weapon/reagent_containers/syringe,
			/obj/item/weapon/storage/fancy/syringe,
			/obj/item/weapon/reagent_containers/syrette,
			/obj/item/weapon/reagent_containers/glass/bottle,
			/obj/item/weapon/reagent_containers/pill,
			)

/obj/item/weapon/storage/backpack/bundes_surg
	name = "surgeon's bag"
	desc = "A leather tablet bag used by Bundeswehr surgeons."
	icon_state = "bundes_med"
	item_state = "bundes_med"
	reachable = 1
	max_storage_space = 24
	open_delay = 5
	slot_flags = SLOT_BACK
	startswith = list(
			/obj/item/weapon/storage/box/ampoule_box/thiopental,
			/obj/item/weapon/storage/box/ampoule_box/angiotensin,
			/obj/item/weapon/storage/box/ampoule_box/epinephrine,
			/obj/item/weapon/reagent_containers/glass/bottle/morphine,
			/obj/item/weapon/reagent_containers/glass/bottle/salbutamol,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocaproic,
			/obj/item/weapon/storage/fancy/syringe
			)
	can_hold = list(
			/obj/item/weapon/storage/box/pill_box,
			/obj/item/weapon/storage/box/ampoule_box,
			/obj/item/weapon/ampoule_pack,
			/obj/item/weapon/pill_pack,
			/obj/item/weapon/gauze_pack,
			/obj/item/stack/medical,
			/obj/item/stack/medical/tourniquet,
			/obj/item/weapon/reagent_containers/syringe,
			/obj/item/weapon/storage/fancy/syringe,
			/obj/item/weapon/reagent_containers/syrette,
			/obj/item/weapon/reagent_containers/glass/bottle,
			/obj/item/weapon/reagent_containers/pill,
			)

/obj/item/weapon/storage/backpack/heer_med
	name = "medical bag"
	desc = "A leather tablet bag used by Bundesheer medical personnel."
	icon_state = "bundes_med"
	item_state = "bundes_med"
	reachable = 1
	max_storage_space = 24
	open_delay = 5
	slot_flags = SLOT_BACK
	startswith = list(
			/obj/item/weapon/reagent_containers/glass/bottle/morphine,
			/obj/item/weapon/reagent_containers/glass/bottle/salbutamol,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocaproic,
			/obj/item/stack/medical/splint = 1,
			/obj/item/stack/medical/ointment/nato = 1,
			/obj/item/weapon/storage/fancy/syringe
			)
	can_hold = list(
			/obj/item/weapon/storage/box/pill_box,
			/obj/item/weapon/ampoule_pack,
			/obj/item/weapon/storage/box/ampoule_box,
			/obj/item/weapon/pill_pack,
			/obj/item/weapon/gauze_pack,
			/obj/item/stack/medical,
			/obj/item/stack/medical/tourniquet,
			/obj/item/weapon/reagent_containers/syringe,
			/obj/item/weapon/storage/fancy/syringe,
			/obj/item/weapon/reagent_containers/syrette,
			/obj/item/weapon/reagent_containers/glass/bottle,
			/obj/item/weapon/reagent_containers/pill,
			)

/obj/item/weapon/storage/backpack/heer_surg
	name = "surgeon's bag"
	desc = "A leather tablet bag used by Bundesheer surgeons."
	icon_state = "bundes_med"
	item_state = "bundes_med"
	reachable = 1
	max_storage_space = 24
	open_delay = 5
	slot_flags = SLOT_BACK
	startswith = list(
			/obj/item/weapon/storage/box/ampoule_box/thiopental,
			/obj/item/weapon/storage/box/ampoule_box/angiotensin,
			/obj/item/weapon/storage/box/ampoule_box/epinephrine,
			/obj/item/weapon/reagent_containers/glass/bottle/morphine,
			/obj/item/weapon/reagent_containers/glass/bottle/salbutamol,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocaproic,
			/obj/item/weapon/storage/fancy/syringe
			)
	can_hold = list(
			/obj/item/weapon/storage/box/pill_box,
			/obj/item/weapon/storage/box/ampoule_box,
			/obj/item/weapon/ampoule_pack,
			/obj/item/weapon/pill_pack,
			/obj/item/weapon/gauze_pack,
			/obj/item/stack/medical,
			/obj/item/stack/medical/tourniquet,
			/obj/item/weapon/reagent_containers/syringe,
			/obj/item/weapon/storage/fancy/syringe,
			/obj/item/weapon/reagent_containers/syrette,
			/obj/item/weapon/reagent_containers/glass/bottle,
			/obj/item/weapon/reagent_containers/pill,
			)

/obj/item/weapon/storage/backpack/bundes_buttpack
	name = "BDW field pack"
	desc = "A sturdy field pack used by Bundeswehr."
	icon_state = "bundes_buttpack"
	item_state = "bundes_buttpack"
	reachable = 1
	open_delay = 10
	max_storage_space = 6
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK

/obj/item/weapon/storage/backpack/heer_buttpack
	name = "BDH field pack"
	desc = "A sturdy field pack used by Bundesheer."
	icon_state = "heer_buttpack"
	item_state = "heer_buttpack"
	reachable = 1
	open_delay = 10
	max_storage_space = 6
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK

/obj/item/weapon/storage/backpack/fra_buttpack
	name = "ADT field pack"
	desc = "A sturdy field pack used by Bundesheer."
	icon_state = "heer_buttpack"
	item_state = "heer_buttpack"
	reachable = 1
	open_delay = 10
	max_storage_space = 6
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK

/obj/item/weapon/storage/backpack/bundes_utilitypouch
	name = "BDW utility pouch"
	desc = "Has enough space to hold a few items"
	icon_state = "bdw_utility"
	item_state = "bdw_utility"
	reachable = 1
	open_delay = 5
	max_storage_space = 4
	slot_flags = SLOT_LPOUCH | SLOT_RPOUCH
	use_sound = 'sound/items/interactions/natopouchopen.wav'
	close_sound = 'sound/items/interactions/natopouchclose.wav'

/obj/item/weapon/storage/backpack/usmc_buttpack
	name = "US field pack"
	desc = "A sturdy field pack used by U.S. army. Also referred as butt pack"
	icon_state = "usmc_buttpack"
	item_state = "usmc_buttpack"
	reachable = 1
	open_delay = 10
	max_storage_space = 6
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK

/obj/item/weapon/storage/backpack/usmcm3/surgeon
	name = "M3 surgeon satchel"
	desc = "A sturdy Vietnam era satchel used by U.S. surgeons."
	icon_state = "m3pack"
	item_state = "m3pack"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	max_storage_space = 24
	reachable = 1
	open_delay = 5
	slot_flags = SLOT_BACK
	startswith = list(
			/obj/item/weapon/storage/box/ampoule_box/thiopental,
			/obj/item/weapon/storage/box/ampoule_box/angiotensin,
			/obj/item/weapon/storage/box/ampoule_box/epinephrine,
			/obj/item/weapon/reagent_containers/glass/bottle/morphine,
			/obj/item/weapon/reagent_containers/glass/bottle/salbutamol,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocaproic,
			/obj/item/weapon/storage/fancy/syringe
			)
	can_hold = list(
			/obj/item/weapon/storage/box/pill_box,
			/obj/item/weapon/storage/box/ampoule_box,
			/obj/item/weapon/ampoule_pack,
			/obj/item/weapon/pill_pack,
			/obj/item/weapon/gauze_pack,
			/obj/item/stack/medical,
			/obj/item/stack/medical/tourniquet,
			/obj/item/weapon/reagent_containers/syringe,
			/obj/item/weapon/storage/fancy/syringe,
			/obj/item/weapon/reagent_containers/syrette,
			/obj/item/weapon/reagent_containers/glass/bottle,
			/obj/item/weapon/reagent_containers/pill,
			)

/obj/item/weapon/storage/backpack/usmc_buttpack/med
	name = "US medical pack"
	desc = "A sturdy field pack used by U.S. army. Also referred as butt pack. This one has a red cross on it."
	icon_state = "usmc_med"
	item_state = "usmc_med"
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	max_storage_space = 24
	reachable = 1
	open_delay = 5
	slot_flags = SLOT_BACK
	startswith = list(
			/obj/item/weapon/reagent_containers/glass/bottle/morphine,
			/obj/item/weapon/reagent_containers/glass/bottle/salbutamol,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocaproic,
			/obj/item/stack/medical/splint = 1,
			/obj/item/stack/medical/ointment/nato = 1,
			/obj/item/weapon/storage/fancy/syringe
			)
	can_hold = list(
			/obj/item/weapon/storage/box/pill_box,
			/obj/item/weapon/ampoule_pack,
			/obj/item/weapon/storage/box/ampoule_box,
			/obj/item/weapon/pill_pack,
			/obj/item/weapon/gauze_pack,
			/obj/item/stack/medical,
			/obj/item/stack/medical/tourniquet,
			/obj/item/weapon/reagent_containers/syringe,
			/obj/item/weapon/storage/fancy/syringe,
			/obj/item/weapon/reagent_containers/syrette,
			/obj/item/weapon/reagent_containers/glass/bottle,
			/obj/item/weapon/reagent_containers/pill,
			)

/obj/item/weapon/storage/backpack/usmcm3
	name = "M3 medical pack"
	desc = "A sturdy Vietnam era satchel used by medical personnel in U.S. armed forces."
	icon_state = "m3pack"
	item_state = "m3pack"
	slot_flags = SLOT_BACK
	reachable = 1
	max_storage_space = 24
	open_delay = 5
	slot_flags = SLOT_BACK
	startswith = list(
			/obj/item/weapon/reagent_containers/glass/bottle/morphine,
			/obj/item/weapon/reagent_containers/glass/bottle/salbutamol,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocaproic,
			/obj/item/stack/medical/splint = 1,
			/obj/item/stack/medical/ointment/nato = 1,
			/obj/item/weapon/storage/fancy/syringe
			)
	can_hold = list(
			/obj/item/weapon/storage/box/pill_box,
			/obj/item/weapon/ampoule_pack,
			/obj/item/weapon/storage/box/ampoule_box,
			/obj/item/weapon/pill_pack,
			/obj/item/weapon/gauze_pack,
			/obj/item/stack/medical,
			/obj/item/stack/medical/tourniquet,
			/obj/item/weapon/reagent_containers/syringe,
			/obj/item/weapon/storage/fancy/syringe,
			/obj/item/weapon/reagent_containers/syrette,
			/obj/item/weapon/reagent_containers/glass/bottle,
			/obj/item/weapon/reagent_containers/pill,
			)

/obj/item/weapon/storage/backpack/sakitbag
	name = "soviet kit bag"
	desc = "A tarp folded carefully to resemble a bag. Used widely by Soviet forces."
	icon_state = "sovietpack"
	item_state = "sovietkitpack"
	slot_flags = SLOT_BACK
	reachable = 0
	max_storage_space = 12
	open_delay = 5

/obj/item/weapon/storage/backpack/sakitbag/New()
	..()
	slowdown_per_slot[slot_back] = 0.03

/obj/item/weapon/storage/backpack/sakitbag/nvaddr
	name = "strichtarn kit bag"
	desc = "A tarp folded carefully to resemble a bag. Used widely by DDR forces."
	icon_state = "nvapack"
	item_state = "nvakitpack"

/obj/item/weapon/storage/backpack/sakitbag/csla
	name = "canvas kit bag"
	desc = "A canvas bag used widely by CSLA forces."
	icon_state = "cslapack"
	item_state = "cslakitpack"

/obj/item/weapon/storage/backpack/sakitbag/esp
	name = "canvas kit bag"
	desc = "A canvas bag used widely by ERE forces."
	icon_state = "esppack"
	item_state = "espkitpack"

/obj/item/weapon/storage/backpack/summedsan
	name = "sanitar's bag"
	desc = "That's the 'Sumka Meditsinskaya Sanitarnaya', a medical bag commonly used by Warsaw Pact."
	icon_state = "summedsan"
	item_state = "summedsan"
	reachable = 1
	max_storage_space = 24
	open_delay = 5
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK
	startswith = list(
			/obj/item/weapon/reagent_containers/glass/bottle/morphine,
			/obj/item/weapon/reagent_containers/glass/bottle/salbutamol,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocaproic,
			/obj/item/stack/medical/splint = 1,
			/obj/item/stack/medical/ointment/soviet = 1,
			/obj/item/weapon/storage/fancy/syringe
			)
	can_hold = list(
			/obj/item/weapon/storage/box/pill_box,
			/obj/item/weapon/storage/box/ampoule_box,
			/obj/item/weapon/ampoule_pack,
			/obj/item/weapon/pill_pack,
			/obj/item/weapon/gauze_pack,
			/obj/item/stack/medical,
			/obj/item/stack/medical/tourniquet,
			/obj/item/weapon/reagent_containers/syringe,
			/obj/item/weapon/storage/fancy/syringe,
			/obj/item/weapon/reagent_containers/syrette,
			/obj/item/weapon/reagent_containers/glass/bottle,
			/obj/item/weapon/reagent_containers/pill,
			)

/obj/item/weapon/storage/backpack/wp_surg
	name = "surgeon's bag"
	desc = "A medical bag used by Warsaw Pact surgeons."
	icon_state = "summedsan"
	item_state = "summedsan"
	reachable = 1
	max_storage_space = 24
	open_delay = 5
	slot_flags = SLOT_BACK
	startswith = list(
			/obj/item/weapon/storage/box/ampoule_box/thiopental,
			/obj/item/weapon/storage/box/ampoule_box/angiotensin,
			/obj/item/weapon/storage/box/ampoule_box/epinephrine,
			/obj/item/weapon/reagent_containers/glass/bottle/morphine,
			/obj/item/weapon/reagent_containers/glass/bottle/salbutamol,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocaproic,
			/obj/item/weapon/storage/fancy/syringe
			)
	can_hold = list(
			/obj/item/weapon/storage/box/pill_box,
			/obj/item/weapon/storage/box/ampoule_box,
			/obj/item/weapon/ampoule_pack,
			/obj/item/weapon/pill_pack,
			/obj/item/weapon/gauze_pack,
			/obj/item/stack/medical,
			/obj/item/stack/medical/tourniquet,
			/obj/item/weapon/reagent_containers/syringe,
			/obj/item/weapon/storage/fancy/syringe,
			/obj/item/weapon/reagent_containers/syrette,
			/obj/item/weapon/reagent_containers/glass/bottle,
			/obj/item/weapon/reagent_containers/pill,
			)

/obj/item/weapon/storage/backpack/gassoviet
	name = "gas mask satchel"
	desc = "That's a canvas gas mask satchel used by the Soviet Army."
	icon_state = "sovietgaspouch"
	item_state = "sovietgaspouch"
	reachable = 1
	max_storage_space = 6
	open_delay = 10
	slot_flags = SLOT_GUN_SLOT | SLOT_BACK

/obj/item/weapon/storage/backpack/gassoviet/csla
	desc = "That's a canvas gas mask satchel used by the CSLA."
	icon_state = "cslagaspouch"

/obj/item/weapon/storage/backpack/gassoviet/nva
	desc = "That's a canvas gas mask satchel used by the NVA DDR."
	icon_state = "nvagaspouch"
	item_state = "nvagaspouch"

/obj/item/weapon/storage/backpack/gassoviet/esp
	desc = "That's a canvas gas mask satchel used by the ERE."
	icon_state = "espgaspouch"
	item_state = "espgaspouch"


/obj/item/weapon/storage/backpack/alice/medium
	name = "ALICE medium pack"
	desc = "Commonly used by USMC."
	icon_state = "alicemediumpack"
	item_state = "alicemediumpack"
	slot_flags = SLOT_BACK
	reachable = 0
	max_storage_space = 12
	open_delay = 5

/obj/item/weapon/storage/backpack/alice/medium/New()
	..()
	slowdown_per_slot[slot_back] = 0.03

/obj/item/weapon/storage/backpack/alice/heer
	name = "KAZ03 rucksack"
	desc = "Commonly used by the Bundesheer."
	icon_state = "heermediumpack"
	item_state = "heermediumpack"
	slot_flags = SLOT_BACK
	reachable = 0
	max_storage_space = 12
	open_delay = 5

/obj/item/weapon/storage/backpack/alice/heer/New()
	..()
	slowdown_per_slot[slot_back] = 0.03

/obj/item/weapon/storage/backpack/alice/large
	name = "ALICE large pack"
	desc = "Commonly used by USMC."
	icon_state = "alicelargepack"
	item_state = "alicelargepack"
	slot_flags = SLOT_BACK
	reachable = 0
	max_storage_space = 16
	open_delay = 5


/obj/item/weapon/storage/backpack/alice/large/New()
	..()
	slowdown_per_slot[slot_back] = 0.03

/obj/item/weapon/storage/backpack/alice/fra
	name = "ADT rucksack"
	desc = "Commonly used by the ADT."
	icon_state = "heermediumpack"
	item_state = "heermediumpack"
	slot_flags = SLOT_BACK
	reachable = 0
	max_storage_space = 12
	open_delay = 5

/obj/item/weapon/storage/backpack/alice/fra/New()
	..()
	slowdown_per_slot[slot_back] = 0.03


//finnish

/obj/item/weapon/storage/backpack/finn/finn_buttpack
	name = "utility pack"
	desc = "A sturdy utility pack standard issue in the Finnish Militaria. Also referred as butt pack"
	icon_state = "finn_buttpack"
	item_state = "finn_buttpack"
	reachable = 1
	open_delay = 10
	max_storage_space = 6
	slot_flags = SLOT_BACK

/obj/item/weapon/storage/backpack/finn/finn_backpack
	name = "Field Backpack"
	desc = "Contains everything recquired for an outdoor excursion, commonly used by the Finnish."
	icon_state = "finn_backpack"
	item_state = "finn_backpack"
	reachable = 0
	max_storage_space = 12
	open_delay = 5

/obj/item/weapon/storage/backpack/finn/medical
	name = "medical bag"
	desc = "Leather Medical Backpack common in Warpact Armies."
	icon_state = "summedsan"
	item_state = "summedsan"
	reachable = 1
	max_storage_space = 24
	open_delay = 5
	slot_flags = SLOT_BACK
	startswith = list(
			/obj/item/weapon/reagent_containers/glass/bottle/morphine,
			/obj/item/weapon/reagent_containers/glass/bottle/salbutamol,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocaproic,
			/obj/item/stack/medical/splint = 1,
			/obj/item/stack/medical/ointment/soviet = 1,
			/obj/item/weapon/storage/fancy/syringe
			)
	can_hold = list(
			/obj/item/weapon/storage/box/pill_box,
			/obj/item/weapon/storage/box/ampoule_box,
			/obj/item/weapon/ampoule_pack,
			/obj/item/weapon/pill_pack,
			/obj/item/weapon/gauze_pack,
			/obj/item/stack/medical,
			/obj/item/stack/medical/tourniquet,
			/obj/item/weapon/reagent_containers/syringe,
			/obj/item/weapon/storage/fancy/syringe,
			/obj/item/weapon/reagent_containers/syrette,
			/obj/item/weapon/reagent_containers/glass/bottle,
			/obj/item/weapon/reagent_containers/pill,
			)

//bri ish

/obj/item/weapon/storage/backpack/baf_buttpack
	name = "BAF field pack"
	desc = "A sturdy field pack standard issue in the British Armed Forces. Also referred as butt pack"
	icon_state = "baf_buttpack"
	item_state = "baf_buttpack"
	reachable = 1
	open_delay = 10
	max_storage_space = 6
	slot_flags = SLOT_BACK

/obj/item/weapon/storage/backpack/baf_utilitypouch
	name = "BAF utility pouch"
	desc = "Has enough space to hold a few items"
	icon_state = "baf_utility"
	item_state = "baf_utility"
	reachable = 1
	open_delay = 5
	max_storage_space = 4
	slot_flags = SLOT_LPOUCH | SLOT_RPOUCH
	use_sound = 'sound/items/interactions/natopouchopen.wav'
	close_sound = 'sound/items/interactions/natopouchclose.wav'

/obj/item/weapon/storage/backpack/baf/medium
	name = "BAF medium pack"
	desc = "Commonly used by the British Armed Forces."
	icon_state = "bafmediumpack"
	item_state = "bafmediumpack"
	slot_flags = SLOT_BACK
	reachable = 0
	max_storage_space = 12
	open_delay = 5

/obj/item/weapon/storage/backpack/baf/medium/New()
	..()
	slowdown_per_slot[slot_back] = 0.03

/obj/item/weapon/storage/backpack/baf/large
	name = "BAF large pack"
	desc = "Commonly used by the British Armed Forces."
	icon_state = "baflargepack"
	item_state = "baflargepack"
	slot_flags = SLOT_BACK
	reachable = 0
	max_storage_space = 16
	open_delay = 5


/obj/item/weapon/storage/backpack/baf/large/New()
	..()
	slowdown_per_slot[slot_back] = 0.03

/obj/item/weapon/storage/backpack/baf_med
	name = "medical bag"
	desc = "A leather tablet bag used by BAF medical personnel."
	icon_state = "bundes_med"
	item_state = "bundes_med"
	reachable = 1
	max_storage_space = 24
	open_delay = 5
	slot_flags = SLOT_BACK
	startswith = list(
			/obj/item/weapon/reagent_containers/glass/bottle/morphine,
			/obj/item/weapon/reagent_containers/glass/bottle/salbutamol,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocaproic,
			/obj/item/stack/medical/splint = 1,
			/obj/item/stack/medical/ointment/nato = 1,
			/obj/item/weapon/storage/fancy/syringe
			)
	can_hold = list(
			/obj/item/weapon/storage/box/pill_box,
			/obj/item/weapon/storage/box/ampoule_box,
			/obj/item/weapon/ampoule_pack,
			/obj/item/weapon/pill_pack,
			/obj/item/weapon/gauze_pack,
			/obj/item/stack/medical,
			/obj/item/stack/medical/tourniquet,
			/obj/item/weapon/reagent_containers/syringe,
			/obj/item/weapon/storage/fancy/syringe,
			/obj/item/weapon/reagent_containers/syrette,
			/obj/item/weapon/reagent_containers/glass/bottle,
			/obj/item/weapon/reagent_containers/pill,
			)

//rpg blyat

/obj/item/weapon/storage/backpack/rpgsa
	name = "rocket backpack"
	desc = "A special-purpose backpack used by the Warsaw Pact armies. Can hold two rockets."
	icon_state = "sa_rpg2"
	item_state = "sa_rpg"
	reachable = 1
	max_storage_space = 30
	storage_slots = 2
	open_delay = 0
	can_hold = list (/obj/item/ammo_casing/rpg_missile, /obj/item/ammo_casing/rpg_missile/finn)
	startswith = null

/obj/item/weapon/storage/backpack/rpgsaassistant
	name = "large rocket backpack"
	desc = "A large special-purpose backpack used by the Warsaw Pact armies. Can hold three rockets."
	icon_state = "sa_rpg3"
	item_state = "sa_rpg"
	reachable = 1
	max_storage_space = 30
	storage_slots = 3
	open_delay = 0
	can_hold = list (/obj/item/ammo_casing/rpg_missile, /obj/item/ammo_casing/rpg_missile/finn)
	startswith = null

/obj/item/weapon/storage/backpack/rpgfin
	name = "55 S 55 shell backpack"
	desc = "A backpack for two 55 S 55 shells."
	icon_state = "fin_rpg"
	item_state = "fin_rpg"
	reachable = 1
	storage_slots = 2
	max_storage_space = 30
	open_delay = 10
	can_hold = list(/obj/item/ammo_casing/rpg_missile/finn)
	startswith = null

/obj/item/weapon/storage/backpack/rpgfinassistant
	name = "large 55 S 55 shell backpack"
	desc = "A backpack for three 55 S 55 shells."
	icon_state = "fin_rpg"
	item_state = "fin_rpg"
	reachable = 1
	storage_slots = 3
	max_storage_space = 30
	open_delay = 10
	can_hold = list(/obj/item/ammo_casing/rpg_missile/finn)
	startswith = null

/obj/item/weapon/storage/backpack/rpgbrit
	name = "shell rucksack"
	desc = "A backpack repurposed to carry two recoilless rifle shells."
	icon_state = "baflargepack"
	item_state = "baflargepack"
	reachable = 1
	storage_slots = 2
	max_storage_space = 30
	open_delay = 10
	can_hold = list(/obj/item/ammo_casing/rpg_missile/smaw, /obj/item/ammo_casing/rpg_missile/recoilless)
	startswith = null


/obj/item/weapon/storage/backpack/rpgusa
	name = "shell rucksack"
	desc = "A backpack repurposed to carry two SMAW tubes."
	icon_state = "alicelargepack"
	item_state = "alicelargepack"
	reachable = 1
	storage_slots = 2
	max_storage_space = 30
	open_delay = 10
	can_hold = list(/obj/item/ammo_casing/rpg_missile/smaw, /obj/item/ammo_casing/rpg_missile/recoilless)
	startswith = null

/obj/item/weapon/storage/backpack/rpgbritassistant
	name = "large shell rucksack"
	desc = "A large backpack repurposed to carry three recoilless rifle shells."
	icon_state = "baflargepack"
	item_state = "baflargepack"
	reachable = 1
	storage_slots = 3
	max_storage_space = 30
	open_delay = 10
	can_hold = list(/obj/item/ammo_casing/rpg_missile/smaw, /obj/item/ammo_casing/rpg_missile/recoilless)
	startswith = null


/obj/item/weapon/storage/backpack/rpgusaassistant
	name = "large shell rucksack"
	desc = "A large backpack repurposed to carry three SMAW tubes."
	icon_state = "alicelargepack"
	item_state = "alicelargepack"
	reachable = 1
	storage_slots = 3
	max_storage_space = 30
	open_delay = 10
	can_hold = list(/obj/item/ammo_casing/rpg_missile/smaw, /obj/item/ammo_casing/rpg_missile/recoilless)
	startswith = null

/obj/item/weapon/storage/backpack/soviet_tabletbag
	name = "tablet bag"
	desc = "A leather tablet bag used by soviet officers and other command staff."
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
			/obj/item/weapon/reagent_containers/glass/bottle/angiotensin,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocap,
			/obj/item/weapon/storage/firstaid/gauze,
			/obj/item/weapon/storage/firstaid/tour,
			/obj/item/weapon/pill_pack/amidopyrinum = 2,
			/obj/item/stack/medical/splint = 1
			)
	can_hold = list(
			/obj/item/weapon/storage/firstaid/gauze,
			/obj/item/weapon/storage/firstaid/tour,
			/obj/item/weapon/storage/box/pill_box,
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
	slot_flags = SLOT_BACK_GUN | SLOT_BACK

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
	slot_flags = SLOT_BACK_GUN | SLOT_BACK

/obj/item/weapon/storage/backpack/usmc_buttpack/med
	name = "US medical pack"
	desc = "A sturdy field pack used by U.S. army. Also referred as butt pack. This one has a red cross on it."
	icon_state = "usmc_med"
	item_state = "usmc_med"
	slot_flags = SLOT_BACK_GUN | SLOT_BACK
	max_storage_space = 24
	reachable = 1
	open_delay = 5
	slot_flags = SLOT_BACK
	startswith = list(
			/obj/item/weapon/reagent_containers/glass/bottle/morphine,
			/obj/item/weapon/reagent_containers/glass/bottle/salbutamol,
			/obj/item/weapon/reagent_containers/glass/bottle/angiotensin,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocap,
			/obj/item/weapon/storage/firstaid/gauze,
			/obj/item/weapon/storage/firstaid/tour,
			/obj/item/weapon/pill_pack/amidopyrinum = 2,
			/obj/item/stack/medical/splint = 1
			)
	can_hold = list(
			/obj/item/weapon/storage/firstaid/gauze,
			/obj/item/weapon/storage/firstaid/tour,
			/obj/item/weapon/storage/box/pill_box,
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
			/obj/item/weapon/reagent_containers/glass/bottle/angiotensin,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocap,
			/obj/item/weapon/storage/firstaid/gauze,
			/obj/item/weapon/storage/firstaid/tour,
			/obj/item/weapon/pill_pack/amidopyrinum = 2,
			/obj/item/stack/medical/splint = 1
			)
	can_hold = list(
			/obj/item/weapon/storage/firstaid/gauze,
			/obj/item/weapon/storage/firstaid/tour,
			/obj/item/weapon/storage/box/pill_box,
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

/obj/item/weapon/storage/backpack/sovietpack
	name = "kitbag"
	desc = "Commonly used by Warsaw Pact."
	icon_state = "sovietpack"
	item_state = "sovietpack"
	reachable = 0
	max_storage_space = 12
	open_delay = 5

/obj/item/weapon/storage/backpack/sovietpack/New()
	..()
	slowdown_per_slot[slot_back] = 1

/obj/item/weapon/storage/backpack/summedsan
	name = "sanitar medical bag"
	desc = "That's the 'Sumka Meditsinskaya Sanitarnaya', a medical bag commonly used by Warsaw Pact."
	icon_state = "summedsan"
	item_state = "summedsan"
	reachable = 1
	max_storage_space = 24
	open_delay = 5
	slot_flags = SLOT_BACK_GUN | SLOT_BACK
	startswith = list(
			/obj/item/weapon/reagent_containers/glass/bottle/morphine,
			/obj/item/weapon/reagent_containers/glass/bottle/salbutamol,
			/obj/item/weapon/reagent_containers/glass/bottle/angiotensin,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocap,
			/obj/item/weapon/storage/firstaid/gauze,
			/obj/item/weapon/storage/firstaid/tour,
			/obj/item/weapon/pill_pack/amidopyrinum = 2,
			/obj/item/stack/medical/splint = 1
			)
	can_hold = list(
			/obj/item/weapon/storage/firstaid/gauze,
			/obj/item/weapon/storage/firstaid/tour,
			/obj/item/weapon/storage/box/pill_box,
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
	desc = "That's a generic gas mask bag commonly used by Warsaw Pact."
	icon_state = "sovietgaspouch"
	item_state = "sovietgaspouch"
	reachable = 1
	max_storage_space = 6
	open_delay = 10
	slot_flags = SLOT_BACK_GUN | SLOT_BACK

/obj/item/weapon/storage/backpack/alice/medium
	name = "ALICE medium pack"
	desc = "Commonly used by USMC."
	icon_state = "alicemediumpack"
	item_state = "alicemediumpack"
	slot_flags = SLOT_BACK
	reachable = 0
	max_storage_space = 16
	open_delay = 5

/obj/item/weapon/storage/backpack/alice/medium/New()
	..()
	slowdown_per_slot[slot_back] = 0.03

/obj/item/weapon/storage/backpack/alice/large
	name = "ALICE large pack"
	desc = "Commonly used by USMC."
	icon_state = "alicelargepack"
	item_state = "alicelargepack"
	slot_flags = SLOT_BACK
	reachable = 0
	max_storage_space = 24
	open_delay = 5


/obj/item/weapon/storage/backpack/alice/large/New()
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
	max_storage_space = 16
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
			/obj/item/weapon/reagent_containers/glass/bottle/angiotensin,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocap,
			/obj/item/weapon/storage/firstaid/gauze,
			/obj/item/weapon/storage/firstaid/tour,
			/obj/item/weapon/pill_pack/amidopyrinum = 2,
			/obj/item/stack/medical/splint = 1
			)
	can_hold = list(
			/obj/item/weapon/storage/firstaid/gauze,
			/obj/item/weapon/storage/firstaid/tour,
			/obj/item/weapon/storage/box/pill_box,
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
	max_storage_space = 16
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
	max_storage_space = 24
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
			/obj/item/weapon/reagent_containers/glass/bottle/angiotensin,
			/obj/item/weapon/reagent_containers/glass/bottle/aminocap,
			/obj/item/weapon/storage/firstaid/gauze,
			/obj/item/weapon/storage/firstaid/tour,
			/obj/item/weapon/pill_pack/amidopyrinum = 2,
			/obj/item/stack/medical/splint = 1
			)
	can_hold = list(
			/obj/item/weapon/storage/firstaid/gauze,
			/obj/item/weapon/storage/firstaid/tour,
			/obj/item/weapon/storage/box/pill_box,
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
	name = "RPG rocket backpack"
	desc = "Soviet Army backpack for RPG rockets. Can hold four rockets."
	icon_state = "sa_rpg2"
	item_state = "sa_rpg"
	reachable = 1
	storage_slots = 4
	open_delay = 0
	can_hold = list (/obj/item/ammo_casing/rpg_missile, /obj/item/ammo_casing/rpg_missile/finn)
	startswith = list(
			/obj/item/ammo_casing/rpg_missile,
			/obj/item/ammo_casing/rpg_missile,
			/obj/item/ammo_casing/rpg_missile,
			/obj/item/ammo_casing/rpg_missile
			)

/obj/item/weapon/storage/backpack/rpgsa/assistant
	name = "RPG Assistant rocket backpack"
	desc = "Backpack for grenadier assistant. Can hold three rockets."
	icon_state = "sa_rpg3"
	item_state = "sa_rpg"
	reachable = 1
	max_storage_space = 30
	storage_slots = 3
	open_delay = 0
	can_hold = list (/obj/item/ammo_casing/rpg_missile, /obj/item/ammo_casing/rpg_missile/finn)

/obj/item/weapon/storage/backpack/rpgcsla
	name = "RPG rocket backpack"
	desc = "CSLA backpack for RPG shots. Can hold two rockets."
	icon_state = "csla_rpg2"
	item_state = "csla_rpg"
	reachable = 1
	storage_slots = 2
	open_delay = 0
	can_hold = list (/obj/item/ammo_casing/rpg_missile)

/obj/item/weapon/storage/backpack/rpgfin
	name = "55 S 55 shell backpack"
	desc = "A backpack for three 55 S 55 shells."
	icon_state = "fin_rpg"
	item_state = "fin_rpg"
	reachable = 1
	storage_slots = 3
	max_storage_space = 30
	open_delay = 10
	can_hold = list(/obj/item/ammo_casing/rpg_missile/finn)


/obj/item/weapon/storage/backpack/rpgbrit
	name = "shell rucksack"
	desc = "A large backpack repurposed to carry three recoilless rifle shells."
	icon_state = "baflargepack"
	item_state = "baflargepack"
	reachable = 1
	storage_slots = 3
	max_storage_space = 30
	open_delay = 10
	can_hold = list(/obj/item/ammo_casing/rpg_missile/smaw, /obj/item/ammo_casing/rpg_missile/recoilless)


/obj/item/weapon/storage/backpack/rpgusa
	name = "shell rucksack"
	desc = "A large backpack repurposed to carry three recoilless rifle shells."
	icon_state = "alicelargepack"
	item_state = "alicelargepack"
	reachable = 1
	storage_slots = 3
	max_storage_space = 30
	open_delay = 10
	can_hold = list(/obj/item/ammo_casing/rpg_missile/smaw, /obj/item/ammo_casing/rpg_missile/recoilless)

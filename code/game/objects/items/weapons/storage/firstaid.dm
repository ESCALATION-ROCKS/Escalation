/* First aid storage
 * Contains:
 *		First Aid Kits
 * 		Pill Bottles
 */

/*
 * First Aid Kits
 */
/obj/item/weapon/storage/firstaid
	name = "first-aid kit"
	desc = "It's an emergency medical kit for those serious boo-boos."
	icon_state = "firstaid"
	throw_speed = 2
	throw_range = 8
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_SMALL
	max_storage_space = DEFAULT_BOX_STORAGE - 5
	use_sound = 'sound/effects/storage/box.ogg'

/obj/item/weapon/storage/firstaid/empty
	icon_state = "firstaid"
	name = "First-Aid (empty)"

/obj/item/weapon/storage/firstaid/regular
	icon_state = "firstaid"

	startswith = list(
		/obj/item/stack/medical/bruise_pack = 1,
		/obj/item/stack/medical/ointment = 1,
		/obj/item/weapon/storage/pill_bottle/antidexafen,
		/obj/item/weapon/storage/pill_bottle/paracetamol
		)

/obj/item/weapon/storage/firstaid/combat
	name = "combat medical kit"
	desc = "Contains advanced medical treatments."
	icon_state = "bezerk"
	item_state = "firstaid-advanced"

	startswith = list(
		/obj/item/weapon/storage/pill_bottle/bicaridine,
		/obj/item/weapon/storage/pill_bottle/dermaline,
		/obj/item/weapon/storage/pill_bottle/dexalin_plus,
		/obj/item/weapon/storage/pill_bottle/dylovene,
		/obj/item/weapon/storage/pill_bottle/tramadol,
		/obj/item/weapon/storage/pill_bottle/doxycycline,
		/obj/item/stack/medical/splint,
		)

/obj/item/weapon/storage/firstaid/stab
	name = "stabilisation first aid"
	desc = "Stocked with medical pouches and a stasis bag."
	icon_state = "stabfirstaid"
	item_state = "firstaid-advanced"

	startswith = list(
		/obj/item/weapon/storage/med_pouch/trauma,
		/obj/item/weapon/storage/med_pouch/burn,
		/obj/item/weapon/storage/med_pouch/oxyloss,
		/obj/item/weapon/storage/med_pouch/toxin,
		/obj/item/bodybag/cryobag
		)

/obj/item/weapon/storage/firstaid/surgery
	name = "surgery kit"
	desc = "Contains tools for surgery. Has precise foam fitting for safe transport and automatically sterilizes the content between uses."
	icon_state = "surgerykit"
	item_state = "firstaid-surgery"

	w_class = 5
	storage_slots = 14
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = null

	use_sound = 'sound/effects/storage/briefcase.ogg'
	can_hold = list(
		/obj/item/weapon/bonesetter,
		/obj/item/weapon/cautery,
		/obj/item/weapon/circular_saw,
		/obj/item/weapon/hemostat,
		/obj/item/weapon/retractor,
		/obj/item/weapon/scalpel,
		/obj/item/weapon/surgicaldrill,
		/obj/item/weapon/bonegel,
		/obj/item/weapon/FixOVein,
		/obj/item/stack/medical/advanced/bruise_pack,
		/obj/item/stack/nanopaste
		)

	startswith = list(
		/obj/item/weapon/bonesetter,
		/obj/item/weapon/cautery,
		/obj/item/weapon/circular_saw,
		/obj/item/weapon/hemostat,
		/obj/item/weapon/retractor,
		/obj/item/weapon/scalpel,
		/obj/item/weapon/surgicaldrill,
		/obj/item/weapon/bonegel,
		/obj/item/weapon/FixOVein,
		/obj/item/stack/medical/advanced/bruise_pack,
		)

/*
 * Pill Bottles
 */
/obj/item/weapon/storage/pill_bottle
	name = "pill bottle"
	desc = "It's an airtight container for storing medication."
	icon_state = "pill_canister"
	icon = 'icons/obj/chemical.dmi'
	item_state = "contsolid"
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_TINY
	max_storage_space = 7
	can_hold = list(/obj/item/weapon/reagent_containers/pill,/obj/item/weapon/dice,/obj/item/weapon/paper)
	allow_quick_gather = 1
	use_to_pickup = 1
	use_sound = 'sound/effects/storage/pillbottle.ogg'

/obj/item/weapon/storage/pill_bottle/antitox
	name = "bottle of Dylovene pills"
	desc = "Contains pills used to counter toxins."

	startswith = list(/obj/item/weapon/reagent_containers/pill/antitox = 7)

/obj/item/weapon/storage/pill_bottle/bicaridine
	name = "bottle of Bicaridine pills"
	desc = "Contains pills used to stabilize the severely injured."

	startswith = list(/obj/item/weapon/reagent_containers/pill/bicaridine = 7)

/obj/item/weapon/storage/pill_bottle/dexalin_plus
	name = "bottle of Dexalin Plus pills"
	desc = "Contains pills used to treat extreme cases of oxygen deprivation."

	startswith = list(/obj/item/weapon/reagent_containers/pill/dexalin_plus = 7)

/obj/item/weapon/storage/pill_bottle/dexalin
	name = "bottle of Dexalin pills"
	desc = "Contains pills used to treat oxygen deprivation."

	startswith = list(/obj/item/weapon/reagent_containers/pill/dexalin = 7)

/obj/item/weapon/storage/pill_bottle/dermaline
	name = "bottle of Dermaline pills"
	desc = "Contains pills used to treat burn wounds."

	startswith = list(/obj/item/weapon/reagent_containers/pill/dermaline = 7)

/obj/item/weapon/storage/pill_bottle/dylovene
	name = "bottle of Dylovene pills"
	desc = "Contains pills used to treat toxic substances in the blood."

	startswith = list(/obj/item/weapon/reagent_containers/pill/dylovene = 7)

/obj/item/weapon/storage/pill_bottle/inaprovaline
	name = "bottle of Inaprovaline pills"
	desc = "Contains pills used to stabilize patients."

	startswith = list(/obj/item/weapon/reagent_containers/pill/inaprovaline = 7)

/obj/item/weapon/storage/pill_bottle/kelotane
	name = "bottle of kelotane pills"
	desc = "Contains pills used to treat burns."

	startswith = list(/obj/item/weapon/reagent_containers/pill/kelotane = 7)

/obj/item/weapon/storage/pill_bottle/doxycycline
	name = "bottle of doxycycline pills"
	desc = "A theta-lactam antibiotic. Effective against many diseases likely to be encountered in space."

	startswith = list(/obj/item/weapon/reagent_containers/pill/doxycycline = 7)

/obj/item/weapon/storage/pill_bottle/tramadol
	name = "bottle of Tramadol pills"
	desc = "Contains pills used to relieve pain."

	startswith = list(/obj/item/weapon/reagent_containers/pill/tramadol = 7)

//Baycode specific Psychiatry pills.
/obj/item/weapon/storage/pill_bottle/citalopram
	name = "bottle of Citalopram pills"
	desc = "Mild antidepressant. For use in individuals suffering from depression or anxiety. 15u dose per pill."

	startswith = list(/obj/item/weapon/reagent_containers/pill/citalopram = 7)

/obj/item/weapon/storage/pill_bottle/methylphenidate
	name = "bottle of Methylphenidate pills"
	desc = "Mental stimulant. For use in individuals suffering from ADHD, or general concentration issues. 15u dose per pill."

	startswith = list(/obj/item/weapon/reagent_containers/pill/methylphenidate = 7)

/obj/item/weapon/storage/pill_bottle/paroxetine
	name = "bottle of Paroxetine pills"
	desc = "High-strength antidepressant. Only for use in severe depression. 10u dose per pill. <span class='warning'>WARNING: side-effects may include hallucinations.</span>"

	startswith = list(/obj/item/weapon/reagent_containers/pill/paroxetine = 7)

/obj/item/weapon/storage/pill_bottle/antidexafen
	name = "bottle of cold medicine pills"
	desc = "All-in-one cold medicine. 10u dose per pill. Safe for babies like you!"

	startswith = list(/obj/item/weapon/reagent_containers/pill/antidexafen = 7)


/obj/item/weapon/storage/firstaid/docbag
	name = "medical bag"
	desc = "Contains some medical tools and medical supplies."
	icon_state = "docbag"
	item_state = "briefcase"
	storage_slots = 14
	w_class = ITEM_SIZE_GARGANTUAN
	max_storage_space = null

	startswith = list(
		/obj/item/weapon/scalpel,
		/obj/item/weapon/storage/pill_bottle/paracetamol,
		/obj/item/stack/medical/splint,
		/obj/item/stack/medical/bruise_pack = 2,
		/obj/item/stack/medical/ointment = 1,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/pain = 2,
		/obj/item/weapon/storage/pill_bottle/antidexafen,
		/obj/item/suture,
		/obj/item/stack/medical/medispray = 1
		)

/obj/item/weapon/storage/firstaid/docbag/advanced
	startswith = list(
		/obj/item/weapon/scalpel,
		/obj/item/weapon/reagent_containers/glass/bottle/talotropine,
		/obj/item/stack/medical/splint,
		/obj/item/stack/medical/bruise_pack = 2,
		/obj/item/stack/medical/ointment = 1,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/pain = 2,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/combatpain = 2,
		/obj/item/suture,
		/obj/item/stack/medical/medispray = 1,
		/obj/item/weapon/reagent_containers/hypospray/autoinjector/ethanol = 10
		)


/obj/item/weapon/storage/firstaid/ifak
	name = "IFAK"
	desc = "That's the Individual First Aid Kit."
	icon_state = "usmc_ifak"
	storage_slots = 4
	item_state = null
	w_class = 2
	startswith = null

	can_hold = list(
		/obj/item/weapon/reagent_containers/syrette/morphine,
		/obj/item/stack/medical/tourniquet,
		/obj/item/weapon/gauze_pack/gauze,
		/obj/item/weapon/gauze_pack/ipp,
		/obj/item/stack/medical/splint/ifak
		)
	
/obj/item/weapon/storage/firstaid/ifak/nato
	desc = "That's the Individual First Aid Kit, a standard-issued NATO first aid kit."
	icon_state = "usmc_ifak"
	startswith = list(
		/obj/item/weapon/reagent_containers/syrette/morphine,
		/obj/item/stack/medical/tourniquet/nato,
		/obj/item/weapon/gauze_pack/gauze,
		/obj/item/stack/medical/splint/ifak
		)

/obj/item/weapon/storage/firstaid/ifak/soviet
	desc = "That's a standard-issued Soviet first aid kit ."
	icon_state = "soviet_ifak"
	startswith = list(
		/obj/item/weapon/reagent_containers/syrette/morphine,
		/obj/item/stack/medical/tourniquet,
		/obj/item/weapon/gauze_pack/ipp,
		/obj/item/stack/medical/splint/ifak
		)

/obj/item/weapon/storage/firstaid/cms
	name = "CMS"
	desc = "Compact surgical kit for treatment of bullet wounds and other serious injuries."
	icon_state = "surgeon_faid"
	storage_slots = 12
	item_state = null
	w_class = 2
	max_w_class = ITEM_SIZE_HUGE
	max_storage_space = null
	slot_flags = SLOT_ID
	startswith = list(
		/obj/item/weapon/FixOVein,
		/obj/item/weapon/hemostat,
		/obj/item/weapon/bonesetter,
		/obj/item/suture,
		/obj/item/weapon/circular_saw,
		/obj/item/weapon/retractor,
		/obj/item/weapon/scalpel,
		/obj/item/weapon/cautery,
		/obj/item/weapon/reagent_containers/spray/sterilizine,
		/obj/item/weapon/setofplates
		)

	can_hold = list(
		/obj/item/weapon/gauze_pack/,
		/obj/item/stack/medical/bruise_pack,
		/obj/item/weapon/storage/pill_bottle,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/storage/box/pill_box,
		/obj/item/weapon/pill_pack,
		/obj/item/weapon/reagent_containers/syrette,
		/obj/item/stack/medical/tourniquet,
		/obj/item/weapon/FixOVein,
		/obj/item/weapon/hemostat,
		/obj/item/weapon/bonesetter,
		/obj/item/suture,
		/obj/item/weapon/circular_saw,
		/obj/item/weapon/retractor,
		/obj/item/weapon/scalpel,
		/obj/item/weapon/cautery,
		/obj/item/weapon/retractor,
		/obj/item/weapon/reagent_containers/spray/sterilizine,
		/obj/item/weapon/gauze_pack,
		/obj/item/weapon/setofplates
		)

/*/obj/item/weapon/storage/firstaid/gauze
	name = "gauze satchel"
	desc = "A small container you can place bandages and bandage packs in."
	icon_state = "nato_gauze"
	storage_slots = 4
	item_state = null
	w_class = 2
	slot_flags = SLOT_ID
	startswith = list(
		/obj/item/weapon/gauze_pack/gauze,
		/obj/item/weapon/gauze_pack/gauze,
		/obj/item/weapon/gauze_pack/gauze,
		/obj/item/weapon/gauze_pack/gauze
		)

	can_hold = list(
		/obj/item/weapon/gauze_pack,
		/obj/item/stack/medical/bruise_pack/
		)

/obj/item/weapon/storage/firstaid/gauze/wp
	icon_state = "soviet_gauze"
	startswith = list(
		/obj/item/weapon/gauze_pack/ipp,
		/obj/item/weapon/gauze_pack/ipp,
		/obj/item/weapon/gauze_pack/ipp,
		/obj/item/weapon/gauze_pack/ipp
		)

/obj/item/weapon/storage/firstaid/tour
	name = "tourniquet satchel"
	desc = "A small container you can place tourniquets in."
	icon_state = "nato_tour"
	storage_slots = 4
	item_state = null
	w_class = 2
	slot_flags = SLOT_ID
	startswith = list(
		/obj/item/stack/medical/tourniquet/nato,
		/obj/item/stack/medical/tourniquet/nato,
		/obj/item/stack/medical/tourniquet/nato,
		/obj/item/stack/medical/tourniquet/nato
		)

	can_hold = list(
		/obj/item/stack/medical/tourniquet
		)

/obj/item/weapon/storage/firstaid/tour/wp
	icon_state = "soviet_tour"
	startswith = list(
		/obj/item/stack/medical/tourniquet,
		/obj/item/stack/medical/tourniquet,
		/obj/item/stack/medical/tourniquet,
		/obj/item/stack/medical/tourniquet
		)*/

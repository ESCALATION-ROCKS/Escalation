/obj/item/clothing/mask/gas
	name = "gas mask"
	desc = "A face-covering mask that can be connected to an air supply. Filters harmful gases from the air."
	icon_state = "fullgas"
	item_flags = BLOCK_GAS_SMOKE_EFFECT | AIRTIGHT
	flags_inv = HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = FACE|EYES
	w_class = ITEM_SIZE_NORMAL
	item_state = "gas_alt"
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	siemens_coefficient = 0.9
	var/gas_filter_strength = 1			//For gas mask filters
	var/list/filtered_gases = list("phoron", "sleeping_agent")
	armor = list(melee = 5, bullet = 5, laser = 5, energy = 0, bomb = 0, bio = 75, rad = 0)
	picksound = 'sound/items/interactions/gasmask.wav'
	tint = 0.5
	visor_color = "green"


/obj/item/clothing/mask/gas/filter_air(datum/gas_mixture/air)
	var/datum/gas_mixture/filtered = new

	for(var/g in filtered_gases)
		if(air.gas[g])
			filtered.gas[g] = air.gas[g] * gas_filter_strength
			air.gas[g] -= filtered.gas[g]

	air.update_values()
	filtered.update_values()

	return filtered

/obj/item/clothing/mask/gas/half
	name = "face mask"
	desc = "A compact, durable gas mask that can be connected to an air supply."
	icon_state = "halfgas"
	siemens_coefficient = 0.7
	body_parts_covered = FACE
	w_class = ITEM_SIZE_SMALL
	armor = list(melee = 10, bullet = 10, laser = 10, energy = 0, bomb = 0, bio = 55, rad = 0)
	visor_color = 0

//Plague Dr suit can be found in clothing/suits/bio.dm
/obj/item/clothing/mask/gas/plaguedoctor
	name = "plague doctor mask"
	desc = "A modernised version of the classic design, this mask will not only filter out phoron but it can also be connected to an air supply."
	icon_state = "plaguedoctor"
	item_state = "gas_mask"
	armor = list(melee = 0, bullet = 0, laser = 2,energy = 2, bomb = 0, bio = 90, rad = 0)
	body_parts_covered = HEAD|FACE|EYES

/obj/item/clothing/mask/gas/swat
	name = "\improper SWAT mask"
	desc = "A close-fitting tactical mask that can be connected to an air supply."
	icon_state = "swat"
	siemens_coefficient = 0.7
	body_parts_covered = FACE|EYES
	armor = list(melee = 15, bullet = 15, laser = 15, energy = 0, bomb = 0, bio = 75, rad = 0)

/obj/item/clothing/mask/gas/swat/vox
	name = "alien mask"
	desc = "Clearly not designed for a human face."
	body_parts_covered = 0 //Hack to allow vox to eat while wearing this mask.
	species_restricted = list(SPECIES_VOX)

/obj/item/clothing/mask/gas/syndicate
	name = "tactical mask"
	desc = "A close-fitting tactical mask that can be connected to an air supply."
	icon_state = "swat"
	siemens_coefficient = 0.7
	armor = list(melee = 15, bullet = 15, laser = 15, energy = 0, bomb = 0, bio = 75, rad = 0)

/obj/item/clothing/mask/gas/clown_hat
	name = "clown wig and mask"
	desc = "A true prankster's facial attire. A clown is incomplete without their wig and mask."
	icon_state = "clown"
	item_state = "clown_hat"
	visor_color = 0

/obj/item/clothing/mask/gas/sexyclown
	name = "sexy-clown wig and mask"
	desc = "A feminine clown mask for the dabbling crossdressers or female entertainers."
	icon_state = "sexyclown"
	item_state = "sexyclown"
	visor_color = 0

/obj/item/clothing/mask/gas/mime
	name = "mime mask"
	desc = "The traditional mime's mask. It has an eerie facial posture."
	icon_state = "mime"
	item_state = "mime"
	visor_color = 0

/obj/item/clothing/mask/gas/monkeymask
	name = "monkey mask"
	desc = "A mask used when acting as a monkey."
	icon_state = "monkeymask"
	item_state = "monkeymask"
	body_parts_covered = HEAD|FACE|EYES
	visor_color = 0

/obj/item/clothing/mask/gas/sexymime
	name = "sexy mime mask"
	desc = "A traditional female mime's mask."
	icon_state = "sexymime"
	item_state = "sexymime"
	visor_color = 0

/obj/item/clothing/mask/gas/death_commando
	name = "Death Commando Mask"
	icon_state = "death_commando_mask"
	item_state = "death_commando_mask"
	siemens_coefficient = 0.2

/obj/item/clothing/mask/gas/cyborg
	name = "cyborg visor"
	desc = "Beep boop!"
	icon_state = "death"

/obj/item/clothing/mask/gas/owl_mask
	name = "owl mask"
	desc = "Twoooo!"
	icon_state = "owl"
	body_parts_covered = HEAD|FACE|EYES
	visor_color = 0

/obj/item/clothing/mask/gas/vox
	name = "vox breathing mask"
	desc = "A small oxygen filter for use by Vox"
	icon_state = "respirator"
	flags_inv = 0
	body_parts_covered = 0
	species_restricted = list(SPECIES_VOX)
	filtered_gases = list("phoron", "sleeping_agent", "oxygen")
	visor_color = 0


////COLDWAR

/obj/item/clothing/mask/gas/coldwar
	name = "weird gas mask"
	desc = "A weird gas mask. You should not be seeing this."
	icon_state = "gp5_mask"
	item_state = "gp5_mask"
	wearable = 1
	w_class = ITEM_SIZE_NORMAL
	flags_inv = BLOCKHAIR
	body_parts_covered = FACE|HEAD
	down_body_parts_covered = HEAD
	filtered_gases = list("phoron", "sleeping_agent", "smoke")
	visor_color = 0
	tint = TINT_NONE
	item_flags = BLOCK_GAS_SMOKE_EFFECT | AIRTIGHT
	armor = list(melee = 5, bullet = 5, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 0)

/obj/item/clothing/mask/gas/coldwar/gp5 /////NVA
	name = "GP-5 gas mask"
	desc = "A gas mask used by the Soviet Army and other WARPACT countries."
	icon_state = "gp5_mask"
	item_state = "gp5_mask"

/obj/item/clothing/mask/gas/coldwar/gp7 ///////SA
	name = "GP-7 gas mask"
	desc = "A gas mask used by the Soviet Army and other WARPACT countries."
	icon_state = "gp7_mask"
	item_state = "gp7_mask"

/obj/item/clothing/mask/gas/coldwar/pmg ///////SA
	name = "PMG gas mask"
	desc = "A gas mask uncommonly used by the Soviet Army. This one is labeled 'J-12', you don't know what that means."
	icon_state = "pmg_mask"
	item_state = "pmg_mask"

/obj/item/clothing/mask/gas/coldwar/m38 ///////BDW - BDH
	name = "M38 gas mask"
	desc = "A gas mask used by the Bundeswehr and other NATO counties."
	icon_state = "m38_mask"
	item_state = "m38_mask"

/obj/item/clothing/mask/gas/coldwar/m17 ///////USMC - USA
	name = "M17 gas mask"
	desc = "A gas mask used by the USA and other NATO counties."
	icon_state = "m17_mask"
	item_state = "m17_mask"
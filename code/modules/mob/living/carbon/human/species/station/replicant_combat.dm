/datum/species/human/replicant
	name = SPECIES_REPLICANT
	flash_mod =     0.7
	oxy_mod =       0.7
	radiation_mod = 0.5
	brute_mod =     0.7
	language = LANGUAGE_EAL
	unarmed_types = list(/datum/unarmed_attack/terminator)
	rarity_value = 10
	num_alternate_languages = 1 // potentially could be 2?
	name_language = LANGUAGE_EAL
	min_age = 1
	max_age = 90
	virus_immune = 1
	darksight = 8

	has_organ = list(
		"brain" = /obj/item/organ/internal/mmi_holder/replica,
		BP_OPTICS = /obj/item/organ/internal/eyes/optics,
		BP_KIDNEYS = /obj/item/organ/internal/kidneys/replica,
		BP_HEART = /obj/item/organ/internal/heart/replica/,
		BP_LUNGS = /obj/item/organ/internal/lungs/replica,
		BP_LIVER = /obj/item/organ/internal/liver/replica/,
		BP_EYES =     /obj/item/organ/internal/eyes/,
		BP_DATACORE = /obj/item/organ/internal/data,
		BP_BIOCELL = /obj/item/organ/internal/replicell
		)

	vision_organ = BP_OPTICS

	has_limbs = list(
		BP_CHEST =  list("path" = /obj/item/organ/external/chest/replica),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/replica),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/replica),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm/replica),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right/replica),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg/replica),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right/replica),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand/replica),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right/replica),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot/replica),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right/replica)
		)

	inherent_verbs = list(
	/mob/living/carbon/human/proc/uncuffreplica,
	/mob/living/carbon/human/proc/stomp,
	/mob/living/carbon/human/proc/replica_baton,
	/mob/living/carbon/human/proc/replica_lockpick,
	/mob/living/carbon/human/proc/stimulants,
	/mob/living/carbon/human/proc/replica_nightvision,
	)
/datum/species/human/replicant/sanitize_name(var/new_name)
	return sanitizeName(new_name, allow_numbers = 1)

/datum/species/human/replicant/handle_death(var/mob/living/carbon/human/H)
	..()
	playsound(H.loc, 'sound/items/countdown.ogg', 125, 1)
	spawn(35)
		explosion(H.loc, -1, 1, 5)
		H.gib()

/datum/species/human/replicant/handle_environment_special(var/mob/living/carbon/human/H, var/datum/species/human/replicant/R,var/obj/item/organ/internal/replicell/P = H.internal_organs_by_name["bioelectrical cell"])
	if(H.nightvision_active == 1)
		P.stored_biopower -= 3
		H.set_see_in_dark(8)
	else
		H.set_see_in_dark(2)
	var/datum/reagent/ethanol = locate(/datum/reagent/ethanol) in H.reagents.reagent_list
	if(ethanol)
		P.stored_biopower += 5
		P.stored_biopower = min(max(P.stored_biopower,0),P.max_biopower)
	if(P.stored_biopower <= 0)
		H.nightvision_active = 0
		H.arm_actuators = 0
		to_chat(src, "<span class='robotic'>WARNING. BATTERY LOW.</span>")

/datum/surgery_step/suture_wounds
	priority = 2
	allowed_tools = list(
	/obj/item/suture = 100,
	/obj/item/stack/cable_coil = 60
	)

	min_duration = 50
	max_duration = 75
	can_infect = 1
	blood_level = 1
	min_duration = 45
	max_duration = 70
	shock_level = 40

/datum/surgery_step/suture_wounds/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if(!istype(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if(!affected || affected.is_stump() || (affected.status & ORGAN_ROBOT) || ((affected.open() >= SURGERY_RETRACTED) && (affected.status & ORGAN_ARTERY_CUT|ORGAN_TENDON_CUT) ))
		return 0
	for(var/datum/wound/W in affected.wounds)
		if(W.damage_type in list(PIERCE, CUT) && W.damage)
			return 1
	return 0

/datum/surgery_step/suture_wounds/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("[user] is beginning to close a wound on [target]'s [affected.name] with \the [tool]." , \
		"You are beginning to close a wound on [target]'s [affected.name] with \the [tool].")
	target.custom_pain("Your [affected.name] is being stabbed!",1)
	..()

/datum/surgery_step/suture_wounds/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	for(var/datum/wound/W in affected.wounds)
		if(W.damage_type == CUT && W.damage)
			// Close it up to a point that it can be bandaged and heal naturally!
			W.heal_damage(rand(10,20)+10)
			if(W.damage >= W.autoheal_cutoff)
				user.visible_message("<span class='notice'>\The [user] partially closes a wound on [target]'s [affected.name] with \the [tool].</span>", \
				"<span class='notice'>You partially close a wound on [target]'s [affected.name] with \the [tool].</span>")
			else
				user.visible_message("<span class='notice'>\The [user] closes a wound on [target]'s [affected.name] with \the [tool].</span>", \
				"<span class='notice'>You close a wound on [target]'s [affected.name] with \the [tool].</span>")
				if(!W.damage)
					affected.wounds -= W
					qdel(W)
				else if(W.damage <= 10)
					W.clamped = 1
			break
	affected.update_damages()

/datum/surgery_step/suture_wounds/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("\red [user]'s hand slips, tearing [target]'s [affected.name] with \the [tool]!", \
		"\red Your hand slips, tearing [target]'s [affected.name] with \the [tool]!")
	target.apply_damage(3, BRUTE, affected)
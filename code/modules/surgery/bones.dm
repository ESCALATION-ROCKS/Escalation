//Procedures in this file: Fracture repair surgery
//////////////////////////////////////////////////////////////////
//						BONE SURGERY							//
//////////////////////////////////////////////////////////////////





//////////////////////////////////////////////////////////////////
//	bone gelling surgery step
//////////////////////////////////////////////////////////////////
/datum/surgery_step/set_bone
	allowed_tools = list(
	/obj/item/weapon/bonesetter = 100
	)
	can_infect = 1
	blood_level = 1

	min_duration = 50
	max_duration = 60
	shock_level = 20

/datum/surgery_step/set_bone/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	return affected && !(affected.robotic >= ORGAN_ROBOT) && affected.open() >= 2 && affected.stage == 0

/datum/surgery_step/set_bone/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	var/bone = affected.encased ? "[target]'s [affected.encased]" : "bones in [target]'s [affected.name]"
	if (affected.stage == 0)
		user.visible_message("[user] starts setting the [bone] in place." , \
		"You start setting the [bone] in place.")
	target.custom_pain("Something in your [affected.name] is causing you a lot of pain!",50, affecting = affected)
	..()

/datum/surgery_step/set_bone/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	var/bone = affected.encased ? "[target]'s [affected.encased]" : "bones in [target]'s [affected.name]"
	user.visible_message("<span class='notice'>[user] sets the [bone] in place</span>", \
		"<span class='notice'>You set a [bone] in place.</span>")
	affected.stage = 1

/datum/surgery_step/set_bone/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("<span class='warning'>[user]'s hand slips, damaging the [affected.encased ? affected.encased : "bones"] in [target]'s [affected.name] with \the [tool]!</span>" , \
		"<span class='warning'>Your hand slips, damaging the [affected.encased ? affected.encased : "bones"] in [target]'s [affected.name] with \the [tool]!</span>")


//////////////////////////////////////////////////////////////////
//	bone setting surgery step
//////////////////////////////////////////////////////////////////
/datum/surgery_step/plate_bone
	allowed_tools = list(
	/obj/item/weapon/plate = 100
	)

	min_duration = 60
	max_duration = 70
	shock_level = 40
	delicate = 1

/datum/surgery_step/plate_bone/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	return affected && affected.organ_tag != BP_HEAD && !(affected.robotic >= ORGAN_ROBOT) && affected.open() >= SURGERY_RETRACTED && affected.stage == 1

/datum/surgery_step/plate_bone/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	var/bone = affected.encased ? "[target]'s [affected.encased]" : "bones in [target]'s [affected.name]"
	user.visible_message("[user] is beginning to set the [bone] in place with \the [tool]." , \
		"You are beginning to set the [bone] in place with \the [tool].")
	target.custom_pain("The pain in your [affected.name] is going to make you pass out!",50, affecting = affected)
	..()

/datum/surgery_step/plate_bone/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	var/bone = affected.encased ? "[target]'s [affected.encased]" : "bones in [target]'s [affected.name]"
	if (affected.status & ORGAN_BROKEN)
		user.visible_message("[user] starts plating \the [bone] with the [tool]." , \
		"You start to plate \the [bone] with the [tool].")
		affected.stage = 2
		qdel(tool)
	else
		user.visible_message("<span class='notice'>[user] plates \the [bone] with the [tool]</span>", \
			"<span class='notice'>You plate \the [bone] with \the [tool].</span>")
		affected.fracture()
		qdel(tool)

/datum/surgery_step/plate_bone/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("<span class='warning'>[user]'s hand slips, cutting \the [target]'s [affected.name] with [tool]'s edge!</span>" , \
	"<span class='warning'>Your hand slips, cutting \the [target]'s [affected.name] with [tool]'s edge!</span>")
	affected.fracture()
	affected.take_damage(15, 0, (DAM_SHARP|DAM_EDGE), used_weapon = tool)


//////////////////////////////////////////////////////////////////
//	skull mending surgery step
//////////////////////////////////////////////////////////////////
/datum/surgery_step/mend_skull
	allowed_tools = list(
	/obj/item/weapon/bonesetter = 100,	\
	/obj/item/weapon/wrench = 75		\
	)

	min_duration = 60
	max_duration = 70
	shock_level = 40
	delicate = 1

/datum/surgery_step/mend_skull/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	return affected && affected.organ_tag == BP_HEAD && !(affected.robotic >= ORGAN_ROBOT) && affected.open() >= SURGERY_RETRACTED && affected.stage == 1

/datum/surgery_step/mend_skull/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	user.visible_message("[user] is beginning to piece together [target]'s skull with \the [tool]."  , \
		"You are beginning to piece together [target]'s skull with \the [tool].")
	..()

/datum/surgery_step/mend_skull/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("<span class='notice'>[user] repairs [target]'s skull with \the [tool].</span>" , \
		"<span class='notice'>You repair [target]'s skull with \the [tool].</span>")
	affected.stage = 2
//////used to be:
//////user.visible_message("<span class='notice'>[user] sets [target]'s skull with \the [tool].</span>" , \
		//////"<span class='notice'>You set [target]'s skull with \the [tool].</span>")

/datum/surgery_step/mend_skull/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("<span class='warning'>[user]'s hand slips, damaging [target]'s face with \the [tool]!</span>"  , \
		"<span class='warning'>Your hand slips, damaging [target]'s face with \the [tool]!</span>")
//	var/obj/item/organ/external/head/h = affected
	affected.take_damage(15, 0, (DAM_SHARP|DAM_EDGE), used_weapon = tool)
//	h.status |= ORGAN_DISFIGURED

//////////////////////////////////////////////////////////////////
//	post setting bone-gelling surgery step
//////////////////////////////////////////////////////////////////
/datum/surgery_step/finish_bone
	allowed_tools = list(
	/obj/item/weapon/bonesetter = 100
	)
	can_infect = 1
	blood_level = 1

	min_duration = 50
	max_duration = 60
	shock_level = 20

/datum/surgery_step/finish_bone/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	return affected && affected.open() >= SURGERY_RETRACTED && !(affected.robotic >= ORGAN_ROBOT) && affected.stage == 2

/datum/surgery_step/finish_bone/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	var/bone = affected.encased ? "[target]'s [affected.encased]" : "bones in [target]'s [affected.name]"
	user.visible_message("[user] is beginning to set the [bone] in place with \the [tool]." , \
		"You are beginning to set the [bone] in place with \the [tool].")
	..()

/datum/surgery_step/finish_bone/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	var/bone = affected.encased ? "[target]'s [affected.encased]" : "bones in [target]'s [affected.name]"
	user.visible_message("<span class='notice'>[user] sets the [bone] n place with \the [tool].</span>", \
		"<span class='notice'>You set the [bone] in place with \the [tool].</span>")
	affected.status &= ~ORGAN_BROKEN
	affected.stage = 0

/datum/surgery_step/finish_bone/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message("<span class='warning'>[user]'s hand slips, damaging the [affected.encased ? affected.encased : "bones"] in [target]'s [affected.name] with \the [tool]!</span>" , \
		"<span class='warning'>Your hand slips, damaging the [affected.encased ? affected.encased : "bones"] in [target]'s [affected.name] with \the [tool]!</span>")

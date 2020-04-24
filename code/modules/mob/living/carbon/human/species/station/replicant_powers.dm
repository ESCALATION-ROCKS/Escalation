
/mob/living/carbon/human/proc/gain_power(var/amount)

	var/obj/item/organ/internal/replicell/I = internal_organs_by_name[BP_BIOCELL]
	if(!istype(I)) return

	if(amount)
		I.stored_biopower += amount
	I.stored_biopower = max(0,min(I.stored_biopower,I.max_biopower))

/mob/living/carbon/human/proc/check_replicant_ability(var/cost,var/needs_foundation,var/needs_organ)

	var/obj/item/organ/internal/replicell/P = internal_organs_by_name[BP_BIOCELL]
	if(!istype(P))
		to_chat(src, "<span class='danger'>Your bioelectrical cell has been removed!</span>")
		return

	if(needs_organ)
		var/obj/item/organ/internal/I = internal_organs_by_name[needs_organ]
		if(!I)
			to_chat(src, "<span class='danger'>Your [needs_organ] has been removed!</span>")
			return
		else if(!I.is_usable())
			to_chat(src, "<span class='danger'>Your [needs_organ] is too damaged to function!</span>")
			return

	if(P.stored_biopower < cost)
		to_chat(src, "<span class='warning'>You don't have enough power stored to do that.</span>")
		return 0

	if(needs_foundation)
		var/turf/T = get_turf(src)
		var/has_foundation
		if(T)
			//TODO: Work out the actual conditions this needs.
			if(!(istype(T,/turf/space)))
				has_foundation = 1
		if(!has_foundation)
			to_chat(src, "<span class='warning'>You need a solid foundation to do that on.</span>")
			return 0

	P.stored_biopower -= cost
	return 1
/mob/living/carbon/human/proc/stomp()
	set name = "Stomp (75)"
	set desc = "Strike the earth!"
	set category = "Replicant"

	if(has_stomped) //Sure, let's use this.
		to_chat(src, "<span class='robotic'>MICROFIBRAL MUSCLE ACTUATORS IS NOT READY.</span>")
		return

	if(!check_replicant_ability(75,1,BP_DATACORE))
		return


	has_stomped = 1
	spawn(500) //50 seconds
		has_stomped = 0
		to_chat(src, "<span class='robotic'>MICROFIBRAL MUSCLE ACTUATORS IS READY.</span>")

	playsound(loc, 'sound/effects/bang.ogg', 100, 0, 100, -1)
	visible_message("\red <B> \The [src] smashes the ground!</B>","\red <b>You smash the ground!</b>")
	for (var/mob/living/carbon/human/M in oview())
		var/dist = get_dist(src,M)
		if(M && M.client && dist < 6)
			shake_camera(M, 5, 1)
		if (dist < 4 && !M.lying && !M.stat)
			M << "<span class='warning'><B>The earth moves beneath your feet!</span></b>"
			M.Weaken(rand(7,10))
	return

/mob/living/carbon/human/proc/uncuffreplica()
	set name = "Remove cuffs (25)"
	set desc = "Remove your handcuffs and unbuckle."
	set category = "Replicant"

	if(!src.handcuffed)
		return 0
	if(check_replicant_ability(25,1,BP_DATACORE))
		to_chat(src, "You feel a faint click.")
		. = src.unEquip(src.handcuffed)
		if(. && src.buckled && src.buckled.buckle_require_restraints)
			src.buckled.unbuckle_mob()

/mob/living/carbon/human/proc/stimulants()
	set name = "Stimulant emission (100)"
	set desc = "Use the stimulants."
	set category = "Replicant"

	if(check_replicant_ability(100,1,BP_LIVER) && stimready == 1)
		to_chat(src, "<span class='robotic'>STIMULATOR EMISSION ENGAGED.</span>")
		src.reagents.add_reagent(/datum/reagent/adrenaline, 5)
		src.reagents.add_reagent(/datum/reagent/hyperzine, 5)
		src.reagents.add_reagent(/datum/reagent/tramadol, 5)
		stimready = 0
		spawn(1800) //180 seconds
			stimready = 1
			to_chat(src, "<span class='robotic'>LIVER CHEMICAL STORAGE IS READY.</span>")
	else
		return 0

/mob/living/carbon/human/proc/replica_lockpick()
	set category = "Replicant"
	set name = "Synthethic Lockpick (80)"
	set desc = "Toggle lockpick."
	if(check_replicant_ability(80,1,BP_DATACORE) && cant_lockpick == 0)
		if(replicant_generic_weapon(/obj/item/weapon/synthlockpick/))
			return 1
			cant_lockpick = 1
			spawn(150) //15 seconds
				cant_lockpick = 0
	else
		return 0



/obj/item/weapon/synthlockpick/
	name = "synthethic lockpick"
	icon = 'icons/obj/device.dmi'
	icon_state = "electrified_arm"
	lock_picking_level = 50
	var/mob/living/creator //This is just like ninja swords, needed to make sure dumb shit that removes the sword doesn't make it stay around.
	var/weapType = "weapon"
	var/weapLocation = "arm"

/obj/item/weapon/melee/baton/replicant/New(location)
	..()
	GLOB.processing_objects |= src
	if(ismob(loc))
		src.creator = loc

/obj/item/weapon/synthlockpick/dropped()
	spawn(1)
		if(src)
			qdel(src)

/obj/item/weapon/synthlockpick/process()  //Stolen from ninja swords.
	if(!creator || loc != creator)
		// Tidy up a bit.
		if(istype(loc,/mob/living))
			var/mob/living/carbon/human/host = loc
			if(istype(host))
				for(var/obj/item/organ/external/organ in host.organs)
					for(var/obj/item/O in organ.implants)
						if(O == src)
							organ.implants -= src
			host.pinned -= src
			host.embedded -= src
			host.drop_from_inventory(src)
		spawn(1)
			if(src)
				qdel(src)

/mob/living/carbon/human/proc/replica_baton()
	set desc = "Toggle electrified arm."
	set category = "Replicant"
	set name = "Electrified Arm (60)"
	if(check_replicant_ability(60,1,BP_DATACORE) && cant_baton == 0)
		if(replicant_generic_weapon(/obj/item/weapon/melee/baton/replicant))
			return 1
			cant_baton = 1
			spawn(150) //15 seconds
				cant_baton = 0
	else
		return 0


/obj/item/weapon/melee/baton/replicant
	name = "electrified arm"
	icon = 'icons/obj/device.dmi'
	icon_state = "electrified_arm"
	item_state = null
	force = 5
	status = 1
	bcell = /obj/item/weapon/cell/device/high
	var/mob/living/creator //This is just like ninja swords, needed to make sure dumb shit that removes the sword doesn't make it stay around.
	var/weapType = "weapon"
	var/weapLocation = "arm"

/obj/item/weapon/melee/baton/replicant/New(location)
	..()
	GLOB.processing_objects |= src
	if(ismob(loc))
		src.creator = loc
	update_icon()
	if(bcell.charge < hitcost)
		qdel(src)

/obj/item/weapon/melee/baton/replicant/process()  //Stolen from ninja swords.
	if(!creator || loc != creator)
		// Tidy up a bit.
		if(istype(loc,/mob/living))
			var/mob/living/carbon/human/host = loc
			if(istype(host))
				for(var/obj/item/organ/external/organ in host.organs)
					for(var/obj/item/O in organ.implants)
						if(O == src)
							organ.implants -= src
			host.pinned -= src
			host.embedded -= src
			host.drop_from_inventory(src)
		spawn(1)
			if(src)
				qdel(src)

/obj/item/weapon/melee/baton/replicant/dropped()
	spawn(1)
		if(src)
			qdel(src)

/obj/item/weapon/melee/baton/replicant/update_icon()
	if(status)
		icon_state = "electrified_arm_active"
		set_light(1.5, 2, "#006aff")
	else
		icon_state = "electrified_arm"
		set_light(0)



/mob/living/carbon/human/proc/replica_nightvision()
	set category = "Replicant"
	set name = "Nightvision Module"
	set desc = "Toggle night vision."
	if(check_replicant_ability(20,1,BP_DATACORE) && nightvision_active == 0)
		to_chat(src, "<span class='robotic'>RETINAL ENHANCEMENT ENGAGED.</span>")
		src.species.darksight = 10
		nightvision_active = 1
	else if(nightvision_active == 1)
		nightvision_active = 0
		src.species.darksight = 4
		to_chat(src, "<span class='robotic'>RETINAL ENHANCEMENT DISABLED.</span>")
	else
		return

/mob/proc/replicant_generic_weapon(var/weapon_type)
	if(!ishuman(src))
		return 0

	var/mob/living/carbon/human/M = src

	if(M.hands_are_full()) //Make sure our hands aren't full.
		src << "<span class='warning'>Your hands are full.  Drop something first.</span>"
		return 0

	var/obj/item/weapon/W = new weapon_type(src)
	src.put_in_hands(W)
	return 1
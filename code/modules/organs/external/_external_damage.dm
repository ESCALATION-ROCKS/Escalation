/****************************************************
			   DAMAGE PROCS
****************************************************/

/obj/item/organ/external/proc/is_damageable(var/additional_damage = 0)
	//Continued damage to vital organs can kill you, and robot organs don't count towards total damage so no need to cap them.
	return ((robotic >= ORGAN_ROBOT) || brute_dam + burn_dam + additional_damage < max_damage * 4)

/obj/item/organ/external/take_damage(brute, burn, damage_flags, used_weapon = null)
	brute = round(brute * species.brute_mod / owner.healthmodifier(owner.end), 0.1)
	burn = round(burn * species.burn_mod / owner.healthmodifier(owner.end), 0.1)
	if((brute <= 0) && (burn <= 0))
		return 0

	var/sharp = (damage_flags & DAM_SHARP)
	var/edge  = (damage_flags & DAM_EDGE)
	var/laser = (damage_flags & DAM_LASER)
	var/blunt = brute && !sharp && !edge

	if(used_weapon)
		add_autopsy_data("[used_weapon]", brute + burn)
	var/can_cut = (prob(brute*2) || sharp) && (robotic < ORGAN_ROBOT)
	var/spillover = 0
	var/pure_brute = brute
	var/pure_burn = burn
	if(!is_damageable(brute + burn))
		spillover =  brute_dam + burn_dam + brute - max_damage
		if(spillover > 0)
			brute -= spillover
		else
			spillover = brute_dam + burn_dam + brute + burn - max_damage
			if(spillover > 0)
				burn -= spillover

	owner.updatehealth() //droplimb will call updatehealth() again if it does end up being called
	//If limb took enough damage, try to cut or tear it off
	if(owner && loc == owner && !is_stump() && !cannot_amputate && config.limbs_can_break)
		if(is_broken() || (!config.bones_can_break && prob(25)))
			var/integrity_damage = pure_brute
			if(laser)
				integrity_damage += pure_burn
			damage_limb_integrity(integrity_damage, damage_flags)
		if(attempt_dismemberment(pure_brute, pure_burn, edge, used_weapon, spillover, (brute+burn>=max_damage*2)))
			return

	// High brute damage or sharp objects may damage internal organs
	if(internal_organs?.len)
		var/internal_damage = pure_brute
		if(laser)
			internal_damage += pure_burn
		damage_internal_organs(internal_damage, damage_flags)

	if(status & ORGAN_BROKEN && brute)
		jostle_bone(brute)
		if(can_feel_pain() && prob(40))
			//getting hit on broken hand hurts
			owner.emote("groan")

	if(brute_dam > min_broken_damage && prob(brute_dam + brute * (1+blunt)) ) //blunt damage is gud at fracturing
		fracture()

	// If the limbs can break, make sure we don't exceed the maximum damage a limb can take before breaking
	var/datum/wound/created_wound
	var/block_cut = !(brute > 15 || !(species.flags & NO_MINOR_CUT))

	if(brute)
		var/to_create = BRUISE
		if(can_cut)
			if(!block_cut)
				to_create = CUT
			//need to check sharp again here so that blunt damage that was strong enough to break skin doesn't give puncture wounds
			if(sharp && !edge)
				to_create = PIERCE
		created_wound = createwound(to_create, brute)

	if(burn)
		if(laser)
			createwound(LASER, burn)
			if(prob(40))
				owner.IgniteMob()
		else
			createwound(BURN, burn)

	//Initial pain spike
	add_pain(0.6*burn + 0.4*brute)

	//Disturb treated burns
	if(brute > 5)
		var/disturbed = 0
		for(var/datum/wound/burn/W in wounds)
			if((W.disinfected || W.salved) && prob(brute + W.damage))
				W.disinfected = 0
				W.salved = 0
				disturbed += W.damage
		if(disturbed)
			to_chat(owner,"<span class='warning'>Ow! Your burns were disturbed.</span>")
			add_pain(0.5*disturbed)

	//If there are still hurties to dispense
	if (spillover)
		owner.shock_stage += spillover * config.organ_damage_spillover_multiplier

	// sync the organ's damage with its wounds
	update_damages()
	owner.updatehealth()

	if(owner && update_damstate())
		owner.UpdateDamageIcon()

	return created_wound

/obj/item/organ/external/proc/damage_limb_integrity(damage_amt = 0, damage_flags)
	limb_integrity = clamp(limb_integrity - damage_amt, 0, max_limb_integrity)

/obj/item/organ/external/proc/heal_limb_integrity(heal_amt = 0, damage_flags)
	limb_integrity = clamp(limb_integrity + heal_amt, 0, max_limb_integrity)

/obj/item/organ/external/proc/damage_internal_organs(damage_amt = 0, damage_flags)
	var/cur_damage = brute_dam
	if(damage_flags & DAM_LASER)
		cur_damage += burn_dam
	var/organ_damage_threshold = 10
	if(damage_flags & DAM_SHARP)
		if(damage_flags & DAM_EDGE)
			organ_damage_threshold *= 0.75
		else
			organ_damage_threshold *= 0.5
	//the bodypart needs to be a tiny bit beat up to cause organ damage
	var/bodypart_damage_minimum = ceil(max_damage * 0.15)
	//more damage, higher chance to damage organs
	var/organ_damage_prob = 30 * damage_amt/organ_damage_threshold
	if(!(damage_flags & DAM_LASER))
		//ribs protect
		if(encased && !(status & ORGAN_BROKEN))
			organ_damage_prob *= 0.5
	//if all goes well...
	if((cur_damage + damage_amt >= bodypart_damage_minimum || damage_amt >= organ_damage_threshold) && prob(organ_damage_prob))
		//damage one internal organ based on size
		var/list/victims = list()
		for(var/obj/item/organ/internal/I in internal_organs)
			if(I.damage < I.max_damage)
				victims[I] = I.relative_size
		if(!victims.len)
			return FALSE
		var/obj/item/organ/victim = pickweight(victims)
		if(victim)
			if(istype(victim, /obj/item/organ/internal/brain))
				victim.take_damage(damage_amt)
			else
				victim.take_damage(damage_amt*0.5)

/obj/item/organ/external/heal_damage(brute, burn, internal = 0, robo_repair = 0)
	if(robotic >= ORGAN_ROBOT && !robo_repair)
		return

	heal_limb_integrity(brute+burn)
	//Heal damage on the individual wounds
	for(var/datum/wound/W in wounds)
		if(brute == 0 && burn == 0)
			break

		// heal brute damage
		if(W.damage_type == BURN && (burn_ratio < 1 || vital))
			burn = W.heal_damage(burn)
		else if(brute_ratio < 1 || vital)
			brute = W.heal_damage(brute)

	if(internal)
		status &= ~ORGAN_BROKEN

	//Sync the organ's damage with its wounds
	src.update_damages()
	owner.updatehealth()

	return update_damstate()

// Brute/burn
/obj/item/organ/external/proc/get_brute_damage()
	return brute_dam

/obj/item/organ/external/proc/get_burn_damage()
	return burn_dam

// Geneloss/cloneloss.
/obj/item/organ/external/proc/get_genetic_damage()
	return ((species && (species.flags & NO_SCAN)) || robotic >= ORGAN_ROBOT) ? 0 : genetic_degradation

/obj/item/organ/external/proc/remove_genetic_damage(var/amount)
	if((species.flags & NO_SCAN) || robotic >= ORGAN_ROBOT)
		genetic_degradation = 0
		status &= ~ORGAN_MUTATED
		return
	var/last_gene_dam = genetic_degradation
	genetic_degradation = min(100,max(0,genetic_degradation - amount))
	if(genetic_degradation <= 30)
		if(status & ORGAN_MUTATED)
			unmutate()
			to_chat(src, "<span class = 'notice'>Your [name] is shaped normally again.</span>")
	return -(genetic_degradation - last_gene_dam)

/obj/item/organ/external/proc/add_genetic_damage(var/amount)
	if((species.flags & NO_SCAN) || robotic >= ORGAN_ROBOT)
		genetic_degradation = 0
		status &= ~ORGAN_MUTATED
		return
	var/last_gene_dam = genetic_degradation
	genetic_degradation = min(100,max(0,genetic_degradation + amount))
	if(genetic_degradation > 30)
		if(!(status & ORGAN_MUTATED) && prob(genetic_degradation))
			mutate()
			to_chat(owner, "<span class = 'notice'>Something is not right with your [name]...</span>")
	return (genetic_degradation - last_gene_dam)

/obj/item/organ/external/proc/mutate()
	if(src.robotic >= ORGAN_ROBOT)
		return
	src.status |= ORGAN_MUTATED
	if(owner) owner.update_body()

/obj/item/organ/external/proc/unmutate()
	src.status &= ~ORGAN_MUTATED
	if(owner) owner.update_body()

// Pain/halloss
/obj/item/organ/external/proc/get_pain()
	if(!can_feel_pain() || robotic >= ORGAN_ROBOT)
		return 0
	var/lasting_pain = 0
	if(is_broken())
		lasting_pain += 10
	else if(is_dislocated())
		lasting_pain += 5
	var/tox_dam = 0
	for(var/obj/item/organ/internal/I in internal_organs)
		tox_dam += I.getToxLoss()
	return pain + lasting_pain + 0.7 * brute_dam + 0.8 * burn_dam + 0.3 * tox_dam + 0.5 * get_genetic_damage()

/obj/item/organ/external/proc/remove_pain(var/amount)
	if(!can_feel_pain() || robotic >= ORGAN_ROBOT)
		pain = 0
		return
	var/last_pain = pain
	pain = max(0,min(max_damage,pain-amount))
	return -(pain-last_pain)

/obj/item/organ/external/proc/add_pain(var/amount)
	if(!can_feel_pain() || robotic >= ORGAN_ROBOT)
		pain = 0
		return
	var/last_pain = pain
	pain = max(0,min(max_damage,pain+amount))
	if(owner && ((amount > 15 && prob(20)) || (amount > 30 && prob(60))))
		owner.emote("groan")
	return pain-last_pain

/obj/item/organ/external/proc/stun_act(var/stun_amount, var/agony_amount)
	return

/obj/item/organ/external/proc/get_agony_multiplier()
	return 1

/obj/item/organ/external/proc/sever_artery()
	if(species && species.has_organ[BP_HEART] && has_artery)
		var/obj/item/organ/internal/heart/O = species.has_organ[BP_HEART]
		playsound(src.loc, 'sound/effects/body/arteria_hit.ogg', 70, 1, -2)
		if(robotic < ORGAN_ROBOT && !(status & ORGAN_ARTERY_CUT) && !initial(O.open))
			status |= ORGAN_ARTERY_CUT
			return TRUE
	return FALSE

/obj/item/organ/external/proc/sever_tendon()
	if(has_tendon && robotic < ORGAN_ROBOT && !(status & ORGAN_TENDON_CUT))
		status |= ORGAN_TENDON_CUT
		return TRUE
	return FALSE

/obj/item/organ/external/proc/get_brute_mod()
	return species.brute_mod + 0.2 * burn_dam/max_damage //burns make you take more brute damage

/obj/item/organ/external/proc/get_burn_mod()
	return species.burn_mod

//organs can come off in three cases
//1. If the damage source is edge_eligible and the brute damage dealt exceeds the edge threshold, then the organ is cut off.
//2. If the damage amount dealt exceeds the disintegrate threshold, the organ is completely obliterated.
//3. If the organ has already reached or would be put over it's max damage amount (currently redundant),
//   and the brute damage dealt exceeds the tearoff threshold, the organ is torn off.
/obj/item/organ/external/proc/attempt_dismemberment(brute, burn, edge, used_weapon, spillover, force_droplimb)
	if(force_droplimb)
		if(brute >= burn)
			droplimb(0, edge ? DROPLIMB_EDGE : DROPLIMB_BLUNT)
		else
			droplimb(0, DROPLIMB_BURN)
		return TRUE

	if(edge && brute+brute_dam >= max_damage / DROPLIMB_THRESHOLD_EDGE)
		if((limb_integrity <= 0) || (prob(brute/3) && !config.bones_can_break))
			droplimb(FALSE, DROPLIMB_EDGE)
			return TRUE
	else if(burn+burn_dam >= max_damage / DROPLIMB_THRESHOLD_DESTROY)
		if((limb_integrity <= 0) || (prob(burn/3) && !config.bones_can_break))
			droplimb(FALSE, DROPLIMB_BURN)
			return TRUE
	else if(brute+brute_dam >= max_damage / DROPLIMB_THRESHOLD_DESTROY)
		if((limb_integrity <= 0) || (prob(brute) && !config.bones_can_break))
			droplimb(FALSE, DROPLIMB_BLUNT)
			return TRUE

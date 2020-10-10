#define ANTIDEPRESSANT_MESSAGE_DELAY 5*60*10


/datum/reagent/naloxone
	name = "Naloxone"
	description = "A morphine-based drug used to neutralize the morphine."
	reagent_state = LIQUID
	color = "#605048"
	overdose = REAGENTS_OVERDOSE
	metabolism = 0.05
	scannable = 0

/datum/reagent/naloxone/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(M.ingested)
		for(var/datum/reagent/R in M.ingested.reagent_list)
			if(istype(R, /datum/reagent/morphine))
				M.chem_doses[R.type] = max(M.chem_doses[R.type] - removed * 5, 0)

/datum/reagent/promethazine
	name = "Promethazine"
	description = "That's the powerful neuroleptic."
	reagent_state = LIQUID
	color = "#FF80BF"
	metabolism = 0.12
	data = 0
	overdose = 16
	scannable = 0

/datum/reagent/promethazine/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.chem_doses[type] < 3)
		if(M.chem_doses[type] == metabolism * 2 || prob(5))
			M.add_chemical_effect(CE_PAINKILLER, 30)
	else if(M.chem_doses[type] < 6)
		M.eye_blurry = max(M.eye_blurry, 20)
		M.add_chemical_effect(CE_PAINKILLER, 40)
	else if(M.chem_doses[type] < 9)
		if(prob(50))
			M.Weaken(4)
		M.drowsyness = max(M.drowsyness, 30)
	else
		M.sleeping = max(M.sleeping, 30)
		M.drowsyness = max(M.drowsyness, 60)
	M.add_chemical_effect(CE_PULSE, -2)


/datum/reagent/promethazine/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.hallucination(60, 20)
	M.make_dizzy(5)
	M.make_jittery(5)
	M.drowsyness += 2
	M.emote(pick("twitch", "drool", "moan", "gasp"))
	M.adjustToxLoss(4)

/datum/reagent/ethaperazine
	name = "Ethaperazine"
	description = "A mild neuroleptic and anti-emetic. Provides relief from nausea and vomiting."
	taste_description = "sourness"
	reagent_state = LIQUID
	color = "#BF80BF"
	metabolism = 0.15
	data = 0
	overdose = 10
	scannable = 0

/datum/reagent/ethaperazine/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(M.chem_doses[type] < 3)
		if(M.chem_doses[type] == metabolism * 2 || prob(5))
			M.add_chemical_effect(CE_PAINKILLER, 5)
			M.add_chemical_effect(CE_ANTIVOMIT, 30)
			M.adjustToxLoss(-1 * removed)
	else if(M.chem_doses[type] < 6)
		M.add_chemical_effect(CE_PAINKILLER, 10)
		M.add_chemical_effect(CE_ANTIVOMIT, 40)
		M.adjustToxLoss(-2 * removed)
	else if(M.chem_doses[type] <= 10)//so 2/3 of syringe is still working
		if(prob(50))
			M.Weaken(4)
		M.drowsyness = max(M.drowsyness, 30)
		M.adjustToxLoss(-3 * removed)
	else
		M.sleeping = max(M.sleeping, 30)
		M.drowsyness = max(M.drowsyness, 60)
		M.adjustToxLoss(-3 * removed)
	M.add_chemical_effect(CE_PULSE, -1)


/datum/reagent/salbutamol
	name = "Salbutamol"
	description = "Salbutamol is used in the treatment of oxygen deprivation."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#0040FF"
	overdose = REAGENTS_OVERDOSE * 0.5
	scannable = 0
	flags = IGNORE_MOB_SIZE
	ingest_met = -1

/datum/reagent/salbutamol/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_VOX)
		M.adjustToxLoss(removed * 9)
	else if(alien != IS_DIONA)
		M.adjustOxyLoss(-25 * removed)

/datum/reagent/salbutamol/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.hallucination(60, 20)
	M.make_dizzy(5)
	M.make_jittery(5)
	M.drowsyness += 2
	M.emote(pick("twitch", "drool", "moan", "gasp"))
	M.adjustToxLoss(4)

/datum/reagent/promethazine
	name = "Promethazine"
	description = "That's the powerful neuroleptic."
	reagent_state = LIQUID
	color = "#FF80BF"
	metabolism = 0.12
	data = 0
	overdose = 16


/datum/reagent/promethazine/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(M.chem_doses[type] < 3)
		if(M.chem_doses[type] == metabolism * 2 || prob(5))
			M.add_chemical_effect(CE_PAINKILLER, 30)
			M.add_chemical_effect(CE_ANTIVOMIT, 30)
	else if(M.chem_doses[type] < 6)
		M.eye_blurry = max(M.eye_blurry, 20)
		M.add_chemical_effect(CE_PAINKILLER, 80)
		M.add_chemical_effect(CE_ANTIVOMIT, 80)
	else if(M.chem_doses[type] < 9)
		if(prob(50))
			M.Weaken(4)
		M.drowsyness = max(M.drowsyness, 30)
	else
		M.sleeping = max(M.sleeping, 30)
		M.drowsyness = max(M.drowsyness, 60)
	M.add_chemical_effect(CE_PULSE, -2)


/datum/reagent/promethazine/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.hallucination(60, 20)
	M.make_dizzy(5)
	M.make_jittery(5)
	M.drowsyness += 2
	M.emote(pick("twitch", "drool", "moan", "gasp"))
	M.adjustToxLoss(4)

/datum/reagent/ethaperazine
	name = "Ethaperazine"
	description = "That's the low-powerful neuroleptic. Also used as anti-vomit drug."
	taste_description = "sourness"
	reagent_state = LIQUID
	color = "#BF80BF"
	metabolism = 0.15
	data = 0
	overdose = 18

/datum/reagent/ethaperazine/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(M.chem_doses[type] < 3)
		if(M.chem_doses[type] == metabolism * 2 || prob(5))
			M.add_chemical_effect(CE_PAINKILLER, 5)
			M.adjustToxLoss(-1 * removed)
	else if(M.chem_doses[type] < 6)
		M.eye_blurry = max(M.eye_blurry, 20)
		M.add_chemical_effect(CE_PAINKILLER, 10)
		M.adjustToxLoss(-2 * removed)
	else if(M.chem_doses[type] < 9)
		if(prob(50))
			M.Weaken(4)
		M.drowsyness = max(M.drowsyness, 30)
		M.adjustToxLoss(-3 * removed)
	else
		M.sleeping = max(M.sleeping, 30)
		M.drowsyness = max(M.drowsyness, 60)
		M.adjustToxLoss(-3 * removed)
	M.add_chemical_effect(CE_PULSE, -1)


/datum/reagent/amidopyrinum
	name = "Amidopyrinum"
	description = "An effective and very addictive painkiller."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#800080"
	overdose = 7
	metabolism = 0.20
	flags = IGNORE_MOB_SIZE

/datum/reagent/amidopyrinum/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.add_chemical_effect(CE_PAINKILLER, 90)

/datum/reagent/amidopyrinum/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.druggy = max(M.druggy, 10)
	M.hallucination(60, 20)


/* /datum/reagent/sydnocarbum
	name = "Sydnocarbum"
	description = "Powerful military-grade psychostimulant."
	reagent_state = LIQUID
	color = "#FF80BF"
	metabolism = 0.15
	data = 0
	overdose = 10
	scannable = 0

/datum/reagent/sydnocarbum/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(prob(5))
		M.emote(pick("twitch", "blink_r", "shiver"))
	M.add_chemical_effect(CE_SPEEDBOOST, 0.1)
	M.add_chemical_effect(CE_PULSE, 2)
	if(volume <= 0.1 && M.chem_doses[type] >= 0.5 && world.time > data + ANTIDEPRESSANT_MESSAGE_DELAY)
		data = world.time
		M << "<span class='warning'>Something is must be wrong	...</span>"
	else
		if(world.time > data + ANTIDEPRESSANT_MESSAGE_DELAY)
			M << "<span class='notice'>You feel yourself much safer.</span>"

/datum/reagent/sydnocarbum/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.hallucination(60, 20)
	M.make_dizzy(5)
	M.make_jittery(5)
	M.confused += 2
	M.drowsyness += 2 */

/datum/reagent/phenazepam
	name = "Phenazepam"
	description = "That's the powerful tranquilizer."
	reagent_state = LIQUID
	color = "#FF80BF"
	metabolism = 0.1
	data = 0
	overdose = 16
	scannable = 0

/datum/reagent/phenazepam/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return

	if(M.chem_doses[type] < 3)
		if(M.chem_doses[type] == metabolism * 2 || prob(5))
			M.emote("yawn")
			M.add_chemical_effect(CE_PAINKILLER, 25)
	else if(M.chem_doses[type] < 6)
		M.eye_blurry = max(M.eye_blurry, 10)
		M.add_chemical_effect(CE_PAINKILLER, 60)
	else if(M.chem_doses[type] < 9)
		if(prob(50))
			M.Weaken(2)
		M.drowsyness = max(M.drowsyness, 20)
	else
		M.sleeping = max(M.sleeping, 20)
		M.drowsyness = max(M.drowsyness, 60)
	M.add_chemical_effect(CE_PULSE, -1)


/datum/reagent/phenazepam/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.hallucination(60, 20)
	M.emote(pick("twitch", "drool", "moan", "gasp"))
	M.adjustToxLoss(3)

/datum/reagent/angiotensin
	name = "angiotensin"
	description = "Effective Compound which helps restore bloodflow to the Brain and Organs. Useful for Toxin and Brain Damage."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#00a000"
	overdose = REAGENTS_OVERDOSE * 2
	metabolism = REM * 0.05
	scannable = 1
	flags = IGNORE_MOB_SIZE

/datum/reagent/angiotensin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.add_chemical_effect(CE_BRAIN_REGEN, 1)
		M.adjustToxLoss(-20 * removed)
		M.heal_organ_damage(1 * removed, 0)
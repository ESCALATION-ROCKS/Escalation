#define ANTIDEPRESSANT_MESSAGE_DELAY 5*60*10

////////////////COLDWAR MEDS

/////////////Conventional meds



/datum/reagent/aminocaproic
	name = "Aminocaproic Acid"
	description = "An anti-hemmorhage drug intended to stop acute bleeding and assist in blood clotting. Do NOT administer more than 60u or orally."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#605048"
	scannable = 1
	flags = IGNORE_MOB_SIZE
	overdose = 61
	metabolism = REM * 0.05
	ingest_met = -1

/datum/reagent/aminocaproic/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.add_chemical_effect(CE_HEMOSTATIC, 4)
		M.heal_organ_damage(3 * removed, 0)

/datum/reagent/aminocaproic/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.make_dizzy(10)
	M.make_jittery(10)
	if(M.losebreath < 2)
		M.losebreath++




/datum/reagent/salbutamol
	name = "Salbutamol"
	description = "A strong bronchodilator. Helps patients who have their airways obstructed in breathing. Do NOT administer more than 10u or orally."
	taste_description = "bitterness"
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#605048"
	scannable = 1
	flags = IGNORE_MOB_SIZE
	overdose = 11
	metabolism = 0.07
	ingest_met = -1

/datum/reagent/salbutamol/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	if(M.chem_doses[type] < 2)	//not that effective after initial rush
		M.add_chemical_effect(CE_PULSE, 0.5)
	else if(M.chem_doses[type] < 5)
		M.add_chemical_effect(CE_PULSE, 1)
		M.add_chemical_effect(CE_OXYGENATED, 0.5)
	else if(M.chem_doses[type] < 10)
		M.add_chemical_effect(CE_PULSE, 1)
		M.add_chemical_effect(CE_OXYGENATED, 0.5)
	if(M.chem_doses[type] > 10)
		M.add_chemical_effect(CE_PULSE, 3)
		M.add_chemical_effect(CE_OXYGENATED, -1)
		M.add_chemical_effect(CE_BREATHLOSS, 1)
		M.make_dizzy(5)

	/*if(alien == IS_VOX)
		M.adjustToxLoss(removed * 9)
	else if(alien != IS_DIONA)                         old stats
		M.adjustOxyLoss(-25 * removed)*/

/datum/reagent/salbutamol/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.hallucination(60, 20)
	M.add_chemical_effect(CE_PULSE, 3)
	M.add_chemical_effect(CE_OXYGENATED, -1)
	M.add_chemical_effect(CE_BREATHLOSS, 1)
	M.make_dizzy(5)
	M.drowsyness += 2


/datum/reagent/lorazepam
	name = "Lorazepam"
	description = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	taste_description = "sourness"
	reagent_state = LIQUID
	color = "#605048"
	scannable = 1
	flags = IGNORE_MOB_SIZE
	metabolism = 0.15
	overdose = 11

/datum/reagent/lorazepam/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
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



/datum/reagent/doxycycline
	name = "Doxycycline"
	description = "A broad spectrum antibiotic to fight against infections. Do NOT administer more than 15u."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#605048"
	scannable = 1
	flags = IGNORE_MOB_SIZE
	metabolism = 0.1
	overdose = 16

/datum/reagent/doxycycline/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.immunity = max(M.immunity - 0.1, 0)
	M.add_chemical_effect(CE_ANTIVIRAL, VIRUS_COMMON)
	if(volume > 10)
		M.immunity = max(M.immunity - 0.3, 0)
		M.add_chemical_effect(CE_ANTIVIRAL, VIRUS_ENGINEERED)
	if(M.chem_doses[type] > 15)
		M.immunity = max(M.immunity - 0.25, 0)

/datum/reagent/doxycycline/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.immunity = max(M.immunity - 0.25, 0)
	M.add_chemical_effect(CE_ANTIVIRAL, VIRUS_EXOTIC)
	if(prob(2))
		M.immunity_norm = max(M.immunity_norm - 1, 0)






/datum/reagent/angiotensin
	name = "Angiotensin"
	description = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#605048"
	scannable = 1
	flags = IGNORE_MOB_SIZE
	overdose = 6
	metabolism = 0.20

/datum/reagent/angiotensin/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.add_chemical_effect(CE_BRAIN_REGEN, 1)
		M.adjustToxLoss(-20 * removed)
		M.heal_organ_damage(1 * removed, 0)

/datum/reagent/angiotensin/overdose(var/mob/living/carbon/M, var/alien)
	if(alien != IS_DIONA)
		M.add_chemical_effect(CE_BRAIN_REGEN, -2)
		M.druggy = max(M.druggy, 2)
		M.make_dizzy(10)
		M.make_jittery(5)


////////////////////painkillers, listed by strength

/datum/reagent/paracetamol
	name = "Paracetamol"
	description = "Weak painkiller with a very slow metabolization speed. Meant for trivial injuries and cracked bones. Do NOT administer more than 20u."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#605048"
	scannable = 1
	flags = IGNORE_MOB_SIZE
	overdose = 21
	metabolism = 0.05

/datum/reagent/paracetamol/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	M.add_chemical_effect(CE_PAINKILLER, 30)

/datum/reagent/paracetamol/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.druggy = max(M.druggy, 2)
	M.make_dizzy(10)
	M.make_jittery(5)
	M.drowsyness += 2
	M.emote(pick("twitch", "drool", "moan", "gasp"))
	M.adjustToxLoss(1)



/datum/reagent/rohypnol
	name = "Rohypnol"
	description = "Mild painkiller for injured patients that require resting. Provides long-lasting pain relief and strong drowsiness. Do NOT administer more than 15u."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#605048"
	scannable = 1
	flags = IGNORE_MOB_SIZE
	metabolism = 0.12
	overdose = 16

/datum/reagent/rohypnol/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
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

/datum/reagent/rohypnol/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.hallucination(60, 20)
	M.make_dizzy(5)
	M.make_jittery(5)
	M.drowsyness += 2
	M.emote(pick("twitch", "drool", "moan", "gasp"))
	M.adjustToxLoss(4)






/datum/reagent/morphine
	name = "Morphine"
	description = "A strong painkiller with a quick metabolization speed, for life threatening injuries. Do NOT administer more than 10u or orally."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#605048"
	scannable = 1
	flags = IGNORE_MOB_SIZE
	overdose = 11
	metabolism = 0.10
	ingest_met = -1

/datum/reagent/morphine/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.add_chemical_effect(CE_PAINKILLER, 80)
	M.add_chemical_effect(CE_PULSE, 1)
	if(prob(5))
		M.emote(pick("twitch", "blink_r", "shiver"))
	if(volume <= 0.02 && M.chem_doses[type] >= 1 && world.time > data + ANTIDEPRESSANT_MESSAGE_DELAY * 0.3)
		data = world.time
		to_chat(M, "<span class='warning'>You feel antsy, your concentration wavers...</span>")
	else
		if(world.time > data + ANTIDEPRESSANT_MESSAGE_DELAY * 0.3)
			data = world.time
			to_chat(M, "<span class='notice'>You feel better.</span>")

/datum/reagent/morphine/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.make_dizzy(10)
	M.make_jittery(10)
	if(M.losebreath < 2)
		M.losebreath++





/datum/reagent/fentanyl
	name = "Fentanyl"
	description = "A very strong painkiller with a swift metabolization speed, meant for patients in shock. Do NOT administer more than 5u."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#605048"
	scannable = 1
	flags = IGNORE_MOB_SIZE
	overdose = 6
	metabolism = 0.20
	
/datum/reagent/fentanyl/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.add_chemical_effect(CE_PAINKILLER, 150)
	M.add_chemical_effect(CE_PULSE, 1)
	if(prob(5))
		M.emote(pick("twitch", "blink_r", "shiver"))
	if(volume <= 0.02 && M.chem_doses[type] >= 1 && world.time > data + ANTIDEPRESSANT_MESSAGE_DELAY * 0.3)
		data = world.time
		to_chat(M, "<span class='warning'>You feel antsy, your concentration wavers...</span>")
	else
		if(world.time > data + ANTIDEPRESSANT_MESSAGE_DELAY * 0.3)
			data = world.time
			to_chat(M, "<span class='notice'>You feel better.</span>")

/datum/reagent/fentanyl/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.druggy = max(M.druggy, 10)
	M.hallucination(60, 20)
	M.make_dizzy(10)
	M.make_jittery(10)
	if(M.losebreath < 2)
		M.losebreath++



/datum/reagent/thiopental
	name = "Sodium Thiopental"
	description = "A rapid-onset sedative for surgical operations. Do NOT administer more than 5u."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#00a000"
	scannable = 1
	flags = IGNORE_MOB_SIZE
	metabolism = 0.05
	overdose = 6

/datum/reagent/thiopental/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien != IS_DIONA)
		M.druggy = max(M.druggy, 60)
		M.sleeping = max(M.sleeping, 60)
		M.drowsyness = max(M.drowsyness, 60)
		M.add_chemical_effect(CE_PAINKILLER, 65)

/datum/reagent/thiopental/overdose(var/mob/living/carbon/M, var/alien)
	if(alien != IS_DIONA)
		M.druggy = max(M.druggy, 60)
		M.hallucination(150)
		M.add_chemical_effect(CE_NOPULSE , 150)



/datum/reagent/naloxone
	name = "Naloxone"
	description = "An opioid antagonist meant to neutralize the effects of morphine and prevent overdose. Do NOT administer more than 15u."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#605048"
	scannable = 1
	flags = IGNORE_MOB_SIZE
	metabolism = 0.15
	overdose = 16

/datum/reagent/naloxone/affect_blood(var/mob/living/carbon/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return
	M.dizziness = 0
	M.drowsyness = 0
	M.stuttering = 0
	M.confused = 0
	if(M.ingested)
		for(var/datum/reagent/R in M.ingested.reagent_list)
			if(istype(R, /datum/reagent/morphine))
				M.chem_doses[R.type] = max(M.chem_doses[R.type] - removed * 5, 0)
			else if(istype(R, /datum/reagent/tramadol))
				M.chem_doses[R.type] = max(M.chem_doses[R.type] - removed * 5, 0)

/datum/reagent/naloxone/overdose(var/mob/living/carbon/M, var/alien)
	..()
	M.make_dizzy(10)
	M.make_jittery(10)
	if(M.losebreath < 2)
		M.losebreath++

/datum/reagent/epinephrine
	name = "Epinephrine"
	description = "Adrenaline is a hormone used as a drug to treat cardiac arrest and other cardiac dysrhythmias resulting in diminished or absent cardiac output."
	taste_description = "excitement"
	reagent_state = LIQUID
	color = "#605048"
	scannable = 1
	flags = IGNORE_MOB_SIZE
	overdose = 10
	metabolism = 0.1

/datum/reagent/epinephrine/affect_blood(var/mob/living/carbon/human/M, var/alien, var/removed)
	if(alien == IS_DIONA)
		return

	if(M.chem_doses[type] < 0.2)	//not that effective after initial rush
		M.add_chemical_effect(CE_PAINKILLER, min(20*volume, 80))
		M.add_chemical_effect(CE_PULSE, 1)
	else if(M.chem_doses[type] < 1)
		M.add_chemical_effect(CE_PAINKILLER, min(10*volume, 20))
		M.add_chemical_effect(CE_PULSE, 2)
	if(M.chem_doses[type] > 5)
		M.make_jittery(5)
	if(volume >= 5 && M.is_asystole())
		remove_self(5)
		M.resuscitate()

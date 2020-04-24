var/datum/antagonist/replicant/replicants

/datum/antagonist/replicant
	role_text = "Replicant"
	role_text_plural = "Replicants"
	welcome_text = "<b>All systems nominal.</b>\
		You were sent on this station to complete your objectives by your <b>employers</b>. \
		Use the ethanol to recharge your own battery. Alcoholic drinks will be fine too. \
		Follow your directives, complete mission and <b>DO NOT</b> compromise yourself."

	id = MODE_REPLICANT
	hard_cap = 1
	hard_cap_round = 1
	initial_spawn_req = 1
	initial_spawn_target = 6
	antaghud_indicator = "hudrenegade"
	valid_species = SPECIES_REPLICANT
	mob_path = /mob/living/carbon/human/replicant/
	flags = ANTAG_OVERRIDE_JOB | ANTAG_CLEAR_EQUIPMENT | ANTAG_CHOOSE_NAME | ANTAG_VOTABLE
	landmark_id = "Replicant"

/datum/antagonist/replicant/New(var/datum/mind/replicant)
	..()
	replicants = src

/datum/antagonist/replicant/create_objectives(var/datum/mind/replicant)
	if(!..())
		return

	var/kill
	var/survive
	var/protect

	switch(rand(1,100))
		if(1 to 50)
			survive = 1
			kill = 1
		else
			protect = 1
			kill = 1

	if(kill)
		var/datum/objective/assassinate/kill_objective1 = new
		kill_objective1.owner = replicant
		kill_objective1.find_target()
		replicant.objectives |= kill_objective1
		var/datum/objective/assassinate/kill_objective2 = new
		kill_objective2.owner = replicant
		kill_objective2.find_target()
		replicant.objectives |= kill_objective2
		var/datum/objective/assassinate/kill_objective3 = new
		kill_objective3.owner = replicant
		kill_objective3.find_target()
		replicant.objectives |= kill_objective3
		var/datum/objective/assassinate/kill_objective4 = new
		kill_objective4.owner = replicant
		kill_objective4.find_target()
		replicant.objectives |= kill_objective4
		var/datum/objective/assassinate/kill_objective5 = new
		kill_objective5.owner = replicant
		kill_objective5.find_target()
		replicant.objectives |= kill_objective5
	if(survive)
		var/datum/objective/survive/survive_objective = new
		survive_objective.owner = replicant
		replicant.objectives |= survive_objective
	if(protect)
		var/datum/objective/protect/protect_objective = new
		protect_objective.owner = replicant
		replicant.objectives |= protect_objective
	return



/datum/antagonist/replicant/equip(var/mob/living/carbon/human/player)
	player.set_species("Replicant")
	player.regenerate_icons()
	player.update_hud()

	if(!..())
		return

/*	var/gun_type = pick(spawn_guns)
	if(islist(gun_type))
		gun_type = pick(gun_type)
	var/obj/item/gun = new gun_type(get_turf(player))

	// Attempt to put into a container.
	if(player.equip_to_storage(gun))
		return

	// If that failed, attempt to put into any valid non-handslot
	if(player.equip_to_appropriate_slot(gun))
		return

	// If that failed, then finally attempt to at least let the player carry the weapon
	player.put_in_hands(gun)
*/
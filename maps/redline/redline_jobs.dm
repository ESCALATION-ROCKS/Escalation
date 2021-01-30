/datum/map/redline
	allowed_jobs = list(/datum/job/stationco,
						/datum/job/intendant,
						/datum/job/merchant,
						/datum/job/adjutant,
						/datum/job/sergeant,
						/datum/job/chieftechnician,
						/datum/job/waiter,
						/datum/job/surgerist,
						/datum/job/patrolman,
						/datum/job/nurse,
						/datum/job/therapist,
						/datum/job/techniciandeputy,
						/datum/job/barkeeper,
						/datum/job/assistant
						)


/datum/job/stationco
	title = "Station Commanding Officer"
	supervisors = "the Remnants Counsil and the Laws of the Underground"
	minimal_player_age = 25
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/redline/chief
	selection_color = "#d9a744"
	account_allowed = 0
	announced = FALSE
	total_positions = 1
	spawn_positions = 1

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 4), rand(3,4), 0, 0, rand(0,1), rand(0,2), rand(0,1), rand(3,5), 0, rand(0,1))


/datum/job/adjutant
	title = "Adjutant"
	supervisors = "Station Commanding Officer"
	minimal_player_age = 21
	economic_modifier = 3
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/redline/adjutant
	selection_color = "#d9a744"
	account_allowed = 0
	announced = FALSE
	total_positions = 1
	spawn_positions = 1

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(2, 4), rand(3,4), 0, 0, rand(0,1), rand(0,2), rand(2,3), rand(1,3), 0, rand(0,1))


/datum/job/sergeant
	title = "VPP Sergeant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Station Commanding Officer"
	economic_modifier = 4
	minimal_player_age = 21
	ideal_character_age = 27
	outfit_type = /decl/hierarchy/outfit/job/redline/remnantssoldier/sarge
	selection_color = "#b5383c"
	account_allowed = 0
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(2, 4), rand(3,4), 0, 0, rand(0,1), rand(0,2), rand(2,3), rand(1,2), 0, rand(0,1))

/datum/job/patrolman
	title = "VPP Grunt"
	total_positions = 4
	spawn_positions = 4
	supervisors = "your sergeant and command"
	economic_modifier = 2
	minimal_player_age = 21
	ideal_character_age = 27
	outfit_type = /decl/hierarchy/outfit/job/redline/remnantssoldier/
	selection_color = "#b5383c"
	account_allowed = 0
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(2, 4), rand(3,4), 0, 0, rand(0,1), rand(0,2), rand(0,1),0, 0, rand(0,1))

/datum/job/merchant
	title = "Merchant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the invisible hand of the market"
	economic_modifier = 4
	minimal_player_age = 25
	ideal_character_age = 30
	outfit_type = /decl/hierarchy/outfit/job/redline/merchant
	selection_color = "#d9a744"
	account_allowed = 0
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(0, 2), rand(0,2), rand(0,1), 0, rand(0,1), rand(0,2), rand(2,3), 0, 0, rand(0,1))

/datum/job/intendant
	title = "Intendant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Station Commanding Officer"
	economic_modifier = 2
	minimal_player_age = 25
	ideal_character_age = 30
	outfit_type = /decl/hierarchy/outfit/job/redline/intendant
	selection_color = "#d9a744"
	account_allowed = 0
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(2, 4), rand(3,4), 0, 0, rand(0,1), rand(0,2), rand(1,2), rand(1,2), 0, rand(0,1))

/datum/job/barkeeper
	title = "Barkeeper"
	total_positions = 1
	spawn_positions = 1
	supervisors = "an invisible hand of the market"
	economic_modifier = 2
	minimal_player_age = 21
	ideal_character_age = 25
	outfit_type = /decl/hierarchy/outfit/job/redline/barkeeper
	selection_color = "#7e9391"
	account_allowed = 0
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 3), rand(0,2), 0, 0, rand(0,1), rand(0,2), rand(2,3), rand(1,2), 0, rand(1,3))

/datum/job/waiter
	title = "Waiter"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Barkeeper"
	economic_modifier = 2
	minimal_player_age = 21
	ideal_character_age = 25
	outfit_type = /decl/hierarchy/outfit/job/redline/waiter
	selection_color = "#7e9391"
	account_allowed = 0
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(0,2), 0, 0, rand(0,1), rand(0,2), 0, 0, 0, rand(1,3))

/datum/job/techniciandeputy
	title = "Technician Deputy"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Chief Technician"
	economic_modifier = 0.5
	minimal_player_age = 17
	ideal_character_age = 23
	outfit_type = /decl/hierarchy/outfit/job/redline/technician
	selection_color = "#7e9391"
	account_allowed = 0
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 3), rand(0,1), rand(2,3), rand(2,4), rand(0,1), rand(0,2), 0, 0, 0, rand(0,1))

/datum/job/chieftechnician
	title = "Chief Technician"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Station Commanding Officer"
	economic_modifier = 4
	minimal_player_age = 30
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/redline/chieftech
	selection_color = "#d9a744"
	account_allowed = 0
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(0,2), rand(3,4), rand(3,4), rand(0,1), rand(0,2), rand(2,3), rand(1,3), 0, rand(0,1))

/datum/job/surgerist
	title = "Surgerist"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Station Commanding Officer"
	economic_modifier = 4
	minimal_player_age = 25
	ideal_character_age = 30
	outfit_type = /decl/hierarchy/outfit/job/redline/surgerist
	selection_color = "#d9a744"
	account_allowed = 0
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(0, 2), rand(0,1),0, 0, rand(4,5), rand(0,2), rand(2,3), rand(2,3), 0, rand(0,1))

/datum/job/nurse
	title = "Nurse"
	total_positions = 4
	spawn_positions = 4
	supervisors = "surgerist"
	economic_modifier = 2
	minimal_player_age = 18
	ideal_character_age = 25
	outfit_type = /decl/hierarchy/outfit/job/redline/nurse
	selection_color = "#97caf9"
	account_allowed = 0
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(0, 2), rand(0,1),0, 0, rand(1,4), rand(0,2), 0, 0, 0, rand(0,1))

/datum/job/therapist
	title = "Therapist"
	total_positions = 1
	spawn_positions = 1
	supervisors = "surgerist"
	economic_modifier = 3
	minimal_player_age = 22
	ideal_character_age = 25
	outfit_type = /decl/hierarchy/outfit/job/redline/therapist
	selection_color = "#97caf9"
	account_allowed = 0
	announced = FALSE
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(0, 2), rand(0,1),0, 0, rand(3,4), rand(0,2), 0, rand(1,2), 0, rand(0,1))

/datum/job/assistant
	title = "Refugee"
	total_positions = 7
	spawn_positions = 7
	supervisors = "your own will"
	economic_modifier = 0.5
	minimal_player_age = 17
	ideal_character_age = 23
	outfit_type = /decl/hierarchy/outfit/job/redline/refugee
	selection_color = "#7e9391"
	alt_titles = null
	account_allowed = 0
	announced = FALSE
	create_record = 0
	latejoin_at_spawnpoints = 1
	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(0, 3), rand(0,2),rand(0,1), rand(0,1), rand(0,1), rand(0,2), rand(0,1), 0, rand(0,1), rand(0,1))

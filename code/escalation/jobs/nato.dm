//USMC

/datum/job/escalation/usmc
	title = "United States Marine Corps"
	enabled = 0
	faction_tag = "usmc"
	military_faction = NATO
	equip(var/mob/living/carbon/human/H)
		..()
		H.fraction = "NATO"

/datum/job/escalation/usmc/usmcplatlead
	title = "USMC Platoon Leader"
	name = "Platoon Leader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/platlead
	selection_color = "#B0C4DE"
	rank_number = 0
	position = "team"
	enabled = 0
	leading = 0
	amount = 0
	whitelist_rank = "usmc_officer"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 80)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 4, 0)

/datum/job/escalation/usmc/usmcplatleaddep
	title = "USMC Platoon Leader Deputy"
	name = "Platoon Leader Deputy"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/platleaddep
	selection_color = "#B0C4DE"
	amount = 1
	rank_number = 1
	enabled = 0
	position = "team"
	whitelist_rank = "usmc_nco"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 60)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 3, 0)

/datum/job/escalation/usmc/usmcratelo
	title = "USMC Radiotelephone Operator"
	name = "Radiotelephone Operator"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/ratelo
	selection_color = "#B0C4DE"
	amount = 1
	enabled = 0
	rank_number = 2
	position = "team"
	whitelist_rank = "usmc_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 100, LANGUAGE_FINNISH = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 2, 0)

/datum/job/escalation/usmc/messenger
	title = "USMC Messenger"
	name = "Messenger"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/messenger
	selection_color = "#B0C4DE"
	amount = 2
	position = "team"
	enabled = 0
	rank_number = 2
	whitelist_rank = "usmc_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 20, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/usmc/usmccorpsman
	title = "USMC Corpsman"
	name = "Corpsman"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/corpsman
	selection_color = "#B0C4DE"
	position = "team"
	enabled = 1
	amount = 1
	whitelist_rank = "usmc_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 30, LANGUAGE_RUSSIAN = 30, LANGUAGE_FINNISH = 30)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 3, 1, 1, 0)

/datum/job/escalation/usmc/usmcsurgerist
	title = "USMC Field Surgeon"
	name = "Field Surgeon"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/doctor
	selection_color = "#B0C4DE"
	amount = 1
	enabled = 0
	position = "team"
	whitelist_rank = "usmc_officer"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 80)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 5, 1, 2, 0)

/datum/job/escalation/usmc/usmcmarksman
	title = "USMC Designated Marksman"
	name = "Designated Marksman"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/marksman
	selection_color = "#B0C4DE"
	position = "team"
	enabled = 1
	amount = 1
	whitelist_rank = "usmc_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 2, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/usmc/usmcquartermaster
	title = "USMC Quartermaster"
	name = "Quartermaster"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/quartermaster
	selection_color = "#B0C4DE"
	amount = 1
	enabled = 0
	whitelist_rank = "usmc_nco"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/usmc/usmcmgcom
	title = "USMC HWS Commander"
	name = "Heavy Weapon Section Commander"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/hws_commander
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usmc_nco"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/usmc/usmcmgload
	title = "USMC HWS Loader"
	name = "Heavy Weapon Loader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/hws_loader
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usmc_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/usmc/usmcmgop
	title = "USMC HWS Operator"
	name = "Heavy Weapon Operator"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/hws_operator
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usmc_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/usmc/usmcsl
	title = "USMC Squad Leader"
	name = "Squad Leader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/sl
	selection_color = "#B0C4DE"
	amount = 1
	rank_number = 2
	position = "fireteam"
	enabled = 1
	whitelist_rank = "usmc_nco"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/usmc/usmcftl
	title = "USMC Fireteam Leader"
	name = "Fireteam Leader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/ftleader
	selection_color = "#B0C4DE"
	account_allowed = 0
	announced = FALSE
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usmc_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 40, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 2, 0)

/datum/job/escalation/usmc/usmcfto
	title = "USMC Rifleman"
	name = "Fireteam Rifleman"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/rifleman
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usmc_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/usmc/usmcftmg
	title = "USMC Fireteam Machinegunner"
	name = "Fireteam Machinegunner"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/mgunner
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usmc_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 1, 0)

/datum/job/escalation/usmc/usmcftg
	title = "USMC Fireteam Grenadier"
	name = "Fireteam Grenadier"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/grenadier
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 6
	enabled = 1
	whitelist_rank = "usmc_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 1, 0)

/datum/job/escalation/usmc/usmcftmga
	title = "USMC Fireteam Machinegunner Assistant"
	name = "Fireteam Machinegunner Assistant"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/mgunnera
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usmc_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


/datum/job/escalation/usmc/usmcatcom
	title = "USMC AT Commander"
	name = "ATS Team Leader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/atcommander
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usmc_nco"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/usmc/usmcat
	title = "USMC AT Gunner"
	name = "ATS Gunner"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/atgunner
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usmc_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/usmc/usmcata
	title = "USMC AT Asistant"
	name = "ATS Assistant Rifleman"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usmc/atass
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usmc_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

////////////////////////////////////////////////////////////////////BDW

/datum/job/escalation/bund
	title = "Bundeswehr"
	enabled = 0
	faction_tag = "bund" //The tag of the faction this job is a part of, for lookups
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes
	military_faction = NATO
	equip(var/mob/living/carbon/human/H)
		..()
		H.fraction = "NATO"

/datum/job/escalation/bund/bdwplatlead
	title = "BDW Zugfuhrer"
	name = "Zugfuhrer"
	english_name = "Platoon Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/platlead
	selection_color = "#4682B4"
	rank_number = 0
	position = "team"
	leading = 1
	amount = 1
	enabled = 1
	whitelist_rank = "bdw_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 4, 0)

/datum/job/escalation/bund/bdwplatleaddep
	title = "BDW Zugfuhrerassistant"
	name = "Zugfuhrerassistant"
	english_name = "Platoon Leader Deputy"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/platleaddep
	selection_color = "#4682B4"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "bdw_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 3, 0)

/datum/job/escalation/bund/bdwratelo
	title = "BDW Funktelefonbetreiber"
	name = "Funktelefonbetreiber"
	english_name = "HQ Radioman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/ratelo
	selection_color = "#4682B4"
	position = "team"
	amount = 1
	rank_number = 2
	enabled = 1
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 20)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 2, 0)

/datum/job/escalation/bund/bdwmessenger
	title = "BDW Bote"
	name = "Bote"
	english_name = "Messenger"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/messenger
	selection_color = "#4682B4"
	position = "team"
	amount = 3
	rank_number = 2
	enabled = 0
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/bund/bdwcorpsman
	title = "BDW Sanitaterschutze"
	name = "Sanitaterschutze"
	english_name = "Field Medic"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/corpsman
	selection_color = "#4682B4"
	position = "team"
	amount = 4
	rank_number = 2
	enabled = 1
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 35)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 3, 1, 1, 0)

/datum/job/escalation/bund/bdwsurgerist
	title = "BDW Feldchirurg"
	name = "Feldchirurg"
	english_name = "Field Surgeon"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/doctor
	selection_color = "#4682B4"
	position = "team"
	amount = 1
	rank_number = 2
	enabled = 1
	whitelist_rank = "bdw_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 80, LANGUAGE_RUSSIAN = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 5, 1, 2, 0)

/datum/job/escalation/bund/bdwsl
	title = "BDW Gruppenfuhrer"
	name = "Gruppenfuhrer"
	english_name = "Squad Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/sqleader
	selection_color = "#4682B4"
	position = "fireteam"
	amount = 1
	leading = 1
	enabled = 1
	whitelist_rank = "bdw_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 80, LANGUAGE_RUSSIAN = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/bund/bdwsld
	title = "BDW Gruppenfuhrer Stellvertretender"
	name = "Gruppenfuhrer Stellvertretender"
	english_name = "Squad Leader Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/sqleaderdep
	selection_color = "#4682B4"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 2, 0)

/datum/job/escalation/bund/bdwsm
	title = "BDW Scharfschutze"
	name = "Scharfschutze"
	english_name = "Marksman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/marksman
	selection_color = "#4682B4"
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 2, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/bund/bdwmg
	title = "BDW Machinengewehrschutze"
	name = "Machinengewehrschutze"
	english_name = "Machinegunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/mgunner
	selection_color = "#4682B4"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/bund/bdwmgas
	title = "BDW Machinengewehrschutze Stellvertretender"
	name = "Machinengewehrschutze Stellvertretender"
	english_name = "Machinegunner Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/mgunnera
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/bund/bdwgrenadier
	title = "BDW Grenadier"
	name = "Grenadier"
	english_name = ""
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/grenadier
	selection_color = "#4682B4"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/bund/bdwsqradio
	title = "BDW Squad Radio Operator"
	name = "Gruppenfunker"
	english_name = "Squad Radioman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/radioman
	selection_color = "#4682B4"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/bund/bdwrifle
	title = "BDW Schutze"
	name = "Schutze"
	english_name = "Rifleman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/rifleman
	selection_color = "#4682B4"
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


/datum/job/escalation/bund/mgcom
	title = "BDW HWS Commander"
	name = "Schwere Waffen Gruppenfuhrer"
	english_name = "Heavy Weapons Section Commander"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/sqleader
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "bdw_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/bund/mgload
	title = "BDW HWS Loader"
	name = "Schwere Waffen Gruppe Ladeschutze"
	english_name = "Heavy Weapons Section Loader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/rifleman
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/bund/mgop
	title = "BDW HWS Operator"
	name = "Schwere Waffen Gruppe Schutze"
	english_name = "Heavy Weapons Section Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/rifleman
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 3)


	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/bund/bdwatlead
	title = "BDW AT Gruppenfuhrer"
	name = "Panzerabwehrschutze Gruppenfuhrer"
	english_name = "AT Group Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/bdwatlead
	selection_color = "#4682B4"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 0
	whitelist_rank = "bdw_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 30, LANGUAGE_RUSSIAN = 35)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/bund/bdwatgun
	title = "BDW Panzerfaustschutze"
	name = "Panzerfaustschutze"
	english_name = "AT Group Gunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/bdwatkanonier
	selection_color = "#4682B4"
	rank_number = 2
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/bund/bdwatasst
	title = "BDW Panzerfaustschutze Assistant"
	name = "Panzerfaustschutze Stellvertretender"
	english_name = "AT Group Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/escalation/nato/bundes/bdwatassist
	selection_color = "#4682B4"
	rank_number = 3
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "bdw_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

////////////////////////////////////////////BAF///////////////////////////////////////////////

/datum/job/escalation/baf
	title = "British Armed Forces"
	enabled = 0
	faction_tag = "baf"
	military_faction = NATO
	equip(var/mob/living/carbon/human/H)
		..()
		H.fraction = "NATO"

/datum/job/escalation/baf/bafplatlead
	title = "BAF Platoon Leader"
	name = "Platoon Leader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/platlead
	selection_color = "#B0C4DE"
	rank_number = 0
	position = "team"
	enabled = 1
	leading = 1
	amount = 1
	whitelist_rank = "baf_officer"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 80, LANGUAGE_FINNISH = 80)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 4, 0)

/datum/job/escalation/baf/bafplatleaddep
	title = "BAF Platoon Leader Deputy"
	name = "Platoon Leader Deputy"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/platleaddep
	selection_color = "#B0C4DE"
	amount = 1
	rank_number = 1
	enabled = 1
	position = "team"
	whitelist_rank = "baf_nco"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 60, LANGUAGE_FINNISH = 60)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 3, 0)

/datum/job/escalation/baf/bafratelo
	title = "BAF Radiotelephone Operator"
	name = "Radiotelephone Operator"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/rto
	selection_color = "#B0C4DE"
	amount = 1
	enabled = 1
	rank_number = 2
	position = "team"
	whitelist_rank = "baf_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 40, LANGUAGE_FINNISH = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 2, 0)


/datum/job/escalation/baf/bafmedic
	title = "BAF Field Medic"
	name = "Field Medic"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/medic
	selection_color = "#B0C4DE"
	position = "team"
	enabled = 1
	amount = 4
	whitelist_rank = "baf_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 30, LANGUAGE_RUSSIAN = 10, LANGUAGE_FINNISH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 3, 1, 1, 0)

/datum/job/escalation/baf/bafsurgeon
	title = "BAF Field Surgeon"
	name = "Field Surgeon"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/doctor
	selection_color = "#B0C4DE"
	amount = 1
	enabled = 1
	position = "team"
	whitelist_rank = "baf_officer"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 80, LANGUAGE_FINNISH = 80)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 5, 1, 2, 0)

/datum/job/escalation/baf/bafmarksman
	title = "BAF Designated Marksman"
	name = "Designated Marksman"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/marksman
	selection_color = "#B0C4DE"
	position = "team"
	enabled = 1
	amount = 1
	whitelist_rank = "baf_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10, LANGUAGE_FINNISH = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 2, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/baf/bafsl
	title = "BAF Squad Leader"
	name = "Squad Leader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/sl
	selection_color = "#B0C4DE"
	amount = 1
	rank_number = 2
	position = "fireteam"
	enabled = 1
	whitelist_rank = "baf_nco"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 10, LANGUAGE_FINNISH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/baf/bafftl
	title = "BAF Fireteam Leader"
	name = "Fireteam Leader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/ftleader
	selection_color = "#B0C4DE"
	account_allowed = 0
	announced = FALSE
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "baf_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 40, LANGUAGE_RUSSIAN = 10, LANGUAGE_FINNISH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 2, 0)

/datum/job/escalation/baf/baffto
	title = "BAF Rifleman"
	name = "Fireteam Rifleman"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/rifleman
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "baf_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5, LANGUAGE_FINNISH = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/baf/bafat
	title = "BAF AT Gunner"
	name = "AT Gunner"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/atgunner
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "baf_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5, LANGUAGE_FINNISH = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/baf/bafata
	title = "BAF AT Asistant"
	name = "AT Assistant Rifleman"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/atass
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "baf_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5, LANGUAGE_FINNISH = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


/datum/job/escalation/baf/bafftmg
	title = "BAF Fireteam Machinegunner"
	name = "Fireteam Machinegunner"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/mgunner
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "baf_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5, LANGUAGE_FINNISH = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/baf/bafftmga
	title = "BAF Fireteam Machinegunner Assistant"
	name = "Fireteam Machinegunner Assistant"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/mgunnera
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "baf_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5, LANGUAGE_FINNISH = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/baf/bafmgcom
	title = "BAF HWS Commander"
	name = "Heavy Weapon Section Commander"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/hws_commander
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "baf_nco"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10, LANGUAGE_FINNISH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/baf/bafmgload
	title = "BAF HWS Loader"
	name = "Heavy Weapon Loader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/hws_loader
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "baf_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10, LANGUAGE_FINNISH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/baf/bafmgop
	title = "BAF HWS Operator"
	name = "Heavy Weapon Operator"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/baf/hws_operator
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "baf_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10, LANGUAGE_FINNISH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/////////////USA///////
/datum/job/escalation/usa
	title = "United States Army"
	enabled = 0
	faction_tag = "usa"
	military_faction = NATO
	equip(var/mob/living/carbon/human/H)
		..()
		H.fraction = "NATO"

/datum/job/escalation/usa/usaplatlead
	title = "USA Platoon Leader"
	name = "Platoon Leader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/platlead
	selection_color = "#B0C4DE"
	rank_number = 0
	position = "team"
	enabled = 1
	leading = 1
	amount = 1
	whitelist_rank = "usa_officer"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 80)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 4, 0)

/datum/job/escalation/usa/usaplatleaddep
	title = "USA Platoon Leader Deputy"
	name = "Platoon Leader Deputy"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/platleaddep
	selection_color = "#B0C4DE"
	amount = 1
	rank_number = 1
	enabled = 1
	position = "team"
	whitelist_rank = "usa_nco"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 60)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 3, 0)

/datum/job/escalation/usa/usaratelo
	title = "USA Radiotelephone Operator"
	name = "Radiotelephone Operator"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/rto
	selection_color = "#B0C4DE"
	amount = 1
	enabled = 1
	rank_number = 2
	position = "team"
	whitelist_rank = "usa_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 2, 0)

/datum/job/escalation/usa/messenger
	title = "USA Messenger"
	name = "Messenger"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/messenger
	selection_color = "#B0C4DE"
	amount = 2
	position = "team"
	enabled = 0
	rank_number = 2
	whitelist_rank = "usa_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 20, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/usa/usamedic
	title = "USA Field Medic"
	name = "Field Medic"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/medic
	selection_color = "#B0C4DE"
	position = "team"
	enabled = 1
	amount = 4
	whitelist_rank = "usa_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 30, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 3, 1, 1, 0)

/datum/job/escalation/usa/usasurgeon
	title = "USA Field Surgeon"
	name = "Field Surgeon"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/doctor
	selection_color = "#B0C4DE"
	amount = 1
	enabled = 1
	position = "team"
	whitelist_rank = "usa_officer"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 80)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 5, 1, 2, 0)

/datum/job/escalation/usa/usamarksman
	title = "USA Designated Marksman"
	name = "Designated Marksman"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/marksman
	selection_color = "#B0C4DE"
	position = "team"
	enabled = 1
	amount = 1
	whitelist_rank = "usa_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 2, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/usa/usaquartermaster
	title = "USA Quartermaster"
	name = "Quartermaster"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/quartermaster
	selection_color = "#B0C4DE"
	amount = 1
	enabled = 0
	whitelist_rank = "usa_nco"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/usa/usasl
	title = "USA Squad Leader"
	name = "Squad Leader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/sl
	selection_color = "#B0C4DE"
	amount = 1
	rank_number = 2
	position = "fireteam"
	enabled = 1
	whitelist_rank = "usa_nco"
	also_known_languages = list(LANGUAGE_GERMAN = 100, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/usa/usaftl
	title = "USA Fireteam Leader"
	name = "Fireteam Leader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/ftleader
	selection_color = "#B0C4DE"
	account_allowed = 0
	announced = FALSE
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usa_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 40, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 2, 0)

/datum/job/escalation/usa/usafto
	title = "USA Rifleman"
	name = "Fireteam Rifleman"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/rifleman
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usa_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/usa/usaftmg
	title = "USA Fireteam Machinegunner"
	name = "Fireteam Machinegunner"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/mgunner
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usa_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/usa/usaftg
	title = "USA Fireteam Grenadier"
	name = "Fireteam Grenadier"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/grenadier
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 6
	enabled = 1
	whitelist_rank = "usa_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/usa/usaftmga
	title = "USA Fireteam Machinegunner Assistant"
	name = "Fireteam Machinegunner Assistant"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/mgunnera
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usa_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


/datum/job/escalation/usa/usamgcom
	title = "USA HWS Commander"
	name = "Heavy Weapon Section Commander"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/hws_commander
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usa_nco"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/usa/usamgload
	title = "USA HWS Loader"
	name = "Heavy Weapon Loader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/hws_loader
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usa_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/usa/usamgop
	title = "USA HWS Operator"
	name = "Heavy Weapon Operator"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/hws_operator
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usa_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/usa/usaatcom
	title = "USA AT Commander"
	name = "ATS Team Leader"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/atcommander
	selection_color = "#B0C4DE"
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usa_nco"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/usa/usaat
	title = "USA AT Gunner"
	name = "ATS Gunner"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/atgunner
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usa_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/usa/usaata
	title = "USA AT Asistant"
	name = "ATS Assistant Rifleman"
	english_name = null
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/usa/atass
	selection_color = "#B0C4DE"
	rank_number = 6
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "usa_enlisted"
	also_known_languages = list(LANGUAGE_GERMAN = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

//Soviet Army
/datum/job/escalation/cccp
	title = "cccp"
	enabled = 0
	faction_tag = "cccp"
	military_faction = WARPAC
	equip(var/mob/living/carbon/human/H)
		..()
		H.fraction = "WP"

/datum/job/escalation/cccp/saplatlead
	title = "SA Komandir Vzvoda"
	name = "Komandir Vzvoda"
	english_name = "Platoon Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/komvzv
	selection_color = "#B22222"
	rank_number = 0
	position = "team"
	leading = 1
	amount = 1
	enabled = 1
	whitelist_rank = "sa_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_GERMAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 3, 0, rand(0,1))

/datum/job/escalation/cccp/saplatleaddep
	title = "SA Zamestitel Komandira Vzvoda"
	name = "Zamestitel' Komandira Vzvoda"
	english_name = "Platoon Leader Deputy"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/zamkomvzv
	selection_color = "#B22222"
	rank_number = 2
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_GERMAN = 60)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 2, 0, rand(0,1))

/datum/job/escalation/cccp/sazampolit
	title = "SA Zampolit"
	name = "Zampolit"
	english_name = "Political Commisar"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/zampolit
	selection_color = "#B22222"
	rank_number = 2
	position = "team"
	amount = 1
	enabled = 0
	whitelist_rank = "sa_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_GERMAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), rand(3,4), 0, rand(0,1))

/datum/job/escalation/cccp/sastarshina
	title = "SA Starshina"
	name = "Starshina"
	english_name = "Staff Sergeant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/starshina
	selection_color = "#B22222"
	rank_number = 3
	position = "team"
	amount = 1
	enabled = 0
	whitelist_rank = "sa_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_GERMAN = 60)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 2, 0, rand(0,1))

/datum/job/escalation/cccp/saplmg
	title = "SA Vzvodny Pulemetchik"
	name = "Vzvodny Pulemetchik"
	english_name = "Platoon Machinegunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/platmgunner
	selection_color = "#B22222"
	rank_number = 5
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 20)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/cccp/saplmgas
	title = "SA Pomoshnik Vzvodnogo Pulemetchika"
	name = "Pomoshnik Vzvodnogo Pulemetchika"
	english_name = "Platoon Machinegunner Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/platmgass
	selection_color = "#B22222"
	rank_number = 5
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/cccp/saratelo
	title = "SA Shtabnoi Radiotelefonist"
	name = "Shtabnoi Radiotelefonist"
	english_name = "HQ Radio Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/radio
	selection_color = "#B22222"
	rank_number = 4
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 80, LANGUAGE_GERMAN = 60)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/cccp/sacorpsman
	title = "SA Sanitar"
	name = "Sanitar"
	english_name = "Field Medic"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/sanitar
	selection_color = "#B22222"
	rank_number = 4
	position = "team"
	amount = 3
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 60, LANGUAGE_GERMAN = 30)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(-1, 0), rand(0,1), 0, 0, rand(2,3), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/cccp/sasurgerist
	title = "SA Polevoi Vrach"
	name = "Polevoi Vrach"
	english_name = "Field Surgeon"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/doctor
	selection_color = "#B22222"
	rank_number = 2
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_GERMAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(-1, 0), rand(-1, 0), 0, 0, 4, rand(0,1), rand(0,1), 2, 0, rand(0,1))

/datum/job/escalation/cccp/sasniper
	title = "SA Snaiper"
	name = "Snaiper"
	english_name = "Sniper"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/sniper
	selection_color = "#B22222"
	rank_number = 4
	position = "team"
	amount = 1
	enabled = 0
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(3,4), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/cccp/sasl
	title = "SA Komandir Otdeleniya"
	name = "Komandir Otdeleniya"
	english_name = "Squad Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/komod
	selection_color = "#B22222"
	rank_number = 3
	position = "fireteam"
	amount = 1
	enabled = 1
	leading = 1
	whitelist_rank = "sa_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_GERMAN = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 2, 0, rand(0,1))

/datum/job/escalation/cccp/sasld
	title = "SA Zamestitel Komandira Otdeleniya"
	name = "Zamestitel' Komandira Otdeleniya"
	english_name = "Squad Leader Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/strifle
	selection_color = "#B22222"
	rank_number = 4
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 0, 0, rand(0,1))

/datum/job/escalation/cccp/samg
	title = "SA Pulemetchik"
	name = "Pulemetchik"
	english_name = "Machinegunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/mgunner
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/cccp/samgas
	title = "SA Pomoshnik Pulemetchika"
	name = "Pomoshnik Pulemetchika"
	english_name = "Machinegunner Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/mgass
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/cccp/sasrad
	title = "SA Radiotelefonist"
	name = "Radiotelefonist"
	english_name = "Radiotelephone Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/radio
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 80, LANGUAGE_GERMAN = 60)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/cccp/sarocket
	title = "SA Strelok-Granatometchik"
	name = "Strelok-Granatometchik"
	english_name = "Squad Grenadier"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/rocket
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/cccp/sarocketass
	title = "SA Pomoshnik Granatometchika"
	name = "Pomoshnik Granatometchika"
	english_name = "Squad Grenadier Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/rocketass
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/cccp/sarifle
	title = "SA Strelok"
	name = "Strelok"
	english_name = "Rifleman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/strelok
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 3
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 5, LANGUAGE_GERMAN = 2)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))


/datum/job/escalation/cccp/saotvco
	title = "SA OTV Komandir"
	name = "OTV Komandir"
	english_name = "Heavy Weapons Commander"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/hws_com
	selection_color = "#B22222"
	rank_number = 4
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 1, 0, rand(0,1))


/datum/job/escalation/cccp/saotvop
	title = "SA OTV Operator"
	name = "OTV Operator"
	english_name = "Heavy Weapons Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/hws_oper
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))


/datum/job/escalation/cccp/saotvload
	title = "SA OTV Zaryazhaiuschiy"
	name = "OTV Zaryazhaiuschiy"
	english_name = "Heavy Weapons Loader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/hws_load
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))


//NVA DDR

/datum/job/escalation/nvaddr
	title = "NVA DDR"
	enabled = 0
	faction_tag = "nvaddr" //The tag of the faction this job is a part of ("bund", "csla"), for lookups
	military_faction = WARPAC
	equip(var/mob/living/carbon/human/H)
		..()
		H.fraction = "WP"


/datum/job/escalation/nvaddr/nvaplatlead
	title = "NVA Zugfuhrer"
	name = "Zugfuhrer"
	english_name = "Platoon Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/komvzv
	selection_color = "#FA8072"
	rank_number = 0
	position = "team"
	leading = 1
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 100)


	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), rand(3,4), 0, rand(0,1))

/datum/job/escalation/nvaddr/nvaplatleaddep
	title = "NVA Zugfuhrerassistant"
	name = "Zugfuhrerassistant"
	english_name = "Platoon Leader Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/zamkomvzv
	selection_color = "#FA8072"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 70, LANGUAGE_RUSSIAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 2, 0, rand(0,1))

/datum/job/escalation/nvaddr/politoffizier
	title = "NVA Politoffizier"
	name = "Politoffizier"
	english_name = "Political Commisar"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/politoffizier
	selection_color = "#FA8072"
	rank_number = 0
	position = "team"
	amount = 1
	enabled = 0
	whitelist_rank = "ddr_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 100)


	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), rand(3,4), 0, rand(0,1))

/datum/job/escalation/nvaddr/nvakapt
	title = "NVA Entfuhrer"
	name = "Entfuhrer"
	english_name = "Staff Sergeant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/nvakapt
	selection_color = "#FA8072"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 2, 0, rand(0,1))

/datum/job/escalation/nvaddr/platnvamg
	title = "NVA Zug Machinengewehrschutze"
	name = "Machinengewehrschutze"
	english_name = "Platoon Machinegunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/platmgunner
	selection_color = "#FA8072"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/nvaddr/platnvamgas
	title = "NVA Zug Machinengewehrschutze Stellvertretender"
	name = "Machinengewehrschutze Stellvertretender"
	english_name = "Platoon Machinegunner Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/platmgass
	selection_color = "#FA8072"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))


/datum/job/escalation/nvaddr/nvasm
	title = "NVA Scharfschutze"
	name = "Scharfschutze"
	english_name = "Designated Marksman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/marksman
	selection_color = "#FA8072"
	rank_number = 4
	position = "team"
	amount = 0
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(3,4), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/nvaddr/nvaratelo
	title = "NVA Funktelefonbetreiber"
	title = "Funktelefonbetreiber"
	english_name = "HQ Radio Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/radio
	selection_color = "#FA8072"
	rank_number = 5
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/nvaddr/nvacorpsman
	title = "NVA Sanitater"
	name = "Sanitater"
	english_name = "Field Medic"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/sanitar
	selection_color = "#FA8072"
	rank_number = 4
	position = "team"
	amount = 3
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_RUSSIAN = 20)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(-1, 0), rand(0,1), 0, 0, rand(2,3), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/nvaddr/nvasurgerist
	title = "NVA Feldchirurg"
	name = "Feldchirurg"
	english_name = "Field Surgeon"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/doctor
	selection_color = "#FA8072"
	rank_number = 2
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(-1, 0), rand(-1, 0), 0, 0, 4, rand(0,1), rand(0,1), 2, 0, rand(0,1))

/datum/job/escalation/nvaddr/nvasl
	title = "NVA Gruppenfuhrer"
	name = "Gruppenfuhrer"
	english_name = "Squad Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/komod
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	leading = 1
	whitelist_rank = "ddr_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 20)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 2, 0, rand(0,1))

/datum/job/escalation/nvaddr/nvasld
	title = "NVA Gruppenfuhrer Stellvertretender"
	name = "Gruppenfuhrer Stellvertretender"
	english_name = "Squad Leader Deputy"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/strifle
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 0, 0, rand(0,1))


/datum/job/escalation/nvaddr/nvamg
	title = "NVA Machinengewehrschutze"
	name = "Machinengewehrschutze"
	english_name = "Machinegunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/mgunner
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/nvaddr/nvamgas
	title = "NVA Machinengewehrschutze Stellvertretender"
	name = "Machinengewehrschutze Stellvertretender"
	english_name = "Machinegunner Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/mgass
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/nvaddr/nvasrad
	title = "NVA Funke"
	name = "Funke"
	english_name = "Squad Radio Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/funke
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/nvaddr/nvarocket
	title = "NVA Panzerabwehrschutze"
	name = "Panzerabwehrschutze"
	english_name = "Squad Grenadier"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/rocket
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/nvaddr/nvarocketass
	title = "NVA Panzerabwerschutze Stellvertretender"
	name = "Panzerabwerschutze Stellvert."
	english_name = "Grenadier Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/rocketass
	selection_color = "#FA8072"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))


/datum/job/escalation/nvaddr/nvarifle
	title = "NVA Schutze"
	name = "Schutze"
	english_name = "Rifleman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/rifleman
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 3
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

//Finnish Army

/datum/job/escalation/finn
	title = "Finnish Militaria"
	enabled = 0
	faction_tag = "finn" //The tag of the faction this job is a part of ("bund", "csla"), for lookups
	military_faction = WARPAC
	equip(var/mob/living/carbon/human/H)
		..()
		H.fraction = "WP"


/datum/job/escalation/finn/finnplatlead
	title = "FINN Luutnantti"
	name = "Luutnantti"
	english_name = "Platoon Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/pl
	selection_color = "#FA8072"
	rank_number = 0
	position = "team"
	leading = 1
	amount = 1
	enabled = 1
	whitelist_rank = "finn_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 100)


	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), rand(3,4), 0, rand(0,1))

/datum/job/escalation/finn/finnplatleaddep
	title = "FINN Ylikersantti"
	name = "Ylikersantti"
	english_name = "Platoon Leader Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/plass
	selection_color = "#FA8072"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 70, LANGUAGE_RUSSIAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 2, 0, rand(0,1))



/datum/job/escalation/finn/finnmajoitusmestari
	title = "FINN Majoitusmestari"
	name = "Majoitusmestari"
	english_name = "Quartermaster"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/quart
	selection_color = "#FA8072"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 2, 0, rand(0,1))

/datum/job/escalation/finn/platfinnmg
	title = "FINN Joukkue Finnmajoitusmestari"
	name = "Finnmajoitusmestari"
	english_name = "Platoon Machinegunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/platmgunner
	selection_color = "#FA8072"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/finn/platfinnmgas
	title = "FINN Joukkue Finnmajoitusmestari Sotamies"
	name = "Finnmajoitusmestari Sotamies"
	english_name = "Platoon Machinegunner Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/platmgass
	selection_color = "#FA8072"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))


/datum/job/escalation/finn/finnratelo
	title = "FINN Alikersantti"
	title = "Alikersantti"
	english_name = "HQ Radio Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/radio
	selection_color = "#FA8072"
	rank_number = 5
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/finn/finncorpsman
	title = "FINN Medisiinari"
	name = "Medisiinari"
	english_name = "Field Medic"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/corpsman
	selection_color = "#FA8072"
	rank_number = 4
	position = "team"
	amount = 3
	enabled = 1
	whitelist_rank = "finns_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_RUSSIAN = 20)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(-1, 0), rand(0,1), 0, 0, rand(2,3), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/finn/finnsurgerist
	title = "NVA Kenttäkirurg"
	name = "Kenttäkirurg"
	english_name = "Field Surgeon"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/doctor
	selection_color = "#FA8072"
	rank_number = 2
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(-1, 0), rand(-1, 0), 0, 0, 4, rand(0,1), rand(0,1), 2, 0, rand(0,1))

/datum/job/escalation/finn/finnsl
	title = "FINN Ryhmänjohtaja"
	name = "Ryhmänjohtaja"
	english_name = "Squad Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/sl
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	leading = 1
	whitelist_rank = "finn_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 20)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 2, 0, rand(0,1))

/datum/job/escalation/finn/finnsld
	title = "FINN Ryhmänjohtaja Jäsen"
	name = "Ryhmänjohtaja Jäsen"
	english_name = "Squad Leader Deputy"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/sld
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), 0, 0, rand(0,1))


/datum/job/escalation/finn/finnmg
	title = "FINN Konekivääri"
	name = "Konekivääri"
	english_name = "Machinegunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/mgunner
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/finn/finnmgas
	title = "FINN Konekivääri-assistentti"
	name = "Konekivääri-assistentti"
	english_name = "Machinegunner Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/mgass
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/finn/finnsrad
	title = "FINN Puhelinoperaattori"
	name = "Puhelinoperaattori"
	english_name = "Squad Radio Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/srad
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/finn/finnrocket
	title = "FINN AT ampuja"
	name = "AT ampuja"
	english_name = "Squad Grenadier"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/rocket
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))

/datum/job/escalation/finn/finnrocketass
	title = "FINN AT ampuja assistentti "
	name = "AT ampuja assistentti."
	english_name = "Grenadier Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/rocketass
	selection_color = "#FA8072"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))


/datum/job/escalation/finn/finnrifle
	title = "FINN Kiväärimies"
	name = "Kiväärimies"
	english_name = "Rifleman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/rifleman
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 3
	enabled = 1
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(rand(1, 2), rand(1,2), 0, 0, rand(0,1), rand(0,1), rand(0,1), -1, 0, rand(0,1))
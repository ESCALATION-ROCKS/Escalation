//Soviet Army
/datum/job/escalation/cccp
	title = "cccp"
	enabled = 0 ///////base job, keep disabled.
	faction_tag = "cccp"
	military_faction = WARPACT
	latejoin_at_spawnpoints = 1
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
		H.add_skills(0, 1, -1, -1, 2, 1, 4, 0)

/datum/job/escalation/cccp/saplatleaddep
	title = "SA Zamestitel Komandira Vzvoda"
	name = "Zamestitel Komandira Vzvoda"
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
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_GERMAN = 90)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 3, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_GERMAN = 45)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 3, 0)

/datum/job/escalation/cccp/sastarshina
	title = "SA Starshina"
	name = "Starshina"
	english_name = "Quartermaster"
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
	also_known_languages = list(LANGUAGE_ENGLISH = 30, LANGUAGE_GERMAN = 55, LANGUAGE_CZECH = 55)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 3, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_GERMAN = 100, LANGUAGE_FINNISH = 100, LANGUAGE_CZECH = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/cccp/sasapper
	title = "SA Saper"
	name = "Saper"
	english_name = "Sapper"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/sapper
	selection_color = "#4682B4"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, 3, 0, 1, 0, 0)

/datum/job/escalation/cccp/samedic
	title = "SA Polevoi Medik"
	name = "Polevoi Medik"
	english_name = "Field Medic"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/sanitar
	selection_color = "#B22222"
	rank_number = 4
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 30, LANGUAGE_GERMAN = 30, LANGUAGE_FINNISH = 30, LANGUAGE_CZECH = 30)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 3, 1, 1, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_GERMAN = 100, LANGUAGE_FINNISH = 100, LANGUAGE_CZECH = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, -1, -1, -1, 5, 1, 2, 0)

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
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 2, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/cccp/sacorpsman
	title = "SA Boevoi Medik"
	name = "Boevoi Medik"
	english_name = "Squad Medic"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/sanitar
	selection_color = "#B22222"
	rank_number = 4
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 30, LANGUAGE_GERMAN = 30, LANGUAGE_FINNISH = 30, LANGUAGE_CZECH = 30)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 3, 1, 1, 0)


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
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_GERMAN = 40, LANGUAGE_FINNISH = 40, LANGUAGE_CZECH = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 1, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/cccp/sasld
	title = "SA Zamestitel Komandira Otdeleniya"
	name = "Zamestitel Komandira Otdeleniya"
	english_name = "Squad Leader Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/zamkomod
	selection_color = "#B22222"
	rank_number = 4
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 2, 0)

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
	amount = 2
	enabled = 1
	whitelist_rank = "sa_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 5, LANGUAGE_CZECH = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_GERMAN = 100, LANGUAGE_FINNISH = 100, LANGUAGE_CZECH = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


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
	whitelist_rank = "sa_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_GERMAN = 40, LANGUAGE_CZECH = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)


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
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


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
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/cccp/vympsl
	title = "KGB Komandir Elementa"
	name = "Komandir Elementa"
	english_name = "Element Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/vympsl
	selection_color = "#B22222"
	rank_number = 2
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_specops"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 100, LANGUAGE_FINNISH = 100, LANGUAGE_CZECH = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 1, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/cccp/vympop
	title = "KGB Operator"
	name = "Operator Elementa"
	english_name = "Element Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/vympop
	selection_color = "#B22222"
	rank_number = 3
	position = "fireteam"
	amount = 3
	enabled = 1
	whitelist_rank = "sa_specops"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_FINNISH = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/cccp/vympbr
	title = "KGB Shturmovik"
	name = "Shturmovik Elementa"
	english_name = "Element Breacher"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/vympbr
	selection_color = "#B22222"
	rank_number = 3
	position = "fireteam"
	amount = 3
	enabled = 1
	whitelist_rank = "sa_specops"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_FINNISH = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/cccp/vympmg
	title = "KGB Pulemetchik"
	name = "Pulemetchik Elementa"
	english_name = "Element Machinegunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/vympmg
	selection_color = "#B22222"
	rank_number = 3
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_specops"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_FINNISH = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/cccp/vympsm
	title = "KGB Snaiper"
	name = "Snaiper Elementa"
	english_name = "Element Sniper"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/soviet/vympsm
	selection_color = "#B22222"
	rank_number = 3
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "sa_specops"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_FINNISH = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 2, -1, -1, 1, 1, 3, 0)

//NVA DDR

/datum/job/escalation/nvaddr
	title = "NVA DDR"
	enabled = 0 ///////base job, keep disabled.
	faction_tag = "nvaddr" //The tag of the faction this job is a part of ("bund", "csla"), for lookups
	military_faction = WARPACT
	latejoin_at_spawnpoints = 1
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
		H.add_skills(0, 1, -1, -1, 2, 1, 4, 0)

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
		H.add_skills(0, 0, -1, -1, 2, 1, 3, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 40)


	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 3, 0)

/datum/job/escalation/nvaddr/nvakapt
	title = "NVA Entfuhrer"
	name = "Entfuhrer"
	english_name = "Quartermaster"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/nvakapt
	selection_color = "#FA8072"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 0
	whitelist_rank = "ddr_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

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
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/nvaddr/nvarad
	title = "NVA Funktelefonbetreiber"
	name = "Funktelefonbetreiber"
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
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 2, 0)

/datum/job/escalation/nvaddr/nvasapper
	title = "NVA Ingenieur"
	name = "Ingenieur"
	english_name = "Sapper"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/sapper
	selection_color = "#4682B4"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_RUSSIAN = 20)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, 3, 0, 1, 0, 0)

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
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_RUSSIAN = 20)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 3, 1, 1, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, -1, -1, -1, 5, 1, 2, 0)

/datum/job/escalation/nvaddr/nvasm
	title = "NVA Scharfschutze"
	name = "Scharfschutze"
	english_name = "Designated Marksman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/marksman
	selection_color = "#FA8072"
	rank_number = 6
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 2, -1, -1, 0, 1, 0, 0)

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
		H.add_skills(0, 1, -1, -1, 1, 1, 3, 0)

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
		H.add_skills(0, 1, -1, -1, 1, 1, 2, 0)

/datum/job/escalation/nvaddr/nvamedic
	title = "NVA Sanitaterschutze"
	name = "Sanitaterschutze"
	english_name = "Squad Medic"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/sanitar
	selection_color = "#FA8072"
	rank_number = 4
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_RUSSIAN = 20)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 3, 1, 1, 0)

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
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/nvaddr/nvarocketass
	title = "NVA Panzerabwehrschutze Stellvertretender"
	name = "Panzerabwehrschutze Stellvert."
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
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


/datum/job/escalation/nvaddr/nvarifle
	title = "NVA Schutze"
	name = "Schutze"
	english_name = "Rifleman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/rifleman
	selection_color = "#f7ddda"
	rank_number = 1
	position = "fireteam"
	amount = 3
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/nvaddr/nvahwscom
	title = "NVA Schwere Waffen Gruppenfuhrer"
	name = "Schwere Waffen Gruppenfuhrer"
	english_name = "Heavy Weapons Group Commander"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/nvahwscom
	selection_color = "#fa8072"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/nvaddr/nvahwsload
	title = "NVA Schwere Waffen Gruppe Ladeschutze"
	name = "Schwere Waffen Gruppe Ladeschutze"
	english_name = "Heavy Weapons Group Loader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/nvahwsload
	selection_color = "#f7ddda"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/nvaddr/nvahwsop
	title = "NVA Schwere Waffen Gruppe Kanonier"
	name = "Schwere Waffen Gruppe Kanonier"
	english_name = "Heavy Weapons Group Gunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/nvaddr/nvahwsload
	selection_color = "#f7ddda"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "ddr_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 3)


	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


//Finnish Army

/datum/job/escalation/finn
	title = "Finnish Militaria"
	enabled = 0 ///////base job, keep disabled.
	faction_tag = "finn" //The tag of the faction this job is a part of ("bund", "csla"), for lookups
	military_faction = WARPACT
	latejoin_at_spawnpoints = 1
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
		H.add_skills(0, 1, -1, -1, 2, 1, 4, 0)

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
		H.add_skills(0, 0, -1, -1, 2, 1, 3, 0)



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
	enabled = 0
	whitelist_rank = "finn_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

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
	enabled = 0
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
	enabled = 0
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


/datum/job/escalation/finn/finnratelo
	title = "FINN Alikersantti"
	name = "Alikersantti"
	english_name = "Platoon RTO"
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
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
	amount = 4
	enabled = 1
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_RUSSIAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 3, 1, 1, 0)

/datum/job/escalation/finn/finnsurgerist
	title = "FINN Kenttakirurg"
	name = "Kenttakirurg"
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
		H.add_skills(0, -1, -1, -1, 5, 1, 2, 0)

/datum/job/escalation/finn/finnsm
	title = "FINN Tarkka-ampuja"
	name = "Tarkka-ampuja"
	english_name = "Designated Marksman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/marksman
	selection_color = "#FA8072"
	rank_number = 4
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 2, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/finn/finnsl
	title = "FINN Ryhmanjohtaja"
	name = "Ryhmanjohtaja"
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
		H.add_skills(0, 1, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/finn/finnsld
	title = "FINN Ryhmanjohtaja Jasen"
	name = "Ryhmanjohtaja Jasen"
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
		H.add_skills(0, 1, -1, -1, 1, 1, 2, 0)


/datum/job/escalation/finn/finnmg
	title = "FINN Konekivaari"
	name = "Konekivaari"
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
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/finn/finnmgas
	title = "FINN Konekivaari-assistentti"
	name = "Konekivaari-assistentti"
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
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

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
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/finn/finnrifle
	title = "FINN Kivarimies"
	name = "Kivaarimies"
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
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


/datum/job/escalation/finn/finnhwtlead
	title = "FINN Raskasaseiden komentaja"
	name = "Raskasaseiden komentaja"
	english_name = "Heavy Weapons Commander"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/hwtlead
	selection_color = "#B22222"
	rank_number = 4
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)


/datum/job/escalation/finn/finnhwtgnr
	title = "FINN Raskasaseiden ampuja"
	name = "Raskasaseiden ampuja"
	english_name = "Heavy Weapons Gunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/hwtgnr
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


/datum/job/escalation/finn/finnhwtload
	title = "FINN Raskasaseiden kuormaaja"
	name = "Raskasaseiden kuormaaja"
	english_name = "Heavy Weapons Loader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/hwtload
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/finn/finnrocketlead
	title = "FINN Panssarintorjunta Ryhmanjohtaja"
	name = "Panssarintorjunta Ryhmanjohtaja"
	english_name = "Anti-Tank Patrol Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/finn/rocketlead
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "finn_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/finn/finnrocket
	title = "FINN Panssarintorjunta ampuja"
	name = "Panssarintorjunta ampuja"
	english_name = "AT Patrol Grenadier"
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
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/finn/finnrocketass
	title = "FINN AT ampuja assistentti "
	name = "AT ampuja assistentti"
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
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


//CSLA

/datum/job/escalation/csla
	title = "CSLA"
	enabled = 0 ///////base job, keep disabled.
	faction_tag = "csla" //The tag of the faction this job is a part of ("bund", "csla"), for lookups
	military_faction = WARPACT
	latejoin_at_spawnpoints = 1
	equip(var/mob/living/carbon/human/H)
		..()
		H.fraction = "WP"


/datum/job/escalation/csla/cslaplatlead
	title = "CSLA Poruchik"
	name = "Poruchik"
	english_name = "Platoon Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/platlead
	selection_color = "#FA8072"
	rank_number = 0
	position = "team"
	leading = 1
	amount = 1
	enabled = 1
	whitelist_rank = "csla_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 100)


	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 1, -1, -1, 2, 1, 4, 0)

/datum/job/escalation/csla/cslaplatleaddep
	title = "CSLA Podporuchik"
	name = "Podporuchik"
	english_name = "Platoon Leader Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/platleaddep
	selection_color = "#FA8072"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 70, LANGUAGE_RUSSIAN = 100, LANGUAGE_GERMAN = 70)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 3, 0)

/datum/job/escalation/csla/cslaqm
	title = "CSLA Quartermaster"
	name = "Quartermaster"
	english_name = "Quartermaster"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/qm
	selection_color = "#FA8072"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 0
	whitelist_rank = "csla_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/csla/cslaplatmg
	title = "CSLA Druzhstvo Delostrelec"
	name = "Druzhstvo Delostrelec"
	english_name = "Platoon Machinegunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/platmgunner
	selection_color = "#FA8072"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/csla/cslaplatmgas
	title = "CSLA Pomocnik Druzhstvo Delostrelec"
	name = "Pomocnik Druzhstvo Delostrelec"
	english_name = "Platoon Machinegunner Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/platmgass
	selection_color = "#FA8072"
	rank_number = 1
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/csla/cslahqrad
	title = "CSLA Druzhstvo Radista"
	name = "Druzhstvo Radista"
	english_name = "HQ Radio Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/radio
	selection_color = "#FA8072"
	rank_number = 5
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 100, LANGUAGE_GERMAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 2, 0)

/datum/job/escalation/csla/cslasapper
	title = "CSLA Zenista"
	name = "Zenista"
	english_name = "Sapper"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/sapper
	selection_color = "#4682B4"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_RUSSIAN = 20)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, 3, 0, 1, 0, 0)

/datum/job/escalation/csla/cslacorpsman
	title = "CSLA Sanitar"
	name = "Sanitar"
	english_name = "Field Medic"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/sanitar
	selection_color = "#FA8072"
	rank_number = 4
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_RUSSIAN = 20)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 3, 1, 1, 0)

/datum/job/escalation/csla/cslasurgerist
	title = "CSLA Chirurg"
	name = "Chirurg"
	english_name = "Field Surgeon"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/surgeon
	selection_color = "#FA8072"
	rank_number = 2
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 100, LANGUAGE_GERMAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, -1, -1, -1, 5, 1, 2, 0)

/datum/job/escalation/csla/cslamarksman
	title = "CSLA Nadstrelec"
	name = "Nadstrelec"
	english_name = "Designated Marksman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/marksman
	selection_color = "#FA8072"
	rank_number = 6
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 2, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/csla/cslasl
	title = "CSLA Chetar"
	name = "Chetar"
	english_name = "Squad Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/sl
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	leading = 1
	whitelist_rank = "csla_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 1, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/csla/cslasld
	title = "CSLA Subchetar"
	name = "Subchetar"
	english_name = "Squad Leader Deputy"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/sldep
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 2, 0)

/datum/job/escalation/csla/cslamedic
	title = "CSLA Sanitarstrelec"
	name = "Sanitarstrelec"
	english_name = "Squad Medic"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/sanitar
	selection_color = "#FA8072"
	rank_number = 4
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_RUSSIAN = 20)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 3, 1, 1, 0)

/datum/job/escalation/csla/cslamg
	title = "CSLA Delostrelec"
	name = "Delostrelec"
	english_name = "Machinegunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/mgunner
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/csla/cslasrad
	title = "CSLA Radista"
	name = "Radista"
	english_name = "Squad Radio Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/srad
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_RUSSIAN = 100, LANGUAGE_GERMAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/csla/cslarocket
	title = "CSLA Pancerovnik"
	name = "Pancerovnik"
	english_name = "Squad Grenadier"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/rocket
	selection_color = "#FA8072"
	rank_number = 1
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/csla/cslarocketass
	title = "CSLA Pomocnik Pancerovnika"
	name = "Pomocnik Pancerovnika"
	english_name = "Grenadier Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/rocketass
	selection_color = "#FA8072"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


/datum/job/escalation/csla/cslarifle
	title = "CSLA Strelec"
	name = "Strelec"
	english_name = "Rifleman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/rifleman
	selection_color = "#f7ddda"
	rank_number = 1
	position = "fireteam"
	amount = 3
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/csla/cslahwscom
	title = "CSLA Tezke Zbrane Chetar"
	name = "Tezke Zbrane Chetar"
	english_name = "Heavy Weapons Group Commander"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/hwscom
	selection_color = "#fa8072"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_RUSSIAN = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/csla/cslahwsload
	title = "CSLA Tezke Zbrane Cheta Nakladac"
	name = "Tezke Zbrane Cheta Nakladac"
	english_name = "Heavy Weapons Group Loader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/hwsload
	selection_color = "#f7ddda"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/csla/cslahwsop
	title = "CSLA Tezke Zbrane Cheta Strelec"
	name = "Tezke Zbrane Cheta Strelec"
	english_name = "Heavy Weapons Group Gunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/csla/hwsload
	selection_color = "#f7ddda"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "csla_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_RUSSIAN = 3)


	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

//Spanish Republican Army
/datum/job/escalation/esp
	title = "Ejercito de la Republica Espanola"
	enabled = 0 ///////base job, keep diespbled.
	faction_tag = "esp"
	military_faction = WARPACT
	latejoin_at_spawnpoints = 1
	equip(var/mob/living/carbon/human/H)
		..()
		H.fraction = "WP"

/datum/job/escalation/esp/espplatlead
	title = "ERE Komandir Vzvoda"
	name = "Komandir Vzvoda"
	english_name = "Platoon Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/komvzv
	selection_color = "#B22222"
	rank_number = 0
	position = "team"
	leading = 1
	amount = 1
	enabled = 1
	whitelist_rank = "esp_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_GERMAN = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 1, -1, -1, 2, 1, 4, 0)

/datum/job/escalation/esp/espplatleaddep
	title = "ERE Zamestitel Komandira Vzvoda"
	name = "Zamestitel Komandira Vzvoda"
	english_name = "Platoon Leader Deputy"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/zamkomvzv
	selection_color = "#B22222"
	rank_number = 2
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_GERMAN = 90)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 2, 1, 3, 0)

/datum/job/escalation/esp/espplmg
	title = "ERE Vzvodny Pulemetchik"
	name = "Vzvodny Pulemetchik"
	english_name = "Platoon Machinegunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/platmgunner
	selection_color = "#B22222"
	rank_number = 5
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/esp/espplmgas
	title = "ERE Pomoshnik Vzvodnogo Pulemetchika"
	name = "Pomoshnik Vzvodnogo Pulemetchika"
	english_name = "Platoon Machinegunner Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/platmgass
	selection_color = "#B22222"
	rank_number = 5
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/esp/espratelo
	title = "ERE Shtabnoi Radiotelefonist"
	name = "Shtabnoi Radiotelefonist"
	english_name = "HQ Radio Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/radio
	selection_color = "#B22222"
	rank_number = 4
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_GERMAN = 100, LANGUAGE_FINNISH = 100, LANGUAGE_CZECH = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/esp/espesppper
	title = "ERE Saper"
	name = "Saper"
	english_name = "Sapper"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/esppper
	selection_color = "#4682B4"
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, 3, 0, 1, 0, 0)

/datum/job/escalation/esp/espmedic
	title = "ERE Polevoi Medik"
	name = "Polevoi Medik"
	english_name = "Field Medic"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/espnitar
	selection_color = "#B22222"
	rank_number = 4
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 30, LANGUAGE_GERMAN = 30, LANGUAGE_FINNISH = 30, LANGUAGE_CZECH = 30)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 3, 1, 1, 0)

/datum/job/escalation/esp/espsurgerist
	title = "ERE Polevoi Vrach"
	name = "Polevoi Vrach"
	english_name = "Field Surgeon"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/doctor
	selection_color = "#B22222"
	rank_number = 2
	position = "team"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_officer"
	also_known_languages = list(LANGUAGE_ENGLISH = 100, LANGUAGE_GERMAN = 100, LANGUAGE_FINNISH = 100, LANGUAGE_CZECH = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, -1, -1, -1, 5, 1, 2, 0)

/datum/job/escalation/esp/espsniper
	title = "ERE Snaiper"
	name = "Snaiper"
	english_name = "Sniper"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/sniper
	selection_color = "#B22222"
	rank_number = 4
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 20, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 2, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/esp/espcorpsman
	title = "ERE Boevoi Medik"
	name = "Boevoi Medik"
	english_name = "Squad Medic"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/espnitar
	selection_color = "#B22222"
	rank_number = 4
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 30, LANGUAGE_GERMAN = 30, LANGUAGE_FINNISH = 30, LANGUAGE_CZECH = 30)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 3, 1, 1, 0)


/datum/job/escalation/esp/espsl
	title = "ERE Komandir Otdeleniya"
	name = "Komandir Otdeleniya"
	english_name = "Squad Leader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/komod
	selection_color = "#B22222"
	rank_number = 3
	position = "fireteam"
	amount = 1
	enabled = 1
	leading = 1
	whitelist_rank = "esp_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_GERMAN = 40, LANGUAGE_FINNISH = 40, LANGUAGE_CZECH = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 1, -1, -1, 1, 1, 3, 0)

/datum/job/escalation/esp/espsld
	title = "ERE Zamestitel Komandira Otdeleniya"
	name = "Zamestitel Komandira Otdeleniya"
	english_name = "Squad Leader Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/zamkomod
	selection_color = "#B22222"
	rank_number = 4
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 2, 0)

/datum/job/escalation/esp/espmg
	title = "ERE Pulemetchik"
	name = "Pulemetchik"
	english_name = "Machinegunner"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/mgunner
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 5, LANGUAGE_CZECH = 5)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/esp/espmgas
	title = "ERE Pomoshnik Pulemetchika"
	name = "Pomoshnik Pulemetchika"
	english_name = "Machinegunner Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/mgass
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/esp/espsrad
	title = "ERE Radiotelefonist"
	name = "Radiotelefonist"
	english_name = "Radiotelephone Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/radio
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_GERMAN = 100, LANGUAGE_FINNISH = 100, LANGUAGE_CZECH = 100)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/esp/esprocket
	title = "ERE Strelok-Granatometchik"
	name = "Strelok-Granatometchik"
	english_name = "Squad Grenadier"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/rocket
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/esp/esprocketass
	title = "ERE Pomoshnik Granatometchika"
	name = "Pomoshnik Granatometchika"
	english_name = "Squad Grenadier Assistant"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/rocketass
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 1
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

/datum/job/escalation/esp/esprifle
	title = "ERE Strelok"
	name = "Strelok"
	english_name = "Rifleman"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/strelok
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 3
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


/datum/job/escalation/esp/espotvco
	title = "ERE OTV Komandir"
	name = "OTV Komandir"
	english_name = "Heavy Weapons Commander"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/hws_com
	selection_color = "#B22222"
	rank_number = 4
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "esp_nco"
	also_known_languages = list(LANGUAGE_ENGLISH = 40, LANGUAGE_GERMAN = 40, LANGUAGE_CZECH = 40)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 1, 1, 3, 0)


/datum/job/escalation/esp/espotvop
	title = "ERE OTV Operator"
	name = "OTV Operator"
	english_name = "Heavy Weapons Operator"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/hws_oper
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)


/datum/job/escalation/esp/espotvload
	title = "ERE OTV Zaryazhaiuschiy"
	name = "OTV Zaryazhaiuschiy"
	english_name = "Heavy Weapons Loader"
	minimal_player_age = 21
	economic_modifier = 5
	ideal_character_age = 28
	outfit_type = /decl/hierarchy/outfit/job/coldwar/esp/hws_load
	selection_color = "#B22222"
	rank_number = 5
	position = "fireteam"
	amount = 2
	enabled = 1
	whitelist_rank = "esp_enlisted"
	also_known_languages = list(LANGUAGE_ENGLISH = 10, LANGUAGE_GERMAN = 10, LANGUAGE_CZECH = 10)

	equip(var/mob/living/carbon/human/H)
		..()
		H.add_skills(0, 0, -1, -1, 0, 1, 0, 0)

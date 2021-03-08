/*

	Hello and welcome to sprite_accessories: For sprite accessories, such as hair,
	facial hair, and possibly tattoos and stuff somewhere along the line. This file is
	intended to be friendly for people with little to no actual coding experience.
	The process of adding in new hairstyles has been made pain-free and easy to do.
	Enjoy! - Doohl


	Notice: This all gets automatically compiled in a list in dna2.dm, so you do not
	have to define any UI values for sprite accessories manually for hair and facial
	hair. Just add in new hair types and the game will naturally adapt.

	!!WARNING!!: changing existing hair information can be VERY hazardous to savefiles,
	to the point where you may completely corrupt a server's savefiles. Please refrain
	from doing this unless you absolutely know what you are doing, and have defined a
	conversion in savefile.dm
*/

/datum/sprite_accessory

	var/icon			// the icon file the accessory is located in
	var/icon_state		// the icon_state of the accessory
	var/preview_state	// a custom preview state for whatever reason

	var/name			// the preview name of the accessory

	// Determines if the accessory will be skipped or included in random hair generations
	var/gender = NEUTER

	// Restrict some styles to specific species
	var/list/species_allowed = list(SPECIES_HUMAN)

	// Whether or not the accessory can be affected by colouration
	var/do_colouration = 1


/*
////////////////////////////
/  =--------------------=  /
/  == Hair Definitions ==  /
/  =--------------------=  /
////////////////////////////
*/

/datum/sprite_accessory/hair

	icon = 'icons/mob/Human_face.dmi'	  // default icon for all hairs
	var/veryshort						//doesn't need to be hidden by BLOCKHEADHAIR hats/helmets

/*
	bald
		name = "Bald"
		icon_state = "bald"
		gender = MALE
		species_allowed = list(SPECIES_HUMAN,SPECIES_UNATHI)
		veryshort = 1
*/
	short
		name = "Short Hair"	  // try to capatilize the names please~
		icon_state = "hair_a" // you do not need to define _s or _l sub-states, game automatically does this for you
		veryshort = 1

	short2
		name = "Short Hair 2"
		icon_state = "hair_shorthair3"

	cut
		name = "Cut Hair"
		icon_state = "hair_c"
		veryshort = 1

	/*flair
		name = "Flaired Hair"
		icon_state = "hair_flair"
		gender = FEMALE

	long
		name = "Shoulder-length Hair"
		icon_state = "hair_b"*/

/*
	longish
		name = "Longer Hair"
		icon_state = "hair_b2"
		gender = FEMALE

	longer
		name = "Long Hair"
		icon_state = "hair_vlong"
		gender = FEMALE

	longest
		name = "Very Long Hair"
		icon_state = "hair_longest"
		gender = FEMALE
*/
	/*longfringe
		name = "Long Fringe"
		icon_state = "hair_longfringe"
		gender = FEMALE*/

/*
	longestalt
		name = "Longer Fringe"
		icon_state = "hair_vlongfringe"
*/
	/*halfbang
		name = "Half-banged Hair"
		icon_state = "hair_halfbang"

	halfbangalt
		name = "Half-banged Hair Alt"
		icon_state = "hair_halfbang_alt"

	ponytail1
		name = "Ponytail 1"
		icon_state = "hair_ponytail"

	ponytail2
		name = "Ponytail 2"
		icon_state = "hair_pa"
		gender = FEMALE

	ponytail3
		name = "Ponytail 3"
		icon_state = "hair_ponytail3"*/

/*
	ponytail4
		name = "Ponytail 4"
		icon_state = "hair_ponytail4"
		gender = FEMALE
*/

	/*ponytail5
		name = "Ponytail 5"
		icon_state = "hair_ponytail5"
		gender = FEMALE

	ponytail6
		name = "Ponytail 6"
		icon_state = "hair_ponytail6"
		gender = FEMALE*/

/*
	sideponytail
		name = "Side Ponytail"
		icon_state = "hair_stail"
		gender = FEMALE
*/
	parted
		name = "Parted"
		icon_state = "hair_parted"

	/*pompadour
		name = "Pompadour"
		icon_state = "hair_pompadour"
		gender = MALE*/

	sleeze
		name = "Sleeze"
		icon_state = "hair_sleeze"
		veryshort = 1

	quiff
		name = "Quiff"
		icon_state = "hair_quiff"
		gender = MALE
/*
	bedhead
		name = "Bedhead"
		icon_state = "hair_bedhead"

	bedhead2
		name = "Bedhead 2"
		icon_state = "hair_bedheadv2"

	bedhead3
		name = "Bedhead 3"
		icon_state = "hair_bedheadv3"

	beehive
		name = "Beehive"
		icon_state = "hair_beehive"
		gender = FEMALE

	beehive2
		name = "Beehive 2"
		icon_state = "hair_beehive2"
		gender = FEMALE

	bobcurl
		name = "Bobcurl"
		icon_state = "hair_bobcurl"
		gender = FEMALE
		species_allowed = list(SPECIES_HUMAN,SPECIES_UNATHI)

	bob
		name = "Bob"
		icon_state = "hair_bobcut"
		gender = FEMALE
		species_allowed = list(SPECIES_HUMAN,SPECIES_UNATHI)

	bobcutalt
		name = "Chin Length Bob"
		icon_state = "hair_bobcutalt"
		gender = FEMALE
		species_allowed = list(SPECIES_HUMAN,SPECIES_UNATHI)
*/

	bowl
		name = "Bowl"
		icon_state = "hair_bowlcut"
		gender = MALE

	buzz
		name = "Buzzcut"
		icon_state = "hair_buzzcut"
		gender = MALE
		species_allowed = list(SPECIES_HUMAN,SPECIES_UNATHI)
		veryshort = 1

	crew
		name = "Crewcut"
		icon_state = "hair_crewcut"
		gender = MALE
		veryshort = 1

	combover
		name = "Combover"
		icon_state = "hair_combover"
		gender = MALE

	father
		name = "Father"
		icon_state = "hair_father"
		gender = MALE

	/*reversemohawk
		name = "Reverse Mohawk"
		icon_state = "hair_reversemohawk"
		gender = MALE*/

	devillock
		name = "Devil Lock"
		icon_state = "hair_devilock"
/*
	dreadlocks
		name = "Dreadlocks"
		icon_state = "hair_dreads"

	curls
		name = "Curls"
		icon_state = "hair_curls"

	afro
		name = "Afro"
		icon_state = "hair_afro"

	afro2
		name = "Afro 2"
		icon_state = "hair_afro2"

	afro_large
		name = "Big Afro"
		icon_state = "hair_bigafro"
		gender = MALE

	rows
		name = "Rows"
		icon_state = "hair_rows1"
		veryshort = 1

	rows2
		name = "Rows 2"
		icon_state = "hair_rows2"
		veryshort = 1

	sargeant
		name = "Flat Top"
		icon_state = "hair_sargeant"
		gender = MALE
		veryshort = 1
*/

	/*emo
		name = "Emo"
		icon_state = "hair_emo"

	emo2
		name = "Emo Alt"
		icon_state = "hair_emo2"*/
/*
	longemo
		name = "Long Emo"
		icon_state = "hair_emolong"
		gender = FEMALE
*/
	shortovereye
		name = "Overeye Short"
		icon_state = "hair_shortovereye"
/*
	longovereye
		name = "Overeye Long"
		icon_state = "hair_longovereye"
*/
	/*fag
		name = "Flow Hair"
		icon_state = "hair_f"

	feather
		name = "Feather"
		icon_state = "hair_feather"*/

/*
	hitop
		name = "Hitop"
		icon_state = "hair_hitop"
		gender = MALE

	mohawk
		name = "Mohawk"
		icon_state = "hair_d"
		species_allowed = list(SPECIES_HUMAN,SPECIES_UNATHI)
*/

	jensen
		name = "Adam Jensen Hair"
		icon_state = "hair_jensen"
		gender = MALE

	/*gelled
		name = "Gelled Back"
		icon_state = "hair_gelled"
		gender = FEMALE

	gentle
		name = "Gentle"
		icon_state = "hair_gentle"
		gender = FEMALE*/

/*
	spiky
		name = "Spiky"
		icon_state = "hair_spikey"
		species_allowed = list(SPECIES_HUMAN,SPECIES_UNATHI)
	kusangi
		name = "Kusanagi Hair"
		icon_state = "hair_kusanagi"
*/

	/*kagami
		name = "Pigtails"
		icon_state = "hair_kagami"
		gender = FEMALE

	himecut
		name = "Hime Cut"
		icon_state = "hair_himecut"
		gender = FEMALE

	shorthime
		name = "Short Hime Cut"
		icon_state = "hair_shorthime"
		gender = FEMALE*/

/*
	grandebraid
		name = "Grande Braid"
		icon_state = "hair_grande"
		gender = FEMALE

	mbraid
		name = "Medium Braid"
		icon_state = "hair_shortbraid"
		gender = FEMALE

	braid2
		name = "Long Braid"
		icon_state = "hair_hbraid"
		gender = FEMALE

	braid
		name = "Floorlength Braid"
		icon_state = "hair_braid"
		gender = FEMALE

	odango
		name = "Odango"
		icon_state = "hair_odango"
		gender = FEMALE

	ombre
		name = "Ombre"
		icon_state = "hair_ombre"
		gender = FEMALE

	updo
		name = "Updo"
		icon_state = "hair_updo"
		gender = FEMALE
*/

	skinhead
		name = "Skinhead"
		icon_state = "hair_skinhead"
		veryshort = 1

	balding
		name = "Balding Hair"
		icon_state = "hair_e"
		gender = MALE // turnoff!
		veryshort = 1
/*
	familyman
		name = "The Family Man"
		icon_state = "hair_thefamilyman"
		gender = MALE
*/
	/*mahdrills
		name = "Drillruru"
		icon_state = "hair_drillruru"
		gender = FEMALE

	fringetail
		name = "Fringetail"
		icon_state = "hair_fringetail"
		gender = FEMALE

	dandypomp
		name = "Dandy Pompadour"
		icon_state = "hair_dandypompadour"
		gender = MALE*/

/*
	poofy
		name = "Poofy"
		icon_state = "hair_poofy"
		gender = FEMALE

	crono
		name = "Chrono"
		icon_state = "hair_toriyama"
		gender = MALE

	vegeta
		name = "Vegeta"
		icon_state = "hair_toriyama2"
		gender = MALE
*/
	cia
		name = "CIA"
		icon_state = "hair_cia"
		gender = MALE

	mulder
		name = "Mulder"
		icon_state = "hair_mulder"
		gender = MALE

/*
	scully
		name = "Scully"
		icon_state = "hair_scully"
		gender = FEMALE

	nitori
		name = "Nitori"
		icon_state = "hair_nitori"
		gender = FEMALE

	joestar
		name = "Joestar"
		icon_state = "hair_joestar"
		gender = MALE

	volaju
		name = "Volaju"
		icon_state = "hair_volaju"

	longeralt2
		name = "Long Hair Alt 2"
		icon_state = "hair_longeralt2"
*/
	shortbangs
		name = "Short Bangs"
		icon_state = "hair_shortbangs"

/*
	halfshaved
		name = "Half-Shaved Emo"
		icon_state = "hair_halfshaved"
*/

	bun
		name = "Low Bun"
		icon_state = "hair_bun"

	bun2
		name = "High Bun"
		icon_state = "hair_bun2"

/*
	doublebun
		name = "Double-Bun"
		icon_state = "hair_doublebun"
*/

	lowfade
		name = "Low Fade"
		icon_state = "hair_lowfade"
		gender = MALE
		veryshort = 1

	medfade
		name = "Medium Fade"
		icon_state = "hair_medfade"

	highfade
		name = "High Fade"
		icon_state = "hair_highfade"
		gender = MALE
		veryshort = 1

	baldfade
		name = "Balding Fade"
		icon_state = "hair_baldfade"
		gender = MALE
		veryshort = 1

	nofade
		name = "Regulation Cut"
		icon_state = "hair_nofade"
		gender = MALE
		veryshort = 1

	trimflat
		name = "Trimmed Flat Top"
		icon_state = "hair_trimflat"
		gender = MALE
		veryshort = 1

	shaved
		name = "Shaved"
		icon_state = "hair_shaved"
		gender = MALE
		veryshort = 1

	trimmed
		name = "Trimmed"
		icon_state = "hair_trimmed"
		gender = MALE
		veryshort = 1

	/*tightbun
		name = "Tight Bun"
		icon_state = "hair_tightbun"
		gender = FEMALE
		veryshort = 1*/

	coffeehouse
		name = "Coffee House Cut"
		icon_state = "hair_coffeehouse"
		gender = MALE
		veryshort = 1

	undercut
		name = "Undercut"
		icon_state = "hair_undercut"
		gender = MALE
		veryshort = 1

	partfade
		name = "Parted Fade"
		icon_state = "hair_shavedpart"
		gender = MALE
		veryshort = 1

	hightight
		name = "High and Tight"
		icon_state = "hair_hightight"
		gender = MALE
		veryshort = 1
/*
	rowbun
		name = "Row Bun"
		icon_state = "hair_rowbun"
		gender = FEMALE

	rowdualbraid
		name = "Row Dual Braid"
		icon_state = "hair_rowdualtail"
		gender = FEMALE

	rowbraid
		name = "Row Braid"
		icon_state = "hair_rowbraid"
		gender = FEMALE
*/
	regulationmohawk
		name = "Regulation Mohawk"
		icon_state = "hair_shavedmohawk"
		gender = MALE
		veryshort = 1
/*
	topknot
		name = "Topknot"
		icon_state = "hair_topknot"
		gender = MALE

	ronin
		name = "Ronin"
		icon_state = "hair_ronin"
		gender = MALE
*/
	bowlcut2
		name = "Bowl2"
		icon_state = "hair_bowlcut2"
		gender = MALE

	thinning
		name = "Thinning"
		icon_state = "hair_thinning"
		gender = MALE
		veryshort = 1

	thinningfront
		name = "Thinning Front"
		icon_state = "hair_thinningfront"
		gender = MALE
		veryshort = 1

	thinningback
		name = "Thinning Back"
		icon_state = "hair_thinningrear"
		gender = MALE
		veryshort = 1

	sideswept
		name = "Sideswept"
		icon_state = "hair_sideswept"
		gender = MALE
		veryshort = 1

	averagejoe
	name = "Average Joe"
	icon_state = "hair_averagejoe"

	mohawkshaved
	name = "Shaved Mohawk"
	icon_state = "hair_mohawkshaved"

	sideundercut
	name = "Side Undercut"
	icon_state = "hair_sideundercut"

	combover2
	name = "Combover 2"
	icon_state = "hair_combover2"

/*
	manbun
		name = "Manbun"
		icon_state = "hair_manbun"
		gender = MALE
*/

/*
///////////////////////////////////
/  =---------------------------=  /
/  == Facial Hair Definitions ==  /
/  =---------------------------=  /
///////////////////////////////////
*/

/datum/sprite_accessory/facial_hair

	icon = 'icons/mob/human_face.dmi'
	gender = MALE // barf (unless you're a dorf, dorfs dig chix /w beards :P)

	shaved
		name = "Shaved"
		icon_state = "bald"
		gender = NEUTER
		species_allowed = list(SPECIES_HUMAN,SPECIES_UNATHI,SPECIES_TAJARA,SPECIES_SKRELL,SPECIES_VOX,SPECIES_IPC)

	watson
		name = "Watson Mustache"
		icon_state = "facial_watson"

	hogan
		name = "Hulk Hogan Mustache"
		icon_state = "facial_hogan" //-Neek

	vandyke
		name = "Van Dyke Mustache"
		icon_state = "facial_vandyke"

	chaplin
		name = "Square Mustache"
		icon_state = "facial_chaplin"

	selleck
		name = "Selleck Mustache"
		icon_state = "facial_selleck"
/*
	neckbeard
		name = "Neckbeard"
		icon_state = "facial_neckbeard"

	fullbeard
		name = "Full Beard"
		icon_state = "facial_fullbeard"

	longbeard
		name = "Long Beard"
		icon_state = "facial_longbeard"

	vlongbeard
		name = "Very Long Beard"
		icon_state = "facial_wise"
*/
	elvis
		name = "Elvis Sideburns"
		icon_state = "facial_elvis"
		species_allowed = list(SPECIES_HUMAN,SPECIES_UNATHI)
/*
	abe
		name = "Abraham Lincoln Beard"
		icon_state = "facial_abe"
*/
	chinstrap
		name = "Chinstrap"
		icon_state = "facial_chin"

	hip
		name = "Hipster Beard"
		icon_state = "facial_hip"

	gt
		name = "Goatee"
		icon_state = "facial_gt"

	jensen
		name = "Adam Jensen Beard"
		icon_state = "facial_jensen"

	/*volaju
		name = "Volaju"
		icon_state = "facial_volaju"*/
/*
	dwarf
		name = "Dwarf Beard"
		icon_state = "facial_dwarf"
*/
	threeOclock
		name = "3 O'clock Shadow"
		icon_state = "facial_3oclock"

	threeOclockstache
		name = "3 O'clock Shadow and Moustache"
		icon_state = "facial_3oclockmoustache"

	fiveOclock
		name = "5 O'clock Shadow"
		icon_state = "facial_5oclock"

	fiveOclockstache
		name = "5 O'clock Shadow and Moustache"
		icon_state = "facial_5oclockmoustache"

	sevenOclock
		name = "7 O'clock Shadow"
		icon_state = "facial_7oclock"

	sevenOclockstache
		name = "7 O'clock Shadow and Moustache"
		icon_state = "facial_7oclockmoustache"
/*
	mutton
		name = "Mutton Chops"
		icon_state = "facial_mutton"

	muttonstache
		name = "Mutton Chops and Moustache"
		icon_state = "facial_muttonmus"
*/
	/*walrus
		name = "Walrus Moustache"
		icon_state = "facial_walrus"*/

	croppedbeard
		name = "Full Cropped Beard"
		icon_state = "facial_croppedfullbeard"

	chinless
		name = "Chinless Beard"
		icon_state = "facial_chinlessbeard"

//skin styles - WIP
//going to have to re-integrate this with surgery
//let the icon_state hold an icon preview for now
/datum/sprite_accessory/skin
	icon = 'icons/mob/human_races/r_human.dmi'

	human
		name = "Default human skin"
		icon_state = "default"
		species_allowed = list(SPECIES_HUMAN)

	human_tatt01
		name = "Tatt01 human skin"
		icon_state = "tatt1"
		species_allowed = list(SPECIES_HUMAN)

	tajaran
		name = "Default tajaran skin"
		icon_state = "default"
		icon = 'icons/mob/human_races/r_tajaran.dmi'
		species_allowed = list(SPECIES_TAJARA)

	unathi
		name = "Default Unathi skin"
		icon_state = "default"
		icon = 'icons/mob/human_races/r_lizard.dmi'
		species_allowed = list(SPECIES_UNATHI)

	skrell
		name = "Default skrell skin"
		icon_state = "default"
		icon = 'icons/mob/human_races/r_skrell.dmi'
		species_allowed = list(SPECIES_SKRELL)

/*
////////////////////////////
/  =--------------------=  /
/  ==  Body Markings   ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/marking
	icon = 'icons/mob/human_races/markings.dmi'
	do_colouration = 1 //Almost all of them have it, COLOR_ADD

	//Empty list is unrestricted. Should only restrict the ones that make NO SENSE on other species,
	//like Tajara inner-ear coloring overlay stuff.
	species_allowed = list()

	var/body_parts = list() //A list of bodyparts this covers, in organ_tag defines
	//Reminder: BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_CHEST,BP_GROIN,BP_HEAD

/datum/sprite_accessory/marking/tat_heart
	name = "Tattoo (Heart, Torso)"
	icon_state = "tat_heart"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_hive
	name = "Tattoo (Hive, Back)"
	icon_state = "tat_hive"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_nightling
	name = "Tattoo (Nightling, Back)"
	icon_state = "tat_nightling"
	body_parts = list(BP_CHEST)

/datum/sprite_accessory/marking/tat_campbell
	name = "Tattoo (Campbell, R.Arm)"
	icon_state = "tat_campbell"
	body_parts = list(BP_R_ARM)

/datum/sprite_accessory/marking/tat_campbell/left
		name = "Tattoo (Campbell, L.Arm)"
		body_parts = list(BP_L_ARM)
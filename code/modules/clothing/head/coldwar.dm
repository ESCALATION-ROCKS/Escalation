/obj/item/clothing/head/coldwar
	wearable = 1

////////garcap, has use function

/obj/item/clothing/head/coldwar/garcap/
	var/icon_state_alt = null

/obj/item/clothing/head/coldwar/garcap/attack_self(mob/user as mob)
	if(icon_state == initial(icon_state))
		icon_state = icon_state_alt
		to_chat(user, "You make your cap look pretty cozy. Nice.")
	else
		icon_state = initial(icon_state)
		to_chat(user, "You put your cap back in fine state.")



//////////helmets - PROTECTION VALUES ONLY APPLY FOR SUBSONIC PROJECTILES LIKE PISTOL ROUNDS AND SHRAPNEL - RIFLE ROUNDS HAVE %100 PEN

/obj/item/clothing/head/coldwar/helmet/
	var/icon_state_unzipped = null
	flags_inv = null
	w_class = ITEM_SIZE_HUGE
	valid_accessory_slots = list(ACCESSORY_SLOT_HELM_C)
	restricted_accessory_slots = list(ACCESSORY_SLOT_HELM_C)

/obj/item/clothing/head/coldwar/helmet/attack_self(mob/user as mob)
	if(icon_state == initial(icon_state))
		icon_state = icon_state_unzipped
		to_chat(user, "You unzip your helmet strips.")
	else
		icon_state = initial(icon_state)
		to_chat(user, "You zip your helmet back.")


////////ushankas

/obj/item/clothing/head/coldwar/ushanka
	name = "ushanka"
	desc = "Perfect for winter in Siberia, da?"
	icon_state = "ushankadown"
	var/icon_state_up = "ushankaup"
	flags_inv = HIDEEARS|BLOCKHEADHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/head/coldwar/ushanka/attack_self(mob/user as mob)
	if(icon_state == initial(icon_state))
		icon_state = icon_state_up
		to_chat(user, "You raise the ear flaps on the ushanka.")
	else
		icon_state = initial(icon_state)
		to_chat(user, "You lower the ear flaps on the ushanka.")

///////officers cap

/obj/item/clothing/head/coldwar/officer
	name = "officer cap"
	desc = "An uniform headdress of officers."
	icon_state = "soviet_officer"


///////cap - no special functions

/obj/item/clothing/head/coldwar/fieldcap
	name = "cap"

///////beret

/obj/item/clothing/head/coldwar/beret
	name = "beret"


/////////////////////HERE ENDS HAT CODE//////////////////////////////////



//Soviet hats

/obj/item/clothing/head/coldwar/garcap/soviet
	name = "'Pilotka'"
	desc = "That's a garrison cap used by Soviet Army."
	icon_state = "sovietgarrisoncap"
	icon_state_alt = "sovietgarrisoncap_alt"

/obj/item/clothing/head/coldwar/fieldcap/afghanka
	name = "'Afghanka' field cap"
	desc = "That's a generic field cap usually worn by junior command personnel of the Soviet Army."
	icon_state = "afghanka_cap"

/obj/item/clothing/head/coldwar/fieldcap/habe
	name = "'Habe' field cap"
	desc = "That's a generic field cap usually worn by junior command personnel of the Soviet Army."
	icon_state = "habe_cap" //change

/obj/item/clothing/head/coldwar/officer/soviet
	name = "officer cap"
	desc = "An uniform headdress of officers."
	icon_state = "soviet_officer"

/obj/item/clothing/head/coldwar/beret/soviet
	name = "Vympel beret"
	desc = "The signature red beret of the Vympel task force."
	icon_state = "saberet"

/obj/item/clothing/head/coldwar/ushanka/soviet
	name = "ushanka"
	desc = "A generic comfy hat used by the Soviet Army. This one is missing an insignia."
	icon_state = "sa_ush"
	icon_state_up = "sa_ush_up"

/obj/item/clothing/head/coldwar/ushanka/soviet/officer
	name = "officer's ushanka"
	desc = "A generic comfy hat used by the Soviet Army."
	icon_state = "sa_ush_officer"
	icon_state_up = "sa_ush_officer_up"

//Soviet helmets

/obj/item/clothing/head/coldwar/helmet/soviet/ssh68
	name = "SSh-68 helmet"
	desc = "A cheap steel helmet used by Soviet Army."
	icon_state = "ssh68"
	armor = list(melee = 85, bullet = 85, laser = 0, energy = 10, bomb = 55, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "ssh68-unzipped"

/obj/item/clothing/head/coldwar/helmet/soviet/ssh68/netting
	desc = "A cheap steel helmet used by Soviet Army. This one has a netting on it."
	icon_state_unzipped = "ssh68netting-unzipped"
	icon_state = "ssh68netting"

/obj/item/clothing/head/coldwar/helmet/soviet/ssh68/medic
	desc = "A cheap steel helmet used by Soviet Army. This one has a red cross on it."
	icon_state_unzipped = "ssh68medic-unzipped"
	icon_state = "ssh68medic"

/obj/item/clothing/head/coldwar/helmet/soviet/ssh60
	name = "SSh-60 helmet"
	desc = "A cheap and somewhat outdated steel helmet used by Soviet Army."
	icon_state = "ssh60"
	armor = list(melee = 80, bullet = 80, laser = 10, energy = 10, bomb = 50, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "ssh60-unzipped"

/obj/item/clothing/head/coldwar/altyn ////////Special define for the visor to work properly, if you define it as /helmet/ it will also engage the strap action
	name = "6B6-3 'Altyn' helmet"
	desc = "A recently engineered titanium helmet, issued in limited quantities to special KGB and Spetsnaz GRU units. This one has a protective visor."
	icon_state = "altyn"
	body_parts_covered = FACE|HEAD
	armor = list(melee = 98, bullet = 98, laser = 0, energy = 10, bomb = 80, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	var/icon_state_unzipped = "altyn-unzipped"

/obj/item/clothing/head/coldwar/altyn/attack_self(mob/user as mob)
	..()
	if(icon_state == initial(icon_state))
		icon_state = "altyn-unzipped"
		body_parts_covered = HEAD
		to_chat(user, "You raise the helmet's visor.")
	else
		icon_state = "altyn"
		body_parts_covered = FACE|HEAD
		to_chat(user, "You pull the visor back down.")


/obj/item/clothing/head/coldwar/helmet/soviet/h6b6
	name = "6B6 helmet"
	desc = "A recently engineered titanium helmet, issued in limited quantities to special KGB and Spetsnaz GRU units."
	icon_state = "6b6"
	armor = list(melee = 90, bullet = 90, laser = 0, energy = 10, bomb = 70, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "6b6-unzipped"

/obj/item/clothing/head/coldwar/helmet/soviet/h6b6/korish
	name = "6B6 helmet"
	desc = "A recently engineered titanium helmet, used for training purposes only."
	icon_state = "6b6korish"
	armor = list(melee = 90, bullet = 90, laser = 0, energy = 10, bomb = 70, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "6b6korish"

/obj/item/clothing/head/coldwar/helmet/soviet/h6b6/sinii
	name = "6B6 helmet"
	desc = "A recently engineered titanium helmet, used for training purposes only."
	icon_state = "6b6sinii"
	armor = list(melee = 90, bullet = 90, laser = 0, energy = 10, bomb = 70, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "6b6sinii"




//NVADDR hats

/obj/item/clothing/head/coldwar/garcap/nvaddr
	name = "garrison cap"
	desc = "That's a garrison cap used by NVA DDR."
	icon_state = "ddrgarrisoncap"
	icon_state_alt = "ddrgarrisoncap_alt"

/obj/item/clothing/head/coldwar/fieldcap/nvaddr
	name = "field cap"
	desc = "That's a garrison cap used by NVA DDR."
	icon_state = "strichtarn_cap"

/obj/item/clothing/head/coldwar/officer/nvaddr
	name = "officer cap"
	desc = "An uniform headdress of officers."
	icon_state = "nvaddr_officer"


//NVADDR helmets

/obj/item/clothing/head/coldwar/helmet/nvaddr/m56
	name = "M56 stahlhelm"
	desc = "A cheap steel helmet used by NVA DDR."
	icon_state = "m56"
	armor = list(melee = 90, bullet = 90, laser = 0, energy = 10, bomb = 60, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "m56-unzipped"

/obj/item/clothing/head/coldwar/helmet/nvaddr/m56/grey
	icon_state = "m56_grey"
	desc = "A cheap steel helmet used by NVA DDR."
	icon_state_unzipped = "m56_grey-unzipped"

/obj/item/clothing/head/coldwar/helmet/nvaddr/m56/cover
	desc = "A cheap steel helmet used by NVA DDR. This one has a stricharn cover on it."
	icon_state = "m56-cover"
	icon_state_unzipped = "m56-cover-unzipped"

/obj/item/clothing/head/coldwar/helmet/nvaddr/m56/netting
	icon_state = "m56netting"
	desc = "A cheap steel helmet used by NVA DDR. This one has a netting on it."
	icon_state_unzipped = "m56netting-unzipped"

/obj/item/clothing/head/coldwar/helmet/nvaddr/m56/foliage
	icon_state = "m56f"
	desc = "A cheap steel helmet used by NVA DDR. This one is covered in foliage."
	icon_state_unzipped = "m56f_unzipped"

/obj/item/clothing/head/coldwar/helmet/nvaddr/m56/medic
	icon_state = "m56medic"
	desc = "A cheap steel helmet used by NVA DDR. This one has a red cross on it."
	icon_state_unzipped = "m56medic-unzipped"



////////////
//CSLA hats

/obj/item/clothing/head/coldwar/garcap/csla
	name = "garrison cap"
	desc = "That's a garrison cap used by the CSLA."
	icon_state = "cslagarrisoncap"
	icon_state_alt = "cslagarrisoncap_alt"

/obj/item/clothing/head/coldwar/fieldcap/csla
	name = "field cap"
	desc = "That's a garrison cap used by the CSLA."
	icon_state = "csla_cap"

/obj/item/clothing/head/coldwar/officer/csla
	name = "officer cap"
	desc = "An uniform headdress of officers."
	icon_state = "csla_officer"


//CSLA helmets

/obj/item/clothing/head/coldwar/helmet/csla/vz53
	name = "vz.53"
	desc = "A cheap steel helmet used by the CSLA."
	icon_state = "vz53"
	armor = list(melee = 85, bullet = 85, laser = 0, energy = 10, bomb = 50, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "vz53-unzipped"

/obj/item/clothing/head/coldwar/helmet/csla/vz53/netting
	icon_state = "vz53netting"
	desc = "A cheap steel helmet used by the CSLA. This one has a netting on it."
	icon_state_unzipped = "vz53netting-unzipped"

/obj/item/clothing/head/coldwar/helmet/csla/vz53/foliage
	icon_state = "vz53foliage"
	desc = "A cheap steel helmet used by the CSLA. This one is covered in foliage."
	icon_state_unzipped = "vz53foliage-unzipped"

/obj/item/clothing/head/coldwar/helmet/csla/vz53/medic
	icon_state = "vz53medic"
	desc = "A cheap steel helmet used by the CSLA. This one has a red cross on it."
	icon_state_unzipped = "vz53medic-unzipped"




//FINN Hats

/obj/item/clothing/head/coldwar/finn/fieldcap/talvimetsa
	name = "Talvimetsa cap"
	desc = "That's a generic field cap in a talvimetsa pattern."
	icon_state = "finn_cap"

/obj/item/clothing/head/coldwar/ushanka/finn
	name = "Ushanka hat"
	desc = "That's a finnish Ushanka for use in cold weather."
	icon_state = "finnushanka"
	icon_state_up = "finnushanka-up"

//FINN Helmets

/obj/item/clothing/head/coldwar/helmet/finn/m63
	name = "M63 helmet"
	desc = "A cheap steel helmet used by the Finnish Army."
	icon_state = "m63helmet"
	armor = list(melee = 85, bullet = 85, laser = 0, energy = 10, bomb = 65, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "m63helmet-unzipped"

/obj/item/clothing/head/coldwar/helmet/finn/m63/netting
	desc = "A cheap steel helmet used by the Finnish Army. This one has a netting."
	icon_state = "m63netting"
	icon_state_unzipped = "m63netting-unzipped"

/obj/item/clothing/head/coldwar/helmet/finn/m63/foliage
	desc = "A cheap steel helmet used by the Finnish Army. This one is covered in foliage."
	icon_state = "m63netting"
	icon_state_unzipped = "m63netting-unzipped"

/obj/item/clothing/head/coldwar/helmet/finn/m63/medic
	desc = "A cheap steel helmet used by the Finnish Army. This one has a red cross on it."
	icon_state = "m63medic"
	icon_state_unzipped = "m63medic-unzipped"


//Spanish hats

/obj/item/clothing/head/coldwar/garcap/esp
	name = "'Pilotka'"
	desc = "That's a garrison cap used by Soviet Army."
	icon_state = "sovietgarrisoncap"
	icon_state_alt = "sovietgarrisoncap_alt"

/obj/item/clothing/head/coldwar/fieldcap/esp
	name = "'Afghanka' field cap"
	desc = "That's a generic field cap usually worn by junior command personnel of the Soviet Army."
	icon_state = "afghanka_cap"

/obj/item/clothing/head/coldwar/officer/esp
	name = "officer cap"
	desc = "An uniform headdress of officers."
	icon_state = "soviet_officer"

//Spanish helmets

/obj/item/clothing/head/coldwar/helmet/esp/m42
	name = "M42-79 helmet"
	desc = "A cheap and very outdated steel helmet used by the Republican Spanish Army."
	icon_state = "m42"
	armor = list(melee = 85, bullet = 85, laser = 0, energy = 10, bomb = 55, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "m42-unzipped"

/obj/item/clothing/head/coldwar/helmet/esp/m42/netting
	desc = "A cheap and very outdated steel helmet used by the Republican Spanish Army. This one has a netting on it."
	icon_state_unzipped = "m42netting-unzipped"
	icon_state = "m42netting"

/obj/item/clothing/head/coldwar/helmet/esp/m42/medic
	desc = "A cheap and very outdated steel helmet used by the Republican Spanish Army. This one has a red cross on it."
	icon_state_unzipped = "m42medic-unzipped"
	icon_state = "m42medic"




//US hats

/obj/item/clothing/head/coldwar/fieldcap/usmc/woodland
	name = "woodland cap"
	desc = "That's a generic field cap in a woodland pattern."
	icon_state = "woodland_cap"

/obj/item/clothing/head/coldwar/beret/usmc/woodland
	name = "woodland beret"
	desc = "That's a USMC in a woodland pattern."
	icon_state = "usmcberet"

/obj/item/clothing/head/coldwar/fieldcap/usmc/boonie
	name = "boonie hat"
	desc = "That's a generic boonie hat in a woodland pattern."
	icon_state = "boonie_woodl"

/*/obj/item/clothing/head/usmc/cavhat
	name = "cavalry hat"
	desc = null
	icon_state = "cavhat"*/ //////belonged to frown some time ago.

/obj/item/clothing/head/coldwar/ushanka/us
	name = "winter cap"
	desc = "That's a generic winter cap for cold climates."
	icon_state = "uswintercap"
	icon_state_up = "uswintercap-up"

/obj/item/clothing/head/coldwar/usmc/fieldcap/beanie
	name = "watch cap"
	desc = "That's a generic beanie. This one is in black."
	icon_state = "wcapblack"
	item_state = "wcapblack"

/obj/item/clothing/head/coldwar/usmc/fieldcap/beaniegreen
	name = "watch cap"
	desc = "That's a generic beanie. This one is in dark green."
	icon_state = "wcapgreen"
	item_state = "wcapgreen"

/obj/item/clothing/head/coldwar/usmc/fieldcap/beaniebrown
	name = "watch cap"
	desc = "That's a generic beanie. This one is in dark brown."
	icon_state = "wcapbrown"
	item_state = "wcapbrown"

/obj/item/clothing/head/coldwar/usmc/fieldcap/beanieblue
	name = "watch cap"
	desc = "That's a generic beanie. This one is in navy blue."
	icon_state = "wcapblue"
	item_state = "wcapblue"


//US helmets

/obj/item/clothing/head/coldwar/helmet/usmc/pasgt
	name = "PASGT M81 helmet"
	desc = "An experimental tactical kevlar helmet used by U.S. army."
	icon_state = "pasgt-green"
	armor = list(melee = 90, bullet = 90, laser = 0, energy = 10, bomb = 70, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "pasgt-green-unzipped"

/obj/item/clothing/head/coldwar/helmet/usmc/pasgt/woodland
	icon_state = "pasgt-woodland"
	icon_state_unzipped = "pasgt-woodland-unzipped"

/obj/item/clothing/head/coldwar/helmet/usmc/pasgt/winter
	icon_state = "pasgtwinter"
	icon_state_unzipped = "pasgtwinter-unzipped"

/obj/item/clothing/head/coldwar/helmet/usmc/pasgt/netting
	desc = "An experimental tactical kevlar helmet used by U.S. army. This one has a netting on it."
	icon_state = "pasgtnetting"
	icon_state_unzipped = "pasgtnetting-unzipped"

/obj/item/clothing/head/coldwar/helmet/usmc/pasgt/medic
	desc = "An experimental tactical kevlar helmet used by U.S. army. This one has a red cross on it."
	icon_state = "pasgtmedic"
	icon_state_unzipped = "pasgtmedic-unzipped"

/obj/item/clothing/head/coldwar/helmet/usmc/pasgt/un
	icon_state = "pasgtantichrist"
	icon_state_unzipped = "pasgtantichrist-unzipped"
	desc = "A kevlar helmet painted in bright blue, signature to the UN forces."

/obj/item/clothing/head/coldwar/helmet/usmc/m1
	name = "M1 helmet"
	desc = "A classic helmet used by the U.S. Army."
	icon_state = "m1helmet"
	armor = list(melee = 80, bullet = 80, laser = 10, energy = 10, bomb = 65, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "m1helmet-unzipped"

/obj/item/clothing/head/coldwar/helmet/usmc/m1/woodland
	icon_state = "m1woodland"
	desc = "A classic helmet used by the U.S. Army. Woodland cover."
	icon_state_unzipped = "m1woodland-unzipped"







//BDW hats

/obj/item/clothing/head/coldwar/fieldcap/bdw
	name = "Bundeswehr cap"
	desc = "That's a generic field cap in a 'Steingrau-olive' pattern."
	icon_state = "bdw_cap"

/obj/item/clothing/head/coldwar/garcap/bdw
	name = "garrison cap"
	desc = "That's a garrison cap used by Bundeswehr."
	icon_state = "bdwgarrisoncap"
	icon_state_alt = "bdwgarrisoncap_alt"

/obj/item/clothing/head/coldwar/beret/bdw
	name = "mountaineer beret"
	desc = "A green beret common amongst Bundeswehr mountaineer divisions."
	icon_state = "bdwberet"

//BDW helmets
/obj/item/clothing/head/coldwar/helmet/bdw/m62
	name = "M62 helmet"
	desc = "A cheap and somewhat outdated steel helmet used by Bundeswehr."
	icon_state = "m62helmet"
	armor = list(melee = 85, bullet = 85, laser = 0, energy = 10, bomb = 65, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "m62helmet-unzipped"

/obj/item/clothing/head/coldwar/helmet/bdw/m62/netting
	desc = "A cheap and somewhat outdated steel helmet used by Bundeswehr. This one has a netting on it."
	icon_state = "m62c"
	icon_state_unzipped = "m62c-unzipped"

/obj/item/clothing/head/coldwar/helmet/bdw/m62/foliage
	desc = "A cheap and somewhat outdated steel helmet used by Bundeswehr. This one is covered in foliage."
	icon_state = "m62helmetfoliage"
	icon_state_unzipped = "m62helmetfoliage-unzipped"

/obj/item/clothing/head/coldwar/helmet/bdw/m62/medic
	desc = "A cheap and somewhat outdated steel helmet used by Bundeswehr. This one has a red cross on it."
	icon_state = "m62medic"
	icon_state_unzipped = "m62medic-unzipped"









//BDHeer hats

/obj/item/clothing/head/coldwar/fieldcap/heer
	name = "Bundeswehr cap"
	desc = "That's a generic field cap in a 'Steingrau-olive' pattern."
	icon_state = "heer_cap"

/obj/item/clothing/head/coldwar/garcap/heer
	name = "garrison cap"
	desc = "That's a garrison cap used by Bundesheer."
	icon_state = "heergarrisoncap"
	icon_state_alt = "heergarrisoncap_alt"

/obj/item/clothing/head/coldwar/beret/heer
	name = "beret"
	desc = "A green beret common amongst Bundesheer divisions."
	icon_state = "heerberet"

//heer helmets
/obj/item/clothing/head/coldwar/helmet/heer/m1
	name = "M75 helmet"
	desc = "An outdated steel helmet used by Bundesheer. This one has a cover on it."
	icon_state = "m1heer"
	armor = list(melee = 85, bullet = 85, laser = 0, energy = 10, bomb = 65, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "m1heer-unzipped"

/obj/item/clothing/head/coldwar/helmet/heer/m1/netting
	desc = "An outdated steel helmet used by Bundesheer. This one has a netting on it."
	icon_state = "m1netting"
	icon_state_unzipped = "m1netting-unzipped"

/obj/item/clothing/head/coldwar/helmet/heer/m1/medic
	desc = "An outdated steel helmet used by Bundesheer. This one has a red cross on it."
	icon_state = "m1medic"
	icon_state_unzipped = "m1medic-unzipped"

/obj/item/clothing/head/coldwar/helmet/heer/pasgt
	name = "PASGT M81 helmet"
	desc = "An experimental tactical kevlar helmet used by the Bundesheer."
	icon_state = "pasgtheer"
	armor = list(melee = 90, bullet = 90, laser = 0, energy = 10, bomb = 70, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "pasgtheer-unzipped"


//UK Hats

/obj/item/clothing/head/coldwar/beret/baf
	name = "British Armed Forces beret"
	desc = "A maroon beret common amongst BAF airtrooper divisions."
	icon_state = "bafberet"

/obj/item/clothing/head/coldwar/garcap/baf
	name = "garrison cap"
	desc = "That's a garrison cap used by BAF."
	icon_state = "bafgarrisoncap"
	icon_state_alt = "bafgarrisoncap_alt"

//UK Helmets

/obj/item/clothing/head/coldwar/helmet/baf/mkv
	name = "MKV helmet"
	desc = "A helmet used by the United Kingdom."
	icon_state = "mkv"
	armor = list(melee = 85, bullet = 85, laser = 0, energy = 10, bomb = 65, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "mkv-unzipped"

/obj/item/clothing/head/coldwar/helmet/baf/mkv/cover
	desc = "A helmet used by the United Kingdom. This one has a netting on it."
	icon_state = "mkvc"
	icon_state_unzipped = "mkvc-unzipped"

/obj/item/clothing/head/coldwar/helmet/baf/mkv/foliage
	desc = "A helmet used by the United Kingdom. This one is covered in foliage."
	icon_state = "mkvfoliage"
	icon_state_unzipped = "mkvfoliage-unzipped"

/obj/item/clothing/head/coldwar/helmet/baf/mkv/medic
	desc = "A helmet used by the United Kingdom. This one has a red cross on it."
	icon_state = "mkvmedic"
	icon_state_unzipped = "mkvmedic-unzipped"


//FRA Hats

/obj/item/clothing/head/coldwar/beret/fra
	name = "Armee de Terre beret"
	desc = "A maroon beret common amongst BAF airtrooper divisions."
	icon_state = "fraberet"

/obj/item/clothing/head/coldwar/garcap/fra
	name = "garrison cap"
	desc = "That's a garrison cap used by ADT."
	icon_state = "frafieldcap"
	icon_state_alt = "frafieldcap_alt"

/obj/item/clothing/head/coldwar/fieldcap/fra
	name = "field cap"
	desc = "That's a field cap used by ADT."
	icon_state = "frafieldcap"

//FRA Helmets

/obj/item/clothing/head/coldwar/helmet/fra/m78
	name = "'Modele 1978' helmet"
	desc = "A helmet used by the Armee de Terre."
	icon_state = "m1978"
	armor = list(melee = 85, bullet = 85, laser = 0, energy = 10, bomb = 65, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "m1978-unzipped"

/obj/item/clothing/head/coldwar/helmet/fra/m78/cover
	desc = "A helmet used by the Armee de Terre. This one has a netting on it."
	icon_state = "m1978c"
	icon_state_unzipped = "m1978c-unzipped"

/obj/item/clothing/head/coldwar/helmet/fra/m78/medic
	desc = "A helmet used by the Armee de Terre. This one has a red cross on it."
	icon_state = "m1978medic"
	icon_state_unzipped = "m1978medic-unzipped"



///NVG googles (2nd gen)

/obj/item/clothing/glasses/night/coldwar
	wearable = 1

/obj/item/clothing/glasses/night/coldwar/pnv10t
	name = "PNV-10T"
	desc = "A second generation night vision googles used by WARPACT armies."
	icon_state = "night"
	item_state = "glasses"
	darkness_view = 7
	action_button_name = "Toggle Goggles"
	toggleable = 1
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	off_state = "denight"
	electric = 1

/obj/item/clothing/glasses/night/coldwar/pnv10t/New()
	..()
	overlay = GLOB.global_hud.nvg

/obj/item/clothing/glasses/night/coldwar/anpvs5
	name = "AN-PVS5"
	desc = "A second generation night vision googles used by NATO armies."
	icon_state = "night"
	item_state = "glasses"
	darkness_view = 7
	action_button_name = "Toggle Goggles"
	toggleable = 1
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	off_state = "denight"
	electric = 1

/obj/item/clothing/glasses/night/coldwar/anpvs5/New()
	..()
	overlay = GLOB.global_hud.nvg


///helmet covers
/obj/item/clothing/accessory/armor/coldwar/helmcover
	name = "helmet cover"
	desc = "A fabric cover for armored helmets."
	icon_override = 'icons/mob/modular_armor_new.dmi'
	icon = 'icons/obj/clothing/modular_armor.dmi'
	accessory_icons = list(slot_tie_str = 'icons/mob/modular_armor_new.dmi', slot_head_str = 'icons/mob/modular_armor_new.dmi')
	icon_state = "null"
	slot = ACCESSORY_SLOT_HELM_C
	wearable = 1
	
/obj/item/clothing/accessory/armor/coldwar/helmcover/m56/strichtarn
	name = "Strichtarn M56 cover"
	desc = "A raindrop pattern cover for M56 helmets."
	icon_state = "m56_strich"

/obj/item/clothing/accessory/armor/coldwar/helmcover/m56/netting
	name = "M56 netting cover"
	desc = "A netting mesh for M56 helmets."
	icon_state = "m56_netting"
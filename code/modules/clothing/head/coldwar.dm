/obj/item/clothing/head/garcap/
	var/icon_state_alt = null

/obj/item/clothing/head/garcap/attack_self(mob/user as mob)
	if(icon_state == initial(icon_state))
		icon_state = icon_state_alt
		to_chat(user, "You make your cap look pretty cozy. Nice.")
	else
		icon_state = initial(icon_state)
		to_chat(user, "You put your cap back in fine state.")

//Soviet hats

/obj/item/clothing/head/garcap/soviet
	name = "'Pilotka'"
	desc = "That's a garrison cap used by Soviet Army."
	icon_state = "sovietgarrisoncap"
	icon_state_alt = "sovietgarrisoncap_alt"

/obj/item/clothing/head/soviet/cap/afghanka
	name = "'Habe' field cap"
	desc = "That's a generic field cap usually worn by junior command personnel of the Soviet Army."
	icon_state = "afghanka_cap"

/obj/item/clothing/head/ushanka/soviet
	name = "ushanka"
	desc = "Where did they did an insignia on that hat? Anyway, it's still warm and comfy, so nothing to worry about."
	icon_state = "sa_ush"
	icon_state_up = "sa_ush_up"

/obj/item/clothing/head/ushanka/soviet/officer
	name = "ushanka"
	desc = "There is an insignia attached to it, and this one seems to be even a little comfier that the soldier variant."
	icon_state = "sa_ush_officer"
	icon_state_up = "sa_ush_officer_up"

/obj/item/clothing/head/ushanka/finn
	name = "Ushanka hat"
	desc = "That's a finnish Ushanka for use in cold weather."
	icon_state = "finnushanka"
	icon_state_up = "finnushanka-up"

/obj/item/clothing/head/soviet/officer
	name = "officer cap"
	desc = "An uniform headdress of officers."
	icon_state = "soviet_officer"
	body_parts_covered = HEAD



//Soviet helmets

/obj/item/clothing/head/helmet/coldwar/
	var/icon_state_unzipped = null
	flags_inv = null

/obj/item/clothing/head/helmet/coldwar/attack_self(mob/user as mob)
	if(icon_state == initial(icon_state))
		icon_state = icon_state_unzipped
		to_chat(user, "You unzip your helmet strips.")
	else
		icon_state = initial(icon_state)
		to_chat(user, "You zip your helmet back.")


/obj/item/clothing/head/helmet/coldwar/soviet/ssh68
	name = "SSh-68 helmet"
	desc = "A cheap steel helmet used by Soviet Army."
	icon_state = "ssh68"
	armor = list(melee = 62, bullet = 22, laser = 10, energy = 10, bomb = 55, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "ssh68-unzipped"


/obj/item/clothing/head/helmet/coldwar/soviet/ssh60
	name = "SSh-60 helmet"
	desc = "A cheap and somewhat outdated steel helmet used by Soviet Army."
	icon_state = "ssh60"
	armor = list(melee = 58, bullet = 20, laser = 10, energy = 10, bomb = 50, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "ssh60-unzipped"

/obj/item/clothing/head/helmet/coldwar/soviet/altyn
	name = "altyn helmet"
	desc = "A recently engineered titanium helmet, issued in limited quantities to special KGB and Spetsnaz GRU units."
	icon_state = "altyn"
	armor = list(melee = 62, bullet = 22, laser = 10, energy = 10, bomb = 55, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "altyn-unzipped"

/obj/item/clothing/head/helmet/coldwar/soviet/altyn/attack_self(mob/user as mob)
	..()
	if(icon_state == initial(icon_state))
		icon_state = "altyn-unzipped"
		to_chat(user, "You raise the helmet's visor.")
	else
		icon_state = "altyn"
		to_chat(user, "You pull the visor back down.")

//Volksarmee helmets


/obj/item/clothing/head/helmet/coldwar/nvaddr/m56
	name = "M56 stahlhelm"
	desc = "A cheap steel helmet used by NVA DDR."
	icon_state = "m56"
	armor = list(melee = 52, bullet = 24, laser = 10, energy = 10, bomb = 60, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "m56-unzipped"

/obj/item/clothing/head/helmet/coldwar/nvaddr/cover
	name = "M56 stahlhelm"
	desc = "A cheap steel helmet used by NVA DDR. Strichtarn cover."
	icon_state = "m56-cover"
	icon_state_unzipped = "m56-cover-unzipped"

/obj/item/clothing/head/helmet/coldwar/nvaddr/m56/grey
	icon_state = "m56_grey"
	desc = "A cheap steel helmet used by NVA DDR. Grey and lame."
	icon_state_unzipped = "m56_grey-unzipped"

/obj/item/clothing/head/helmet/coldwar/nvaddr/m56/foliage
	icon_state = "m56f"
	desc = "A cheap steel helmet used by NVA DDR. Foliage cover."
	icon_state_unzipped = "m56f-unzipped"

/obj/item/clothing/head/helmet/coldwar/nvaddr/m56/snow
	icon_state = "m56_snow"
	desc = "A cheap steel helmet used by NVA DDR. Winter cover."
	icon_state_unzipped = "m56_snow-unzipped"

/obj/item/clothing/head/helmet/coldwar/nvaddr/m56/snowc
	icon_state = "m56c_snow"
	desc = "A cheap steel helmet used by NVA DDR. Winter cover and netting."
	icon_state_unzipped = "m56c_snow-unzipped"

//Volksarmee hats

/obj/item/clothing/head/garcap/nvaddr
	name = "garrison cap"
	desc = "That's a garrison cap used by NVA DDR."
	icon_state = "ddrgarrisoncap"
	icon_state_alt = "ddrgarrisoncap_alt"

//Volksarmee hats

/obj/item/clothing/head/fieldcap/nvaddr
	name = "field cap"
	desc = "That's a garrison cap used by NVA DDR."
	icon_state = "strichtarn_cap"

/obj/item/clothing/head/nvaddr/officer
	name = "officer cap"
	desc = "An uniform headdress of officers."
	icon_state = "nvaddr_officer"
	body_parts_covered = HEAD


//U.S. hats

/obj/item/clothing/head/usmc/cap/woodland
	name = "woodland cap"
	desc = "That's a generic field cap in a woodland pattern."
	icon_state = "woodland_cap"

/obj/item/clothing/head/usmc/boonie/woodland
	name = "boonie hat"
	desc = "That's a generic boonie hat in a woodland pattern."
	icon_state = "boonie_woodl"


/obj/item/clothing/head/ushanka/uswintercap
	name = "winter cap"
	desc = "That's a generic winter cap for cold climates."
	icon_state = "uswintercap"
	icon_state_up = "uswintercap-up"


//U.S. watchcaps
/obj/item/clothing/head/usmc/wcap/black
	name = "watch cap"
	desc = "That's a generic beanie. This one is in black."
	icon_state = "wcapblack"
	item_state = "wcapblack"

/obj/item/clothing/head/usmc/wcap/green
	name = "watch cap"
	desc = "That's a generic beanie. This one is in dark green."
	icon_state = "wcapgreen"
	item_state = "wcapgreen"

/obj/item/clothing/head/usmc/wcap/brown
	name = "watch cap"
	desc = "That's a generic beanie. This one is in dark brown."
	icon_state = "wcapbrown"
	item_state = "wcapbrown"

/obj/item/clothing/head/usmc/wcap/blue
	name = "watch cap"
	desc = "That's a generic beanie. This one is in navy blue."
	icon_state = "wcapblue"
	item_state = "wcapblue"


//U.S. helmets

/obj/item/clothing/head/helmet/coldwar/usmc/pasgt
	name = "PASGT M81 helmet"
	desc = "An experimental tactical kevlar helmet used by U.S. army."
	icon_state = "pasgt-green"
	armor = list(melee = 48, bullet = 34, laser = 10, energy = 10, bomb = 70, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "pasgt-green-unzipped"

/obj/item/clothing/head/helmet/coldwar/usmc/pasgt/woodland
	icon_state = "pasgt-woodland"
	icon_state_unzipped = "pasgt-woodland-unzipped"


/obj/item/clothing/head/helmet/coldwar/usmc/pasgt/winter
	icon_state = "pasgtwinter"
	icon_state_unzipped = "pasgtwinter-unzipped"

/obj/item/clothing/head/helmet/coldwar/usmc/m1
	name = "M1 helmet"
	desc = "A classic helmet used by the U.S. Army."
	icon_state = "m1helmet"
	armor = list(melee = 68, bullet = 20, laser = 10, energy = 10, bomb = 65, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "m1helmet-unzipped"

/obj/item/clothing/head/helmet/coldwar/usmc/m1/woodland
	icon_state = "m1woodland"
	desc = "A classic helmet used by the U.S. Army. Woodland cover."
	icon_state_unzipped = "m1woodland-unzipped"

/*/obj/item/clothing/head/helmet/coldwar/usmc/m1/winter
	icon_state = "m1snow"
	desc = "A classic helmet used by the U.S. Army. Snow cover."
	icon_state_unzipped = "m1snow-unzipped"
*/

//HEV Helmets

/obj/item/clothing/head/helmet/coldwar/hev_helm/
	name = "H.E.V Advanced Helmet"
	desc = "An experimental protective helmet used in combination with the Black Mesa H.E.V Suit"
	icon_state = "pasgt-green"
	armor = list(melee = 99, bullet = 99, laser = 99, energy = 99, bomb = 99, bio = 100, rad = 100)
	siemens_coefficient = 0.9
	icon_state = "hev_helm_s"

/obj/item/clothing/head/helmet/coldwar/hev_helm/woodland
	icon_state = "hev_helm_w"


//BDW hats

/obj/item/clothing/head/usmc/cap/bundeswehr
	name = "Bundeswehr cap"
	desc = "That's a generic field cap in a 'Steingrau-olive' pattern."
	icon_state = "bdw_cap"

/obj/item/clothing/head/garcap/bundeswehr
	name = "garrison cap"
	desc = "That's a garrison cap used by Bundeswehr."
	icon_state = "bdwgarrisoncap"
	icon_state_alt = "bdwgarrisoncap_alt"

/obj/item/clothing/head/beret/bundeswehr
	name = "mountaineer beret"
	desc = "A green beret common amongst Bundeswehr mountaineer divisions."
	icon_state = "bdwberret"

//BDW helmets
/obj/item/clothing/head/helmet/coldwar/bdw/m62
	name = "M62 helmet"
	desc = "A cheap and somewhat outdated steel helmet used by Bundeswehr."
	icon_state = "m62helmet"
	armor = list(melee = 68, bullet = 20, laser = 10, energy = 10, bomb = 65, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "m62helmet-unzipped"

/obj/item/clothing/head/helmet/coldwar/bdw/m62/foliage
	desc = "A helmet used by Bundeswehr based on American M1 helmet. There is a net with some foliage attached to it."
	icon_state = "m62helmetfoliage"
	icon_state_unzipped = "m62helmetfoliage-unzipped"

/obj/item/clothing/head/helmet/coldwar/bdw/m62/cover
	desc = "A helmet used by Bundeswehr based on American M1 helmet. This one is covered by a camoflaged net."
	icon_state = "m62c"
	icon_state_unzipped = "m62c-unzipped"

//UK Hats

/obj/item/clothing/head/beret/baf
	name = "British Armed Forces beret"
	desc = "A maroon beret common amongst BAF airtrooper divisions."
	icon_state = "bafberret"

//UK Helmets
/obj/item/clothing/head/helmet/coldwar/baf/mkv
	name = "MKV helmet"
	desc = "A relatively average helmet used by the United Kingdom."
	icon_state = "mkv"
	armor = list(melee = 68, bullet = 20, laser = 10, energy = 10, bomb = 65, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "mkv-unzipped"

/obj/item/clothing/head/helmet/coldwar/baf/mkv/cover
	desc = "A relatively average helmet used by the United Kingdom, this one has a camo net covering it."
	icon_state = "mkvc"
	icon_state_unzipped = "mkvc-unzipped"

//FINN Hats

/obj/item/clothing/head/finn/cap/talvimetsa
	name = "Talvimetsa cap"
	desc = "That's a generic field cap in a talvimetsa pattern."
	icon_state = "finn_cap"

//FINN Helmets

/obj/item/clothing/head/helmet/coldwar/finn/m63
	name = "M63 helmet"
	desc = "A cheap and yet improved helmet compared to the M62, A steel helmet used by the Finnish."
	icon_state = "m63helmet"
	armor = list(melee = 68, bullet = 20, laser = 10, energy = 10, bomb = 65, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	icon_state_unzipped = "m63helmet-unzipped"

/obj/item/clothing/head/helmet/coldwar/finn/m63/camo
	desc = "A helmet used by the Finnish Military, improvement over the M62, this one has a woodland pattern."
	icon_state = "m63helmetc"
	siemens_coefficient = 0.9
	icon_state_unzipped = "m63helmetc-unzipped"
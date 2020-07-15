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

/obj/item/clothing/head/soviet/officer
	name = "officer cap"
	desc = "An uniform headdress of officers."
	icon_state = "soviet_officer"
	body_parts_covered = HEAD



//Soviet helmets

/obj/item/clothing/head/helmet/coldwar/
	var/icon_state_unzipped = null

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

//HEV Helmets

/obj/item/clothing/head/helmet/coldwar/hev_helm/
	name = "H.E.V Advanced Helmet"
	desc = "An experimental protective helmet used in combination with the Black Mesa H.E.V Suit"
	icon_state = "pasgt-green"
	armor = list(melee = 90, bullet = 85, laser = 35, energy = 75, bomb = 65, bio = 100, rad = 100)
	siemens_coefficient = 0.9
	icon_state = "hev_helm_s"

/obj/item/clothing/head/helmet/coldwar/hev_helm/woodland
	icon_state = "hev_helm_w"


//BDW helmets

/obj/item/clothing/head/usmc/cap/bundeswehr
	name = "Bundeswehr cap"
	desc = "That's a generic field cap in a 'Steingrau-olive' pattern."
	icon_state = "bdw_cap"

/obj/item/clothing/head/garcap/bundeswehr
	name = "garrison cap"
	desc = "That's a garrison cap used by Bundeswehr."
	icon_state = "bdwgarrisoncap"
	icon_state_alt = "bdwgarrisoncap_alt"


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
	siemens_coefficient = 0.9
	icon_state_unzipped = "m62helmetfoliage-unzipped"

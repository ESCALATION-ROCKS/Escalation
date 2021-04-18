/obj/item/clothing/accessory/badge/natodogtag
	name = "NATO dogtag"
	desc = "A piece of stamped metal containing the identification for a NATO soldier."
	gender = PLURAL
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "natodog"
	badge_string = "NATO"
	slot_flags = SLOT_TIE
	wearable = 1

/obj/item/clothing/accessory/badge/natodogtag/Initialize()
	. = ..()
	var/mob/living/carbon/human/H
	H = get_holder_of_type(src, /mob/living/carbon/human)
	if(H)
		set_name(H.real_name)
		set_desc(H)

/obj/item/clothing/accessory/badge/natodogtag/set_desc(var/mob/living/carbon/human/H)
	if(!istype(H))
		return
	desc = "[initial(desc)]\nName: [H.real_name]\nBlood type: [H.b_type]"

/obj/item/clothing/accessory/badge/wpdogtag
	name = "WARPACT dogtag"
	desc = "A piece of stamped metal containing the identification for a Warsaw Pact soldier."
	icon_state = "wpdog"
	icon = 'icons/obj/clothing/ties.dmi'
	gender = PLURAL
	badge_string = "WARPACT"
	slot_flags = SLOT_TIE
	wearable = 1

/obj/item/clothing/accessory/badge/wpdogtag/Initialize()
	. = ..()
	var/mob/living/carbon/human/H
	H = get_holder_of_type(src, /mob/living/carbon/human)
	if(H)
		set_name(H.real_name)
		set_desc(H)

/obj/item/clothing/accessory/badge/wpdogtag/set_desc(var/mob/living/carbon/human/H)
	if(!istype(H))
		return
	desc = "[initial(desc)]\nName: [H.real_name]\nBlood type: [H.b_type]"

/obj/item/clothing/accessory/insignia
	name = "Insignia"
	desc = "That's an insignia"
	on_rolled = list("down" = "none")
	var/rank = null
	wearable = 1

/obj/item/clothing/accessory/insignia/soviet/pvt
	name = "'Ryadovoi' insignia"
	icon_state = "sa_pvt_insignia"
	item_state = "soviet_jr"
	rank = "Ryadovoi"

/obj/item/clothing/accessory/insignia/soviet/gefr
	name = "'Efreitor' insignia"
	icon_state = "sa_efr_insignia"
	item_state = "soviet_jr"
	rank = "Efreitor"

/obj/item/clothing/accessory/insignia/soviet/jsgt
	name = "'Mladshiy sergant' insignia"
	icon_state = "sa_jsgt_insignia"
	item_state = "soviet_sgt"
	rank = "Mladshiy Sergant"

/obj/item/clothing/accessory/insignia/soviet/sgt
	name = "'Sergant' insignia"
	icon_state = "sa_sgt_insignia"
	item_state = "soviet_sgt"
	rank = "Sergant"

/obj/item/clothing/accessory/insignia/soviet/ssgt
	name = "'Starshiy Sergant' insignia"
	icon_state = "sa_ssgt_insignia"
	item_state = "soviet_sgt"
	rank = "Starshiy Sergant"

/obj/item/clothing/accessory/insignia/soviet/star
	name = "'Starshina' insignia"
	icon_state = "sa_star_insignia"
	item_state = "soviet_sgt"
	rank = "Starshina"

/obj/item/clothing/accessory/insignia/soviet/prap
	name = "'Praporshik' insignia"
	icon_state = "sa_pr_insignia"
	item_state = "soviet_sgt"
	rank = "Praporshik"

/obj/item/clothing/accessory/insignia/soviet/stpr
	name = "'Starshiy Praporshik' insignia"
	icon_state = "sa_stpr_insignia"
	item_state = "soviet_sgt"
	rank = "Starshiy Praporshik"

/obj/item/clothing/accessory/insignia/soviet/mllt
	name = "'Mladshiy Leitenant' insignia"
	icon_state = "sa_mllt_insignia"
	item_state = "soviet_officer"
	rank = "Mladshiy Leitenant"

/obj/item/clothing/accessory/insignia/soviet/lt
	name = "'Leitenant' insignia"
	icon_state = "sa_lt_insignia"
	item_state = "soviet_officer"
	rank = "Leitenant"

/obj/item/clothing/accessory/insignia/soviet/stlt
	name = "'Starshiy Leitenant' insignia"
	icon_state = "sa_stlt_insignia"
	item_state = "soviet_officer"
	rank = "Starshiy Leitenant"

/obj/item/clothing/accessory/insignia/soviet/cpt
	name = "'Kapitan' insignia"
	icon_state = "sa_cpt_insignia"
	item_state = "soviet_officer"
	rank = "Kapitan"


/obj/item/clothing/accessory/insignia/usmc/pfc
	name = "Private First Class insignia"
	icon_state = "usmc_pfc_insignia"
	rank = "Private First Class"

/obj/item/clothing/accessory/insignia/usmc/lcpl
	name = "Lance Corporal insignia"
	icon_state = "usmc_lcpl_insignia"
	rank = "Lance Corporal"

/obj/item/clothing/accessory/insignia/usmc/spc
	name = "Specialist insignia"
	icon_state = "usmc_cpl_insignia"
	rank = "Specialist"

/obj/item/clothing/accessory/insignia/usmc/cpl
	name = "Corporal insignia"
	icon_state = "usmc_cpl_insignia"
	rank = "Corporal"

/obj/item/clothing/accessory/insignia/usmc/sgt
	name = "Sergeant insignia"
	icon_state = "usmc_sgt_insignia"
	rank = "Sergeant"

/obj/item/clothing/accessory/insignia/usmc/ssgt
	name = "Staff Sergeant insignia"
	icon_state = "usmc_ssgt_insignia"
	rank = "Staff Sergeant"

/obj/item/clothing/accessory/insignia/usmc/sfc
	name = "Sergeant First Class"
	icon_state = "usmc_msgt_insignia"
	rank = "Sergeant First class"

/obj/item/clothing/accessory/insignia/usmc/msgt
	name = "Master Sergeant insignia"
	icon_state = "usmc_msgt_insignia"
	rank = "Master Sergeant"

/obj/item/clothing/accessory/insignia/usmc/gysgt
	name = "Gunnery Sergeant insignia"
	icon_state = "usmc_msgt_insignia"
	rank = "Gunnery Sergeant"

/obj/item/clothing/accessory/insignia/usmc/frstsgt
	name = "First Sergeant insignia"
	icon_state = "usmc_1stsgt_insignia"
	rank = "First Sergeant"

/obj/item/clothing/accessory/insignia/usmc/scndlt
	name = "Second Lieutenant insignia"
	icon_state = "usmc_2ndlt_insignia"
	rank = "Second Lieutenant"

/obj/item/clothing/accessory/insignia/usmc/frstlt
	name = "First Lieutenant insignia"
	icon_state = "usmc_1stlt_insignia"
	rank = "First Lieutenant"

/obj/item/clothing/accessory/insignia/bundeswehr/soldat
	name = "Schutze insignia"
	icon_state = "bdw_soldat"
	rank = "Schutze"

/obj/item/clothing/accessory/insignia/bundeswehr/gefr
	name = "Gefreiter insignia"
	icon_state = "bdw_gefreiter"
	rank = "Gefreiter"

/obj/item/clothing/accessory/insignia/bundeswehr/obergefr
	name = "Obergefreiter insignia"
	icon_state = "bdw_obergefreiter"
	rank = "Obergefreiter"

/obj/item/clothing/accessory/insignia/bundeswehr/hauptgefr
	name = "Hauptgefreiter insignia"
	icon_state = "bdw_hauptgefreiter"
	rank = "Hauptgefreiter"

/obj/item/clothing/accessory/insignia/bundeswehr/stabsgefr
	name = "Stabsgefreiter insignia"
	icon_state = "bdw_stabsgefreiter"
	rank = "Stabsgefreiter"

/obj/item/clothing/accessory/insignia/bundeswehr/oberstabsgefr
	name = "Obertabsgefreiter insignia"
	icon_state = "bdw_oberstabsgefreiter"
	rank = "Obertabsgefreiter"

/obj/item/clothing/accessory/insignia/bundeswehr/unter
	name = "Unteroffizier insignia"
	icon_state = "bdw_unteroffizier"
	rank = "Unteroffizier"

/obj/item/clothing/accessory/insignia/bundeswehr/stabsunter
	name = "Stabsunteroffizier insignia"
	icon_state = "bdw_stabsunteroffizier"
	rank = "Stabsunteroffizier"

/obj/item/clothing/accessory/insignia/bundeswehr/leutnant
	name = "Leutnant insignia"
	icon_state = "bdw_leutnant"
	rank = "Leutnant"

/obj/item/clothing/accessory/insignia/bundeswehr/oberleutnant
	name = "Oberleutnant insignia"
	icon_state = "bdw_oberleutnant"
	rank = "Oberleutnant"

/obj/item/clothing/accessory/insignia/bundesheer/soldat
	name = "Schutze insignia"
	icon_state = "bdw_soldat"
	rank = "Schutze"

/obj/item/clothing/accessory/insignia/bundesheer/gefr
	name = "Gefreiter insignia"
	icon_state = "bdw_gefreiter"
	rank = "Gefreiter"

/obj/item/clothing/accessory/insignia/bundesheer/obergefr
	name = "Obergefreiter insignia"
	icon_state = "bdw_obergefreiter"
	rank = "Obergefreiter"

/obj/item/clothing/accessory/insignia/bundesheer/hauptgefr
	name = "Hauptgefreiter insignia"
	icon_state = "bdw_hauptgefreiter"
	rank = "Hauptgefreiter"

/obj/item/clothing/accessory/insignia/bundesheer/stabsgefr
	name = "Stabsgefreiter insignia"
	icon_state = "bdw_stabsgefreiter"
	rank = "Stabsgefreiter"

/obj/item/clothing/accessory/insignia/bundesheer/oberstabsgefr
	name = "Obertabsgefreiter insignia"
	icon_state = "bdw_oberstabsgefreiter"
	rank = "Obertabsgefreiter"

/obj/item/clothing/accessory/insignia/bundesheer/unter
	name = "Unteroffizier insignia"
	icon_state = "bdw_unteroffizier"
	rank = "Unteroffizier"

/obj/item/clothing/accessory/insignia/bundesheer/stabsunter
	name = "Stabsunteroffizier insignia"
	icon_state = "bdw_stabsunteroffizier"
	rank = "Stabsunteroffizier"

/obj/item/clothing/accessory/insignia/bundesheer/leutnant
	name = "Leutnant insignia"
	icon_state = "bdw_leutnant"
	rank = "Leutnant"

/obj/item/clothing/accessory/insignia/bundesheer/oberleutnant
	name = "Oberleutnant insignia"
	icon_state = "bdw_oberleutnant"
	rank = "Oberleutnant"

/obj/item/clothing/accessory/insignia/nnaddr/soldat
	name = "Soldat insignia"
	icon_state = "nnaddr_soldat"
	rank = "Soldat"

/obj/item/clothing/accessory/insignia/nnaddr/gefr
	name = "Gefreiter insignia"
	icon_state = "nnaddr_gefreiter"
	rank = "Gefreiter"

/obj/item/clothing/accessory/insignia/nnaddr/obergefr
	name = "Obergefreiter insignia"
	icon_state = "nnaddr_obergefreiter"
	rank = "Obergefreiter"

/obj/item/clothing/accessory/insignia/nnaddr/unter
	name = "Unteroffizier insignia"
	icon_state = "nnaddr_unteroffizier"
	rank = "Unteroffizier"

/obj/item/clothing/accessory/insignia/nnaddr/unterfeldwebel
	name = "Unterfeldwebel insignia"
	icon_state = "nnaddr_unterfeldwebel"
	rank = "Unterfeldwebel"

/obj/item/clothing/accessory/insignia/nnaddr/feldwebel
	name = "Feldwebel insignia"
	icon_state = "nnaddr_feldwebel"
	rank = "Feldwebel"

/obj/item/clothing/accessory/insignia/nnaddr/leutnant
	name = "Leutnant insignia"
	icon_state = "nnaddr_leutnant"
	rank = "Leutnant"

/obj/item/clothing/accessory/insignia/nnaddr/oberleutnant
	name = "Oberleutnant insignia"
	icon_state = "nnaddr_oberleutnant"
	rank = "Oberleutnant"

/obj/item/clothing/accessory/squadpatch
	name = "Squad patch"
	desc = null
	icon_state = "squadpatch"
	var/squad = null

//uk

/obj/item/clothing/accessory/insignia/baf/p
	name = "Private"
	icon_state = "usmc_pfc_insignia"
	rank = "Private"

/obj/item/clothing/accessory/insignia/baf/lcpl
	name = "Lance Corporal insignia"
	icon_state = "usmc_lcpl_insignia"
	rank = "Lance Corporal"

/obj/item/clothing/accessory/insignia/baf/cpl
	name = "Corporal insignia"
	icon_state = "usmc_cpl_insignia"
	rank = "Corporal"

/obj/item/clothing/accessory/insignia/baf/sgt
	name = "Sergeant insignia"
	icon_state = "usmc_sgt_insignia"
	rank = "Sergeant"

/obj/item/clothing/accessory/insignia/baf/frstsgt
	name = "First Sergeant insignia"
	icon_state = "usmc_1stsgt_insignia"
	rank = "First Sergeant"

/obj/item/clothing/accessory/insignia/baf/scndlt
	name = "Second Lieutenant insignia"
	icon_state = "usmc_2ndlt_insignia"
	rank = "Second Lieutenant"

/obj/item/clothing/accessory/insignia/baf/lt
	name = "Lieutenant insignia"
	icon_state = "usmc_1stlt_insignia"
	rank = "Lieutenant"

////////////////////////finland
/obj/item/clothing/accessory/insignia/finn/p
	name = "Sotamies insignia"
	icon_state = "usmc_pfc_insignia"
	rank = "Jakaari"

/obj/item/clothing/accessory/insignia/finn/lcpl
	name = "Korpraali insignia"
	icon_state = "usmc_lcpl_insignia"
	rank = "Korpraali"

/obj/item/clothing/accessory/insignia/finn/cpl
	name = "Alikersantti insignia"
	icon_state = "usmc_cpl_insignia"
	rank = "Alikersantti"

/obj/item/clothing/accessory/insignia/finn/sgt
	name = "Kersantti insignia"
	icon_state = "usmc_sgt_insignia"
	rank = "Kersantti"

/obj/item/clothing/accessory/insignia/finn/ltdep
	name = "Ylikersantti insignia"
	icon_state = "usmc_1stsgt_insignia"
	rank = "Ylikersantti"

/obj/item/clothing/accessory/insignia/finn/surgeon
	name = "Vanrikki insignia"
	icon_state = "usmc_2ndlt_insignia"
	rank = "Vanrikki"

/obj/item/clothing/accessory/insignia/finn/lt
	name = "Luutnantti insignia"
	icon_state = "usmc_1stlt_insignia"
	rank = "Luutnantti"


//////////csla
/obj/item/clothing/accessory/insignia/csla/svobodnik
	name = "Svobodnik insignia"
	icon_state = "nnaddr_soldat"
	rank = "Svobodnik"

/obj/item/clothing/accessory/insignia/csla/desatnik
	name = "Desatnik insignia"
	icon_state = "nnaddr_obergefreiter"
	rank = "Desatnik"

/obj/item/clothing/accessory/insignia/csla/cetar
	name = "Cetar insignia"
	icon_state = "nnaddr_unteroffizier"
	rank = "Cetar"

/obj/item/clothing/accessory/insignia/csla/rotny
	name = "Rotny insignia"
	icon_state = "nnaddr_unteroffizier"
	rank = "Rotny"

/obj/item/clothing/accessory/insignia/csla/subleutnant
	name = "Subleutnant insignia"
	icon_state = "nnaddr_feldwebel"
	rank = "Subleutnant"

/obj/item/clothing/accessory/insignia/csla/leutnant
	name = "Leutnant insignia"
	icon_state = "nnaddr_leutnant"
	rank = "Leutnant"

//Storage Accessories

/obj/item/clothing/accessory/storage/coldwar
	wearable = 1

/obj/item/clothing/accessory/storage/coldwar/bandolier_nato
	name = "bandolier"
	desc = "A generic nylon bandolier that can hold 5 items."
	icon_state = "bandolier_nato"
	gender = NEUTER
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_OCLOTHING
	slot = ACCESSORY_SLOT_ARMOR_S
	slots = 4
	armor_slowdown = 0.0

/obj/item/clothing/accessory/storage/coldwar/bandolier_nato/filled/New()
	..()
	new /obj/item/ammo_magazine/box/paper/box556x45(hold)
	new /obj/item/ammo_magazine/box/paper/box556x45(hold)
	new /obj/item/ammo_magazine/box/paper/box556x45(hold)
	new /obj/item/ammo_magazine/box/paper/box556x45(hold)
	new /obj/item/ammo_magazine/box/paper/box556x45(hold)

/obj/item/clothing/accessory/storage/coldwar/vest
	name = "Bandolier Vest"
	desc = "A lightweight storage vest with 4 large pouches used by NATO personnel, provides no ballistic protection."
	icon_state = "bandovest_nato"
	gender = NEUTER
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_OCLOTHING
	slot = ACCESSORY_SLOT_ARMOR_S
	slots = 4
	armor_slowdown = 0.0

/obj/item/clothing/accessory/storage/coldwar/vest/woodland
	icon_state = "bandovest_nato_w"

/obj/item/clothing/accessory/storage/coldwar/lifchik
	name = "'lifchik' vest"
	desc = "Known by soviet forces as a 'lifchik', which translates to 'brassiere' in English. It seems to be knit from some kind of bag."
	icon_state = "lifchik_1"
	gender = NEUTER
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_OCLOTHING
	slot = ACCESSORY_SLOT_ARMOR_S
	slots = 4
	armor_slowdown = 0.0

/obj/item/clothing/accessory/storage/coldwar/kaz
	name = "KAZ03 chest rig"
	desc = "A chest rig used by the Bundesheer, meant to be attached on the flak vest."
	icon_state = "bandovest_heer"
	gender = NEUTER
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_OCLOTHING
	slot = ACCESSORY_SLOT_ARMOR_S
	slots = 4
	armor_slowdown = 0.0

/obj/item/clothing/accessory/storage/coldwar/lifchik/alt
	icon_state = "lifchik_2"
	slots = 2
	max_w_class = ITEM_SIZE_NORMAL
	armor_slowdown = 0.0

/obj/item/clothing/accessory/storage/coldwar/lifchikblack
	name = "webbing"
	desc = "A black webbing vest used by the Suomen Maavoimat."
	icon_state = "lifchikblack_1"
	gender = NEUTER
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_OCLOTHING
	slot = ACCESSORY_SLOT_ARMOR_S
	slots = 4
	armor_slowdown = 0.0

/obj/item/clothing/accessory/storage/coldwar/lifchikblack/alt
	icon_state = "lifchikblack_2"
	slots = 2
	max_w_class = ITEM_SIZE_NORMAL
	armor_slowdown = 0.0


/obj/item/clothing/accessory/storage/coldwar/shellbandolier
	name = "shell bandolier"
	desc = "A generic nylon 12ga shell bandolier. It can hold up to thirty 12ga shells."
	icon_state = "lifchikblack_1" //placeholder
	gender = NEUTER
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_OCLOTHING
	slot = ACCESSORY_SLOT_ARMOR_S
	slots = 6
	armor_slowdown = 0.0

/obj/item/clothing/accessory/storage/coldwar/shellbandolier/New()
	..()
	hold.can_hold = list(/obj/item/ammo_magazine/box/clip/ga12)

/*coats, these need up-down item states implemented*/

/obj/item/clothing/accessory/storage/coldwar/palatka
	name = "palash palatka"
	desc = "Known by soviet forces as 'palash palatka', it is a half-tent that you can wear as a raincoat!."
	icon_state = "palatka_t"
	item_state = ""
	/*down_icon_state = "palatka"*/
	/*down_icon_flags = BLOCKHAIR */
	/*down_body_parts_covered = HEAD*/
	gender = NEUTER
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_OCLOTHING
	slot = ACCESSORY_SLOT_ARMOR_S
	slots = 4
	armor_slowdown = 0.0

/obj/item/clothing/accessory/storage/coldwar/zeltbahn
	name = "zeltbahn"
	desc = "Known by NVA forces as 'zeltbahn', it is a half-tent that you can wear as a raincoat!."
	icon_state = "zeltbahn_t"
	item_state = ""
	/*down_icon_state = "zeltbahn"*/
	/*down_icon_flags = BLOCKHAIR */
	/*down_body_parts_covered = HEAD*/
	gender = NEUTER
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_OCLOTHING
	slot = ACCESSORY_SLOT_ARMOR_S
	slots = 4
	armor_slowdown = 0.0

/obj/item/clothing/accessory/storage/coldwar/usmccoat
	name = "marine winter coat"
	desc = "A winter coat, issued by US forces."
	icon_state = "usmc_win_t"
	item_state = ""
	/*down_icon_state = "usmc_win"*/
	/*down_icon_flags = BLOCKHAIR */
	/*down_body_parts_covered = HEAD*/
	gender = NEUTER
	w_class = ITEM_SIZE_LARGE
	slot_flags = SLOT_OCLOTHING
	slot = ACCESSORY_SLOT_ARMOR_S
	slots = 4
	armor_slowdown = 0.0
//U.S. Army
/obj/item/clothing/under/usmc/
	allowed = list(/obj/item/weapon/storage/belt/suit/ammo/)


/obj/item/clothing/under/usmc/woodland/
	name = "woodland fatigues"
	desc = "That's the M.1981 Woodland pattern uniform, commonly used by United States Army."
	icon_state = "usmcwoodland"
	worn_state = "usmcwoodland"
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 5)
	siemens_coefficient = 0.7
	slowdown_general = 0.5
	has_sensor = 0
	starting_accessories = list(/obj/item/clothing/accessory/storage/usmc_harness)

/obj/item/clothing/under/usmc/woodland/alt
	icon_state = "usmcwoodland_alt"
	worn_state = "usmcwoodland_alt"

/obj/item/clothing/under/usmc/woodland/alt/pfc
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/usmc/pfc)

/obj/item/clothing/under/usmc/woodland/alt/lcpl
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/usmc/lcpl)

/obj/item/clothing/under/usmc/woodland/alt/cpl
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/usmc/cpl)

/obj/item/clothing/under/usmc/woodland/alt/spc
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/usmc/spc)

/obj/item/clothing/under/usmc/woodland/alt/sgt
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/usmc/sgt)

/obj/item/clothing/under/usmc/woodland/alt/ssgt
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/usmc/ssgt)

/obj/item/clothing/under/usmc/woodland/alt/sfc
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/usmc/sfc)

/obj/item/clothing/under/usmc/woodland/alt/msgt
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/usmc/msgt)

/obj/item/clothing/under/usmc/woodland/alt/gysgt
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/usmc/gysgt)

/obj/item/clothing/under/usmc/woodland/alt/scndlt
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/usmc/scndlt)

/obj/item/clothing/under/usmc/woodland/alt/fstlt
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/usmc/frstlt)

//Bundeswehr

/obj/item/clothing/under/bundeswehr/
	allowed = list(/obj/item/weapon/storage/belt/suit/ammo/)

/obj/item/clothing/under/bundeswehr/olive/
	name = "olive fatigues"
	desc = "That's the so-called 'Steingrau-Oliv' uniform, which in service in Bundeswehr from 1960's."
	icon_state = "bundeswehr"
	worn_state = "bundeswehr"
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 5)
	siemens_coefficient = 0.7
	slowdown_general = 0.5
	has_sensor = 0

/obj/item/clothing/under/bundeswehr/olive/soldat
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag/,/obj/item/clothing/accessory/insignia/bundeswehr/soldat)

/obj/item/clothing/under/bundeswehr/olive/gefr
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag/,/obj/item/clothing/accessory/insignia/bundeswehr/gefr)

/obj/item/clothing/under/bundeswehr/olive/stabsgefr
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag/,/obj/item/clothing/accessory/insignia/bundeswehr/stabsgefr)

/obj/item/clothing/under/bundeswehr/olive/hauptgefr
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag/,/obj/item/clothing/accessory/insignia/bundeswehr/hauptgefr)

/obj/item/clothing/under/bundeswehr/olive/oberstabsgefr
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag/,/obj/item/clothing/accessory/insignia/bundeswehr/oberstabsgefr)

/obj/item/clothing/under/bundeswehr/olive/oberleutnant
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag/,/obj/item/clothing/accessory/insignia/bundeswehr/oberleutnant)

/obj/item/clothing/under/bundeswehr/olive/leutnant
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag/,/obj/item/clothing/accessory/insignia/bundeswehr/leutnant)

/obj/item/clothing/under/bundeswehr/olive/unter
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag/,/obj/item/clothing/accessory/insignia/bundeswehr/unter)

/obj/item/clothing/under/bundeswehr/olive/stabsunter
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag/,/obj/item/clothing/accessory/insignia/bundeswehr/stabsunter)


//Soviet Army
/obj/item/clothing/under/soviet/
	allowed = list(/obj/item/weapon/storage/belt/suit/ammo/)

/obj/item/clothing/under/soviet/habe/
	name = "'Habe' fatigues"
	desc = "That's the generic field uniform, commonly used by regular Soviet motorized infantry."
	icon_state = "habe"
	worn_state = "habe"
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 5)
	siemens_coefficient = 0.7
	slowdown_general = 0.5
	has_sensor = 0

/obj/item/clothing/under/soviet/afghanka/
	name = "'Afghanka' fatigues"
	desc = "That's the generic field uniform, commonly used by regular Soviet motorized infantry."
	icon_state = "afghanka_demiseason"
	worn_state = "afghanka_demiseason"
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 5)
	siemens_coefficient = 0.7
	slowdown_general = 0.5
	has_sensor = 0
	starting_accessories = list(/obj/item/clothing/accessory/storage/sa_harness)

/obj/item/clothing/under/soviet/afghanka/alt
	icon_state = "afghanka_demiseason_alt"
	worn_state = "afghanka_demiseason_alt"

/obj/item/clothing/under/soviet/habe/pvt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/pvt)

/obj/item/clothing/under/soviet/habe/gefr
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/gefr)

/obj/item/clothing/under/soviet/habe/jsgt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/jsgt)

/obj/item/clothing/under/soviet/habe/sgt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/sgt)

/obj/item/clothing/under/soviet/habe/ssgt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/ssgt)

/obj/item/clothing/under/soviet/habe/star
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/star)

/obj/item/clothing/under/soviet/habe/mllt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/mllt)

/obj/item/clothing/under/soviet/habe/lt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/lt)

/obj/item/clothing/under/soviet/habe/stlt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/stlt)

/obj/item/clothing/under/soviet/habe/prap
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/prap)

/obj/item/clothing/under/soviet/habe/stprap
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/stpr)

/obj/item/clothing/under/soviet/habe/cpt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/cpt)

/obj/item/clothing/under/soviet/airhabe/
	name = "TTsKO fatigues"
	desc = "A three-color pattern uniform, issues to Soviet Airborne units."
	icon_state = "airhabe"
	worn_state = "airhabe"
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 5)
	siemens_coefficient = 0.7
	slowdown_general = 0.5
	has_sensor = 0

/obj/item/clothing/under/soviet/airhabe/pvt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/pvt)

/obj/item/clothing/under/soviet/airhabe/gefr
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/gefr)

/obj/item/clothing/under/soviet/airhabe/jsgt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/jsgt)

/obj/item/clothing/under/soviet/airhabe/sgt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/sgt)

/obj/item/clothing/under/soviet/airhabe/ssgt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/ssgt)

/obj/item/clothing/under/soviet/airhabe/star
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/star)

/obj/item/clothing/under/soviet/airhabe/mllt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/mllt)

/obj/item/clothing/under/soviet/airhabe/lt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/lt)

/obj/item/clothing/under/soviet/airhabe/stlt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/stlt)

/obj/item/clothing/under/soviet/airhabe/prap
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/prap)

/obj/item/clothing/under/soviet/airhabe/stprap
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/stpr)

/obj/item/clothing/under/soviet/airhabe/cpt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/soviet/cpt)

//NVA DDR

/obj/item/clothing/under/nvaddr/
	allowed = list(/obj/item/weapon/storage/belt/suit/ammo/)


/obj/item/clothing/under/nvaddr/strichtarn
	name = "'Strichtarn' pattern uniform"
	desc = "That's the camouflaged field uniform, commonly used by regular NVA DDR motorized infantry, border guard etc."
	icon_state = "nvaddr"
	worn_state = "nvaddr"
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 5)
	siemens_coefficient = 0.7
	slowdown_general = 0.5
	has_sensor = 0

/obj/item/clothing/under/nvaddr/strichtarn/sold
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/nnaddr/soldat)

/obj/item/clothing/under/nvaddr/strichtarn/gefr
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/nnaddr/gefr)

/obj/item/clothing/under/nvaddr/strichtarn/obergefr
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/nnaddr/obergefr)

/obj/item/clothing/under/nvaddr/strichtarn/feldwebel
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/nnaddr/feldwebel)

/obj/item/clothing/under/nvaddr/strichtarn/unter
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/nnaddr/unter)

/obj/item/clothing/under/nvaddr/strichtarn/unterfeldwebel
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/nnaddr/unterfeldwebel)

/obj/item/clothing/under/nvaddr/strichtarn/leutnant
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/nnaddr/leutnant)

//Finnish Militaria

/obj/item/clothing/under/finn/
	allowed = list(/obj/item/weapon/storage/belt/suit/ammo/)

/obj/item/clothing/under/finn/talvimetsa
	name = "'Talvi Metsa' pattern uniform"
	desc = "That's the camouflaged field uniform, commonly used by regular Finnish Infantry."
	icon_state = "finn"
	worn_state = "finn"
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 5)
	siemens_coefficient = 0.7
	slowdown_general = 0.5
	has_sensor = 0

/obj/item/clothing/under/finn/talvimetsa/p
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/finn/p)

/obj/item/clothing/under/finn/talvimetsa/lcpl
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/finn/lcpl)

/obj/item/clothing/under/finn/talvimetsa/cpl
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/finn/cpl)

/obj/item/clothing/under/finn/talvimetsa/sgt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/finn/sgt)

/obj/item/clothing/under/finn/talvimetsa/ltdep
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/finn/ltdep)

/obj/item/clothing/under/finn/talvimetsa/surgeon
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/finn/surgeon)

/obj/item/clothing/under/finn/talvimetsa/lt
	starting_accessories = list(/obj/item/clothing/accessory/badge/wpdogtag/,/obj/item/clothing/accessory/insignia/finn/lt)

//British
/obj/item/clothing/under/brit/
	allowed = list(/obj/item/weapon/storage/belt/suit/ammo/)

/obj/item/clothing/under/brit/tiger
	name = "'DPM' pattern uniform"
	desc = "That's a camouflaged field uniform, commonly used by regular British Officers."
	icon_state = "tiger"
	worn_state = "tiger"
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 5)
	siemens_coefficient = 0.7
	slowdown_general = 0.5
	has_sensor = 0

/obj/item/clothing/under/brit/tiger/alt/sgt
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/baf/sgt)

/obj/item/clothing/under/brit/tiger/alt/sfc
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/baf/frstsgt)

/obj/item/clothing/under/brit/tiger/alt/scndlt
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/baf/scndlt)

/obj/item/clothing/under/brit/tiger/alt/lt
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/baf/lt)

/obj/item/clothing/under/brit/tiger/alt/cpl
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/baf/cpl)

/obj/item/clothing/under/brit/tiger/olive
	name = "'DPM Olive' pattern uniform"
	desc = "That's a camouflaged field uniform, comes with olive pants, commonly used by regular British Forces."
	icon_state = "tigero"
	worn_state = "tigero"

/obj/item/clothing/under/brit/tiger/olive/alt/p
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/baf/p)

/obj/item/clothing/under/brit/tiger/olive/alt/lcpl
	starting_accessories = list(/obj/item/clothing/accessory/badge/natodogtag, /obj/item/clothing/accessory/insignia/baf/lcpl)
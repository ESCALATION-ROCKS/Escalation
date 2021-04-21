/////////////////////////////////////NATO magazines/////////////////////////////////////////////

/obj/item/ammo_magazine/c556x45m
	name = "STANAG magazine (5.56x45mm)"
	desc = "A STANAG magazine that fits thirty 5.56mm rounds."
	icon_state = "5.56x45mm"
	item_state = "m16_mag"
	mag_type = MAGAZINE
	caliber = "556x45"
	ammo_type = /obj/item/ammo_casing/a556x45
	max_ammo = 30
	load_delay = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/c556x45m/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c556x45g
	name = "AUG magazine (5.56x45mm)"
	desc = "A Steyr AUG magazine that fits thirty 5.56mm rounds."
	icon_state = "aug"
	item_state = "m16_mag"
	mag_type = MAGAZINE
	caliber = "556x45"
	ammo_type = /obj/item/ammo_casing/a556x45
	max_ammo = 30
	load_delay = 12
	multiple_sprites = 1

/obj/item/ammo_magazine/c556x45g/examine(mob/user)
	. = ..()
	to_chat(user, "There [(stored_ammo.len == 1)? "is" : "are"] [stored_ammo.len] round\s left!")

/obj/item/ammo_magazine/c556x45g/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c556x45s
	name = "FAMAS magazine (5.56x45mm)"
	desc = "A STANAG magazine that fits twenty five 5.56x45mm rounds."
	icon_state = "5.56x45s"
	item_state = "m16_mag"
	mag_type = MAGAZINE
	caliber = "556x45"
	ammo_type = /obj/item/ammo_casing/a556x45
	max_ammo = 25
	load_delay = 12 //bullpup
	multiple_sprites = 1

/obj/item/ammo_magazine/c556x45s/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x51m //////////////30 round g3 mag - unused////////////////////
	name = "magazine (7.62x51mm)"
	desc = "A STANAG magazine that fits thirty 7.62x51mm rounds."
	icon_state = "7.62x51mm"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 30
	load_delay = 12
	multiple_sprites = 1

/obj/item/ammo_magazine/c762x51m/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x51s
	name = "magazine (7.62x51mm)"
	desc = "A STANAG magazine that fits twenty 7.62x51mm rounds."
	icon_state = "7.62x51s"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 20
	multiple_sprites = 1
	load_delay = 9

/obj/item/ammo_magazine/c762x51s/tr ////////Sniper magazines
	name = "match grade magazine (7.62x51mm)"
	desc = "A STANAG magazine that fits twenty 7.62x51mm match grade rounds."
	ammo_type = /obj/item/ammo_casing/a762x51/tr

/obj/item/ammo_magazine/c762x51s/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x51l
	name = "L96 magazine (7.62x51mm)"
	desc = "An L96 magazine that fits ten 7.62x51mm rounds."
	icon_state = "l96"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 10
	multiple_sprites = 1
	load_delay = 10

/obj/item/ammo_magazine/c762x51l/tr ////////Sniper magazines
	name = "match grade magazine (7.62x51mm)"
	desc = "An L96 magazine that fits ten 7.62x51mm match grade rounds."
	ammo_type = /obj/item/ammo_casing/a762x51/tr

/obj/item/ammo_magazine/c762x51l/empty
	initial_ammo = 0


/obj/item/ammo_magazine/c762x51f
	name = "FR F2 magazine (7.62x51mm)"
	desc = "A FR F2 magazine that fits ten 7.62x51mm rounds."
	icon_state = "l96"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 10
	multiple_sprites = 1
	load_delay = 10

/obj/item/ammo_magazine/c762x51f/tr ////////Sniper magazines
	name = "FR F2 magazine (7.62x51mm)"
	desc = "A FR F2 magazine that fits ten 7.62x51mm rounds."
	ammo_type = /obj/item/ammo_casing/a762x51/tr

/obj/item/ammo_magazine/c762x51f/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x51b
	name = "M60 belt box (7.62x51mm)"
	desc = "An M60 box that fits one hundred 7.62x51mm rounds."
	icon_state = "m60"
	item_state = "m60_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 100
	multiple_sprites = 1
	load_delay = 30
	slowdown_general = 0.1

/obj/item/ammo_magazine/c762x51b/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x51b/bdw
	name = "MG3 belt box (7.62x51mm)"
	desc = "An MG3 box that fits one hundred and fifty 7.62x51mm rounds."
	icon_state = "mg3"
	item_state = "mg3_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 150
	multiple_sprites = 1
	load_delay = 30

/obj/item/ammo_magazine/c762x51b/bdw/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x51b/bdw/drum
	name = "MG3 belt drum (7.62x51mm)"
	desc = "A belt drum that fits fifty 7.62x51mm rounds."
	icon_state = "mg3s"
	item_state = "mg3_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_NORMAL
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 50
	multiple_sprites = 1
	load_delay = 15

/obj/item/ammo_magazine/c762x51b/bdw/drum/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x51b/en
	name = "L7A2 belt box (7.62x51mm)"
	desc = "An L7A2 belt box that fits two hundred 7.62x51mm rounds."
	icon_state = "l7a2"
	item_state = "mg3_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 200
	multiple_sprites = 1
	load_delay = 30

/obj/item/ammo_magazine/c762x51b/en/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c556x45b
	name = "M249 belt box (5.56x45mm)"
	desc = "An M249 belt box that fits two hundred 5.56x45mm rounds."
	icon_state = "m249"
	item_state = "m60_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "556x45"
	ammo_type = /obj/item/ammo_casing/a556x45
	max_ammo = 200
	multiple_sprites = 1
	load_delay = 30

/obj/item/ammo_magazine/c556x45b/minimi
	name = "MINIMI belt box (5.56x45mm)"
	desc = "An MINIMI belt box that fits two hundred 5.56x45mm rounds."

/obj/item/ammo_magazine/c556x45b/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c556x45a
	name = "CETME Ameli belt box (5.56x45mm)"
	desc = "A CETME Ameli belt box that fits two hundred 5.56x45mm rounds."
	icon_state = "ameli"
	item_state = "m60_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "556x45"
	ammo_type = /obj/item/ammo_casing/a556x45
	max_ammo = 200
	multiple_sprites = 1
	load_delay = 30

/obj/item/ammo_magazine/c556x45a/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c50cals
	name = "magazine (.50 cal)"
	desc = "A magazine for the M82 Barrett, fits ten .50 cal rounds."
	icon_state = "50cal"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = ".50"
	ammo_type = /obj/item/ammo_casing/a50cal
	max_ammo = 10
	multiple_sprites = 1
	load_delay = 30

/obj/item/ammo_magazine/c50cals/tr ////////Sniper magazines
	name = "match grade magazine (.50 cal)"
	desc = "A magazine for the M82 Barrett, fits ten .50 cal match grade rounds."
	ammo_type = /obj/item/ammo_casing/a50cal/tr

/obj/item/ammo_magazine/c50cals/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a9x19
	name = "magazine (9x19mm)"
	desc = "A P1 magazine that fits eight 9x19mm rounds."
	icon_state = "9x19a"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	w_class = 1
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x19"
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x19/examine(mob/user)
	. = ..()
	to_chat(user, "There [(stored_ammo.len == 1)? "is" : "are"] [stored_ammo.len] round\s left!")

/obj/item/ammo_magazine/a9x19/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a9x19g
	name = "glock magazine (9x19mm)"
	desc = "A Glock magazine that fits eighteen 9x19mm rounds."
	icon_state = "9x19b"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	w_class = 1
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x19"
	max_ammo = 18
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x19g/examine(mob/user)
	. = ..()
	to_chat(user, "There [(stored_ammo.len == 1)? "is" : "are"] [stored_ammo.len] round\s left!")

/obj/item/ammo_magazine/a9x19g/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a9x19s
	name = "smg magazine (9x19mm)"
	desc = "An SMG magazine that fits thirty 9x19mm rounds."
	icon_state = "9x19s"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	w_class = 2
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x19"
	max_ammo = 30
	load_delay = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x19s/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a9x19k
	name = "smg drum magazine (9x19mm)"
	desc = "A KP31 magazine that fits seventy one 9x19mm rounds."
	icon_state = "9x19k"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	w_class = 2
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x19"
	max_ammo = 71
	load_delay = 12
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x19s/empty
	initial_ammo = 0


/obj/item/ammo_magazine/a9x19t
	name = "MAT-49 magazine (9x19mm)"
	desc = "A MAT-49 magazine that fits thirty two 9x19mm rounds."
	icon_state = "9x19t"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	w_class = 2
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x19"
	max_ammo = 32
	load_delay = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x19t/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a9x19t/examine(mob/user)
	. = ..()
	to_chat(user, "There [(stored_ammo.len == 1)? "is" : "are"] [stored_ammo.len] round\s left!")

/obj/item/ammo_magazine/a9x19z
	name = "Z84 magazine (9x19mm)"
	desc = "A Star Modelo Z84 magazine that fits thirty 9x19mm rounds."
	icon_state = "a9x19z"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	w_class = 2
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x19"
	max_ammo = 30
	load_delay = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x19z/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a9x19b
	name = "magazine (9x19mm)"
	desc = "A Browning Hi-Power magazine that fits thirteen 9x19mm rounds."
	icon_state = "9x19b"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	w_class = 1
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x19"
	max_ammo = 13
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x19b/examine(mob/user)
	. = ..()
	to_chat(user, "There [(stored_ammo.len == 1)? "is" : "are"] [stored_ammo.len] round\s left!")

/obj/item/ammo_magazine/a9x19b/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a9x19m
	name = "magazine (9x19mm)"
	desc = "A MAC 50 magazine that fits nine 9x19mm rounds."
	icon_state = "9x18a"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	w_class = 1
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x19"
	max_ammo = 9
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x19m/examine(mob/user)
	. = ..()
	to_chat(user, "There [(stored_ammo.len == 1)? "is" : "are"] [stored_ammo.len] round\s left!")

/obj/item/ammo_magazine/a9x19m/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a45
	name = "magazine (.45 ACP)"
	desc = "An M1911 magazine that fits seven .45 ACP rounds."
	icon_state = "a45"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a45
	caliber = ".45"
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/a45/examine(mob/user)
	. = ..()
	to_chat(user, "There [(stored_ammo.len == 1)? "is" : "are"] [stored_ammo.len] round\s left!")

/obj/item/ammo_magazine/a45/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x51wa
	name = "WA2000 magazine (7.62x51mm)"
	desc = "A WA2000 magazine that fits six 7.62x51mm rounds."
	icon_state = "wa2000mag"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/c762x51wa/tr ////////Sniper magazines
	desc = "A WA2000 magazine that fits six 7.62x51mm match grade rounds."
	name = "match grade magazine (7.62x51mm)"
	ammo_type = /obj/item/ammo_casing/a762x51/tr

/obj/item/ammo_magazine/c762x51wa/empty
	initial_ammo = 0

/obj/item/ammo_magazine/m9x19
	name = "magazine (9x19mm)"
	desc = "A Beretta M9 magazine that fits fifteen 9x19mm rounds."
	icon_state = "9x19b"
	item_state = "generic_mag"
	w_class = 1
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x19"
	max_ammo = 15
	multiple_sprites = 1

/obj/item/ammo_magazine/m9x19/examine(mob/user)
	. = ..()
	to_chat(user, "There [(stored_ammo.len == 1)? "is" : "are"] [stored_ammo.len] round\s left!")

/obj/item/ammo_magazine/m9x19/empty
	initial_ammo = 0

//////////////////////////////////// WARPACT magazines//////////////////////////////////////////

/obj/item/ammo_magazine/c545x39m
	name = "magazine (5.45x39mm)"
	desc = "An AK-platform magazine that fits thirty 5.45x39mm rounds. Made of bakelite."
	icon_state = "5.45x39mm"
	item_state = "ak_mag"
	mag_type = MAGAZINE
	caliber = "545x39"
	ammo_type = /obj/item/ammo_casing/a545x39
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/c545x39m/black
	name = "magazine (5.45x39mm)"
	desc = "An AK-platform magazine that fits thirty armor-piercing 5.45x39mm rounds. Made of bakelite."
	icon_state = "5.45x39mmb"
	item_state = "generic_mag"
	ammo_type = /obj/item/ammo_casing/a545x39/

/obj/item/ammo_magazine/c545x39m/black/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c545x39m/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c545x39b
	name = "large magazine (5.45x39mm)"
	desc = "An AK-platform magazine that fits fourty five 5.45x39mm rounds. Made of bakelite."
	icon_state = "5.45x39b"
	item_state = "ak_mag"
	mag_type = MAGAZINE
	caliber = "545x39"
	ammo_type = /obj/item/ammo_casing/a545x39
	max_ammo = 45
	multiple_sprites = 1
	w_class = 3
	slowdown_general = 0.1

/obj/item/ammo_magazine/c545x39b/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c545x39s
	name = "small magazine (5.45x39mm)"
	desc = "A small magazine that fits five 5.45x39mm rounds. Made of stainless steel."
	icon_state = "5.45x39s"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	caliber = "545x39"
	ammo_type = /obj/item/ammo_casing/a545x39
	max_ammo = 5
	load_delay = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/c545x39s/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x39m
	name = "magazine (7.62x39mm)"
	desc = "An AK-platform magazine that fits thirty 7.62x39mm rounds."
	icon_state = "7.62x39mm"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 30
	multiple_sprites = 1
	load_delay = 10

/obj/item/ammo_magazine/c762x39m/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x39b
	name = "large magazine (7.62x39mm)"
	desc = "An AK-platform magazine that fits fourty 7.62x39mm rounds."
	icon_state = "7.62x39mmb"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_NORMAL
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 40
	multiple_sprites = 1
	load_delay = 12
	slowdown_general = 0.1

/obj/item/ammo_magazine/c762x39b/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x39k
	name = "drum magazine (7.62x39mm)"
	desc = "An AK-platform drum magazine that fits seventy five 7.62x39mm rounds."
	icon_state = "rpdbaraban"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 75
	multiple_sprites = 1
	load_delay = 18

/obj/item/ammo_magazine/c762x39k/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x39d
	name = "RPD belt drum (7.62x39mm)"
	desc = "An RPD belt drum that fits seventy five 7.62x39mm rounds."
	icon_state = "c762x39d"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 75
	multiple_sprites = 1
	load_delay = 20

/obj/item/ammo_magazine/c762x39d/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x39v
	name = "KK62 belt drum (7.62x39mm)"
	desc = "A KK62 belt drum that fits one hundred 7.62x39mm rounds."
	icon_state = "kk62"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 100
	multiple_sprites = 1
	load_delay = 30

/obj/item/ammo_magazine/c762x39v/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x54s
	name = "SVD magazine (7.62x54mmR)"
	desc = "A SVD magazine that fits ten 7.62x54mm rounds."
	icon_state = "7.62x54s"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	max_ammo = 10
	multiple_sprites = 1
	load_delay = 7

/obj/item/ammo_magazine/c762x54s/tr ////////Sniper magazines
	name = "SVD match grade magazine (7.62x54mmr)"
	desc = "A SVD magazine that fits ten 7.62x54mmR match grade rounds."
	ammo_type = /obj/item/ammo_casing/a762x54/tr

/obj/item/ammo_magazine/c762x54s/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x54b
	name = "PKM belt box (7.62x54mmR)"
	desc = "A PKM belt box that fits two hundred 7.62x54mmR rounds."
	icon_state = "pkm"
	item_state = "pkm_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	max_ammo = 200
	multiple_sprites = 1
	load_delay = 30
	slowdown_general = 0.1

/obj/item/ammo_magazine/c762x54b/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762x54b/csla
	name = "vz. 59 belt box (7.62x54mmR)"
	desc = "A gray vz.59 belt box that fits two hundred 7.62x54mmR rounds."
	icon_state = "vz59"
	item_state = "mg3_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	max_ammo = 200
	multiple_sprites = 1
	load_delay = 30

/obj/item/ammo_magazine/c762x54b/csla/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a9x18
	name = "magazine (9x18mm)"
	desc = "A Makarov magazine that fits eight 9x18mm rounds."
	icon_state = "9x18a"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	w_class = 1
	ammo_type = /obj/item/ammo_casing/a9x18
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x18"
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x18/examine(mob/user)
	. = ..()
	to_chat(user, "There [(stored_ammo.len == 1)? "is" : "are"] [stored_ammo.len] round\s left!")

/obj/item/ammo_magazine/a9x18/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a9x18b
	name = "magazine (9x18mm)"
	desc = "A Stechkin APS magazine that fits twenty 9x18mm rounds."
	icon_state = "9x18b"
	item_state = "generic_mag"
	mag_type = MAGAZINE
	w_class = 1
	ammo_type = /obj/item/ammo_casing/a9x18
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x18"
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x18b/examine(mob/user)
	. = ..()
	to_chat(user, "There [(stored_ammo.len == 1)? "is" : "are"] [stored_ammo.len] round\s left!")

/obj/item/ammo_magazine/a9x18b/empty
	initial_ammo = 0

/obj/item/ammo_magazine/cz9x18
	name = "magazine (9x18mm)"
	desc = "A CZ82 magazine that fits twelve 9x18mm rounds."
	icon_state = "9x18a" //fix
	item_state = "generic_mag"
	w_class = 1
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x18
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x18"
	max_ammo = 12
	multiple_sprites = 1

/obj/item/ammo_magazine/cz9x18/examine(mob/user)
	. = ..()
	to_chat(user, "There [(stored_ammo.len == 1)? "is" : "are"] [stored_ammo.len] round\s left!")

/obj/item/ammo_magazine/cz9x18/empty
	initial_ammo = 0

//////////////////////////////////////////heavy weapons//////////////////////////////////////

/obj/item/ammo_magazine/c127x108b
	name = "UTES belt box (12.7x108mm)"
	desc = "A NSV Utes belt box that fits fifty 12.7x108mm rounds."
	icon_state = "utes"
	item_state = "pkm_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "127x108mm"
	ammo_type = /obj/item/ammo_casing/a127x108mm
	max_ammo = 50
	multiple_sprites = 1
	slowdown_general = 0.1

/obj/item/ammo_magazine/c127x108d
	name = "DsHK belt box (12.7x108mm)"
	desc = "A DsHK belt box that fits fifty 12.7x108mm rounds."
	icon_state = "utes"
	item_state = "pkm_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_LARGE
	caliber = "127x108mm"
	ammo_type = /obj/item/ammo_casing/a127x108mm
	max_ammo = 50
	multiple_sprites = 1
	slowdown_general = 0.1

/obj/item/ammo_magazine/c50cal
	name = "Browning belt box (.50 cal)"
	desc = "A Browning belt box that fits one hundred .50 cal rounds."
	icon_state = "m2ammo"
	item_state = "m60_mag"
	mag_type = MAGAZINE
	w_class = 5
	caliber = ".50"
	ammo_type = /obj/item/ammo_casing/a50cal
	max_ammo = 100
	multiple_sprites = 1
	load_delay = 30

/obj/item/ammo_magazine/ags30x29mm
	name = "AGS belt box (VOG 30x29mm)"
	desc = "An AGS Plamya belt box that fits twenty nine grenades."
	icon_state = "ags30x29mm"
	item_state = "pkm_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_HUGE
	caliber = "30x29mm"
	ammo_type = /obj/item/ammo_casing/ags30x29mm
	max_ammo = 29
	multiple_sprites = 1
	load_delay = 40

/obj/item/ammo_magazine/mk19_40x53mm
	name = "MK19 belt box (MK19 40x53mm)"
	desc = "A MK19 box that fits thirty two grenades."
	icon_state = "mk19ammo"
	item_state = "m60_mag"
	mag_type = MAGAZINE
	w_class = ITEM_SIZE_HUGE
	caliber = "40x53mm"
	ammo_type = /obj/item/ammo_casing/mk19_40x53mm
	max_ammo = 32
	multiple_sprites = 1
	load_delay = 40

///////////////////////////////////ammo packs/////////////////////////////////////////

/obj/item/ammo_magazine/box/paper/
	max_ammo = 40

/obj/item/ammo_magazine/box/paper/box545x39
	name = "ammo box (5.45x39mm)"
	desc = "A 40-round pack of 5.45x39mm ammunition."
	icon_state = "sa_box"
	item_state = "paper_mag"
	ammo_type = /obj/item/ammo_casing/a545x39
	caliber = "545x39"

/obj/item/ammo_magazine/box/paper/box545x39/tr
	name = "match grade ammo box (5.45x39mm)"
	desc = "A 40-round pack of 5.45x39mm match grade ammunition."
	icon_state = "sa_box"
	item_state = "paper_mag"
	ammo_type = /obj/item/ammo_casing/a545x39/tr

/obj/item/ammo_magazine/box/paper/box762x39
	name = "ammo box (7.62x39mm)"
	desc = "A 40-round pack of 7.62x39mm ammunition."
	icon_state = "csla_box"
	item_state = "paper_mag"
	ammo_type = /obj/item/ammo_casing/a762x39
	caliber = "762x39"

/obj/item/ammo_magazine/box/paper/box762x39/tr
	name = "match grade ammo box (7.62x39mm)"
	desc = "A 40-round pack of 7.62x39mm match grade ammunition."
	icon_state = "csla_box"
	item_state = "paper_mag"
	ammo_type = /obj/item/ammo_casing/a762x39/tr

/obj/item/ammo_magazine/box/paper/box762x54
	name = "ammo box (7.62x54mmR)"
	desc = "A 40-round pack of 7.62x54mmR ammunition."
	icon_state = "csla_box"
	item_state = "paper_mag"
	ammo_type = /obj/item/ammo_casing/a762x54
	caliber = "762x54"

/obj/item/ammo_magazine/box/paper/box762x54/tr
	name = "match grade ammo box (7.62x54mmR)"
	desc = "A 40-round pack of 7.62x54mmR match grade ammunition."
	icon_state = "csla_box"
	item_state = "paper_mag"
	ammo_type = /obj/item/ammo_casing/a762x54/tr

/obj/item/ammo_magazine/box/paper/box556x45
	name = "ammo box (5.56x45mm)"
	desc = "A 40-round pack of 5.56x45mm ammunition."
	icon_state = "usmc_box"
	item_state = "paper_mag"
	ammo_type = /obj/item/ammo_casing/a556x45
	caliber = "556x45"

/obj/item/ammo_magazine/box/paper/box556x45/tr
	name = "match grade ammo box (5.56x45mm)"
	desc = "A 40-round pack of 5.56x45mm match grade ammunition."
	icon_state = "usmc_box"
	item_state = "paper_mag"
	ammo_type = /obj/item/ammo_casing/a556x45/tr

/obj/item/ammo_magazine/box/paper/box762x51
	name = "ammo box (7.62x51mm)"
	desc = "A 40-round pack of 7.62x51mm ammunition."
	icon_state = "bdw_box"
	item_state = "paper_mag"
	ammo_type = /obj/item/ammo_casing/a762x51
	caliber = "762x51"

/obj/item/ammo_magazine/box/paper/box762x51/tr
	name = "match grade ammo box (7.62x51mm)"
	desc = "A 40-round pack of 7.62x51mm match grade ammunition."
	icon_state = "bdw_box"
	ammo_type = /obj/item/ammo_casing/a762x51/tr
	caliber = "762x51"

/////////////////////////////////////////////pistols//////////////////////////////

/obj/item/ammo_magazine/box/paper/box9x19
	name = "ammo box (9x19mm)"
	desc = "A 40-round pack of 9x19mm ammunition."
	icon_state = "nine_box"
	item_state = "paper_mag"
	ammo_type = /obj/item/ammo_casing/a9x19
	caliber = "9x19"

/obj/item/ammo_magazine/box/paper/box9x19/tr
	name = "ammo box (9x19mm)"
	desc = "A 40-round pack of 9x19mm ammunition."
	icon_state = "bdw_box"
	item_state = "paper_mag"
	ammo_type = /obj/item/ammo_casing/a9x19/tr

/obj/item/ammo_magazine/box/paper/box9x18
	name = "ammo box (9x18mm)"
	desc = "A 40-round pack of 9x18mm ammunition."
	icon_state = "csla_box"
	item_state = "paper_mag"
	ammo_type = /obj/item/ammo_casing/a9x18
	caliber = "9x18"

/obj/item/ammo_magazine/box/paper/box9x18/tr
	name = "match grade ammo box (9x18mm)"
	desc = "A 40-round pack of 9x18mm match grade ammunition."
	icon_state = "csla_box"
	item_state = "paper_mag"
	ammo_type = /obj/item/ammo_casing/a9x18/tr
	caliber = "9x18"

/////////shotgun boxes

/obj/item/ammo_magazine/box/paper/boxga12
	name = "#00 buckshot shell box (12ga)"
	desc = "A 25 shotshell pack of 12ga #00 buckshot shells."
	icon_state = "ga12_box"
	item_state = "paper_mag"
	w_class = ITEM_SIZE_LARGE
	max_ammo = 5
	ammo_type = /obj/item/ammo_magazine/box/clip/ga12
	caliber = "12ga"

/obj/item/ammo_magazine/box/paper/boxga12/slug
	name = "slug shell box (12ga)"
	desc = "A 25 shotshell pack of 12ga slug shells."
	icon_state = "ga12slug_box"
	item_state = "paper_mag"
	w_class = ITEM_SIZE_LARGE
	max_ammo = 5
	ammo_type = /obj/item/ammo_magazine/box/clip/ga12/slug
	caliber = "12ga"

/obj/item/ammo_magazine/box/paper/boxga12/flec
	name = "flechette shell box (12ga)"
	desc = "A 20 shotshell pack of 12ga flechette shells."
	icon_state = "ga12flec_box"
	w_class = ITEM_SIZE_LARGE
	item_state = "paper_mag"
	max_ammo = 5
	ammo_type = /obj/item/ammo_magazine/box/clip/ga12/flec
	caliber = "12ga"

/obj/item/ammo_magazine/box/paper/boxga6
	name = "'Shrapnel-25' shell box (6ga)"
	desc = "A 20 shotshell pack of 6ga 'Shrapnel-25' buckshot shells."
	icon_state = "ga6_box"
	item_state = "paper_mag"
	w_class = ITEM_SIZE_LARGE
	max_ammo = 5
	ammo_type = /obj/item/ammo_magazine/box/clip/ga6
	caliber = "6ga"

/obj/item/ammo_magazine/box/paper/boxga6/slug
	name = "'Barricada' shell box (6ga)"
	desc = "A 25 shotshell pack of 6ga 'Barricada' slug shells."
	icon_state = "ga6slug_box"
	item_state = "paper_mag"
	w_class = ITEM_SIZE_LARGE
	max_ammo = 5
	ammo_type = /obj/item/ammo_magazine/box/clip/ga6/slug
	caliber = "6ga"

/obj/item/ammo_magazine/box/paper/boxga6/flec
	name = "'Fleshet' shell box (6ga)"
	desc = "A 20 shotshell pack of 6ga 'Fleshet' flechette shells."
	icon_state = "ga6flec_box"
	w_class = ITEM_SIZE_LARGE
	item_state = "paper_mag"
	max_ammo = 5
	ammo_type = /obj/item/ammo_magazine/box/clip/ga6/flec
	caliber = "6ga"

/////////////////// clips

/obj/item/ammo_magazine/box/clip/h762x53
	name = "stripper clip (7.62x53mmR)"
	desc = "A clip of 7.62x53mmR ammunition."
	mag_type = SPEEDLOADER
	icon_state = "h762x53"
	item_state = "clip_mag"
	caliber = "762x53"
	ammo_type = /obj/item/ammo_casing/a762x53
	w_class = 1
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/box/clip/h762x53/tr
	name = "match grade stripper clip (7.62x53mmR)"
	desc = "A stripper clip of yellow tipped 7.62x53mmR ammunition."
	mag_type = SPEEDLOADER
	icon_state = "hy762x53"
	item_state = "clip_mag"
	caliber = "762x53"
	ammo_type = /obj/item/ammo_casing/a762x53/tr
	w_class = 1
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/box/clip/h303
	name = "stripper clip (.303 British)"
	desc = "A clip of .303 British ammunition."
	mag_type = SPEEDLOADER
	icon_state = "h762x53"
	item_state = "clip_mag"
	caliber = "303"
	ammo_type = /obj/item/ammo_casing/a303
	w_class = 1
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/box/clip/h303/tr
	name = "match grade stripper clip (.303 British)"
	desc = "A stripper clip of .303 British match grade ammunition."
	mag_type = SPEEDLOADER
	icon_state = "h762x53"
	item_state = "clip_mag"
	caliber = "303"
	ammo_type = /obj/item/ammo_casing/a303/tr
	w_class = 1
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/box/clip/h303/empty
	initial_ammo = 0

///////////////////////handfuls

/obj/item/ammo_magazine/box/clip/t762x51
	name = "handful of bullets (7.62x51mm)"
	desc = "A handful of 7.62x51mm bullets."
	mag_type = AMMO_BOX
	icon_state = "t762x51"
	caliber = "762x51"
	w_class = 1
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/box/clip/t762x51/tr
	name = "handful of match grade bullets (7.62x51mm)"
	desc = "A handful of orange tipped 7.62x51mm bullets."
	mag_type = AMMO_BOX
	icon_state = "to762x51"
	caliber = "762x51"
	w_class = 1
	ammo_type = /obj/item/ammo_casing/a762x51/tr
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/box/clip/t762x53
	name = "handful of bullets (7.62x53mmR)"
	desc = "A handful of 7.62x53mmR bullets."
	mag_type = AMMO_BOX
	icon_state = "t762x53"
	caliber = "762x53"
	w_class = 1
	ammo_type = /obj/item/ammo_casing/a762x53
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/box/clip/t762x53/tr
	name = "handful of match grade bullets (7.62x53mmR)"
	desc = "A handful of yellow tipped 7.62x53mmR bullets."
	mag_type = AMMO_BOX
	icon_state = "ty762x53"
	caliber = "762x53"
	w_class = 1
	ammo_type = /obj/item/ammo_casing/a762x53/tr
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/box/clip/ga12
	name = "handful of #00 buckshot shells (12ga)"
	desc = "A handful of #00 buckshot shells."
	mag_type = AMMO_BOX
	icon_state = "ga12"
	caliber = "12ga"
	w_class = 1
	ammo_type = /obj/item/ammo_casing/ga12
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/box/clip/ga12/slug
	name = "handful of slug shells (12ga)"
	desc = "A handful of slug shells."
	mag_type = AMMO_BOX
	icon_state = "ga12slug"
	caliber = "12ga"
	w_class = 1
	ammo_type = /obj/item/ammo_casing/ga12/slug
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/box/clip/ga12/flec
	name = "handful of flechette shells (12ga)"
	desc = "A handful of flechette shells."
	mag_type = AMMO_BOX
	icon_state = "ga12flec"
	caliber = "12ga"
	w_class = 1
	ammo_type = /obj/item/ammo_casing/ga12/flec
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/box/clip/ga6
	name = "handful of buckshot shells (ga6)"
	desc = "A handful of buckshot shells."
	mag_type = AMMO_BOX
	icon_state = "ga6"
	caliber = "6ga"
	w_class = 1
	ammo_type = /obj/item/ammo_casing/ga6
	max_ammo = 4
	multiple_sprites = 1

/obj/item/ammo_magazine/box/clip/ga6/slug
	name = "handful of slug shells (ga6)"
	desc = "A handful of slug shells."
	mag_type = AMMO_BOX
	icon_state = "ga6slug"
	caliber = "6ga"
	w_class = 1
	ammo_type = /obj/item/ammo_casing/ga6/slug
	max_ammo = 4
	multiple_sprites = 1

/obj/item/ammo_magazine/box/clip/ga6/flec
	name = "handful of flechette shells (ga6)"
	desc = "A handful of flechette shells."
	mag_type = AMMO_BOX
	icon_state = "ga6flec"
	caliber = "6ga"
	w_class = 1
	ammo_type = /obj/item/ammo_casing/ga6/flec
	max_ammo = 4
	multiple_sprites = 1




















///////BOTTOM OF THE ICEBERG

/obj/item/ammo_magazine/flamer ////////TEST THING - FLAMETHROWER DOESN'T ACTUALLY WORK
	name = "flamer fuel"
	desc = "Put it in your flamer and roast those you don't like."
	icon_state = "flamer"
	caliber = "flamer"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/flamer
	max_ammo = 30
	multiple_sprites = FALSE

/obj/item/ammo_magazine/flamer/attack_self(mob/user) //Can't empty out
	return

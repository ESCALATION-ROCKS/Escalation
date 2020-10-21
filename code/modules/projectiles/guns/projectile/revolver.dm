/obj/item/weapon/gun/projectile/revolver
	name = "revolver"
	desc = "The Lumoco Arms HE Colt is a choice revolver for when you absolutely, positively need to put a hole in the other guy. Uses .357 ammo."
	icon_state = "revolver"
	item_state = "revolver"
	caliber = "357"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	handle_casings = CYCLE_CASINGS
	max_shells = 6
	ammo_type = /obj/item/ammo_casing/a357
	var/chamber_offset = 0 //how many empty chambers in the cylinder until you hit a round
	picksound = 'sound/items/interactions/pistol_draw.wav'
	reload_sound = 'sound/weapons/gunhandling/revolver_loader.wav'
	cocked_sound = 'sound/weapons/gunhandling/revolver_cock.wav'
	fire_sound = 'sound/weapons/gunshot/revolver.ogg'
	jam_chance = 5
	loud = 0
/obj/item/weapon/gun/projectile/revolver/verb/spin_cylinder()
	set name = "Spin cylinder"
	set desc = "Fun when you're bored out of your skull."
	set category = "Object"

	chamber_offset = 0
	visible_message("<span class='warning'>\The [usr] spins the cylinder of \the [src]!</span>", \
	"<span class='notice'>You hear something metallic spin and click.</span>")
	playsound(src.loc, 'sound/weapons/revolver_spin.ogg', 100, 1)
	loaded = shuffle(loaded)
	if(rand(1,max_shells) > loaded.len)
		chamber_offset = rand(0,max_shells - loaded.len)

/obj/item/weapon/gun/projectile/revolver/consume_next_projectile()
	if(chamber_offset)
		chamber_offset--
		return
	return ..()

/obj/item/weapon/gun/projectile/revolver/load_ammo(var/obj/item/A, mob/user)
	chamber_offset = 0
	return ..()

/obj/item/weapon/gun/projectile/revolver/mateba
	name = "mateba"
	icon_state = "mateba"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)

/obj/item/weapon/gun/projectile/revolver/detective
	name = "revolver"
	desc = "A cheap Martian knock-off of a Smith & Wesson Model 10. Uses .38-Special rounds."
	icon_state = "detective"
	max_shells = 6
	caliber = "38"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/c38

/obj/item/weapon/gun/projectile/revolver/detective/verb/rename_gun()
	set name = "Name Gun"
	set category = "Object"
	set desc = "Click to rename your gun. If you're the detective."

	var/mob/M = usr
	if(!M.mind)	return 0
	if(!M.mind.assigned_role == "Detective")
		to_chat(M, "<span class='notice'>You don't feel cool enough to name this gun, chump.</span>")
		return 0

	var/input = sanitizeSafe(input("What do you want to name the gun?", ,""), MAX_NAME_LEN)

	if(src && input && !M.stat && in_range(M,src))
		name = input
		to_chat(M, "You name the gun [input]. Say hello to your new friend.")
		return 1

// Blade Runner pistol.
/obj/item/weapon/gun/projectile/revolver/deckard
	name = "Deckard .44"
	desc = "A custom-built revolver, based off the semi-popular Detective Special model."
	icon_state = "deckard-empty"
	ammo_type = /obj/item/ammo_magazine/c38/rubber

/obj/item/weapon/gun/projectile/revolver/deckard/emp
	ammo_type = /obj/item/ammo_casing/c38/emp

/obj/item/weapon/gun/projectile/revolver/deckard/update_icon()
	..()
	if(loaded.len)
		icon_state = "deckard-loaded"
	else
		icon_state = "deckard-empty"

/obj/item/weapon/gun/projectile/revolver/deckard/load_ammo(var/obj/item/A, mob/user)
	if(istype(A, /obj/item/ammo_magazine))
		flick("deckard-reload",src)
	..()

/obj/item/weapon/gun/projectile/revolver/capgun
	name = "cap gun"
	desc = "Looks almost like the real thing! Ages 8 and up."
	icon_state = "revolver-toy"
	item_state = "revolver"
	caliber = "caps"
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	handle_casings = CYCLE_CASINGS
	max_shells = 7
	ammo_type = /obj/item/ammo_casing/cap

/obj/item/weapon/gun/projectile/revolver/capgun/attackby(obj/item/weapon/wirecutters/W, mob/user)
	if(!istype(W) || icon_state == "revolver")
		return ..()
	to_chat(user, "<span class='notice'>You snip off the toy markings off the [src].</span>")
	name = "revolver"
	icon_state = "revolver"
	desc += " Someone snipped off the barrel's toy mark. How dastardly."
	return 1


/obj/item/weapon/gun/projectile/revolver/chevalier
	name = "Chevalier MkI"
	desc = "That's the Unity Arms Chevalier. Cheap, durable and effective. Also, it's double action. Loaded with .44 rounds."
	icon_state = "chevalier"
	max_shells = 6
	caliber = ".44"
	w_class = 2
	ammo_type = null
	jam_chance = 0.01
	var/cocked = FALSE

/obj/item/weapon/gun/projectile/revolver/chevalier/update_icon()
	if(cocked)
		icon_state = "chevalier-cocked"
	else
		icon_state = "chevalier"

/obj/item/weapon/gun/projectile/revolver/chevalier/attack_self(mob/user)
	if(cocked)
		..()
	else
		cocked = TRUE
		accuracy += 3
		update_icon()
		to_chat(user, "You cock \the [src].")
		playsound(user, 'sound/weapons/revolver_cock.ogg', 50, 1)

/obj/item/weapon/gun/projectile/revolver/chevalier/afterattack(atom/target as mob|obj|turf|area, mob/living/user as mob|obj, flag, struggle = 0)
	if(cocked)
		..()
		cocked = FALSE
		accuracy -=3
		update_icon()
	else
		..()

/obj/item/weapon/gun/projectile/revolver/nipper
	name = "Nipper GSAR Mk.I"
	desc = "That's the Unity Arms Nipper Government Service Automatic Revolver. It's pretty unreliable, so you'd better search something better than this. Loaded with .32 rounds."
	icon_state = "nipper"
	max_shells = 7
	caliber = ".32"
	w_class = 2
	ammo_type = null
	jam_chance = 10
	accuracy = 1
	fire_anim = "nipper_anim"
	fire_sound = 'sound/weapons/gunshot/revolver_shoot.ogg'

/obj/item/weapon/gun/projectile/revolver/nipper/mk2
	name = "Nipper GSAR Mk.II"
	desc = "That's the Unity Arms Nipper Government Service Automatic Revolver Mark 2. Now it's more reliable than the Mark One, but still isn't so reliable than double-action revolvers are. Loaded with .32 rounds."
	icon_state = "nipper"
	max_shells = 7
	caliber = ".32"
	w_class = 2
	jam_chance = 5
	accuracy = 1.2
	fire_anim = "nipper_anim"

/obj/item/weapon/gun/projectile/craftrifle
	name = "boomstick"
	desc = "A cheap makeshift rifle."
	icon_state = "boomstick"
	item_state = "OLDshotgun"
	caliber = ".22lr"
	origin_tech = "combat=3;materials=2"
	w_class = 4.0
	fire_sound = 'sound/weapons/garandshot.ogg'
	ammo_type = /obj/item/ammo_casing/pistol/a22lr
	condition = 1
	max_shells = 1
	screen_shake = 2
	load_method = 0 //0 = Single shells or quick loader, 1 = box, 2 = magazine
	var/boom_mod_count = 1
	blowout_chance = 5
	picksound = 'sound/items/interactions/rifle_draw.ogg'
	drop_sound = 'sound/items/interactions/drop_gun.ogg'
	load_method = SINGLE_CASING

/obj/item/weapon/gun/projectile/craftrifle/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if(istype(W, /obj/item/weapon/screwdriver))
		if(boom_mod_count == 1)
			user << "<span class='notice'>You begin to expand the barrel of [src]...</span>"
			if(loaded.len)
				afterattack(user, user)	//you know the drill
				playsound(user, fire_sound, 50, 1)
				user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='danger'>[src] goes off in your face!</span>")
				return
			else
				sleep(100)
				caliber = "9x19"
				user << "<span class='notice'>You reinforce the barrel of [src]. Now it will fire 9mm rounds.</span>"
				boom_mod_count = 2
				blowout_chance = 10
				ammo_type = /obj/item/ammo_casing/pistol/a9mm
				return
		else if(boom_mod_count == 2)
			user << "<span class='notice'>You begin to expand the barrel of [src]...</span>"
			if(loaded.len)
				afterattack(user, user)	//and again
				playsound(user, fire_sound, 50, 1)
				user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='danger'>[src] goes off in your face!</span>")
				return
			else
				sleep(100)
				caliber = "38"
				ammo_type = /obj/item/ammo_casing/c38
				user << "<span class='notice'>You reinforce the barrel of [src]. Now it will fire .38 rounds.</span>"
				boom_mod_count = 3
				blowout_chance = 15
				return
		else if(boom_mod_count == 3)
			user << "<span class='notice'>You begin to expand the barrel of [src]...</span>"
			if(loaded.len)
				afterattack(user, user)	//and again
				playsound(user, fire_sound, 50, 1)
				user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='danger'>[src] goes off in your face!</span>")
				return
			else
				sleep(100)
				caliber = ".40"
				ammo_type = /obj/item/ammo_casing/pistol/a40sw
				user << "<span class='notice'>You reinforce the barrel of [src]. Now it will fire .40 rounds.</span>"
				boom_mod_count = 4
				blowout_chance = 20
				return
		else if(boom_mod_count == 4)
			user << "<span class='notice'>You begin to expand the barrel of [src]...</span>"
			if(loaded.len)
				afterattack(user, user)	//and again
				playsound(user, fire_sound, 50, 1)
				user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='danger'>[src] goes off in your face!</span>")
				return
			else
				sleep(100)
				caliber = ".44"
				ammo_type = /obj/item/ammo_casing/pistol/a44sw
				caliber = ".44"
				user << "<span class='notice'>You reinforce the barrel of [src]. Now it will fire .44 rounds.</span>"
				boom_mod_count = 5
				blowout_chance = 25
				return
		else if(boom_mod_count == 5)
			user << "<span class='notice'>You begin to expand the barrel of [src]...</span>"
			if(loaded.len)
				afterattack(user, user)	//and again
				playsound(user, fire_sound, 50, 1)
				user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='danger'>[src] goes off in your face!</span>")
				return
			else
				sleep(100)
				caliber = "shotgun"
				ammo_type = /obj/item/ammo_casing/shotgun
				user << "<span class='notice'>You reinforce the barrel of [src]. Now it will fire shotgun shells.</span>"
				boom_mod_count = 6
				blowout_chance = 30
				return
		else
			user << "<span class='notice'>You can't expand the barrel any further."

/obj/item/weapon/gun/projectile/zipgun
	name = "Zipgun"
	desc = "A spawn of someone's wild imagination and lots of spare time. Not much of a handgun, it will probably just backfire right into your face the very first time you try to shoot it."
	icon_state = "zipgun"
	caliber = "c22"
	ammo_type = "/obj/item/ammo_casing/c22"
	load_method = 0
	max_shells = 1
	var/zip_mod_count = 1
	blowout_chance = 5

/obj/item/weapon/gun/projectile/zipgun/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if(istype(W, /obj/item/weapon/screwdriver))
		if(zip_mod_count == 1)
			user << "<span class='notice'>You begin to expand the barrel of [src]...</span>"
			if(loaded.len)
				afterattack(user, user)	//you know the drill
				playsound(user, fire_sound, 50, 1)
				user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='danger'>[src] goes off in your face!</span>")
				return
			else
				sleep(100)
				caliber = "c9mm"
				user << "<span class='notice'>You reinforce the barrel of [src]. Now it will fire 9mm rounds.</span>"
				zip_mod_count = 2
				blowout_chance = 10
				return
		else if(zip_mod_count == 2)
			user << "<span class='notice'>You begin to expand the barrel of [src]...</span>"
			if(loaded.len)
				afterattack(user, user)	//and again
				playsound(user, fire_sound, 50, 1)
				user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='danger'>[src] goes off in your face!</span>")
				return
			else
				sleep(100)
				caliber = "c38s"
				user << "<span class='notice'>You reinforce the barrel of [src]. Now it will fire .38 Special rounds.</span>"
				zip_mod_count = 3
				blowout_chance = 15
				return
		else if(zip_mod_count == 3)
			user << "<span class='notice'>You begin to expand the barrel of [src]...</span>"
			if(loaded.len)
				afterattack(user, user)	//and again
				playsound(user, fire_sound, 50, 1)
				user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='danger'>[src] goes off in your face!</span>")
				return
			else
				sleep(100)
				caliber = ".45b"
				user << "<span class='notice'>You reinforce the barrel of [src]. Now it will fire .45-70 rounds.</span>"
				zip_mod_count = 4
				blowout_chance = 20
				return
		else if(zip_mod_count == 4)
			user << "<span class='notice'>You begin to expand the barrel of [src]...</span>"
			if(loaded.len)
				afterattack(user, user)	//and again
				playsound(user, fire_sound, 50, 1)
				user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='danger'>[src] goes off in your face!</span>")
				return
			else
				sleep(100)
				caliber = ".50"
				user << "<span class='notice'>You reinforce the barrel of [src]. Now it will fire .50 rounds.</span>"
				zip_mod_count = 5
				blowout_chance = 25
				return
		else if(zip_mod_count == 5)
			user << "<span class='notice'>You begin to expand the barrel of [src]...</span>"
			if(loaded.len)
				afterattack(user, user)	//and again
				playsound(user, fire_sound, 50, 1)
				user.visible_message("<span class='danger'>[src] goes off!</span>", "<span class='danger'>[src] goes off in your face!</span>")
				return
			else
				sleep(100)
				caliber = "shotgun"
				user << "<span class='notice'>You reinforce the barrel of [src]. Now it will fire shotgun shells.</span>"
				zip_mod_count = 6
				blowout_chance = 30
				return
		else
			user << "<span class='notice'>You can't expand the barrel any further."

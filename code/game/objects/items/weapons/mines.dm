
/obj/item/weapon/mine/boobytrap
	name = "booby trap"
	desc = "An improvised frag mine."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "boobytrap"

/obj/item/weapon/mine/attack_self(mob/user as mob)
	new /obj/effect/mine/boobytrap(user.loc)
	user.visible_message("<span class='warning'>[user] arms the mine! Be careful not to step on it!</span>")
	qdel(src)
	user.regenerate_icons()

/obj/effect/mine/proc/explode2boobytrap(obj)
	/* oldcode, pre-fragification -scr
	explosion(loc, 0, 0, 2, 2)
	spawn(1)
		qdel(src)*/
	//vars stolen for fragification
	var/fragment_type = /obj/item/projectile/bullet/pellet/fragment
	var/num_fragments = 160  //total number of fragments produced by the grenade
	//The radius of the circle used to launch projectiles. Lower values mean less projectiles are used but if set too low gaps may appear in the spread pattern
	var/spread_range = 8 //leave as is, for some reason setting this higher makes the spread pattern have gaps close to the epicenter

	//blatant copypaste from frags, but those are a whole different type so vOv
	set waitfor = 0
	..()

	var/turf/O = get_turf(src)
	if(!O) return

	var/list/target_turfs = getcircle(O, spread_range)
	var/fragments_per_projectile = round(num_fragments/target_turfs.len)

	for(var/turf/T in target_turfs)
		sleep(0)
		var/obj/item/projectile/bullet/pellet/fragment/P = new fragment_type(O)

		P.pellets = fragments_per_projectile
		P.shot_from = src.name

		P.launch(T)

		//Make sure to hit any mobs in the source turf
		for(var/mob/living/M in O)
			//lying on a frag grenade while the grenade is on the ground causes you to absorb most of the shrapnel.
			//you will most likely be dead, but others nearby will be spared the fragments that hit you instead.
			if(M.lying && isturf(src.loc))
				P.attack_mob(M, 0, 0)
			else
				P.attack_mob(M, 0, 100) //otherwise, allow a decent amount of fragments to pass
	explosion(loc, 0, 2, 4, 5)
	qdel(src)

/obj/effect/mine/boobytrap
	name = "booby trap"
	triggerproc = "explode2boobytrap"
	icon_state = "boobytrap-armed"

/obj/effect/mine/boobytrap/attack_hand(mob/user as mob)
	if (do_after(usr, 16))
		if(prob(25))
			user.visible_message("<span class='warning'>[user] disarms the mine!</span>")
			icon_state = "boobytrap"
			new /obj/item/weapon/mine/boobytrap(src.loc)
			qdel(src)
		else
			usr << "Whoops."
			explode2boobytrap()
			qdel(src)
	else
		return


/obj/effect/mine/boobytrap/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/))
		user.visible_message("<span class='warning'>[user] begins to disarm the mine!</span>")
		if (do_after(usr, 25))
			if(prob(95))
				user.visible_message("<span class='warning'>[user] disarms the mine!</span>")
				icon_state = "boobytrap"
				new /obj/item/weapon/mine/boobytrap(src.loc)
				qdel(src)
			else
				explode2boobytrap()
				qdel(src)
		else
			explode2boobytrap()
			qdel(src)
	else
		explode2boobytrap()
		qdel(src)


/obj/effect/mine/boobytrap/New()
	icon_state = "boobytrap-armed"

/obj/effect/mine/boobytrap/attack_hand(mob/user as mob)
	user.visible_message("<span class='warning'>[user] disarms the mine!</span>")
	icon_state = "boobytrap"
	new /obj/item/weapon/mine/boobytrap(src.loc)
	qdel(src)

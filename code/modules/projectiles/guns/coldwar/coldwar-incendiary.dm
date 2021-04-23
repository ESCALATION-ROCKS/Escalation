///////Flame shit code - stolen from IS12 by severepwnage.
///////I'll probably use the flame code to make WP grenades. Maybe a flamethrower as well?
///////LE WAR CRIMES


/obj/item/weapon/gun/flamer
	name = "\improper M2A4 Fire Thrower"
	desc = "Flame thrower made to light people you don't like on fire."
	icon_state = "flamer"
	slot_flags = SLOT_BACK
	w_class = 4
	force = 15
//	fire_sound = 'sound/weapons/gun_flamethrower2.ogg'
	var/ammo_type = /obj/item/ammo_magazine/flamer
	var/max_range = 5
	var/lit = 0 //Turn the flamer on/off

	attack_self(mob/user)
		. = ..()
		toggle_flame(user)

	examine(mob/user)
		..()
		to_chat(user,"It's turned [lit? "on" : "off"].")
/*
/atom/proc/flamer_fire_act()
	return
*/
/obj/item/weapon/gun/flamer/proc/toggle_flame(mob/user)
	playsound(user,'sound/weapons/flipblade.ogg', 25, 1)
	lit = !lit
	if (lit)
		icon_state = "flamer-lit"
	else
		icon_state = "flamer"

/obj/item/weapon/gun/flamer/Fire(atom/target, mob/living/user, params, reflex)
	set waitfor = 0
	..()
	var/turf/curloc = get_turf(user) //In case the target or we are expired.
	var/turf/targloc = get_turf(target)
	if (!targloc || !curloc) return //Something has gone wrong...

	if(!lit)
		to_chat(user, "<span class='alert'>The weapon isn't lit</span>")
		return

	unleash_flame(target, user)

/proc/getline2(atom/from_atom, atom/to_atom, exclude_origin=FALSE)

/obj/item/weapon/gun/flamer/proc/unleash_flame(atom/target, mob/living/user)
	set waitfor = 0
	var/burnlevel = 50
	var/burntime = 40
	var/fire_color = "red"
	var/list/turf/turfs = getline2(user,target)
	playsound(user, fire_sound, 50, 1)
	var/distance = 1
	var/turf/prev_T

	for(var/turf/T in turfs)
		if(T == user.loc)
			prev_T = T
			continue
		if(T.density)
			break
		if(loc != user)
			break
		if(distance > max_range)
			break
		if(prev_T && LinkBlocked(prev_T, T))
			break
		flame_turf(T,user, burntime, burnlevel, fire_color)
		distance++
		prev_T = T
		sleep(1)

/obj/item/weapon/gun/flamer/proc/flame_turf(turf/T, mob/living/user, heat, burn, f_color = "red")
	if(!istype(T))
		return

	// No stacking flames
	if (locate(/obj/flamer_fire) in T)
		return

	new /obj/flamer_fire(T, heat, burn, f_color)

	for(var/mob/living/M in T) //Deal bonus damage if someone's caught directly in initial stream
		if(M.stat == DEAD)		continue
		M.adjust_fire_stacks(rand(5,burn*2))
		M.IgniteMob()
		M.adjustFireLoss(rand(burn,(burn*2))) // Make it so its the amount of heat or twice it for the initial blast.
		to_chat(M, "<span class='danger'>Augh! You are roasted by the flames!")

/obj/item/weapon/gun/flamer/proc/triangular_flame(var/atom/target, var/mob/living/user, var/burntime, var/burnlevel)
	set waitfor = 0

	var/unleash_dir = user.dir //don't want the player to turn around mid-unleash to bend the fire.
	var/list/turf/turfs = getline2(user,target)
	playsound(user, fire_sound, 50, 1)
	var/distance = 1
	var/turf/prev_T

	for(var/turf/T in turfs)
		if(T == user.loc)
			prev_T = T
			continue
		if(T.density)
			break
		if(loc != user)
			break
		if(distance > max_range)
			break
		if(prev_T && LinkBlocked(prev_T, T))
			break
		flame_turf(T,user, burntime, burnlevel, "green")
		prev_T = T
		sleep(1)

		var/list/turf/right = list()
		var/list/turf/left = list()
		var/turf/right_turf = T
		var/turf/left_turf = T
		var/right_dir = turn(unleash_dir, 90)
		var/left_dir = turn(unleash_dir, -90)
		for (var/i = 0, i < distance - 1, i++)
			right_turf = get_step(right_turf, right_dir)
			right += right_turf
			left_turf = get_step(left_turf, left_dir)
			left += left_turf

		var/turf/prev_R = T
		for (var/turf/R in right)

			if (R.density)
				break
			if(prev_R && LinkBlocked(prev_R, R))
				break

			flame_turf(R, user, burntime, burnlevel, "green")
			prev_R = R
			sleep(1)

		var/turf/prev_L = T
		for (var/turf/L in left)
			if (L.density)
				break
			if(prev_L && LinkBlocked(prev_L, L))  break

			flame_turf(L, user, burntime, burnlevel, "green")
			prev_L = L
			sleep(1)

		distance++

//////////////////////////////////////////////////////////////////////////////////////////////////
//Time to redo part of abby's code.
//Create a flame sprite object. Doesn't work like regular fire, ie. does not affect atmos or heat
/obj/flamer_fire
	name = "fire"
	desc = "Ouch!"
	anchored = 1
	mouse_opacity = 0
	icon = 'icons/effects/fire.dmi'
	icon_state = "red_2"
	layer = BELOW_OBJ_LAYER
	var/firelevel = 12 //Tracks how much "fire" there is. Basically the timer of how long the fire burns
	var/burnlevel = 10 //Tracks how HOT the fire is. This is basically the heat level of the fire and determines the temperature.
	var/flame_color = "red"

/obj/flamer_fire/New(loc, fire_lvl, burn_lvl, f_color, fire_spread_amount)
	..()
	if(istype(loc, /turf/unsimulated/floor/river))//No catching the water on fire.
		qdel(src)
	playsound(src, "sound/effects/fire.ogg", 40, FALSE)
	playsound(src, "sound/effects/burning.ogg", 25, FALSE) //Edited to fade in at 5 seconds and fade out at 15. I know I'm a fucking genius
	if (f_color)
		flame_color = f_color

	icon_state = "[flame_color]_2" //We got red, green, blue and IS12(flaky)
	if(fire_lvl) firelevel = fire_lvl
	if(burn_lvl) burnlevel = burn_lvl
	START_PROCESSING(SSobj,src)

	if(fire_spread_amount > 0)
		var/turf/T
		for(var/dirn in GLOB.cardinal)
			T = get_step(loc, dirn)
			if(istype(T,/turf/simulated/open)) continue
			if(locate(/obj/flamer_fire) in T) continue //No stacking
			var/new_spread_amt = T.density ? 0 : fire_spread_amount - 1 //walls stop the spread
			if(new_spread_amt)
				for(var/obj/O in T)
					if(!O.CanPass(src, loc))
						new_spread_amt = 0
						break
			addtimer(CALLBACK(src, .proc/make_more_fire,T, fire_lvl, burn_lvl, f_color, new_spread_amt), 0) //Do not put spawns in recursive things.

obj/flamer_fire/proc/make_more_fire(var/T, var/f_level, var/b_level, var/fcolor, var/new_spread)
	new /obj/flamer_fire(T, f_level, b_level, fcolor, new_spread)

/obj/flamer_fire/Destroy()
	set_light(0)
	STOP_PROCESSING(SSobj,src)
	. = ..()


/obj/flamer_fire/Crossed(mob/living/M) //Only way to get it to reliable do it when you walk into it.
	if(istype(M))
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if(istype(H.wear_suit, /obj/item/clothing/suit/fire))
				H.show_message(text("Your suit protects you from the flames."),1)
				H.adjustFireLoss(burnlevel*0.25) //Does small burn damage to a person wearing one of the suits.
				return
		M.adjust_fire_stacks(burnlevel) //Make it possible to light them on fire later.
		if (prob(firelevel + 2*M.fire_stacks)) //the more soaked in fire you are, the likelier to be ignited
			M.IgniteMob()

		M.adjustFireLoss(round(burnlevel*0.5)) //This makes fire stronk.
		to_chat(M, "<span class='danger'>You are burned!</span>")


/obj/flamer_fire/proc/updateicon()
	if(burnlevel < 15)
		color = "#c1c1c1" //make it darker to make show its weaker.
	switch(firelevel)
		if(1 to 9)
			icon_state = "[flame_color]_1"
			set_light(2, l_color = "#E38F46")
		if(10 to 25)
			icon_state = "[flame_color]_2"
			set_light(4, l_color = "#E38F46")
		if(25 to INFINITY) //Change the icons and luminosity based on the fire's intensity
			icon_state = "[flame_color]_3"
			set_light(6, l_color = "#E38F46")


/obj/flamer_fire/Process()
	var/turf/T = loc
	firelevel = max(0, firelevel)
	if(!istype(T)) //Is it a valid turf? Has to be on a floor
		qdel(src)
		return

	updateicon()

	if(!firelevel)
		qdel(src)
		return

	//var/j = 0
	for(var/mob/living/I in loc)
		if(istype(I,/mob/living/carbon/human))
			var/mob/living/carbon/human/M = I
			if(istype(M.wear_suit, /obj/item/clothing/suit/fire))
				M.show_message(text("Your suit protects you from the flames."),1)
				M.adjustFireLoss(rand(0 ,burnlevel*0.25)) //Does small burn damage to a person wearing one of the suits.
				continue
		I.adjust_fire_stacks(burnlevel) //If i stand in the fire i deserve all of this. Also Napalm stacks quickly.
		if(prob(firelevel)) I.IgniteMob()
		I.show_message(text("<span class='warning'>You are burned!</span>"),1)
/* //Uncomment when you decide to make this proc do something.
	for(var/obj/O in loc)
		O.flamer_fire_act()
*/
	firelevel -= 2 //reduce the intensity by 2 per tick
	return

///////////////WEAPONS

/obj/item/weapon/grenade/fire
	icon = 'icons/obj/coldwar/grenade.dmi'
	name = "incendiary grenade"
	desc = "A military incendiary grenade designed to spread and ignite a vast ammount of highly flammable liquid."
	icon_state = "anm14"
	throw_range = 10

	var/fire_range = 2 // size of the fire zone

/obj/item/weapon/grenade/fire/detonate()
	..()

	var/turf/O = get_turf(src)
	if(!O) return

	new /obj/flamer_fire(loc, 30, 6, "flaky", fire_range)

	qdel(src)

/obj/item/weapon/grenade/fire/anm14
	name = "AN/M14"
	desc = "An incendiary grenade used by NATO armies."
	icon_state = "anm14"
	throw_range = 10
	throw_speed = 1
	fire_range = 2

/*/obj/item/weapon/grenade/fire/anm14/detonate() - Doesn't work for some reason
	playsound(src.loc, 'sound/effects/incendiary_detonate.ogg', 80, 1, 30)
	..()*/


//////////Molotov cocktail

/obj/item/weapon/grenade/fire/molotov
	name = "molotov cocktail"
	desc = "A large bottle filled with fuel and sealed with a rag. Explodes in 10 seconds if not thrown."
	icon_state = "molotov"
	throw_speed = 1
	throw_range = 10
	w_class = ITEM_SIZE_SMALL
	det_time = 100
	arm_sound = 'sound/items/cig_light.ogg'
	fire_range = 2
	var/lit = 0


/obj/item/weapon/grenade/fire/molotov/attack_self(mob/user as mob)
	to_chat(user, "<span class='warning'>You're gonna need some sort of lighter to light this up!</span>")
	return

/obj/item/weapon/grenade/fire/molotov/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if(!roundstarted)
		to_chat(user, "<span class='warning'>There is no reason to light up the [src] yet!")
		return
	else
		if(isflamesource(W))
			activate()
			to_chat(user, "<span class='warning'>You light up the [src]! 10 seconds!")
			playsound(src.loc, 'sound/items/cig_light.ogg', 100, 1)
			var/mob/living/carbon/C = user
			C.throw_mode_on()
			return
		else
			to_chat(user, "<span class='warning'>You need an active fire source to light up the [src]!")
			return

/obj/item/weapon/grenade/fire/molotov/throw_impact(atom/hit_atom)
	if(active)
		playsound(src.loc, 'sound/effects/glassbr1.ogg', 80, 1, 30)
		detonate()
	
	else
		return

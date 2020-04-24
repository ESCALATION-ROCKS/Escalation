/obj/structure/window_frame
	desc = "A good old window frame."
	icon_state = "framewood"
	layer = MOB_LAYER + 0.01
	anchored = TRUE

/obj/structure/window_frame/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/stack/material/glass))
		var/obj/item/stack/S = W
		if (S.amount >= 3)
			visible_message("<span class = 'notice'>[user] starts to add glass to the window frame...</span>")
			if (do_after(user, 50, src))
				new/obj/structure/window/classic(get_turf(src))
				visible_message("<span class = 'notice'>[user] adds glass to the window frame.</span>")
				S.use(3)
				qdel(src)
		else
			user << "<span class = 'warning'>You need at least 3 sheets of glass.</span>"

/obj/structure/window/classic
	desc = "A good old window."
	icon_state = "framewindowwood"
	basestate = "framewindowwood"
	glasstype = /obj/item/stack/material/glass
	maximal_heat = T0C + 100
	damage_per_fire_tick = 5.0
	maxhealth = 20.0
	layer = MOB_LAYER + 0.02
	exterior = 1
	density = FALSE // so we can touch curtains from any direction

/obj/structure/window/classic/reinforced
	reinf = TRUE

/obj/structure/window/classic/is_full_window()
	return TRUE

/obj/structure/window/classic/take_damage(damage)
	if (damage > 12 || (damage > 5 && prob(damage * 5)))
		if (!reinf || (reinf && prob(20)))
			shatter()
	else return

/obj/structure/window/classic/hitby(AM as mob|obj)
	..()
	visible_message("<span class='danger'>[src] was hit by [AM].</span>")
	var/tforce = FALSE
	if (ismob(AM))
		tforce = 40
	else if (isobj(AM))
		var/obj/item/I = AM
		tforce = I.throwforce
	if (reinf) tforce *= 0.25
	take_damage(tforce)

/obj/structure/window/classic/bullet_act(var/obj/item/projectile/P)
	if (!P || !P.nodamage)
		shatter()
		return PROJECTILE_CONTINUE

/obj/structure/window/classic/shatter(var/display_message = TRUE)
	var/myturf = get_turf(src)
	new/obj/structure/window_frame(myturf)
	..(display_message)

/obj/structure/window/classic/update_icon()
	return

/obj/structure/window/classic/update_nearby_icons()
	return





//jesus fucking christ

/obj/structure/window_framesteel
	name = "window frame"
	desc = "A good old window frame."
	icon_state = "frame"
	layer = MOB_LAYER + 0.01
	anchored = TRUE

/obj/structure/window_frame/attackby(obj/item/W as obj, mob/user as mob)
	if (istype(W, /obj/item/stack/material/glass))
		var/obj/item/stack/S = W
		if (S.amount >= 3)
			visible_message("<span class = 'notice'>[user] starts to add glass to the window frame...</span>")
			if (do_after(user, 50, src))
				new/obj/structure/window/classicsteel(get_turf(src))
				visible_message("<span class = 'notice'>[user] adds glass to the window frame.</span>")
				S.use(3)
				qdel(src)
		else
			user << "<span class = 'warning'>You need at least 3 sheets of glass.</span>"

/obj/structure/window/classicsteel
	name = "window"
	desc = "A good old window."
	icon_state = "framewindow"
	basestate = "framewindow"
	glasstype = /obj/item/stack/material/glass
	exterior = 1
	maximal_heat = T0C + 100
	damage_per_fire_tick = 5.0
	maxhealth = 20.0
	layer = MOB_LAYER + 0.02
	density = FALSE // so we can touch curtains from any direction

/obj/structure/window/classicsteel/reinforced
	reinf = TRUE

/obj/structure/window/classicsteel/is_full_window()
	return TRUE

/obj/structure/window/classicsteel/take_damage(damage)
	if (damage > 12 || (damage > 5 && prob(damage * 5)))
		if (!reinf || (reinf && prob(20)))
			shatter()
	else return

/obj/structure/window/classicsteel/hitby(AM as mob|obj)
	..()
	visible_message("<span class='danger'>[src] was hit by [AM].</span>")
	var/tforce = FALSE
	if (ismob(AM))
		tforce = 40
	else if (isobj(AM))
		var/obj/item/I = AM
		tforce = I.throwforce
	if (reinf) tforce *= 0.25
	take_damage(tforce)

/obj/structure/window/classicsteel/bullet_act(var/obj/item/projectile/P)
	if (!P || !P.nodamage)
		shatter()
		return PROJECTILE_CONTINUE

/obj/structure/window/classicsteel/shatter(var/display_message = TRUE)
	var/myturf = get_turf(src)
	new/obj/structure/window_framesteel(myturf)
	..(display_message)

/obj/structure/window/classicsteel/update_icon()
	return

/obj/structure/window/classicsteel/update_nearby_icons()
	return

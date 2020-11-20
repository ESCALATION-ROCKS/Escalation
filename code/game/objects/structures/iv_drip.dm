/obj/structure/iv_drip
	name = "\improper IV drip"
	icon = 'icons/obj/iv_drip.dmi'
	anchored = 0
	density = 0


/obj/structure/iv_drip/var/mob/living/carbon/human/attached = null
/obj/structure/iv_drip/var/obj/item/weapon/reagent_containers/beaker = null

/obj/structure/iv_drip/update_icon()
	if(src.attached)
		icon_state = "hooked"
	else
		icon_state = ""

	overlays = null

	if(beaker)
		var/datum/reagents/reagents = beaker.reagents
		var/percent = round((reagents.total_volume / beaker.volume) * 100)
		if(reagents.total_volume)
			var/image/filling = image('icons/obj/iv_drip.dmi', src, "reagent")

			switch(percent)
				if(0 to 9)		filling.icon_state = "reagent0"
				if(10 to 24) 	filling.icon_state = "reagent10"
				if(25 to 49)	filling.icon_state = "reagent25"
				if(50 to 74)	filling.icon_state = "reagent50"
				if(75 to 79)	filling.icon_state = "reagent75"
				if(80 to 90)	filling.icon_state = "reagent80"
				if(91 to INFINITY)	filling.icon_state = "reagent100"
			filling.icon += reagents.get_color()
			overlays += filling

		if(attached)
			var/image/light = image('icons/obj/iv_drip.dmi', "light_full")
			if(percent < 15)
				light.icon_state = "light_low"
			else if(percent < 60)
				light.icon_state = "light_mid"
			overlays += light

/obj/structure/iv_drip/MouseDrop(over_object, src_location, over_location)
	if(!CanMouseDrop(over_object))
		return

	if(attached)
		visible_message("\The [attached] is detached from \the [src]")
		src.attached = null
		src.update_icon()
		return

	if(ishuman(over_object))
		visible_message("\The [usr] attaches \the [src] to \the [over_object].")
		src.attached = over_object
		src.update_icon()
		inject_fluid()


/obj/structure/iv_drip/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/reagent_containers))
		if(!isnull(src.beaker))
			to_chat(user, "There is already a reagent container loaded!")
			return

		user.drop_item()
		W.loc = src
		src.beaker = W
		to_chat(user, "You attach \the [W] to \the [src].")
		src.update_icon()
		return
	else
		return ..()


/obj/structure/iv_drip/proc/inject_fluid()
	set background = 1

	if(src.attached && src.beaker)
		// Give blood
		if(beaker.volume > 0)
			var/transfer_amount = REM
			if(istype(src.beaker, /obj/item/weapon/reagent_containers/blood))
				// speed up transfer on blood packs
				transfer_amount = 4
			beaker.reagents.trans_to_mob(attached, transfer_amount, CHEM_BLOOD)
			iv_range_check()
			update_icon()
	
	addtimer(CALLBACK(src, .proc/inject_fluid), 40) // 4 seconds

/obj/structure/iv_drip/proc/iv_range_check()
	if(src.attached)

		if(!(get_dist(src, src.attached) <= 1 && isturf(src.attached.loc)))
			visible_message("The needle is ripped out of [src.attached], doesn't that hurt?")
			src.attached.apply_damage(3, BRUTE, pick(BP_R_ARM, BP_L_ARM))
			src.attached = null
			src.update_icon()
			return

/obj/structure/iv_drip/attack_hand(mob/user as mob)
	if(src.beaker)
		src.beaker.loc = get_turf(src)
		src.beaker = null
		update_icon()
	else
		return ..()

/obj/structure/iv_drip/examine(mob/user)
	. = ..(user)
	if (!(user in view(2)) && user!=src.loc) return

	if(beaker)
		if(beaker.reagents && beaker.reagents.reagent_list.len)
			to_chat(usr, "<span class='notice'>Attached is \a [beaker] with [beaker.reagents.total_volume] units of liquid.</span>")
		else
			to_chat(usr, "<span class='notice'>Attached is an empty [beaker].</span>")
	else
		to_chat(usr, "<span class='notice'>No chemicals are attached.</span>")

	to_chat(usr, "<span class='notice'>[attached ? attached : "No one"] is attached.</span>")

/obj/structure/iv_drip/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(height && istype(mover) && mover.checkpass(PASSTABLE)) //allow bullets, beams, thrown objects, mice, drones, and the like through.
		return 1
	return ..()

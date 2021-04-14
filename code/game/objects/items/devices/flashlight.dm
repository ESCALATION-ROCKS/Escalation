/obj/item/device/flashlight
	name = "flashlight"
	desc = "A hand-held emergency light."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "flashlight"
	item_state = "flashlight"
	w_class = ITEM_SIZE_SMALL
	flags = CONDUCT

	matter = list(DEFAULT_WALL_MATERIAL = 50,"glass" = 20)

	action_button_name = "Toggle Flashlight"
	var/on = 0
	var/activation_sound = 'sound/effects/flashlight.ogg'
	var/obj/item/weapon/cell/cell
	var/cell_type = /obj/item/weapon/cell/device
	var/list/brightness_levels
	var/brightness_level = "medium"
	var/power_usage
	var/power_use = 1
	var/brightness_on = 4 //range of light when on
	var/flashlight_power //luminosity of light when on, can be negative

/obj/item/device/flashlight/New()
	if(power_use)
		GLOB.processing_objects |= src

		if(cell_type)
			cell = new cell_type(src)
			brightness_levels = list("low" = 0.25, "medium" = 0.5, "high" = 1)
			power_usage = brightness_levels[brightness_level]

	else
		verbs -= /obj/item/device/flashlight/verb/toggle
	..()

/obj/item/device/flashlight/Destroy()
	if(power_use)
		GLOB.processing_objects -= src
	return ..()


/obj/item/device/flashlight/verb/toggle()
	set name = "Toggle Flashlight Brightness"
	set category = "Object"
	set src in usr
	set_brightness(usr)

/obj/item/device/flashlight/proc/set_brightness(mob/user as mob)
	var/choice = input("Choose a brightness level.") as null|anything in brightness_levels
	if(choice)
		brightness_level = choice
		power_usage = brightness_levels[choice]
		user << "<span class='notice'>You set the brightness level on \the [src] to [brightness_level].</span>"
		update_icon()

/obj/item/device/flashlight/emp_act(severity)
	for(var/obj/O in contents)
		O.emp_act(severity)
	..()

/obj/item/device/flashlight/process()
	if(on)
		if(cell)
			if(brightness_level && power_usage)
				if(power_usage < cell.charge)
					cell.charge -= power_usage
				else
					cell.charge = 0
					visible_message("<span class='warning'>\The [src] flickers before going dull.</span>")
					set_light(0)
					on = 0
					update_icon()


/obj/item/device/flashlight/attack_hand(mob/user as mob)
	if(user.get_inactive_hand() == src)
		if(cell)
			cell.update_icon()
			user.put_in_hands(cell)
			cell = null
			user << "<span class='notice'>You remove the cell from the [src].</span>"
			on = 0
			update_icon()
			return
		..()
	else
		return ..()


/obj/item/device/flashlight/attackby(obj/item/weapon/W, mob/user as mob)
	if(power_use)
		if(istype(W, /obj/item/weapon/cell))
			if(istype(W, /obj/item/weapon/cell/device))
				if(!cell)
					user.drop_item()
					W.loc = src
					cell = W
					user << "<span class='notice'>You install a cell in \the [src].</span>"
					update_icon()
				else
					user << "<span class='notice'>\The [src] already has a cell.</span>"
			else
				user << "<span class='notice'>\The [src] cannot use that type of cell.</span>"

	else
		..()


/obj/item/device/flashlight/Initialize()
	. = ..()
	update_icon()

/obj/item/device/flashlight/update_icon()
	if(on)
		icon_state = "[initial(icon_state)]-on"
		item_state = "[initial(icon_state)]-on"

		if(brightness_level == "low")
			set_light(l_range = brightness_on/4, l_power = flashlight_power)
		else if(brightness_level == "high")
			set_light(l_range = brightness_on*1.5, l_power = flashlight_power)
		else
			set_light(l_range = brightness_on, l_power = flashlight_power)

	else
		icon_state = "[initial(icon_state)]"
		set_light(0)

/obj/item/device/flashlight/examine(mob/user)
	..()
	if(power_use && brightness_level)
		var/tempdesc
		tempdesc += "\The [src] is set to [brightness_level]. "
		if(cell)
			tempdesc += "\The [src] has a \the [cell] attached. "

			if(cell.charge <= cell.maxcharge*0.25)
				tempdesc += "It appears to have a low amount of power remaining."
			else if(cell.charge > cell.maxcharge*0.25 && cell.charge <= cell.maxcharge*0.5)
				tempdesc += "It appears to have an average amount of power remaining."
			else if(cell.charge > cell.maxcharge*0.5 && cell.charge <= cell.maxcharge*0.75)
				tempdesc += "It appears to have an above average amount of power remaining."
			else if(cell.charge > cell.maxcharge*0.75 && cell.charge <= cell.maxcharge)
				tempdesc += "It appears to have a high amount of power remaining."

		user << "[tempdesc]"

/obj/item/device/flashlight/attack_self(mob/user)
	if(!isturf(user.loc))
		to_chat(user, "You cannot turn the light on while in this [user.loc].")//To prevent some lighting anomalities.
		return 0
	if(!cell || cell.charge == 0)
		user << "You flick the switch on [src], but nothing happens."
		return 0
	on = !on
	if(on && activation_sound)
		playsound(src.loc, activation_sound, 75, 1)
	update_icon()
	user.update_action_buttons()
	return 1


/obj/item/device/flashlight/attack(mob/living/M as mob, mob/living/user as mob)
	add_fingerprint(user)
	if(on && user.zone_sel.selecting == BP_EYES)

		if((CLUMSY in user.mutations) && prob(50))	//too dumb to use flashlight properly
			return ..()	//just hit them in the head

		var/mob/living/carbon/human/H = M	//mob has protective eyewear
		if(istype(H))
			for(var/obj/item/clothing/C in list(H.head,H.wear_mask,H.glasses))
				if(istype(C) && (C.body_parts_covered & EYES))
					to_chat(user, "<span class='warning'>You're going to need to remove [C] first.</span>")
					return

			var/obj/item/organ/vision
			if(!H.species.vision_organ || !H.should_have_organ(H.species.vision_organ))
				to_chat(user, "<span class='warning'>You can't find anything on [H] to direct [src] into!</span>")
				return

			vision = H.internal_organs_by_name[H.species.vision_organ]
			if(!vision)
				vision = H.species.has_organ[H.species.vision_organ]
				to_chat(user, "<span class='warning'>\The [H] is missing \his [initial(vision.name)]!</span>")
				return

			user.visible_message("<span class='notice'>\The [user] directs [src] into [M]'s [vision.name].</span>", \
								 "<span class='notice'>You direct [src] into [M]'s [vision.name].</span>")

			inspect_vision(vision, user)

			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN) //can be used offensively
			M.flash_eyes()
	else
		return ..()

/obj/item/device/flashlight/proc/inspect_vision(obj/item/organ/vision, mob/living/user)
	var/mob/living/carbon/human/H = vision.owner

	if(H == user)	//can't look into your own eyes buster
		return

	if(vision.robotic < ORGAN_ROBOT )

		if(vision.owner.stat == DEAD || H.blinded)	//mob is dead or fully blind
			to_chat(user, "<span class='warning'>\The [H]'s pupils do not react to the light!</span>")
			return
		if(XRAY in H.mutations)
			to_chat(user, "<span class='notice'>\The [H]'s pupils give an eerie glow!</span>")
		if(vision.damage)
			to_chat(user, "<span class='warning'>There's visible damage to [H]'s [vision.name]!</span>")
		else if(H.eye_blurry)
			to_chat(user, "<span class='notice'>\The [H]'s pupils react slower than normally.</span>")
		if(H.getBrainLoss() > 15)
			to_chat(user, "<span class='notice'>There's visible lag between left and right pupils' reactions.</span>")

		var/list/pinpoint = list(/datum/reagent/tramadol/oxycodone=1,/datum/reagent/tramadol=5)
		var/list/dilating = list(/datum/reagent/space_drugs=5,/datum/reagent/mindbreaker=1,/datum/reagent/adrenaline=1)
		if(H.reagents.has_any_reagent(pinpoint) || H.ingested.has_any_reagent(pinpoint))
			to_chat(user, "<span class='notice'>\The [H]'s pupils are already pinpoint and cannot narrow any more.</span>")
		else if(H.shock_stage >= 30 || H.reagents.has_any_reagent(dilating) || H.ingested.has_any_reagent(dilating))
			to_chat(user, "<span class='notice'>\The [H]'s pupils narrow slightly, but are still very dilated.</span>")
		else
			to_chat(user, "<span class='notice'>\The [H]'s pupils narrow.</span>")

	//if someone wants to implement inspecting robot eyes here would be the place to do it.

/obj/item/device/flashlight/flashdark
	name = "flashdark"
	desc = "A strange device manufactured with mysterious elements that somehow emits darkness. Or maybe it just sucks in light? Nobody knows for sure."
	icon_state = "flashdark"
	item_state = "flashdark"
	w_class = ITEM_SIZE_NORMAL
	brightness_on = 8
	flashlight_power = -6

/obj/item/device/flashlight/pen
	name = "penlight"
	desc = "A pen-sized light, used by medical staff."
	icon_state = "penlight"
	item_state = ""
	flags = CONDUCT
	slot_flags = SLOT_EARS
	brightness_on = 2
	w_class = ITEM_SIZE_TINY
	power_use = 0

/obj/item/device/flashlight/maglight
	name = "maglight"
	desc = "A very, very heavy duty flashlight."
	icon_state = "maglight"
	item_state = "maglight"
	force = 10
	attack_verb = list ("smacked", "thwacked", "thunked")
	matter = list(DEFAULT_WALL_MATERIAL = 200,"glass" = 50)
	hitsound = "swing_hit"

/obj/item/device/flashlight/drone
	name = "low-power flashlight"
	desc = "A miniature lamp, that might be used by small robots."
	icon_state = "penlight"
	item_state = ""
	flags = CONDUCT
	brightness_on = 2
	w_class = ITEM_SIZE_TINY
	power_use = 0


// the desk lamps are a bit special
/obj/item/device/flashlight/lamp
	name = "desk lamp"
	desc = "A desk lamp with an adjustable mount."
	icon_state = "lamp"
	item_state = "lamp"
	brightness_on = 5
	w_class = ITEM_SIZE_LARGE
	power_use = 0
	flags = CONDUCT
	on = 1


// green-shaded desk lamp
/obj/item/device/flashlight/lamp/green
	desc = "A classic green-shaded desk lamp."
	icon_state = "lampgreen"
	item_state = "lampgreen"
	brightness_on = 5
	light_color = "#ffc58f"
	power_use = 0
	on = 1

/obj/item/device/flashlight/lamp/verb/toggle_light()
	set name = "Toggle light"
	set category = "Object"
	set src in oview(1)

	if(!usr.stat)
		attack_self(usr)

// FLARES

/obj/item/device/flashlight/flare
	name = "flare"
	desc = "A red standard-issue flare. There are instructions on the side reading 'pull cord, make light'."
	w_class = ITEM_SIZE_TINY
	brightness_on = 8 // Pretty bright.
	light_power = 3
	light_color = COLOR_RED

	light_color = "#e58775"
	icon_state = "flare"
	item_state = "flare"
	action_button_name = null //just pull it manually, neckbeard.
	power_use = 0
	var/fuel = 0
	var/on_damage = 7
	var/produce_heat = 1500
	activation_sound = 'sound/effects/flare.ogg'

/obj/item/device/flashlight/flare/New()
	fuel = rand(800, 1000) // Sorry for changing this so much but I keep under-estimating how long X number of ticks last in seconds.
	..()

/obj/item/device/flashlight/flare/process()
	var/turf/pos = get_turf(src)
	if(pos)
		pos.hotspot_expose(produce_heat, 5)
	fuel = max(fuel - 1, 0)
	playsound(src.loc, 'sound/effects/flareburning.ogg', 75, 1)
	if(!fuel || !on)
		turn_off()
		if(!fuel)
			src.icon_state = "[initial(icon_state)]-empty"
		GLOB.processing_objects -= src

/obj/item/device/flashlight/flare/proc/turn_off()
	on = 0
	src.force = initial(src.force)
	src.damtype = initial(src.damtype)
	update_icon()

/obj/item/device/flashlight/flare/attack_self(mob/user as mob)
	if(turn_on(user))
		user.visible_message("<span class='notice'>\The [user] activates \the [src].</span>", "<span class='notice'>You pull the cord on the flare, activating it!</span>")
		playsound(src.loc, activation_sound, 75, 1)
		if(iscarbon(user))
			var/mob/living/carbon/C = user
			C.throw_mode_on()

/obj/item/device/flashlight/flare/proc/turn_on(var/mob/user)
	if(on)
		return FALSE
	if(!fuel)
		if(user)
			to_chat(user, "<span class='notice'>It's out of fuel.</span>")
		return FALSE
	on = TRUE
	force = on_damage
	damtype = "fire"
	GLOB.processing_objects += src
	update_icon()
	return 1

/obj/item/device/flashlight/wpflare
	name = "RSP-30 flare"
	desc = "A red-lighting flare used widely by WARPACT armies."
	w_class = ITEM_SIZE_SMALL
	brightness_on = 8 // Pretty bright.
	light_power = 3
	light_color = COLOR_RED

	light_color = "#da0205"
	icon_state = "wpflare"
	item_state = "wpflare"
	action_button_name = null //just pull it manually, neckbeard.
	power_use = 0
	var/fuel = 0
	var/on_damage = 7
	var/produce_heat = 1500
	activation_sound = 'sound/effects/flare.ogg'

/obj/item/device/flashlight/wpflare/New()
	fuel = rand(800, 1000)
	..()

/obj/item/device/flashlight/wpflare/process()
	var/turf/pos = get_turf(src)
	if(pos)
		pos.hotspot_expose(produce_heat, 5)
	fuel = max(fuel - 1, 0)
	playsound(src.loc, 'sound/effects/flareburning.ogg', 75, 1)
	if(!fuel || !on)
		turn_off()
		if(!fuel)
			src.icon_state = "[initial(icon_state)]-empty"
		GLOB.processing_objects -= src

/obj/item/device/flashlight/wpflare/proc/turn_off()
	on = 0
	src.force = initial(src.force)
	src.damtype = initial(src.damtype)
	w_class = ITEM_SIZE_SMALL
	update_icon()

/obj/item/device/flashlight/wpflare/attack_self(mob/user as mob)
	if(turn_on(user))
		user.visible_message("<span class='notice'>\The [user] activates \the [src].</span>", "<span class='notice'>You pull the cord on the flare, activating it!</span>")
		playsound(src.loc, activation_sound, 75, 1)
		w_class = ITEM_SIZE_NO_CONTAINER
		if(iscarbon(user))
			var/mob/living/carbon/C = user
			C.throw_mode_on()

/obj/item/device/flashlight/wpflare/proc/turn_on(var/mob/user)
	if(on)
		return FALSE
	if(!fuel)
		if(user)
			to_chat(user, "<span class='notice'>It's out of fuel.</span>")
		return FALSE
	on = TRUE
	force = on_damage
	damtype = "fire"
	GLOB.processing_objects += src
	update_icon()
	return 1

/obj/item/device/flashlight/natoflare
	name = "COMET handheld flare"
	desc = "A generic red-lighting flare used widely by NATO armies."
	w_class = ITEM_SIZE_SMALL
	brightness_on = 8 // Pretty bright.
	light_power = 3
	light_color = COLOR_RED

	light_color = "#da0205"
	icon_state = "natoflare"
	item_state = "natoflare"
	action_button_name = null //just pull it manually, neckbeard.
	power_use = 0
	var/fuel = 0
	var/on_damage = 7
	var/produce_heat = 1500
	activation_sound = 'sound/effects/flare.ogg'

/obj/item/device/flashlight/natoflare/New()
	fuel = rand(800, 1000)
	..()

/obj/item/device/flashlight/natoflare/process()
	var/turf/pos = get_turf(src)
	if(pos)
		pos.hotspot_expose(produce_heat, 5)
	fuel = max(fuel - 1, 0)
	playsound(src.loc, 'sound/effects/flareburning.ogg', 75, 1)
	if(!fuel || !on)
		turn_off()
		if(!fuel)
			src.icon_state = "[initial(icon_state)]-empty"
		GLOB.processing_objects -= src

/obj/item/device/flashlight/natoflare/proc/turn_off()
	on = 0
	src.force = initial(src.force)
	src.damtype = initial(src.damtype)
	w_class = ITEM_SIZE_SMALL
	update_icon()

/obj/item/device/flashlight/natoflare/attack_self(mob/user as mob)
	if(turn_on(user))
		user.visible_message("<span class='notice'>\The [user] activates \the [src].</span>", "<span class='notice'>You pull the cord on the flare, activating it!</span>")
		playsound(src.loc, activation_sound, 75, 1)
		w_class = ITEM_SIZE_NO_CONTAINER
		if(iscarbon(user))
			var/mob/living/carbon/C = user
			C.throw_mode_on()

/obj/item/device/flashlight/natoflare/proc/turn_on(var/mob/user)
	if(on)
		return FALSE
	if(!fuel)
		if(user)
			to_chat(user, "<span class='notice'>It's out of fuel.</span>")
		return FALSE
	on = TRUE
	force = on_damage
	damtype = "fire"
	GLOB.processing_objects += src
	update_icon()
	return 1

/obj/item/device/flashlight/m203flare
	name = "M583 flare shell"
	desc = "A 40mm flare shell used by NATO armies."
	w_class = ITEM_SIZE_SMALL
	brightness_on = 8 // Pretty bright.
	light_power = 3
	light_color = COLOR_RED

	light_color = "#e58775"
	icon_state = "m203flare"
	item_state = "m203flare"
	action_button_name = null //just pull it manually, neckbeard.
	power_use = 0
	var/fuel = 0
	var/on_damage = 7
	var/produce_heat = 1500
	activation_sound = 'sound/effects/flare.ogg'

/obj/item/device/flashlight/m203flare/New()
	fuel = rand(800, 1000)
	..()

/obj/item/device/flashlight/m203flare/process()
	var/turf/pos = get_turf(src)
	if(pos)
		pos.hotspot_expose(produce_heat, 5)
	fuel = max(fuel - 1, 0)
	playsound(src.loc, 'sound/effects/flareburning.ogg', 75, 1)
	if(!fuel || !on)
		turn_off()
		if(!fuel)
			src.icon_state = "[initial(icon_state)]-empty"
		GLOB.processing_objects -= src

/obj/item/device/flashlight/m203flare/proc/turn_off()
	on = 0
	src.force = initial(src.force)
	src.damtype = initial(src.damtype)
	update_icon()

/obj/item/device/flashlight/m203flare/attack_self(mob/user as mob)
	return

/obj/item/device/flashlight/m203flare/proc/turn_on(var/mob/user)
	if(on)
		return FALSE
	if(!fuel)
		if(user)
			to_chat(user, "<span class='notice'>It's out of fuel.</span>")
		return FALSE
	on = TRUE
	force = on_damage
	damtype = "fire"
	GLOB.processing_objects += src
	update_icon()
	return 1

/obj/item/device/flashlight/gp25flare
	name = "VGS-40-1 flare shell"
	desc = "A flare shell used by WARPACT armies."
	w_class = ITEM_SIZE_SMALL
	brightness_on = 8 // Pretty bright.
	light_power = 3
	light_color = COLOR_RED

	light_color = "#e58775"
	icon_state = "gp25flare"
	item_state = "gp25flare"
	action_button_name = null //just pull it manually, neckbeard.
	power_use = 0
	var/fuel = 0
	var/on_damage = 7
	var/produce_heat = 1500
	activation_sound = 'sound/effects/flare.ogg'

/obj/item/device/flashlight/gp25flare/New()
	fuel = rand(800, 1000)
	..()

/obj/item/device/flashlight/gp25flare/process()
	var/turf/pos = get_turf(src)
	if(pos)
		pos.hotspot_expose(produce_heat, 5)
	fuel = max(fuel - 1, 0)
	playsound(src.loc, 'sound/effects/flareburning.ogg', 75, 1)
	if(!fuel || !on)
		turn_off()
		if(!fuel)
			src.icon_state = "[initial(icon_state)]-empty"
		GLOB.processing_objects -= src

/obj/item/device/flashlight/gp25flare/proc/turn_off()
	on = 0
	src.force = initial(src.force)
	src.damtype = initial(src.damtype)
	update_icon()

/obj/item/device/flashlight/gp25flare/attack_self(mob/user as mob)
	return

/obj/item/device/flashlight/gp25flare/proc/turn_on(var/mob/user)
	if(on)
		return FALSE
	if(!fuel)
		if(user)
			to_chat(user, "<span class='notice'>It's out of fuel.</span>")
		return FALSE
	on = TRUE
	force = on_damage
	damtype = "fire"
	GLOB.processing_objects += src
	update_icon()
	return 1

/obj/item/device/flashlight/flare/mortar
	name = "flare"
	desc = "A bright light high in the sky, you cant seem to reach it."
	w_class = ITEM_SIZE_TINY
	brightness_on = 10 // Pretty bright.
	light_power = 3
	light_color = COLOR_GREEN

	light_color = "#00FF00"
	icon_state = "flare"
	item_state = "flare"
	action_button_name = null //just pull it manually, neckbeard.
	power_use = 0
	fuel = 0
	on_damage = 7
	activation_sound = 'sound/effects/flare.ogg'



//Glowsticks
/obj/item/device/flashlight/glowstick
	name = "green glowstick"
	desc = "A military-grade glowstick."
	w_class = 2.0
	brightness_on = 4
	light_power = 2
	action_button_name = null //just pull it manually, neckbeard.
	color = "#49f37c"
	icon_state = "glowstick"
	item_state = "glowstick"
	randpixel = 12
	activation_sound = null
	power_use = 0
	var/fuel = 0
	var/on_damage = 7
	var/produce_heat = 1500
	activation_sound = 'sound/effects/flare.ogg'

/obj/item/device/flashlight/glowstick/New()
	fuel = rand(800, 1000) // Sorry for changing this so much but I keep under-estimating how long X number of ticks last in seconds.
	light_color = color
	..()

/obj/item/device/flashlight/glowstick/process()
	fuel = max(fuel - 1, 0)
	if(!fuel || !on)
		turn_off()
		GLOB.processing_objects -= src

/obj/item/device/flashlight/glowstick/proc/turn_off()
	on = 0
	src.force = initial(src.force)
	src.damtype = initial(src.damtype)
	update_icon()

/obj/item/device/flashlight/glowstick/attack_self(mob/user)
	if(turn_on(user))
		user.visible_message("<span class='notice'>\The [user] activates \the [src].</span>", "<span class='notice'>You pull the cord on the glowstick, activating it.</span>")

/obj/item/device/flashlight/glowstick/proc/turn_on(var/mob/user)
	if(on)
		return FALSE
	if(!fuel)
		if(user)
			to_chat(user, "<span class='notice'>It's out of chemicals.</span>")
		return FALSE
	on = TRUE
	GLOB.processing_objects += src
	update_icon()
	return 1

/obj/item/device/flashlight/glowstick/update_icon()
	item_state = "glowstick"
	overlays.Cut()
	if(!fuel)
		icon_state = "glowstick-empty"
		set_light(0)
	else if (on)
		var/image/I = overlay_image(icon,"glowstick-on",color)
		I.blend_mode = BLEND_ADD
		overlays += I
		item_state = "glowstick-on"
		set_light(brightness_on)
	else
		icon_state = "glowstick"
	var/mob/M = loc
	if(istype(M))
		if(M.l_hand == src)
			M.update_inv_l_hand()
		if(M.r_hand == src)
			M.update_inv_r_hand()

/obj/item/device/flashlight/glowstick/red
	name = "red glowstick"
	color = "#fc0f29"
	power_use = 0

/obj/item/device/flashlight/glowstick/blue
	name = "blue glowstick"
	color = "#599dff"
	power_use = 0

/obj/item/device/flashlight/glowstick/orange
	name = "orange glowstick"
	color = "#fa7c0b"
	power_use = 0

/obj/item/device/flashlight/glowstick/yellow
	name = "yellow glowstick"
	color = "#fef923"
	power_use = 0

/obj/item/device/flashlight/glowstick/random
	name = "glowstick"
	desc = "A party-grade glowstick."
	color = "#ff00ff"
	power_use = 0

/obj/item/device/flashlight/glowstick/random/New()
	color = rgb(rand(50,255),rand(50,255),rand(50,255))
	..()

/obj/item/device/flashlight/slime
	gender = PLURAL
	name = "glowing slime extract"
	desc = "A glowing ball of what appears to be amber."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "floor1" //not a slime extract sprite but... something close enough!
	item_state = "slime"
	w_class = ITEM_SIZE_TINY
	brightness_on = 6

	on = 1 //Bio-luminesence has one setting, on.
	power_use = 0

/obj/item/device/flashlight/slime/New()
	..()
	set_light(brightness_on)

/obj/item/device/flashlight/slime/update_icon()
	return

/obj/item/device/flashlight/slime/attack_self(mob/user)
	return //Bio-luminescence does not toggle.


/obj/item/device/flashlight/color	//Default color is blue, just roll with it.
	name = "blue flashlight"
	desc = "A hand-held emergency light. This one is blue."
	icon_state = "flashlight_blue"
	item_state = "flashlight_blue"

/obj/item/device/flashlight/color/red
	name = "red flashlight"
	desc = "A hand-held emergency light. This one is red."
	item_state = "flashlight_blue"
	icon_state = "flashlight_blue"

/obj/item/device/flashlight/color/orange
	name = "orange flashlight"
	desc = "A hand-held emergency light. This one is orange."
	icon_state = "flashlight_orange"
	item_state = "flashlight_orange"

/obj/item/device/flashlight/color/yellow
	name = "yellow flashlight"
	desc = "A hand-held emergency light. This one is yellow."
	icon_state = "flashlight_yellow"
	item_state = "flashlight_yellow"


/obj/item/device/flashlight/kerosene
	name = "lantern"
	desc = "A red fancy lantern. Requires kerosene to work."
	w_class = ITEM_SIZE_LARGE
	brightness_on = 6
	icon_state = "kerosene"
	action_button_name = null //just pull it manually, neckbeard.
	power_use = 0
	activation_sound = 'sound/effects/flare.ogg'
	item_state = "lantern"

/obj/item/device/flashlight/kerosene/attack_self(mob/user)
	if(on)
		user.visible_message("<span class='notice'>\The [user] extinguishes \the [src].</span>", "<span class='notice'>You extinguish the kerosene lantern.</span>")
		on = 0
		set_light(0)
		icon_state = "kerosene"
		item_state = "lantern"

/obj/item/device/flashlight/kerosene/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if(istype(W, /obj/item/weapon/flame/))
		var/obj/item/weapon/flame/S = W
		if(S.lit && !on)
			visible_message("<span class='warning'>[user] lights the [name] with the [W].</span>")
			on = 1
			set_light(6)
			icon_state = "kerosene_on"
			GLOB.processing_objects.Add(src)
			item_state = "lantern-on"
		else
			return



//Lava Lamps: Because we're already stuck in the 70ies with those fax machines.
/obj/item/device/flashlight/lamp/lava
	name = "lava lamp"
	desc = "A kitchy throwback decorative light. Noir Edition."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "lavalamp"
	on = 0
	action_button_name = "Toggle lamp"
	brightness_on = 3
	power_use = 0

/obj/item/device/flashlight/lamp/lava/red
	desc = "A kitchy red decorative light."
	icon_state = "redlamp"
	light_color = "#ff0000"

/obj/item/device/flashlight/lamp/lava/blue
	desc = "A kitchy blue decorative light"
	icon_state = "bluelamp"
	light_color = "#0000ff"

/obj/item/device/flashlight/lamp/lava/cyan
	desc = "A kitchy cyan decorative light"
	icon_state = "cyanlamp"
	light_color = "#00ffff"

/obj/item/device/flashlight/lamp/lava/green
	desc = "A kitchy green decorative light"
	icon_state = "greenlamp"
	light_color = "#00ff00"

/obj/item/device/flashlight/lamp/lava/orange
	desc = "A kitchy orange decorative light"
	icon_state = "orangelamp"
	light_color = "#ff9b00"

/obj/item/device/flashlight/lamp/lava/purple
	desc = "A kitchy purple decorative light"
	icon_state = "purplelamp"
	light_color = "#9b00ff"

/obj/item/device/flashlight/lamp/lava/pink
	desc = "A kitchy pink decorative light"
	icon_state = "pinklamp"
	light_color = "#ff00ff"

/obj/item/device/flashlight/lamp/lava/yellow
	desc = "A kitchy yellow decorative light"
	icon_state = "yellowlamp"
	light_color = "#ffff00"
/obj/item/weapon/material/butterfly
	name = "butterfly knife"
	desc = "A basic metal blade concealed in a lightweight plasteel grip. Small enough when folded to fit in a pocket."
	icon_state = "butterflyknife"
	item_state = null
	hitsound = null
	var/active = 0
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("patted", "tapped")
	force_divisor = 0.25 // 15 when wielded with hardness 60 (steel)
	thrown_force_divisor = 0.25 // 5 when thrown with weight 20 (steel)
	weapon_speed_delay = 5
	sharpness = 5

/obj/item/weapon/material/butterfly/update_force()
	if(active)
		edge = 1
		sharp = 1
		..() //Updates force.
		throwforce = max(3,force-3)
		hitsound = 'sound/weapons/bladeslice.ogg'
		icon_state += "_open"
		w_class = ITEM_SIZE_NORMAL
		attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	else
		force = 3
		edge = 0
		sharp = 0
		hitsound = initial(hitsound)
		icon_state = initial(icon_state)
		w_class = initial(w_class)
		attack_verb = initial(attack_verb)

/obj/item/weapon/material/butterfly/switchblade
	name = "switchblade"
	desc = "A classic switchblade with gold engraving. Just holding it makes you feel like a gangster."
	icon_state = "switchblade"
	unbreakable = 1

/obj/item/weapon/material/butterfly/attack_self(mob/user)
	active = !active
	if(active)
		to_chat(user, "<span class='notice'>You flip out \the [src].</span>")
		playsound(user, 'sound/weapons/flipblade.ogg', 15, 1)
	else
		to_chat(user, "<span class='notice'>\The [src] can now be concealed.</span>")
	update_force()
	add_fingerprint(user)

/*
 * Kitchen knives
 */
/obj/item/weapon/material/knife
	name = "kitchen knife"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "knife"
	desc = "A general purpose Chef's Knife made by SpaceCook Incorporated. Guaranteed to stay sharp for years to come."
	flags = CONDUCT
	sharp = 1
	edge = 1
	force_divisor = 0.15 // 9 when wielded with hardness 60 (steel)
	matter = list(DEFAULT_WALL_MATERIAL = 12000)
	origin_tech = list(TECH_MATERIAL = 1)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	picksound = 'sound/items/interactions/blade_unsheath.ogg'
	unbreakable = 1
	weapon_speed_delay = 4

/*/obj/item/weapon/material/knife/attack_self(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(user.a_intent == I_HELP)
			var/obj/item/organ/external/injured_area = H.get_organ(H.zone_sel.selecting)
			if(!injured_area.implants)
				to_chat(H, "<span class='warning'>You search for embedded shrapnel, but there is none to be found.</span>")
				return	
			for(var/obj/item/weapon/O in injured_area.implants)
				if(istype(O, /obj/item/weapon/material/shard/shrapnel/))
					for(var/datum/wound/W in injured_area.wounds)
						var/shrap_removal_scale = W.embedded_objects.len
						H.visible_message("<span class='warning'>[H] starts to dig out the shrapnel out of their [injured_area], don't move!</span>",\
		"You begin to dig out the shrapnel in [injured_area], don't move!")
						if(!do_after(H, ((60*shrap_removal_scale)-(10*H.skill_medicine)), src)) 
							to_chat(H, "<span class='userdanger'>You moved and your wounds painfully tear apart!</span>")
							injured_area.add_pain(15*shrap_removal_scale) // idk if this is a good amount of pain, i think it's acceptable doe
							injured_area.sever_artery()
							H.say("*scream")
							return 
						W.embedded_objects -= O
						injured_area.implants -= O
						O.forceMove(get_turf(H.loc)) // add bleeding if found how
						injured_area.take_damage(5-H.skill_medicine, 0, (DAM_SHARP|DAM_EDGE), used_weapon = src)
						to_chat(H, "<span class='warning'>You remove the shrapnel out of your [injured_area]. </span>")
						return

/obj/item/weapon/material/knife/attack(mob/M, mob/user, var/target_zone) // make a loop if possible
	if(user.a_intent == I_HELP && user.skill_medicine >= 3) // only medics and doctors can do this 
		var/mob/living/carbon/human/H = user
		var/mob/living/carbon/human/T = M 
		if(user.a_intent == I_HELP)
			for(var/bodypart in BP_ALL_LIMBS)
				var/obj/item/organ/external/injured_area = T.organs_by_name[bodypart]
				if(!injured_area.implants)
					to_chat(H, "<span class='warning'>You search for embedded shrapnel, but there is none to be found.</span>")
					return	
				for(var/obj/item/weapon/O in injured_area.implants)
					if(istype(O, /obj/item/weapon/material/shard/shrapnel/))
						for(var/datum/wound/W in injured_area.wounds)
							var/shrap_removal_scale = W.embedded_objects.len
							H.visible_message("<span class='warning'>[H] starts to dig out the shrapnel out of [injured_area] of [T]. </span>",\
		"You begin to dig out the shrapnel in [T]'s [injured_area].")
							if(!do_after(H, 15, H)) 
								to_chat(H, "<span class='userdanger'>You were interrupted!</span>")
								injured_area.add_pain(5*shrap_removal_scale) // idk if this is a good amount of pain, i think it's acceptable doe
								injured_area.get_brute_damage(3*shrap_removal_scale)
								T.say("*scream")
								return 
							W.embedded_objects -= O
							injured_area.implants -= O
							O.forceMove(get_turf(H.loc))  // add bleeding if found how
							injured_area.take_damage(5-H.skill_medicine, 0, (DAM_SHARP|DAM_EDGE), used_weapon = src)
							to_chat(H, "<span class='warning'>You remove the shrapnel out of [T]'s body. </span>")
							return	
		return  

	else
		return ..()*/ ////////////fix this shit sometime - severe
								
/obj/item/weapon/material/knife/hook
	name = "meat hook"
	desc = "A sharp, metal hook what sticks into things."
	icon_state = "hook_knife"
	item_state = "hook_knife"

/obj/item/weapon/material/knife/ritual
	name = "ritual knife"
	desc = "The unearthly energies that once powered this blade are now dormant."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "render"
	applies_material_colour = 0

/obj/item/weapon/material/knife/butch
	name = "butcher's cleaver"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "butch"
	desc = "A huge thing used for chopping and chopping up meat. This includes clowns and clown-by-products."
	force_divisor = 0.25 // 15 when wielded with hardness 60 (steel)
	attack_verb = list("cleaved", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")


/obj/item/weapon/material/knife/bayonet
	w_class = 2
	force_divisor = 0.25
	color = null
	sharp = 1
	edge = 1
	item_state = "knife"
	sharpness = 5

/obj/item/weapon/material/knife/bayonet/sa/a6h4
	name = "6h4 bayonet"
	desc = "An AK74 bayonet with two sharp edges near the point."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "6h4"

/obj/item/weapon/material/knife/bayonet/sa/a6h4/ddr
	name = "Modell AK74 bayonet"
	desc = "An AK74 bayonet with two sharp edges near the point."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "6h4_ddr"

/obj/item/weapon/material/knife/bayonet/sa/a6h3
	name = "6h3 bayonet"
	desc = "An AKM bayonet with two sharp edges near the point."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "6h3"

/obj/item/weapon/material/knife/bayonet/sa/a6h3/ddr
	name = "Mehrzweckbajonett M1959"
	desc = "An AKM bayonet with two sharp edges near the point."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "6h3_ddr"

/obj/item/weapon/material/knife/bayonet/csla
	name = "Vz.58 bayonet"
	desc = "A slim and sharp, but somewhat fragile Czechoslovakian bayonet."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "csla"

/obj/item/weapon/material/knife/bayonet/usmc
	name = "M7 bayonet"
	desc = "A 12 inch bayonet with a carbon-steel blade. This one was manufacured in West Germany."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "usmc"

/obj/item/weapon/material/knife/bayonet/bdw
	name = "Kampfmesser M68"
	desc = "Combat knife of the Bundeswehr forces. German quality."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "bdw"

/obj/item/weapon/material/knife/bayonet/baf
	name = "L1A3 bayonet"
	desc = "A 9 inch bayonet with a carbon-steel blade. Produced in Great Britain."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "baf"

/obj/item/weapon/material/knife/bayonet/finn
	name = "M62 Valmet bayonet"
	desc = "A bayonet based on Finnish 'puukko' knives."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "finn"
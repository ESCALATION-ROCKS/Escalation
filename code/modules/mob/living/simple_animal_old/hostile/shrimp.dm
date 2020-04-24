
/mob/living/simple_animal/hostile/mechspider
	name = "mechspider"
	desc = "That's the small robot, slightly resembling a spider. It has a saw on a place of his head."
	icon = 'icons/mob/critter.dmi'
	icon_state = "shrimp_stealth"
	icon_living = "shrimp_stealth"
	icon_dead = "shrimp_stealth"
	icon_gib = "shrimp_stealth"
	maxHealth = 40
	health = 40
	speed = 10
	speak_chance = 0
	turns_per_move = 5
	move_to_delay = 3
	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"
	break_stuff_probability = 0
	faction = "vagrant"
	harm_intent_damage = 5
	melee_damage_lower = 15
	melee_damage_upper = 30
	light_color = "#8A0707"
	attacktext = "slashed"
	attack_sound = 'sound/weapons/rapidslice.ogg'
	min_gas = null
	max_gas = null
	minbodytemp = 0
	var/cloaked = 0
	var/mob/living/carbon/human/gripping = null
	var/blood_per_tick = 4.25

/mob/living/simple_animal/hostile/mechspider/bullet_act(var/obj/item/projectile/Proj)
	var/oldhealth = health
	. = ..()
	if((target_mob != Proj.firer) && health < oldhealth && !incapacitated(INCAPACITATION_KNOCKOUT)) //Respond to being shot at
		target_mob = Proj.firer
		turns_per_move = 2
		MoveToTarget()

/mob/living/simple_animal/hostile/mechspider/Life()
	. = ..()
	if(gripping)
		if(!(get_turf(src) == get_turf(gripping)))
			gripping = null

		else if(gripping.should_have_organ(BP_HEART))
			var/blood_volume = round(gripping.vessel.get_reagent_amount(/datum/reagent/blood))
			if(blood_volume > 5)
				gripping.vessel.remove_reagent(/datum/reagent/blood, blood_per_tick)
				if(prob(15))
					to_chat(gripping, "<span class='danger'>You feel your fluids being drained!</span>")
			else
				gripping = null

		if(turns_per_move != initial(turns_per_move))
			turns_per_move = initial(turns_per_move)

	if(stance == HOSTILE_STANCE_IDLE && !cloaked)
		cloaked = 1
		update_icon()

/mob/living/simple_animal/hostile/mechspider/death()
	..(null, "blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

/mob/living/simple_animal/hostile/mechspider/update_icon()
	if(cloaked) //It's fun time
		alpha = 105
		icon_state = initial(icon_state)
		move_to_delay = initial(move_to_delay)
	else //It's fight time
		alpha = 255
		icon_state = "shrimp"
		move_to_delay = 2
		playsound(src.loc, 'sound/weapons/circsawhit.ogg', 50, 1)

/mob/living/simple_animal/hostile/mechspider/AttackingTarget()
	. = ..()
	if(ishuman(.))
		var/mob/living/carbon/human/H = .
		if(gripping == H)
			H.Weaken(3)
			return
		//This line ensures there's always a reasonable chance of grabbing, while still
		//Factoring in health
		if(!gripping && (cloaked || prob(health + ((maxHealth - health) * 2))))
			gripping = H
			cloaked = 0
			update_icon()
			H.Weaken(3)
			H.visible_message("<span class='danger'>\the [src] latches onto \the [H]!</span>")
			src.loc = gripping.loc
			return

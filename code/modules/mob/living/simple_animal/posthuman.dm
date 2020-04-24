/mob/living/simple_animal/hostile/posthuman/
	a_intent = I_HURT
	destroy_surroundings = 1
	speak_chance = 20
	speak = list("BZ-ZT.","BR-RT.")
	emote_see = list("beeps menacingly","whirrs threateningly","scans its immediate vicinity")
	melee_attack_minDelay = 3		// How long between attacks at least
	melee_attack_maxDelay = 5		// How long between attacks at most


/mob/living/simple_animal/hostile/posthuman/death()
	new/obj/effect/gibspawner/robot(loc) //TODO: use gib() or refactor spiderbots into synthetics.
	..()

/mob/living/simple_animal/hostile/posthuman/android
	name = "android"
	desc = "A humanoid thing resembling a skeleton with some metal plating."
	icon = 'icons/mob/posthuman.dmi'
	icon_state = "android1"
	icon_living = "android1"
	speed = 4
	faction = "android"
	maxHealth = 70
	health = 70

//	pass_flags = PASSTABLE

	melee_damage_lower = 20
	melee_damage_upper = 20
	attack_sharp = 0
	attack_edge = 0
	attack_sound = 'sound/weapons/bladeslice.ogg'
	attacktext = list("bash")
	triggered_sound = 'sound/voice/android/g_triggered.wav'
	say_sounds = list('sound/voice/android/g_idle1.wav', 'sound/voice/android/g_idle2.wav', 'sound/voice/android/g_idle3.wav')
	death_sound = 'sound/voice/android/g_death.wav'
	attack_sound = 'sound/voice/android/g_strike.wav'

/mob/living/simple_animal/hostile/posthuman/android/Initialize()
	icon_state = "android[rand(1,4)]"
	icon_living = "android[rand(1,4)]"
	..()

/mob/living/simple_animal/hostile/posthuman/androidfast
	name = "android"
	desc = "A spiderous robotic-looking thing. It seems to be in fucking horrible condition"
	icon = 'icons/mob/posthuman.dmi'
	icon_state = "android_sp"
	icon_living = "android_sp"
	intelligence_level = SA_ROBOTIC
	speed = 7
	faction = "android"
	maxHealth = 40
	health = 40
	triggered_sound = 'sound/voice/android/ld_triggered.wav'
	say_sounds = list('sound/voice/android/ld_idle1.wav', 'sound/voice/android/ld_idle2.wav', 'sound/voice/android/ld_idle3.wav')
	death_sound = 'sound/voice/android/ld_death.wav'
	attack_sound = 'sound/voice/android/ld_strike.wav'

	pass_flags = PASSTABLE

	melee_attack_minDelay = 0		// How long between attacks at least
	melee_attack_maxDelay = 2		// How long between attacks at most

	melee_damage_lower = 10
	melee_damage_upper = 15
	attack_sharp = 1
	attack_edge = 1
	attacktext = list("cut", "slice")
	var/mob/living/carbon/human/gripping = null
	var/blood_per_tick = 4.25


/mob/living/simple_animal/hostile/posthuman/androidfast/Life()
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


/mob/living/simple_animal/hostile/posthuman/androidfast/PunchTarget()
	. = ..()
	if(ishuman(.))
		var/mob/living/carbon/human/H = .
		if(gripping == H)
			H.Weaken(3)
			return
		//This line ensures there's always a reasonable chance of grabbing, while still
		//Factoring in health
		if(!gripping && (prob(health + ((maxHealth - health) * 2))))
			gripping = H
			update_icon()
			H.Weaken(3)
			H.visible_message("<span class='danger'>\the [src] latches onto \the [H]!</span>")
			src.loc = gripping.loc
			return



/mob/living/simple_animal/hostile/posthuman/androidcarrier
	name = "android"
	desc = "A pathehic looking thing resembling a synthesis of an android and some trash."
	icon = 'icons/mob/posthuman.dmi'
	icon_state = "android_hv"
	icon_living = "android_hv"
	intelligence_level = SA_ROBOTIC
	speed = 3
	faction = "android"
	maxHealth = 200
	health = 250
	melee_attack_minDelay = 4		// How long between attacks at least
	melee_attack_maxDelay = 10		// How long between attacks at most

	pass_flags = PASSTABLE

	melee_damage_lower = 25
	melee_damage_upper = 40
	attacktext = list("BASHED", "CRUSHED")
	triggered_sound = 'sound/voice/android/pz_triggered.wav'
	say_sounds = list('sound/voice/android/pz_idle2.wav', 'sound/voice/android/pz_idle3.wav', 'sound/voice/android/pz_idle4.wav')
	death_sound = 'sound/voice/android/pz_die.wav'
	attack_sound = 'sound/voice/android/g_strike.wav'
	spattack_prob = 20			// Chance of the mob doing a special attack (0 for never)
	spattack_min_range = 0		// Min range to perform the special attacks from
	spattack_max_range = 6		// Max range to perform special attacks from

	var/bots_count = 0

/mob/living/simple_animal/hostile/posthuman/androidcarrier/New()
	bots_count = rand(2,6)
//	adjust_scale(1.2)
	..()

/mob/living/simple_animal/hostile/posthuman/androidcarrier/set_target()
	. = ..()
	if(bots_count > 0)
		visible_message("<span class='notice'>\The [src]'s hatch opens and a little bot comes out!</span>")
		new /mob/living/simple_animal/hostile/posthuman/carrier_ling(loc)
		bots_count -= 1

/mob/living/simple_animal/hostile/posthuman/carrier_ling
	name = "android"
	desc = "A small thing resembling a medical bot."
	icon = 'icons/mob/posthuman.dmi'
	icon_state = "android_ling"
	icon_living = "android_ling"
	intelligence_level = SA_ROBOTIC
	speed = 5
	faction = "android"
	maxHealth = 15
	health = 15

	pass_flags = PASSTABLE

	melee_damage_lower = 5
	melee_damage_upper = 5
//	attack_sharp = 1
//	attack_edge = 1
	attacktext = list("stings")
	triggered_sound = 'sound/voice/android/sb_triggered.wav'
	say_sounds = list('sound/voice/android/sb_idle1.wav', 'sound/voice/android/sb_idle2.wav', 'sound/voice/android/sb_idle3.wav')
	death_sound = 'sound/voice/android/sb_die.wav'
	attack_sound = 'sound/voice/android/sb_strike.wav'
	var/busy = 0
	var/poison_per_bite = 5
	var/poison_chance = 40
	var/poison_type = /datum/reagent/lexorin

/mob/living/simple_animal/hostile/posthuman/carrier_ling/DoPunch(var/atom/A)
	. = ..()
	if(.) // If we succeeded in hitting.
		if(isliving(A))
			var/mob/living/L = A
			if(L.reagents)
				var/target_zone = pick(BP_CHEST,BP_CHEST,BP_CHEST,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_HEAD)
				if(L.can_inject(src, null, target_zone))
					L.reagents.add_reagent(poison_type, poison_per_bite)
					if(prob(poison_chance))
						to_chat(L, "<span class='warning'>You feel a tiny prick.</span>")
						L.reagents.add_reagent(poison_type, poison_per_bite)


/mob/living/simple_animal/hostile/posthuman/android_barebeh
	name = "android"
	desc = "A pathehic looking thing resembling some combat android."
	icon = 'icons/mob/posthuman.dmi'
	icon_state = "android_barebeh"
	icon_living = "android_barebeh"
	intelligence_level = SA_ROBOTIC
	speed = 2
	faction = "android"
	maxHealth = 150
	health = 150
	triggered_sound = 'sound/voice/android/cp_triggered.wav'
	say_sounds = list('sound/voice/android/cp_idle1.wav', 'sound/voice/android/cp_idle2.wav', 'sound/voice/android/cp_idle3.wav')
	death_sound = 'sound/voice/android/cp_die.wav'
	attack_sound = 'sound/voice/android/ld_strike.wav'

	pass_flags = PASSTABLE

	melee_damage_lower = 20
	melee_damage_upper = 20
	attacktext = list("bashed", "crushed")
	spattack_prob = 10			// Chance of the mob doing a special attack (0 for never)
	spattack_min_range = 0		// Min range to perform the special attacks from
	spattack_max_range = 6		// Max range to perform special attacks from
	var/triggered = 0
	var/exploded = 0

/mob/living/simple_animal/hostile/posthuman/android_barebeh/Life()
	if(!triggered && health < 50)
		triggered = 1
		visible_message("<span class='notice'>\The [src]'s emits some weeping sound!</span>")
		playsound(src.loc, 'sound/voice/android/cp_nade.wav', 100, 1)
		speed = 5
		sleep(25)
		visible_message("<span class='danger'>\The [src]'s body begins to rupture!</span>")
		spawn(rand(6,10))
		if(src && !exploded)
			visible_message("<span class='critical'>\The [src]'s body detonates!</span>")
			exploded = 1
			explosion(src.loc, 1, 2, 4, 6)
	..()

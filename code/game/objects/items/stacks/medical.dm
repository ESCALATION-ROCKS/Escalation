/obj/item/stack/medical
	name = "medical pack"
	singular_name = "medical pack"
	icon = 'icons/obj/items.dmi'
	amount = 5
	max_amount = 5
	w_class = ITEM_SIZE_SMALL
	throw_speed = 4
	throw_range = 20
	var/heal_brute = 0
	var/heal_burn = 0
	var/animal_heal = 3
	picksound = 'sound/items/interactions/bandages.wav'

/obj/item/stack/medical/attack(mob/living/carbon/M as mob, mob/user as mob)
	if (!istype(M))
		to_chat(user, "<span class='warning'>\The [src] cannot be applied to [M]!</span>")
		return 1

	if ( ! (istype(user, /mob/living/carbon/human) || \
			istype(user, /mob/living/silicon)) )
		to_chat(user, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return 1

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting)

		if(!affecting)
			to_chat(user, "<span class='warning'>\The [M] is missing that body part!</span>")
			return 1

		if(affecting.organ_tag == BP_HEAD)
			if(H.head && istype(H.head,/obj/item/clothing/head/helmet/space))
				to_chat(user, "<span class='warning'>You can't apply [src] through [H.head]!</span>")
				return 1
		else
			if(H.wear_suit && istype(H.wear_suit,/obj/item/clothing/suit/space))
				to_chat(user, "<span class='warning'>You can't apply [src] through [H.wear_suit]!</span>")
				return 1

		if(affecting.robotic >= ORGAN_ROBOT)
			to_chat(user, "<span class='warning'>This isn't useful at all on a robotic limb..</span>")
			return 1

		H.UpdateDamageIcon()

	else

		M.heal_organ_damage((src.heal_brute/2), (src.heal_burn/2))
		user.visible_message( \
			"<span class='notice'>[M] has been applied with [src] by [user].</span>", \
			"<span class='notice'>You apply \the [src] to [M].</span>" \
		)
		use(1)

	M.updatehealth()


/obj/item/stack/medical/bruise_pack/craft
	name = "makeshift bandage"
	singular_name = "makeshift bandage"
	desc = "A piece of clothing, which can be used for low quality treatment."
	icon_state = "hc_brutepack"
	amount = 10

/obj/item/stack/medical/bruise_pack/craft/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting) //nullchecked by ..()

		if(affecting.is_bandaged())
			to_chat(user, "<span class='warning'>The wounds on [M]'s [affecting.name] have already been bandaged.</span>")
			return 1
		else
			user.visible_message("<span class='notice'>\The [user] starts treating [M]'s [affecting.name].</span>", \
					             "<span class='notice'>You start treating [M]'s [affecting.name].</span>" )
			var/used = 0
			for (var/datum/wound/W in affecting.wounds)
				if(W.bandaged)
					continue
				if(used == amount)
					break
				if(!do_mob(user, M, W.damage*3))
					to_chat(user, "<span class='notice'>You must stand still to bandage wounds.</span>")
					break
				if(!user.statscheck(user.skill_medicine, user.int, 6, 0, src))
					used++
					to_chat(user, "<span class='notice'>You fumble with the bandages.</span>")
					break
				else
					continue
				if (W.current_stage <= W.max_bleeding_stage)
					user.visible_message("<span class='notice'>\The [user] bandages \a [W.desc] on [M]'s [affecting.name].</span>", \
					                              "<span class='notice'>You bandage \a [W.desc] on [M]'s [affecting.name].</span>" )
					//H.add_side_effect("Itch")
				else if (W.damage_type == BRUISE)
					user.visible_message("<span class='notice'>\The [user] places a bruise patch over \a [W.desc] on [M]'s [affecting.name].</span>", \
					                              "<span class='notice'>You place a bruise patch over \a [W.desc] on [M]'s [affecting.name].</span>" )
				else
					user.visible_message("<span class='notice'>\The [user] places a bandaid over \a [W.desc] on [M]'s [affecting.name].</span>", \
					                              "<span class='notice'>You place a bandaid over \a [W.desc] on [M]'s [affecting.name].</span>" )
				W.bandage()
				used++
				playsound(user.loc, 'sound/items/interactions/smallmedkit1.wav', 20, 1)
			affecting.update_damages()
			if(used == amount)
				if(affecting.is_bandaged())
					to_chat(user, "<span class='warning'>\The [src] is used up.</span>")
				else
					to_chat(user, "<span class='warning'>\The [src] is used up, but there are more wounds to treat on \the [affecting.name].</span>")
			use(used)


/obj/item/stack/medical/bruise_pack
	name = "roll of gauze"
	singular_name = "gauze length"
	desc = "Some sterile gauze to wrap around bloody stumps."
	icon_state = "brutepack"
	origin_tech = list(TECH_BIO = 1)
	animal_heal = 5

/obj/item/stack/medical/bruise_pack/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting) //nullchecked by ..()

		if(affecting.is_bandaged())
			to_chat(user, "<span class='warning'>The wounds on [M]'s [affecting.name] have already been bandaged.</span>")
			return 1
		else
			user.visible_message("<span class='notice'>\The [user] starts treating [M]'s [affecting.name].</span>", \
					             "<span class='notice'>You start treating [M]'s [affecting.name].</span>" )
			var/used = 0
			for (var/datum/wound/W in affecting.wounds)
				if(W.bandaged)
					continue
				if(used == amount)
					break
				if(!do_mob(user, M, W.damage*2))
					to_chat(user, "<span class='notice'>You must stand still to bandage wounds.</span>")
					break
				if(!user.statscheck(user.skill_medicine, user.int, 4, 0, src))
					used++
					to_chat(user, "<span class='notice'>You fumble with the bandages.</span>")
					break
				if (W.current_stage <= W.max_bleeding_stage)
					user.visible_message("<span class='notice'>\The [user] bandages \a [W.desc] on [M]'s [affecting.name].</span>", \
					                              "<span class='notice'>You bandage \a [W.desc] on [M]'s [affecting.name].</span>" )
					//H.add_side_effect("Itch")
				else if (W.damage_type == BRUISE)
					user.visible_message("<span class='notice'>\The [user] places a bruise patch over \a [W.desc] on [M]'s [affecting.name].</span>", \
					                              "<span class='notice'>You place a bruise patch over \a [W.desc] on [M]'s [affecting.name].</span>" )
				else
					user.visible_message("<span class='notice'>\The [user] places a bandaid over \a [W.desc] on [M]'s [affecting.name].</span>", \
					                              "<span class='notice'>You place a bandaid over \a [W.desc] on [M]'s [affecting.name].</span>" )
				W.bandage()
				used++
				playsound(user.loc, 'sound/items/interactions/smallmedkit1.wav', 20, 1)
			affecting.update_damages()
			if(used == amount)
				if(affecting.is_bandaged())
					to_chat(user, "<span class='warning'>\The [src] is used up.</span>")
				else
					to_chat(user, "<span class='warning'>\The [src] is used up, but there are more wounds to treat on \the [affecting.name].</span>")
			use(used)


/obj/item/stack/medical/medispray
	name = "medispray"
	singular_name = "medispray"
	desc = "A mass-produced spray used to treating desinfecting injuries."
	icon_state = "medispray"
	origin_tech = list(TECH_BIO = 1)
	animal_heal = 0
	amount = 20
	max_amount = 20

/obj/item/stack/medical/medispray/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting) //nullchecked by ..()

		user.visible_message("<span class='notice'>\The [user] starts spraying wounds on [M]'s [affecting.name].</span>", \
				             "<span class='notice'>You start spraying the wounds on [M]'s [affecting.name].</span>" )
		if(!do_mob(user, M, 30))
			to_chat(user, "<span class='notice'>You must stand still to salve wounds.</span>")
			return 1
		if(!user.statscheck(user.skill_medicine, user.int, 6, 0, src))
			to_chat(user, "<span class='notice'>You fumble with the spray.</span>")
			return 1
		user.visible_message("<span class='notice'>[user] sprays wounds on [M]'s [affecting.name].</span>", \
		                         "<span class='notice'>You sprayed wounds on [M]'s [affecting.name].</span>" )
		use(1)
		affecting.disinfect()
		playsound(user.loc, 'sound/items/interactions/Medspray.wav', 50, 1)

/obj/item/stack/medical/ointment
	name = "ointment"
	desc = "Used to treat those nasty burns."
	gender = PLURAL
	singular_name = "ointment"
	icon_state = "ointment"
	heal_burn = 1
	origin_tech = list(TECH_BIO = 1)
	animal_heal = 4

/obj/item/stack/medical/ointment/soviet
	icon_state = "ointment_soviet"

/obj/item/stack/medical/ointment/nato
	icon_state = "ointment_usmc"

/obj/item/stack/medical/ointment/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting) //nullchecked by ..()

		if(affecting.is_salved())
			to_chat(user, "<span class='warning'>The wounds on [M]'s [affecting.name] have already been salved.</span>")
			return 1
		else
			user.visible_message("<span class='notice'>\The [user] starts salving wounds on [M]'s [affecting.name].</span>", \
					             "<span class='notice'>You start salving the wounds on [M]'s [affecting.name].</span>" )
			if(!do_mob(user, M, 10))
				to_chat(user, "<span class='notice'>You must stand still to salve wounds.</span>")
				return 1
			user.visible_message("<span class='notice'>[user] salved wounds on [M]'s [affecting.name].</span>", \
			                         "<span class='notice'>You salved wounds on [M]'s [affecting.name].</span>" )
			use(1)
			affecting.salve()

/obj/item/stack/medical/advanced/bruise_pack
	name = "advanced trauma kit"
	singular_name = "advanced trauma kit"
	desc = "An advanced trauma kit for severe injuries."
	icon_state = "traumakit"
	heal_brute = 0
	origin_tech = list(TECH_BIO = 1)
	animal_heal = 12

/obj/item/stack/medical/advanced/bruise_pack/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting) //nullchecked by ..()
		if(affecting.is_bandaged() && affecting.is_disinfected())
			to_chat(user, "<span class='warning'>The wounds on [M]'s [affecting.name] have already been treated.</span>")
			return 1
		else
			user.visible_message("<span class='notice'>\The [user] starts treating [M]'s [affecting.name].</span>", \
					             "<span class='notice'>You start treating [M]'s [affecting.name].</span>" )
			var/used = 0
			for (var/datum/wound/W in affecting.wounds)
				if (W.bandaged && W.disinfected)
					continue
				if(used == amount)
					break
				if(!do_mob(user, M, W.damage/5))
					to_chat(user, "<span class='notice'>You must stand still to bandage wounds.</span>")
					break
				if (W.current_stage <= W.max_bleeding_stage)
					user.visible_message("<span class='notice'>\The [user] cleans \a [W.desc] on [M]'s [affecting.name] and seals the edges with bioglue.</span>", \
					                     "<span class='notice'>You clean and seal \a [W.desc] on [M]'s [affecting.name].</span>" )
				else if (W.damage_type == BRUISE)
					user.visible_message("<span class='notice'>\The [user] places a medical patch over \a [W.desc] on [M]'s [affecting.name].</span>", \
					                              "<span class='notice'>You place a medical patch over \a [W.desc] on [M]'s [affecting.name].</span>" )
				else
					user.visible_message("<span class='notice'>\The [user] smears some bioglue over \a [W.desc] on [M]'s [affecting.name].</span>", \
					                              "<span class='notice'>You smear some bioglue over \a [W.desc] on [M]'s [affecting.name].</span>" )
				W.bandage()
				W.disinfect()
				W.heal_damage(heal_brute)
				used++
			affecting.update_damages()
			if(used == amount)
				if(affecting.is_bandaged())
					to_chat(user, "<span class='warning'>\The [src] is used up.</span>")
				else
					to_chat(user, "<span class='warning'>\The [src] is used up, but there are more wounds to treat on \the [affecting.name].</span>")
			use(used)

/obj/item/stack/medical/advanced/ointment
	name = "advanced burn kit"
	singular_name = "advanced burn kit"
	desc = "An advanced treatment kit for severe burns."
	icon_state = "burnkit"
	heal_burn = 0
	origin_tech = list(TECH_BIO = 1)
	animal_heal = 7


/obj/item/stack/medical/advanced/ointment/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting) //nullchecked by ..()

		if(affecting.is_salved())
			to_chat(user, "<span class='warning'>The wounds on [M]'s [affecting.name] have already been salved.</span>")
			return 1
		else
			user.visible_message("<span class='notice'>\The [user] starts salving wounds on [M]'s [affecting.name].</span>", \
					             "<span class='notice'>You start salving the wounds on [M]'s [affecting.name].</span>" )
			if(!do_mob(user, M, 10))
				to_chat(user, "<span class='notice'>You must stand still to salve wounds.</span>")
				return 1
			user.visible_message( 	"<span class='notice'>[user] covers wounds on [M]'s [affecting.name] with regenerative membrane.</span>", \
									"<span class='notice'>You cover wounds on [M]'s [affecting.name] with regenerative membrane.</span>" )
			affecting.heal_damage(0,heal_burn)
			use(1)
			affecting.salve()

/obj/item/stack/medical/splint
	name = "medical splints"
	singular_name = "medical splint"
	desc = "Modular splints capable of supporting and immobilizing bones in both limbs and appendages."
	icon_state = "splint"
	amount = 5
	max_amount = 5
	animal_heal = 0
	var/list/splintable_organs = list(BP_HEAD, BP_CHEST, BP_GROIN, BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_L_HAND, BP_R_HAND, BP_L_FOOT, BP_R_FOOT)	//List of organs you can splint, natch.

/obj/item/stack/medical/splint/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting) //nullchecked by ..()
		var/limb = affecting.name
		if(!(affecting.organ_tag in splintable_organs))
			to_chat(user, "<span class='danger'>You can't use \the [src] to apply a splint there!</span>")
			return
		if(affecting.splinted)
			to_chat(user, "<span class='danger'>[M]'s [limb] is already splinted!</span>")
			return
		if (M != user)
			user.visible_message("<span class='danger'>[user] starts to apply \the [src] to [M]'s [limb].</span>", "<span class='danger'>You start to apply \the [src] to [M]'s [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
		else
			if(( !user.hand && (affecting.organ_tag in list(BP_R_ARM, BP_R_HAND)) || \
				user.hand && (affecting.organ_tag in list(BP_L_ARM, BP_L_HAND)) ))
				to_chat(user, "<span class='danger'>You can't apply a splint to the arm you're using!</span>")
				return
			user.visible_message("<span class='danger'>[user] starts to apply \the [src] to their [limb].</span>", "<span class='danger'>You start to apply \the [src] to your [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
		if(do_after(user, 50, M))
			if(M == user && !user.statscheck(user.skill_medicine, user.int, 8, 0, src))
				user.visible_message("<span class='danger'>\The [user] fumbles [src].</span>", "<span class='danger'>You fumble [src].</span>", "<span class='danger'>You hear something being wrapped.</span>")
				return
			var/obj/item/stack/medical/splint/S = split(1)
			if(S)
				if(affecting.apply_splint(S))
					S.forceMove(affecting)
					if (M != user)
						user.visible_message("<span class='danger'>\The [user] finishes applying [src] to [M]'s [limb].</span>", "<span class='danger'>You finish applying \the [src] to [M]'s [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
					else
						user.visible_message("<span class='danger'>\The [user] successfully applies [src] to their [limb].</span>", "<span class='danger'>You successfully apply \the [src] to your [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
					return
				S.dropInto(src.loc) //didn't get applied, so just drop it
			user.visible_message("<span class='danger'>\The [user] fails to apply [src].</span>", "<span class='danger'>You fail to apply [src].</span>", "<span class='danger'>You hear something being wrapped.</span>")
		return


/obj/item/stack/medical/splint/ghetto
	name = "makeshift splints"
	singular_name = "makeshift splint"
	desc = "For holding your limbs in place with duct tape and scrap metal."
	icon_state = "tape-splint"
	amount = 1
	splintable_organs = list(BP_HEAD, BP_CHEST, BP_GROIN, BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_L_HAND, BP_R_HAND, BP_L_FOOT, BP_R_FOOT)

/obj/item/stack/medical/tourniquet
	name = "Esmarch tourniquet"
	singular_name = "tourniquet"
	desc = "That's the generic tourniquet used to treat arterial bleeding."
	icon_state = "esmarch_tourniquet"
	amount = 1
	animal_heal = 0
	var/list/tourniquetable_organs = list(BP_HEAD, BP_CHEST, BP_GROIN, BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_L_HAND, BP_R_HAND, BP_L_FOOT, BP_R_FOOT)	//List of organs you can splint, natch.

/obj/item/stack/medical/tourniquet/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting) //nullchecked by ..()
		var/limb = affecting.name
		if(!(affecting.organ_tag in tourniquetable_organs))
			to_chat(user, "<span class='danger'>You can't use \the [src] to apply a tourniquet there!</span>")
			return
		if(affecting.tourniqueted)
			to_chat(user, "<span class='danger'>[M]'s [limb] is already tourniqueted!</span>")
			return
		if (M != user)
			user.visible_message("<span class='danger'>[user] starts to apply \the [src] to [M]'s [limb].</span>", "<span class='danger'>You start to apply \the [src] to [M]'s [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
		else
			if(( !user.hand && (affecting.organ_tag in list(BP_R_ARM, BP_R_HAND)) || \
				user.hand && (affecting.organ_tag in list(BP_L_ARM, BP_L_HAND)) ))
				to_chat(user, "<span class='danger'>You can't apply a tourniquet to the arm you're using!</span>")
				return
			user.visible_message("<span class='danger'>[user] starts to apply \the [src] to their [limb].</span>", "<span class='danger'>You start to apply \the [src] to your [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
		if(do_after(user, 50, M))
			if(M == user && !user.statscheck(user.skill_medicine, user.int, 1, 1, src))
				user.visible_message("<span class='danger'>\The [user] fumbles [src].</span>", "<span class='danger'>You fumble [src].</span>", "<span class='danger'>You hear something being wrapped.</span>")
				return
			var/obj/item/stack/medical/tourniquet/S = split(1)
			if(S)
				if(affecting.apply_tourniquet(S))
					S.forceMove(affecting)
					if (M != user)
						user.visible_message("<span class='danger'>\The [user] finishes applying [src] to [M]'s [limb].</span>", "<span class='danger'>You finish applying \the [src] to [M]'s [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
					else
						user.visible_message("<span class='danger'>\The [user] successfully applies [src] to their [limb].</span>", "<span class='danger'>You successfully apply \the [src] to your [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
					return
				S.dropInto(src.loc) //didn't get applied, so just drop it
			user.visible_message("<span class='danger'>\The [user] fails to apply [src].</span>", "<span class='danger'>You fail to apply [src].</span>", "<span class='danger'>You hear something being wrapped.</span>")
		return


/obj/item/stack/medical/tourniquet/nato
	name = "NATO tourniquet"
	icon_state = "nato_tourniquet"

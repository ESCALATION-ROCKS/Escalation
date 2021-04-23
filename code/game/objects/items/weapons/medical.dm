//////////////////Hope this whole shit was worth re-writing
//////////////////Here you will find everything related to coldwar medicine
//////////////////Chemicals are in Coldwarmeds, each chemical there has a container here. -Severe

///////GAUZE CODE
/obj/item/stack/medical/bruise_pack
	name = "roll of gauze"
	singular_name = "gauze length"
	desc = "Some sterile gauze to wrap around bloody stumps."
	icon_state = "brutepack"
	amount = 8
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
				if(M == user && !user.statscheck(user.skill_medicine, user.int, 3, 1, src))
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

///////////////COLDWAR GAUZE PACKS

/obj/item/weapon/gauze_pack
	name = "pack of nothing"
	desc = "Contains nothing."
	icon = 'icons/obj/coldwar/medical.dmi'
	w_class = ITEM_SIZE_SMALL //Packed very effective
	var/content_type = null
	var/packed = 1
	var/rip_sound = 'sound/effects/rip_pack.ogg'

/obj/item/weapon/gauze_pack/New()
	..()

	if(ispath(content_type))
		new content_type(src)

	update_icon()

/obj/item/weapon/gauze_pack/attack_hand(mob/user as mob)
	if(user.get_inactive_hand() == src && packed)
		packed = 0
		if(rip_sound)
			playsound(src.loc, rip_sound, 50, 1)
		if(contents.len)
			var/obj/O = contents[1]
			user.put_in_active_hand(O)
			to_chat(user, "<span class='notice'>You ripped the [src.name] and took out an [O.name].</span>")
		else
			to_chat(user, "<span class='warning'>You ripped the [src.name] but it's empty!</span>")
		update_icon()
	else
		..()

/obj/item/weapon/gauze_pack/attack_self(mob/user as mob)
	if(packed)
		if(prob(50))
			packed = 0
			if(rip_sound)
				playsound(src.loc, rip_sound, 50, 1)
			if(contents.len)
				var/obj/O = contents[1]
				O.loc = user.loc
				to_chat(user, "<span class='notice'>You ripped the [src.name] with one hand and [O] fell out.</span>")
			update_icon()
		else
			to_chat(user, "<span class='warning'>You tried to rip the [src.name] but failed!</span>")
	else
		to_chat(user, "<span class='warning'>[name] is already unpacked!</span>")

/obj/item/weapon/gauze_pack/update_icon()
	icon_state = "[initial(icon_state)][packed]"

///////////////////
////Gauze Packs////
///////////////////

/obj/item/weapon/gauze_pack/ipp
	name = "'IPP'"
	desc = "That's the Individualniy Perevyazochniy Paket. Contains sterile gauze."
	w_class = ITEM_SIZE_SMALL
	icon_state = "bint_pack"
	content_type = /obj/item/stack/medical/bruise_pack/gauze

/obj/item/stack/medical/bruise_pack/bint///unused
	name = "Bint"
	singular_name = "bint length"
	icon = 'icons/obj/coldwar/medical.dmi'
	icon_state = "bint"

/obj/item/weapon/gauze_pack/gauze
	name = "M56 gauze pack"
	desc = "Contains sterile gauze."
	w_class = ITEM_SIZE_SMALL
	icon_state = "gauze_pack"
	content_type = /obj/item/stack/medical/bruise_pack/gauze

/obj/item/stack/medical/bruise_pack/gauze
	name = "roll of gauze"
	singular_name = "gauze length"
	icon = 'icons/obj/coldwar/medical.dmi'
	icon_state = "gauze"


/obj/item/weapon/gauze_pack/woundseal/nato
	name = "'Celox' granule packet"
	desc = "That's the 'Celox' hemostatic granule packet. Contains wound seal."
	w_class = ITEM_SIZE_SMALL
	icon_state = "nato_woundseal"
	content_type = /obj/item/stack/medical/tourniquet/woundseal

/obj/item/weapon/gauze_pack/woundseal/wp
	name = "'Hemostat' granule packet"
	desc = "That's the 'Hemostat' granule packet. Contains wound seal."
	w_class = ITEM_SIZE_SMALL
	icon_state = "wp_woundseal"
	content_type = /obj/item/stack/medical/tourniquet/woundseal

/////////Tourniquets
/obj/item/stack/medical/tourniquet
	name = "Esmarch tourniquet"
	singular_name = "tourniquet"
	w_class = ITEM_SIZE_SMALL//Packed very effective
	desc = "That's the generic tourniquet used to treat arterial bleeding."
	icon_state = "esmarch_tourniquet"
	amount = 1
	animal_heal = 0
	var/list/tourniquetable_organs = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_L_HAND, BP_R_HAND, BP_L_FOOT, BP_R_FOOT)	//List of organs you can splint, natch.

/obj/item/stack/medical/tourniquet/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/stack/medical/tourniquet))
		return
	..()

/obj/item/stack/medical/tourniquet/attack(mob/living/carbon/M as mob, mob/user as mob)
	if(..())
		return 1

	if (istype(M, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.zone_sel.selecting) //nullchecked by ..()
		var/limb = affecting.name
		if(!(affecting.organ_tag in tourniquetable_organs))
			to_chat(user, "<span class='danger'>You can't apply \the [src] there!</span>")
			return
		if(!(affecting.status & ORGAN_ARTERY_CUT))//There is nothing to fix don't fix anything.
			to_chat(user, "<span class='danger'>Why would I apply \the [src]? There's nothing to fix. </span>")
			return
		if(affecting.tourniqueted)
			to_chat(user, "<span class='danger'>[M]'s [limb] is already tourniqueted!</span>")
			return
		if (M != user)
			to_chat("<span class='danger'>[user] starts to apply \the [src] to [M]'s [limb].</span>", "<span class='danger'>You start to apply \the [src] to [M]'s [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
		else
			if(( !user.hand && (affecting.organ_tag in list(BP_R_ARM, BP_R_HAND)) || \
				user.hand && (affecting.organ_tag in list(BP_L_ARM, BP_L_HAND)) ))
				to_chat(user, "<span class='danger'>You can't apply \the [src] to the arm you're using!</span>")
				return
			to_chat("<span class='danger'>[user] starts to apply \the [src] to their [limb].</span>", "<span class='danger'>You start to apply \the [src] to your [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
		if(do_after(user, max(20, 50 - (user.skill_medicine*15)), M))
			if(M == user && !user.statscheck(user.skill_medicine, user.int, 3, 1, src))
				to_chat("<span class='danger'>\The [user] fumbles [src].</span>", "<span class='danger'>You fumble [src].</span>", "<span class='danger'>You hear something being wrapped.</span>")
				return
			var/obj/item/stack/medical/tourniquet/S = split(1)
			if(S)
				if(affecting.apply_tourniquet(S))
					S.forceMove(affecting)
					if (M != user)
						to_chat("<span class='danger'>\The [user] finishes applying [src] to [M]'s [limb].</span>", "<span class='danger'>You finish applying \the [src] to [M]'s [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
					else
						to_chat("<span class='danger'>\The [user] successfully applies [src] to their [limb].</span>", "<span class='danger'>You successfully apply \the [src] to your [limb].</span>", "<span class='danger'>You hear something being wrapped.</span>")
					return
				S.dropInto(src.loc) //didn't get applied, so just drop it
			user.visible_message("<span class='danger'>\The [user] fails to apply [src].</span>", "<span class='danger'>You fail to apply [src].</span>", "<span class='danger'>You hear something being wrapped.</span>")
		return


/obj/item/stack/medical/tourniquet/nato
	name = "NATO tourniquet"
	icon_state = "nato_tourniquet"


/obj/item/stack/medical/tourniquet/woundseal
	name = "wound seal"
	desc = "A handful of granular 'wound seal', used to treat bleeding in core bodyparts and other limbs."
	icon_state = "granule"
	singular_name = "wound seal"
	w_class = ITEM_SIZE_NORMAL
	amount = 1
	animal_heal = 0
	tourniquetable_organs = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, BP_L_HAND, BP_R_HAND, BP_L_FOOT, BP_R_FOOT, BP_GROIN, BP_CHEST, BP_HEAD)	//List of organs you can splint, natch.


//////////Splints
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
		if(!(affecting.status & ORGAN_BROKEN))//There is nothing to fix don't fix anything.
			to_chat(user, "<span class='danger'>Why would I apply \the [src]? There's nothing to fix. </span>")
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
		if(do_after(user, max(20, 50 - (user.skill_medicine*15)), M))
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

/obj/item/stack/medical/splint/ifak
	name = "splint"
	singular_name = "medical splint"
	desc = "A splint capable of supporting and immobilizing bones in both limbs and appendages."
	icon_state = "splint"
	amount = 1
	max_amount = 1
	animal_heal = 0

/*potential nato/soviet splints? anyone? */

/////////Ointment
/obj/item/stack/medical/ointment
	name = "ointment"
	desc = "Used to treat those nasty burns."
	gender = PLURAL
	singular_name = "ointment"
	icon_state = "ointment"
	heal_burn = 1
	amount = 10
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


/// Pills.
////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/pill
	name = "pill"
	desc = "A pill."
	icon = 'icons/obj/chemical.dmi'
	icon_state = null
	item_state = "pill"
	randpixel = 7
	possible_transfer_amounts = null
	w_class = ITEM_SIZE_TINY
	slot_flags = null
	volume = 60

	New()
		..()
		if(!icon_state)
			icon_state = "pill[rand(1, 20)]"

	attack(mob/M as mob, mob/user as mob, def_zone)
		//TODO: replace with standard_feed_mob() call.

		if(M == user)
			if(!M.can_eat(src))
				return

			to_chat(M, "<span class='notice'>You swallow \the [src].</span>")
			M.drop_from_inventory(src) //icon update
			if(reagents.total_volume)
				reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
			qdel(src)
			return 1

		else if(istype(M, /mob/living/carbon/human))
			if(!M.can_force_feed(user, src))
				return

			user.visible_message("<span class='warning'>[user] attempts to force [M] to swallow \the [src].</span>")

			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			if(!do_mob(user, M))
				return

			user.drop_from_inventory(src) //icon update
			user.visible_message("<span class='warning'>[user] forces [M] to swallow \the [src].</span>")

			var/contained = reagentlist()
			admin_attack_log(user, M, "Fed the victim with [name] (Reagents: [contained])", "Was fed [src] (Reagents: [contained])", "used [src] (Reagents: [contained]) to feed")

			if(reagents.total_volume)
				reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
			qdel(src)

			return 1

		return 0

	afterattack(obj/target, mob/user, proximity)
		if(!proximity) return

		if(target.is_open_container() && target.reagents)
			if(!target.reagents.total_volume)
				to_chat(user, "<span class='notice'>[target] is empty. Can't dissolve \the [src].</span>")
				return
			to_chat(user, "<span class='notice'>You dissolve \the [src] in [target].</span>")

			admin_attacker_log(user, "spiked \a [target] with a pill. Reagents: [reagentlist()]")
			reagents.trans_to(target, reagents.total_volume)
			for(var/mob/O in viewers(2, user))
				O.show_message("<span class='warning'>[user] puts something in \the [target].</span>", 1)

			qdel(src)

		return

////////////////////////////////////////////////////////////////////////////////
/// Pill code end


/////////////////COLDWAR PILLS

/obj/item/weapon/reagent_containers/pill/aminocaproic
	name = "aminocaproic acid pill (10u)"
	desc = "An anti-hemmorhage drug intended to stop acute bleeding and assist in blood clotting. Do NOT administer more than 60u or orally."
	icon_state = "pill4"
	New()
		..()
		reagents.add_reagent(/datum/reagent/aminocaproic, 10)

/obj/item/weapon/reagent_containers/pill/salbutamol
	name = "salbutamol pill (10u)"
	desc = "A strong bronchodilator. Helps patients who have their airways obstructed in breathing. Do NOT administer more than 10u or orally."
	icon_state = "pill16"
	New()
		..()
		reagents.add_reagent(/datum/reagent/salbutamol, 10)

/obj/item/weapon/reagent_containers/pill/lorazepam
	name = "lorazepam pill (10u)"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	icon_state = "pill7"
	New()
		..()
		reagents.add_reagent(/datum/reagent/lorazepam, 10)

/obj/item/weapon/reagent_containers/pill/doxycycline
	name = "doxycycline pill (10u)"
	desc = "A broad spectrum antibiotic to fight against infections. Do NOT administer more than 15u."
	icon_state = "green"
	New()
		..()
		reagents.add_reagent(/datum/reagent/doxycycline, 10)

/obj/item/weapon/reagent_containers/pill/angiotensin
	name = "angiotensin pill (5u)"
	desc = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	icon_state = "pill5"
	New()
		..()
		reagents.add_reagent(/datum/reagent/angiotensin, 5)

/obj/item/weapon/reagent_containers/pill/paracetamol
	name = "paracetamol pill (10u)"
	desc = "Weak painkiller with a very slow metabolization speed. Meant for trivial injuries and cracked bones. Do NOT administer more than 20u."
	icon_state = "pill9"
	New()
		..()
		reagents.add_reagent(/datum/reagent/paracetamol, 10)

/obj/item/weapon/reagent_containers/pill/rohypnol
	name = "rohypnol pill (10u)"
	desc = "Mild painkiller for injured patients that require resting. Provides long-lasting pain relief and strong drowsiness. Do NOT administer more than 15u."
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent(/datum/reagent/rohypnol, 10)

/obj/item/weapon/reagent_containers/pill/morphine
	name = "morphine pill (5u)"
	desc = "A strong painkiller with a quick metabolization speed, for life threatening injuries. Do NOT administer more than 10u or orally."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/morphine, 5)

/obj/item/weapon/reagent_containers/pill/fentanyl
	name = "fentanyl pill"
	desc = "A very strong painkiller with a swift metabolization speed, meant for patients in shock. Do NOT administer more than 5u."
	icon_state = "orange"
	New()
		..()
		reagents.add_reagent(/datum/reagent/fentanyl, 5)

/obj/item/weapon/reagent_containers/pill/thiopental
	name = "sodium thiopental pill (5u)"
	desc = "A rapid-onset sedative for surgical operations. Do NOT administer more than 5u."
	icon_state = "red"
	New()
		..()
		reagents.add_reagent(/datum/reagent/thiopental, 5)

/obj/item/weapon/reagent_containers/pill/naloxone
	name = "naloxone pill (7u)"
	desc = "An opioid antagonist meant to neutralize the effects of morphine and prevent overdose. Do NOT administer more than 15u."
	icon_state = "blue"
	New()
		..()
		reagents.add_reagent(/datum/reagent/naloxone, 7)

/obj/item/weapon/reagent_containers/pill/epinephrine
	name = "epinephrine pill (5u)"
	desc = "A neurotransmitter that is capable of restarting hearts. Do NOT administer more than 5u."
	icon_state = "pill3"
	New()
		..()
		reagents.add_reagent(/datum/reagent/epinephrine, 5)


///////////// COLDWAR PILL PACKS

/obj/item/weapon/pill_pack
	name = "pill pack"
	desc = "Pills in sterile and handy pack."
	icon = 'icons/obj/coldwar/medical.dmi'
	w_class = ITEM_SIZE_SMALL//Packed very effective
	icon_state = "pill_pack"
	var/pill_type = null
	var/pop_sound = 'sound/effects/pop_pill.ogg'

/obj/item/weapon/pill_pack/New()
	..()

	if(ispath(pill_type))
		for(var/i = 1 to 6)
			new pill_type(src)

	update_icon()

/obj/item/weapon/pill_pack/attack_hand(mob/user as mob)
	if(user.get_inactive_hand() == src)
		if(src.contents.len > 0)
			if(pop_sound)
				playsound(src.loc, pop_sound, 50, 1)
			var/obj/item/weapon/reagent_containers/pill/pill = contents[1]
			user << "<span class='notice'>You took one [pill.name] from [src.name]</span>"
			user.put_in_active_hand(pill)
			update_icon()
		else
			user << "<span class='warning'>It's empty!</span>"
	else
		..()

/obj/item/weapon/pill_pack/attack_self(mob/user as mob)
	if(src.contents.len > 0)
		var/obj/item/weapon/reagent_containers/pill/pill = contents[1]
		if(prob(30))
			if(pop_sound)
				playsound(src.loc, pop_sound, 50, 1)
			user << "<span class='notice'>You took one [pill.name] from [src.name]</span>"
			pill.loc = user.loc
			update_icon()
		else
			user << "<span class='warning'>You tried to take one [pill.name] from [src.name] by one hand but failed</span>"
	else
		user << "<span class='warning'>[name] is empty!</span>"

/obj/item/weapon/pill_pack/update_icon()
	icon_state = "[initial(icon_state)][contents.len]"


/obj/item/weapon/pill_pack/aminocaproic
	name = "aminocaproic acid pill pack"
	desc = "An anti-hemmorhage drug intended to stop acute bleeding and assist in blood clotting. Do NOT administer more than 60u or orally."
	pill_type = /obj/item/weapon/reagent_containers/pill/aminocaproic

/obj/item/weapon/pill_pack/salbutamol
	name = "salbutamol pill pack"
	desc = "A strong bronchodilator. Helps patients who have their airways obstructed in breathing. Do NOT administer more than 10u or orally."
	pill_type = /obj/item/weapon/reagent_containers/pill/salbutamol

/obj/item/weapon/pill_pack/lorazepam
	name = "lorazepam pill pack"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	pill_type = /obj/item/weapon/reagent_containers/pill/lorazepam

/obj/item/weapon/pill_pack/doxycycline
	name = "doxycycline pill pack"
	desc = "A broad spectrum antibiotic to fight against infections. Do NOT administer more than 15u."
	pill_type = /obj/item/weapon/reagent_containers/pill/doxycycline

/obj/item/weapon/pill_pack/angiotensin
	name = "angiotensin pill pack"
	desc = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	pill_type = /obj/item/weapon/reagent_containers/pill/angiotensin

/obj/item/weapon/pill_pack/paracetamol
	name = "paracetamol pill pack"
	desc = "Weak painkiller with a very slow metabolization speed. Meant for trivial injuries and cracked bones. Do NOT administer more than 20u."
	pill_type = /obj/item/weapon/reagent_containers/pill/paracetamol

/obj/item/weapon/pill_pack/rohypnol
	name = "rohypnol pill pack"
	desc = "Mild painkiller for injured patients that require resting. Provides long-lasting pain relief and strong drowsiness. Do NOT administer more than 15u."
	pill_type = /obj/item/weapon/reagent_containers/pill/rohypnol

/obj/item/weapon/pill_pack/morphine
	name = "morphine pill pack"
	desc = "A strong painkiller with a quick metabolization speed, for life threatening injuries. Do NOT administer more than 10u or orally."
	pill_type = /obj/item/weapon/reagent_containers/pill/morphine

/obj/item/weapon/pill_pack/fentanyl
	name = "fentanyl pill pack"
	desc = "A very strong painkiller with a swift metabolization speed, meant for patients in shock. Do NOT administer more than 5u."
	pill_type = /obj/item/weapon/reagent_containers/pill/fentanyl

/obj/item/weapon/pill_pack/thiopental
	name = "sodium thiopental pill pack"
	desc = "A rapid-onset sedative for surgical operations. Do NOT administer more than 5u."
	pill_type = /obj/item/weapon/reagent_containers/pill/thiopental

/obj/item/weapon/pill_pack/naloxone
	name = "naloxone pill pack"
	desc = "An opioid antagonist meant to neutralize the effects of morphine and prevent overdose. Do NOT administer more than 15u."
	pill_type = /obj/item/weapon/reagent_containers/pill/naloxone

/obj/item/weapon/pill_pack/epinephrine
	name = "epinephrine pill pack"
	desc = "A neurotransmitter that is capable of restarting hearts. Do NOT administer more than 5u."
	pill_type = /obj/item/weapon/reagent_containers/pill/epinephrine

/////////COLDWAR PILL BOXES

/obj/item/weapon/storage/box/pill_box
	name = "pill box"
	icon_state = "pillbox"
	icon = 'icons/obj/coldwar/medical.dmi'
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_SMALL
	foldable = 0
	max_storage_space = 4
	can_hold = list(/obj/item/weapon/pill_pack/)

/obj/item/weapon/storage/box/pill_box/update_icon()
	if(contents.len)
		src.icon_state = "[initial(icon_state)]"
	else
		src.icon_state = "[initial(icon_state)]-empty"

/obj/item/weapon/storage/box/pill_box/aminocaproic
	name = "aminocaproic acid pill box"
	icon_state = "pillbox_aminocaproic"
	desc = "An anti-hemmorhage drug intended to stop acute bleeding and assist in blood clotting. Do NOT administer more than 60u or orally."
	startswith = list(/obj/item/weapon/pill_pack/aminocaproic = 2)

/obj/item/weapon/storage/box/pill_box/salbutamol
	name = "salbutamol pill box"
	icon_state = "pillbox_salbutamol"
	desc = "A strong bronchodilator. Helps patients who have their airways obstructed in breathing. Do NOT administer more than 10u or orally."
	startswith = list(/obj/item/weapon/pill_pack/salbutamol = 2)

/obj/item/weapon/storage/box/pill_box/lorazepam
	name = "lorazepam pill box"
	icon_state = "pillbox_lorazepam"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	startswith = list(/obj/item/weapon/pill_pack/lorazepam = 2)

/obj/item/weapon/storage/box/pill_box/doxycycline
	name = "doxycycline pill box"
	icon_state = "pillbox_doxycycline"
	desc = "A broad spectrum antibiotic to fight against infections. Do NOT administer more than 15u."
	startswith = list(/obj/item/weapon/pill_pack/doxycycline = 2)

/obj/item/weapon/storage/box/pill_box/angiotensin
	name = "angiotensin pill box"
	icon_state = "pillbox_angiotensin"
	desc = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	startswith = list(/obj/item/weapon/pill_pack/angiotensin = 2)

/obj/item/weapon/storage/box/pill_box/paracetamol
	name = "paracetamol pill box"
	icon_state = "pillbox_paracetamol"
	desc = "Weak painkiller with a very slow metabolization speed. Meant for trivial injuries and cracked bones. Do NOT administer more than 20u."
	startswith = list(/obj/item/weapon/pill_pack/paracetamol = 2)

/obj/item/weapon/storage/box/pill_box/rohypnol
	name = "rohypnol pill box"
	icon_state = "pillbox_rohypnol"
	desc = "Mild painkiller for injured patients that require resting. Provides long-lasting pain relief and strong drowsiness. Do NOT administer more than 15u."
	startswith = list(/obj/item/weapon/pill_pack/rohypnol = 2)

/obj/item/weapon/storage/box/pill_box/morphine
	name = "morphine pill box"
	icon_state = "pillbox_morphine"
	desc = "A strong painkiller with a quick metabolization speed, for life threatening injuries. Do NOT administer more than 10u or orally."
	startswith = list(/obj/item/weapon/pill_pack/morphine = 2)

/obj/item/weapon/storage/box/pill_box/fentanyl
	name = "fentanyl pill box"
	icon_state = "pillbox_fentanyl"
	desc = "A very strong painkiller with a swift metabolization speed, meant for patients in shock. Do NOT administer more than 5u."
	startswith = list(/obj/item/weapon/pill_pack/fentanyl = 2)

/obj/item/weapon/storage/box/pill_box/thiopental
	name = "sodium thiopental pill box"
	icon_state = "pillbox_thiopental"
	desc = "A rapid-onset sedative for surgical operations. Do NOT administer more than 5u."
	startswith = list(/obj/item/weapon/pill_pack/thiopental = 2)

/obj/item/weapon/storage/box/pill_box/naloxone
	name = "naloxone pill box"
	icon_state = "pillbox_naloxone"
	desc = "An opioid antagonist meant to neutralize the effects of morphine and prevent overdose. Do NOT administer more than 15u."
	startswith = list(/obj/item/weapon/pill_pack/naloxone = 2)

/obj/item/weapon/storage/box/pill_box/epinephrine
	name = "epinephrine pill box"
	icon_state = "pillbox_epinephrine"
	desc = "A neurotransmitter that is capable of restarting hearts. Do NOT administer more than 5u."
	startswith = list(/obj/item/weapon/pill_pack/epinephrine = 2)


///////////////AMPOULE CODE


/obj/item/weapon/reagent_containers/glass/ampoule
	name = "ampoule"
	desc = "An ampoule."
	icon = 'icons/obj/syringe.dmi'
	icon_state = "ampoule"
	item_state = null
	amount_per_transfer_from_this = 5
	w_class = ITEM_SIZE_TINY
	slot_flags = null
	volume = 10
	flags = null
	var/closed = 1

/obj/item/weapon/reagent_containers/glass/ampoule/attack_self()
	..()
	if(closed)
		to_chat(usr, "<span class = 'notice'>You crack \the [src], opening it.</span>")
		flags |= OPENCONTAINER
		icon_state = "[initial(icon_state)]_open"
		closed = 0
		update_icon()
	else
		return

/obj/item/weapon/reagent_containers/glass/ampoule/afterattack()
	update_icon()


///////////////coldwar ampoules

/obj/item/weapon/reagent_containers/glass/ampoule/aminocaproic
	name = "aminocaproic acid ampoule"
	desc = "An anti-hemmorhage drug intended to stop acute bleeding and assist in blood clotting. Do NOT administer more than 60u or orally."
	New()
		..()
		reagents.add_reagent(/datum/reagent/aminocaproic, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/salbutamol
	name = "salbutamol ampoule"
	desc = "A strong bronchodilator. Helps patients who have their airways obstructed in breathing. Do NOT administer more than 10u or orally."
	New()
		..()
		reagents.add_reagent(/datum/reagent/salbutamol, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/lorazepam
	name = "lorazepam ampoule"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/lorazepam, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/doxycycline
	name = "doxycycline ampoule"
	desc = "A broad spectrum antibiotic to fight against infections. Do NOT administer more than 15u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/doxycycline, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/angiotensin
	name = "angiotensin ampoule"
	desc = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	New()
		..()
		reagents.add_reagent(/datum/reagent/angiotensin, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/paracetamol
	name = "paracetamol ampoule"
	desc = "Weak painkiller with a very slow metabolization speed. Meant for trivial injuries and cracked bones. Do NOT administer more than 20u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/paracetamol, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/rohypnol
	name = "rohypnol ampoule"
	desc = "Mild painkiller for injured patients that require resting. Provides long-lasting pain relief and strong drowsiness. Do NOT administer more than 15u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/rohypnol, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/morphine
	name = "morphine ampoule"
	desc = "A strong painkiller with a quick metabolization speed, for life threatening injuries. Do NOT administer more than 10u or orally."
	New()
		..()
		reagents.add_reagent(/datum/reagent/morphine, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/fentanyl
	name = "fentanyl ampoule"
	desc = "A very strong painkiller with a swift metabolization speed, meant for patients in shock. Do NOT administer more than 5u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/fentanyl, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/thiopental
	name = "sodium thiopental ampoule"
	desc = "A rapid-onset sedative for surgical operations. Do NOT administer more than 5u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/thiopental, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/naloxone
	name = "naloxone ampoule"
	desc = "An opioid antagonist meant to neutralize the effects of morphine and prevent overdose. Do NOT administer more than 15u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/naloxone, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/epinephrine
	name = "epinephrine ampoule"
	desc = "A neurotransmitter that is capable of restarting hearts. Do NOT administer more than 5u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/epinephrine, 5)

///////////////COLDWAR AMPOULE PACKS

/obj/item/weapon/ampoule_pack
	name = "ampoule pack"
	desc = "That's an ampoule pack."
	icon = 'icons/obj/coldwar/medical.dmi'
	w_class = ITEM_SIZE_SMALL
	icon_state = "ampoule_pack"
	var/ampoule_type = null

/obj/item/weapon/ampoule_pack/New()
	..()

	if(ispath(ampoule_type))
		for(var/i = 1 to 5)
			new ampoule_type(src)

	update_icon()

/obj/item/weapon/ampoule_pack/attack_hand(mob/user as mob)
	if(user.get_inactive_hand() == src)
		if(src.contents.len > 0)
			var/obj/item/weapon/reagent_containers/glass/ampoule/ampoule = contents[1]
			user << "<span class='notice'>You take one [ampoule.name] from [src.name]</span>"
			user.put_in_active_hand(ampoule)
			update_icon()
		else
			user << "<span class='warning'>It's empty.</span>"
	else
		..()

/obj/item/weapon/ampoule_pack/attack_self(mob/user as mob)
	if(src.contents.len > 0)
		var/obj/item/weapon/reagent_containers/glass/ampoule/ampoule = contents[1]
		if(prob(30))
			user << "<span class='notice'>You take one [ampoule.name] from [src.name]</span>"
			ampoule.loc = user.loc
			update_icon()
		else
			user << "<span class='warning'>You tried to take one [ampoule.name] from [src.name] with a single hand but failed.</span>"
	else
		user << "<span class='warning'>[name] is empty.</span>"

/obj/item/weapon/ampoule_pack/update_icon()
	icon_state = "[initial(icon_state)][contents.len]"

/obj/item/weapon/ampoule_pack/aminocaproic
	name = "aminocaproic acid ampoule pack"
	desc = "An anti-hemmorhage drug intended to stop acute bleeding and assist in blood clotting. Do NOT administer more than 60u or orally."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/aminocaproic

/obj/item/weapon/ampoule_pack/salbutamol
	name = "salbutamol ampoule pack"
	desc = "A strong bronchodilator. Helps patients who have their airways obstructed in breathing. Do NOT administer more than 10u or orally."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/salbutamol

/obj/item/weapon/ampoule_pack/lorazepam
	name = "lorazepam ampoule pack"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/lorazepam

/obj/item/weapon/ampoule_pack/doxycycline
	name = "doxycycline ampoule pack"
	desc = "A broad spectrum antibiotic to fight against infections. Do NOT administer more than 15u."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/doxycycline

/obj/item/weapon/ampoule_pack/angiotensin
	name = "angiotensin ampoule pack"
	desc = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/angiotensin

/obj/item/weapon/ampoule_pack/paracetamol
	name = "paracetamol ampoule pack"
	desc = "Weak painkiller with a very slow metabolization speed. Meant for trivial injuries and cracked bones. Do NOT administer more than 20u."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/paracetamol

/obj/item/weapon/ampoule_pack/rohypnol
	name = "rohypnol ampoule pack"
	desc = "Mild painkiller for injured patients that require resting. Provides long-lasting pain relief and strong drowsiness. Do NOT administer more than 15u."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/rohypnol

/obj/item/weapon/ampoule_pack/morphine
	name = "morphine ampoule pack"
	desc = "A strong painkiller with a quick metabolization speed, for life threatening injuries. Do NOT administer more than 10u or orally."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/morphine

/obj/item/weapon/ampoule_pack/fentanyl
	name = "fentanyl ampoule pack"
	desc = "A very strong painkiller with a swift metabolization speed, meant for patients in shock. Do NOT administer more than 5u."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/fentanyl

/obj/item/weapon/ampoule_pack/thiopental
	name = "sodium thiopental ampoule pack"
	desc = "A rapid-onset sedative for surgical operations. Do NOT administer more than 5u."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/thiopental

/obj/item/weapon/ampoule_pack/naloxone
	name = "naloxone ampoule pack"
	desc = "An opioid antagonist meant to neutralize the effects of morphine and prevent overdose. Do NOT administer more than 15u."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/naloxone

/obj/item/weapon/ampoule_pack/epinephrine
	name = "epinephrine ampoule pack"
	desc = "A neurotransmitter that is capable of restarting a heart with a single ampoule."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/epinephrine


///////////////COLDWAR AMPOULE BOXES


/obj/item/weapon/storage/box/ampoule_box
	name = "ampoule box"
	icon_state = "ampoulebox"
	icon = 'icons/obj/coldwar/medical.dmi'
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_SMALL
	foldable = 0
	max_storage_space = 4
	can_hold = list(/obj/item/weapon/ampoule_pack/)


/obj/item/weapon/storage/box/ampoule_box/update_icon()
	if(contents.len)
		src.icon_state = "[initial(icon_state)]"
	else
		src.icon_state = "[initial(icon_state)]-empty"

/obj/item/weapon/storage/box/ampoule_box/aminocaproic
	name = "aminocaproic acid ampoule box"
	icon_state = "ampoulebox_aminocaproic"
	desc = "An anti-hemmorhage drug intended to stop acute bleeding and assist in blood clotting. Do NOT administer more than 60u or orally."
	startswith = list(/obj/item/weapon/ampoule_pack/aminocaproic = 2)

/obj/item/weapon/storage/box/ampoule_box/salbutamol
	name = "salbutamol ampoule box"
	icon_state = "ampoulebox_salbutamol"
	desc = "A strong bronchodilator. Helps patients who have their airways obstructed in breathing. Do NOT administer more than 10u or orally."
	startswith = list(/obj/item/weapon/ampoule_pack/salbutamol = 2)

/obj/item/weapon/storage/box/ampoule_box/lorazepam
	name = "lorazepam ampoule box"
	icon_state = "ampoulebox_lorazepam"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	startswith = list(/obj/item/weapon/ampoule_pack/lorazepam = 2)

/obj/item/weapon/storage/box/ampoule_box/doxycycline
	name = "doxycycline ampoule box"
	icon_state = "ampoulebox_doxycycline"
	desc = "A broad spectrum antibiotic to fight against infections. Do NOT administer more than 15u."
	startswith = list(/obj/item/weapon/ampoule_pack/doxycycline = 2)

/obj/item/weapon/storage/box/ampoule_box/angiotensin
	name = "angiotensin ampoule box"
	icon_state = "ampoulebox_angiotensin"
	desc = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	startswith = list(/obj/item/weapon/ampoule_pack/angiotensin = 2)

/obj/item/weapon/storage/box/ampoule_box/paracetamol
	name = "paracetamol ampoule box"
	icon_state = "ampoulebox_paracetamol"
	desc = "Weak painkiller with a very slow metabolization speed. Meant for trivial injuries and cracked bones. Do NOT administer more than 20u."
	startswith = list(/obj/item/weapon/ampoule_pack/paracetamol = 2)

/obj/item/weapon/storage/box/ampoule_box/rohypnol
	name = "rohypnol ampoule box"
	icon_state = "ampoulebox_rohypnol"
	desc = "Mild painkiller for injured patients that require resting. Provides long-lasting pain relief and strong drowsiness. Do NOT administer more than 15u."
	startswith = list(/obj/item/weapon/ampoule_pack/rohypnol = 2)

/obj/item/weapon/storage/box/ampoule_box/morphine
	name = "morphine ampoule box"
	icon_state = "ampoulebox_morphine"
	desc = "A strong painkiller with a quick metabolization speed, for life threatening injuries. Do NOT administer more than 10u or orally."
	startswith = list(/obj/item/weapon/ampoule_pack/morphine = 2)

/obj/item/weapon/storage/box/ampoule_box/fentanyl
	name = "fentanyl ampoule box"
	icon_state = "ampoulebox_fentanyl"
	desc = "A very strong painkiller with a swift metabolization speed, meant for patients in shock. Do NOT administer more than 5u."
	startswith = list(/obj/item/weapon/ampoule_pack/fentanyl = 2)

/obj/item/weapon/storage/box/ampoule_box/thiopental
	name = "sodium thiopental ampoule box"
	icon_state = "ampoulebox_thiopental"
	desc = "A rapid-onset sedative for surgical operations. Do NOT administer more than 5u."
	startswith = list(/obj/item/weapon/ampoule_pack/thiopental = 2)

/obj/item/weapon/storage/box/ampoule_box/naloxone
	name = "naloxone ampoule box"
	icon_state = "ampoulebox_naloxone"
	desc = "An opioid antagonist meant to neutralize the effects of morphine and prevent overdose. Do NOT administer more than 15u."
	startswith = list(/obj/item/weapon/ampoule_pack/naloxone = 2)

/obj/item/weapon/storage/box/ampoule_box/epinephrine
	name = "epinephrine ampoule box"
	icon_state = "ampoulebox_epinephrine"
	desc = "A neurotransmitter that is capable of restarting hearts. Do NOT administer more than 5u."
	startswith = list(/obj/item/weapon/ampoule_pack/epinephrine = 2)


//////// COLDWAR BOTTLES

/obj/item/weapon/reagent_containers/glass/bottle/aminocaproic
	name = "aminocaproic acid bottle"
	desc = "An anti-hemmorhage drug intended to stop acute bleeding and assist in blood clotting. Do NOT administer more than 60u or orally."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-red"
	New()
		..()
		reagents.add_reagent(/datum/reagent/aminocaproic, 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/salbutamol
	name = "salbutamol bottle"
	desc = "A strong bronchodilator. Helps patients who have their airways obstructed in breathing. Do NOT administer more than 10u or orally."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-blue"
	New()
		..()
		reagents.add_reagent(/datum/reagent/salbutamol, 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/lorazepam
	name = "lorazepam bottle"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-yellow"
	New()
		..()
		reagents.add_reagent(/datum/reagent/lorazepam, 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/doxycycline
	name = "doxycycline bottle"
	desc = "A broad spectrum antibiotic to fight against infections. Do NOT administer more than 15u."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-green"
	New()
		..()
		reagents.add_reagent(/datum/reagent/doxycycline, 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/angiotensin
	name = "angiotensin bottle"
	desc = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-teal"
	New()
		..()
		reagents.add_reagent(/datum/reagent/angiotensin, 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/paracetamol
	name = "paracetamol bottle"
	desc = "Weak painkiller with a very slow metabolization speed. Meant for trivial injuries and cracked bones. Do NOT administer more than 20u."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-yellow"
	New()
		..()
		reagents.add_reagent(/datum/reagent/paracetamol, 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/rohypnol
	name = "rohypnol bottle"
	desc = "Mild painkiller for injured patients that require resting. Provides long-lasting pain relief and strong drowsiness. Do NOT administer more than 15u."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-yellow"
	New()
		..()
		reagents.add_reagent(/datum/reagent/rohypnol, 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/morphine
	name = "morphine bottle"
	desc = "A strong painkiller with a quick metabolization speed, for life threatening injuries. Do NOT administer more than 10u or orally."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-yellow"
	New()
		..()
		reagents.add_reagent(/datum/reagent/morphine, 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/fentanyl
	name = "fentanyl bottle"
	desc = "A very strong painkiller with a swift metabolization speed, meant for patients in shock. Do NOT administer more than 5u."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-yellow"
	New()
		..()
		reagents.add_reagent(/datum/reagent/fentanyl, 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/thiopental
	name = "sodium thiopental bottle"
	desc = "A rapid-onset sedative for surgical operations. Do NOT administer more than 5u."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-purple"
	New()
		..()
		reagents.add_reagent(/datum/reagent/thiopental, 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/naloxone
	name = "naloxone bottle"
	desc = "An opioid antagonist meant to neutralize the effects of morphine and prevent overdose. Do NOT administer more than 15u."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-teal"
	New()
		..()
		reagents.add_reagent(/datum/reagent/naloxone, 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/epinephrine
	name = "epinephrine bottle"
	desc = "A neurotransmitter that is capable of restarting hearts. Do NOT administer more than 5u."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle-purple"
	New()
		..()
		reagents.add_reagent(/datum/reagent/epinephrine, 60)
		update_icon()























///////////////BAY12 BULLSHIT - HERE ENDS ESCALATION

//////////////////
////Pill Packs////
//////////////////
/obj/item/weapon/pill_pack/antitox
	name = "antitoxin pill pack"
	icon_state = null
	desc = "Removes toxins and poisions from blood."
	pill_type = /obj/item/weapon/reagent_containers/pill/antitox

/obj/item/weapon/pill_pack/tetracetam
	name = "tetracetam pill pack"
	icon_state = null
	pill_type = /obj/item/weapon/reagent_containers/pill/tetracetam

/obj/item/weapon/pill_pack/oxaprofen
	name = "oxaprofen pill pack"
	icon_state = null
	pill_type = /obj/item/weapon/reagent_containers/pill/oxaprofen

/obj/item/weapon/pill_pack/antitox
	name = "antitoxin pill pack"
	icon_state = null
	desc = "Removes toxins and poisions from blood."
	pill_type = /obj/item/weapon/reagent_containers/pill/antitox

/obj/item/weapon/pill_pack/tramadol
	name = "tramadol pill pack"
	icon_state = null
	desc = "Effective painkiller."
	pill_type = /obj/item/weapon/reagent_containers/pill/tramadol

/obj/item/weapon/pill_pack/dexalin
	name = "dexalin pill pack"
	icon_state = null
	desc = "Used in cases of oxygen deprivation."
	pill_type = /obj/item/weapon/reagent_containers/pill/dexalin

/obj/item/weapon/pill_pack/bicaridine
	name = "bicaridine pill pack"
	icon_state = null
	desc = "Helps treat brute injures."
	pill_type = /obj/item/weapon/reagent_containers/pill/bicaridine

/obj/item/weapon/pill_pack/inaprovaline
	name = "inaprovaline pill pack"
	icon_state = null
	desc = "Prevents death by pain shock."
	pill_type = /obj/item/weapon/reagent_containers/pill/inaprovaline

/obj/item/weapon/pill_pack/adminordrazine
	name = "adminordrazine pill pack"
	icon_state = null
	desc = "Where did you even get that?"
	pill_type = /obj/item/weapon/reagent_containers/pill/adminordrazine


/obj/item/weapon/pill_pack/phenazepam
	name = "phenazepam pill pack"
	icon_state = null
	desc = "A mild painkiller with a slow metabolization speed. Meant for mild injuries."
	pill_type = /obj/item/weapon/reagent_containers/pill/aminocaproic

/obj/item/weapon/pill_pack/naloxone
	name = "naloxone pill pack"
	icon_state = null
	desc = "You have no idea what's that."
	pill_type = /obj/item/weapon/reagent_containers/pill/aminocaproic

/obj/item/weapon/storage/box/pill_box/tetracetam
	name = "tetracetam pill box"
	icon_state = null
	max_storage_space = 2
	startswith = list(/obj/item/weapon/pill_pack/tetracetam = 2)

/obj/item/weapon/storage/box/pill_box/oxaprofen
	name = "oxaprofen pill box"
	icon_state = null
	max_storage_space = 4
	startswith = list(/obj/item/weapon/pill_pack/oxaprofen = 4)

/obj/item/weapon/storage/pill_bottle/paracetamol
	name = "bottle of paracetamol"
	icon_state = null
	desc = "Weak painkiller with a very slow metabolization speed. Meant for trivial injuries."

	startswith = list(/obj/item/weapon/reagent_containers/pill/paracetamol = 7)

/obj/item/weapon/reagent_containers/glass/bottle/talotropine
	name = "talotropine bottle"
	desc = "A strong bronchodilator. Helps patients who have their airways obstructed in breathing. Do NOT administer more than 10u or orally."
	icon = 'icons/obj/chemical.dmi'
	icon_state = null
	icon_state = "bottle-blu"
	New()
		..()
		reagents.add_reagent(/datum/reagent/salbutamol, 60)
		update_icon()

/obj/item/weapon/reagent_containers/glass/bottle/tetracetam
	name = "tetracetam bottle"
	desc = "A strong bronchodilator. Helps patients who have their airways obstructed in breathing. Do NOT administer more than 10u or orally."
	icon = 'icons/obj/chemical.dmi'
	icon_state = null
	icon_state = "bottle-blu"
	New()
		..()
		reagents.add_reagent(/datum/reagent/salbutamol, 60)
		update_icon()

/obj/item/weapon/storage/box/ampoule_box/talotropine
	name = "aminocaproic acid ampoule box"
	icon_state = null
	desc = "An anti-hemmorhage drug intended to stop acute bleeding and assist in blood clotting. Do NOT administer more than 60u or orally."
	startswith = list(/obj/item/weapon/ampoule_pack/aminocaproic = 2)
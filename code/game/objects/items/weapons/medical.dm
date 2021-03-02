
///////////////COLDWAR GAUZE PACKS

/obj/item/weapon/gauze_pack
	name = "pack of nothing"
	desc = "Contains nothing."
	icon = 'icons/obj/medical.dmi'
	w_class = 2 //Packed very effective
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
	icon_state = "bint_pack"
	content_type = /obj/item/stack/medical/bruise_pack/bint

/obj/item/stack/medical/bruise_pack/bint
	name = "roll of gauze"
	singular_name = "bint length"
	icon = 'icons/obj/medical.dmi'
	icon_state = "bint"

/obj/item/weapon/gauze_pack/gauze
	name = "M56 bandage pack"
	desc = "Contains sterile bandage."
	icon_state = "gauze_pack"
	content_type = /obj/item/stack/medical/bruise_pack/gauze

/obj/item/stack/medical/bruise_pack/gauze
	name = "roll of bandage"
	singular_name = "gauze length"
	icon = 'icons/obj/medical.dmi'
	icon_state = "gauze"

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
	desc = "Contains antiviral agents."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/aminocaproic, 10)

/obj/item/weapon/reagent_containers/pill/salbutamol
	name = "salbutamol pill (10u)"
	desc = "Contains antiviral agents."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/salbutamol, 10)

/obj/item/weapon/reagent_containers/pill/doxicycline
	name = "doxicycline pill"
	desc = "Contains antiviral agents."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/doxicycline, 15)
		
/obj/item/weapon/reagent_containers/pill/amidopyrinum
	name = "amidopyrinum pill"
	desc = "A very strong painkiller with a swift metabolization speed, meant for patients in shock. Do NOT administer more than 5u."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/amidopyrinum, 5)

/obj/item/weapon/reagent_containers/pill/doxycicline
	name = "doxycicline pill"
	desc = "A broad spectrum antibiotic to fight against infections."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/doxicycline, 5)

/obj/item/weapon/reagent_containers/pill/promethazine
	name = "promethazine pill"
	desc = "Mild painkiller for injured patients that require resting. Provides long-lasting pain relief and strong drowsiness. Do NOT administer more than 15u."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/promethazine, 5)

/obj/item/weapon/reagent_containers/pill/ethaperazine
	name = "ethaperazine pill"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethaperazine, 5)

/obj/item/weapon/reagent_containers/pill/angiotensin
	name = "Angiotensin pill"
	desc = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	icon_state = "pill21"
	New()
		..()
		reagents.add_reagent(/datum/reagent/angiotensin, 5)

///////////// COLDWAR PILL PACKS

/obj/item/weapon/pill_pack
	name = "pill pack"
	desc = "Pills in sterile and handy pack."
	icon = 'icons/obj/medical.dmi'
	w_class = 2//Packed very effective
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
	desc = "A broad spectrum antibiotic to fight against infections. Do NOT administer more than 15u."
	pill_type = /obj/item/weapon/reagent_containers/pill/aminocaproic

/obj/item/weapon/pill_pack/salbutamol
	name = "salbutamol pill pack"
	desc = "A broad spectrum antibiotic to fight against infections. Do NOT administer more than 15u."
	pill_type = /obj/item/weapon/reagent_containers/pill/salbutamol

/obj/item/weapon/pill_pack/doxycycline
	name = "doxycycline pill pack"
	desc = "A broad spectrum antibiotic to fight against infections. Do NOT administer more than 15u."
	pill_type = /obj/item/weapon/reagent_containers/pill/doxycicline

/obj/item/weapon/pill_pack/amidopyrinum
	name = "amidopyrinum pill pack"
	desc = "A very strong painkiller with a swift metabolization speed, meant for patients in shock. Do NOT administer more than 5u."
	pill_type = /obj/item/weapon/reagent_containers/pill/amidopyrinum

/obj/item/weapon/pill_pack/paracetamol
	name = "paracetamol pill pack"
	desc = "Weak painkiller with a very slow metabolization speed. Meant for trivial injuries and cracked bones. Do NOT administer more than 20u."
	pill_type = /obj/item/weapon/reagent_containers/pill/paracetamol

/obj/item/weapon/pill_pack/promethazine
	name = "promethazine pill pack"
	desc = "Mild painkiller for injured patients that require resting. Provides long-lasting pain relief and strong drowsiness. Do NOT administer more than 15u."
	pill_type = /obj/item/weapon/reagent_containers/pill/promethazine

/obj/item/weapon/pill_pack/ethaperazine
	name = "ethaperazine pill pack"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	pill_type = /obj/item/weapon/reagent_containers/pill/ethaperazine

/obj/item/weapon/pill_pack/angiotensin
	name = "angiotensin pill pack"
	desc = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	pill_type = /obj/item/weapon/reagent_containers/pill/angiotensin

/////////COLDWAR PILL BOXES

/obj/item/weapon/storage/box/pill_box
	name = "pill box"
	icon_state = "pillbox"
	icon = 'icons/obj/medical.dmi'
	w_class = 2
	max_w_class = 1
	max_storage_space = 5
	can_hold = list(/obj/item/weapon/pill_pack/)


/obj/item/weapon/storage/box/pill_box/tetracetam
	name = "tetracetam pill box"
	max_storage_space = 2
	startswith = list(/obj/item/weapon/pill_pack/tetracetam = 2)

/obj/item/weapon/storage/box/pill_box/oxaprofen
	name = "oxaprofen pill box"
	max_storage_space = 4
	startswith = list(/obj/item/weapon/pill_pack/oxaprofen = 4)

/obj/item/weapon/storage/box/pill_box/amidopyrinum
	name = "amidopyrinum pill box"
	desc = "A very strong painkiller with a swift metabolization speed, meant for patients in shock. Do NOT administer more than 5u."
	startswith = list(/obj/item/weapon/pill_pack/amidopyrinum = 2)

/obj/item/weapon/storage/box/pill_box/promethazine
	name = "promethazine pill box"
	desc = "Mild painkiller for injured patients that require resting. Provides long-lasting pain relief and strong drowsiness. Do NOT administer more than 15u."
	startswith = list(/obj/item/weapon/pill_pack/promethazine = 2)

/obj/item/weapon/storage/box/pill_box/doxycycline
	name = "doxycycline pill box"
	desc = "A broad spectrum antibiotic to fight against infections. Do NOT administer more than 15u."
	startswith = list(/obj/item/weapon/pill_pack/doxycycline = 2)

/obj/item/weapon/storage/box/pill_box/paracetamol
	name = "paracetamol pill box"
	desc = "Weak painkiller with a very slow metabolization speed. Meant for trivial injuries and cracked bones. Do NOT administer more than 20u."
	startswith = list(/obj/item/weapon/pill_pack/paracetamol = 2)

/obj/item/weapon/storage/box/pill_box/ethaperazine
	name = "ethaperazine pill box"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	startswith = list(/obj/item/weapon/pill_pack/ethaperazine = 2)

/obj/item/weapon/storage/box/pill_box/angiotensin
	name = "angiotensin pill box"
	desc = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	startswith = list(/obj/item/weapon/pill_pack/angiotensin = 2)

/obj/item/weapon/storage/box/pill_box/epinephrine
	name = "epinephrine pill box"
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
	w_class = 1
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
	
/obj/item/weapon/reagent_containers/glass/ampoule/ethaperazine
	name = "ethaperazine ampoule"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethaperazine, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/doxycycline
	name = "doxycycline ampoule"
	desc = "A broad spectrum antibiotic to fight against infections. Do NOT administer more than 15u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethaperazine, 5)

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
		
/obj/item/weapon/reagent_containers/glass/ampoule/promethazine
	name = "promethazine ampoule"
	desc = "Mild painkiller for injured patients that require resting. Provides long-lasting pain relief and strong drowsiness. Do NOT administer more than 15u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/promethazine, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/morphine
	name = "morphine ampoule"
	desc = "A strong painkiller with a quick metabolization speed, for life threatening injuries. Do NOT administer more than 10u or orally."
	New()
		..()
		reagents.add_reagent(/datum/reagent/morphine, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/amidopyrinum
	name = "amidopyrinum ampoule"
	desc = "A very strong painkiller with a swift metabolization speed, meant for patients in shock. Do NOT administer more than 5u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/amidopyrinum, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/thiopental
	name = "sodium thiopental ampoule"
	desc = "A rapid-onset sedative for surgical operations. Do NOT administer more than 5u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/thiopental, 5)

/obj/item/weapon/reagent_containers/glass/ampoule/naltamine
	name = "naltamine ampoule"
	desc = "An opioid antagonist meant to neutralize the effects of morphine and prevent overdose. Do NOT administer more than 15u."
	New()
		..()
		reagents.add_reagent(/datum/reagent/naltamine, 5)

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
	icon = 'icons/obj/medical.dmi'
	w_class = 1
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


/obj/item/weapon/ampoule_pack/morphine
	name = "morphine ampoule pack"
	desc = "A strong painkiller with a quick metabolization speed, for life threatening injuries. Do NOT administer more than 10u or orally."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/morphine

/obj/item/weapon/ampoule_pack/naltamine
	name = "naltamine ampoule pack"
	desc = "An opioid antagonist meant to neutralize the effects of morphine and prevent overdose. Do NOT administer more than 15u."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/naltamine

/obj/item/weapon/ampoule_pack/aminocaproic
	name = "aminocaproic acid ampoule pack"
	desc = "An anti-hemmorhage drug intended to stop acute bleeding and assist in blood clotting. Do NOT administer more than 60u or orally."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/aminocaproic

/obj/item/weapon/ampoule_pack/salbutamol
	name = "salbutamol ampoule pack"
	desc = "A strong bronchodilator. Helps patients who have their airways obstructed in breathing. Do NOT administer more than 10u or orally."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/salbutamol

/obj/item/weapon/ampoule_pack/ethaperazine
	name = "ethaperazine ampoule pack"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/ethaperazine

/obj/item/weapon/ampoule_pack/angiotensin
	name = "angiotensin ampoule pack"
	desc = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/angiotensin

/obj/item/weapon/ampoule_pack/thiopental
	name = "sodium thiopental ampoule pack"
	desc = "A rapid-onset sedative for surgical operations. Do NOT administer more than 5u."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/thiopental

/obj/item/weapon/ampoule_pack/epinephrine
	name = "epinephrine ampoule pack"
	desc = "A neurotransmitter that is capable of restarting a heart with a single ampoule."
	ampoule_type = /obj/item/weapon/reagent_containers/glass/ampoule/epinephrine

	
///////////////COLDWAR AMPOULE BOXES


/obj/item/weapon/storage/box/ampoule_box
	name = "ampoule box"
	icon_state = "ampoulebox"
	icon = 'icons/obj/medical.dmi'
	w_class = 2
	max_w_class = 1
	max_storage_space = 2
	can_hold = list(/obj/item/weapon/ampoule_pack/)

/obj/item/weapon/storage/box/ampoule_box/aminocaproic
	name = "aminocaproic acid ampoule box"
	desc = "An anti-hemmorhage drug intended to stop acute bleeding and assist in blood clotting. Do NOT administer more than 60u or orally."
	startswith = list(/obj/item/weapon/ampoule_pack/aminocaproic = 2)
	
/obj/item/weapon/storage/box/ampoule_box/salbutamol
	name = "salbutamol ampoule box"
	desc = "A strong bronchodilator. Helps patients who have their airways obstructed in breathing. Do NOT administer more than 10u or orally."
	startswith = list(/obj/item/weapon/ampoule_pack/salbutamol = 2)

/obj/item/weapon/storage/box/ampoule_box/ethaperazine
	name = "ethaperazine ampoule box"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	startswith = list(/obj/item/weapon/ampoule_pack/ethaperazine = 2)

/obj/item/weapon/storage/box/ampoule_box/doxycycline
	name = "doxycycline ampoule box"
	desc = "A mild neuroleptic and anti-emetic, provides relief from nausea and vomiting. Do NOT administer more than 10u."
	startswith = list(/obj/item/weapon/ampoule_pack/doxycycline = 2)

/obj/item/weapon/storage/box/ampoule_box/angiotensin
	name = "angiotensin ampoule box"
	desc = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	startswith = list(/obj/item/weapon/ampoule_pack/angiotensin = 2)

/obj/item/weapon/storage/box/ampoule_box/paracetamol
	name = "paracetamol ampoule box"
	desc = "A compound which restores bloodflow to the brain and organs. Useful for treating brain and toxin damage. Do NOT administer more than 5U."
	startswith = list(/obj/item/weapon/ampoule_pack/paracetamol = 2)

/obj/item/weapon/storage/box/ampoule_box/promethazine
	name = "promethazine ampoule box"
	desc = "A strong painkiller with a quick metabolization speed, for life threatening injuries. Do NOT administer more than 10u or orally."
	startswith = list(/obj/item/weapon/ampoule_pack/promethazine = 2)

/obj/item/weapon/storage/box/ampoule_box/morphine
	name = "morphine ampoule box"
	desc = "A strong painkiller with a quick metabolization speed, for life threatening injuries. Do NOT administer more than 10u or orally."
	startswith = list(/obj/item/weapon/ampoule_pack/morphine = 2)

/obj/item/weapon/storage/box/ampoule_box/amidopyrinum
	name = "amidopyrinum ampoule box"
	desc = "A strong painkiller with a quick metabolization speed, for life threatening injuries. Do NOT administer more than 10u or orally."
	startswith = list(/obj/item/weapon/ampoule_pack/amidopyrinum = 2)

/obj/item/weapon/storage/box/ampoule_box/thiopental
	name = "sodium thiopental ampoule box"
	desc = "A rapid-onset sedative for surgical operations. Do NOT administer more than 5u."
	startswith = list(/obj/item/weapon/ampoule_pack/thiopental = 2)

/obj/item/weapon/storage/box/ampoule_box/naltamine
	name = "naltamine ampoule box"
	desc = "An opioid antagonist meant to neutralize the effects of morphine and prevent overdose. Do NOT administer more than 15u."
	startswith = list(/obj/item/weapon/ampoule_pack/naltamine = 2)

/obj/item/weapon/storage/box/ampoule_box/epinephrine
	name = "epinephrine ampoule box"
	desc = "A neurotransmitter that is capable of restarting hearts. Do NOT administer more than 5u."
	startswith = list(/obj/item/weapon/ampoule_pack/epinephrine = 2)

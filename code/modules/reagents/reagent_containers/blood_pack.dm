/obj/item/weapon/storage/box/bloodpacks
	name = "blood packs bags"
	desc = "This box contains blood packs."
	icon_state = "sterile"
	New()
		..()
		new /obj/item/weapon/reagent_containers/blood/empty(src)
		new /obj/item/weapon/reagent_containers/blood/empty(src)
		new /obj/item/weapon/reagent_containers/blood/empty(src)
		new /obj/item/weapon/reagent_containers/blood/empty(src)
		new /obj/item/weapon/reagent_containers/blood/empty(src)
		new /obj/item/weapon/reagent_containers/blood/empty(src)
		new /obj/item/weapon/reagent_containers/blood/empty(src)

/obj/item/weapon/reagent_containers/blood
	name = "BloodPack"
	desc = "Flexible bag for IV injectors."
	icon = 'icons/obj/bloodpack.dmi'
	icon_state = "empty"
	volume = 200
	amount_per_transfer_from_this = 0.1
	possible_transfer_amounts = list(0.1;0.2;1;2;5)
	///Blood type we start with
	var/blood_type = null
	///Who are we sticking our needle in?
	var/mob/living/carbon/human/attached
	///Are we injecting or sucking?
	var/injecting = FALSE

/obj/item/weapon/reagent_containers/blood/New()
	. = ..()
	if(blood_type)
		name = "BloodPack [blood_type]"
		reagents.add_reagent(/datum/reagent/blood, 200, list("donor" = null, "blood_DNA" = null, "blood_type" = blood_type, "trace_chem" = null, "virus2" = list(), "antibodies" = list()))
		update_icon()

/obj/item/weapon/reagent_containers/blood/Destroy()
	. = ..()
	if(attached)
		detach_iv()

/obj/item/weapon/reagent_containers/blood/Process(wait, times_fired)
	if(!attached)
		return PROCESS_KILL

	if(!(get_dist(src, attached) <= 1 && isturf(attached.loc)) || !isliving(loc))
		attached.visible_message(span_danger("\The IV bag needle is ripped out of <b>[attached]</b>!"), \
								span_userdanger("Ouch! \The IV bag needle is ripped from me!"))
		attached.apply_damage(3, BRUTE, pick(BP_R_ARM, BP_L_ARM), damage_flags = DAM_SHARP)

		detach_iv()
		return PROCESS_KILL

	if(reagents)
		// Inject reagents
		if(injecting)
			if(reagents.total_volume)
				reagents.trans_to_mob(attached, amount_per_transfer_from_this, CHEM_BLOOD) //make reagents reacts, but don't spam messages
		// Take blood
		else
			var/amount = attached.vessel.reagents.maximum_volume - attached.vessel.reagents.total_volume
			amount = min(amount, amount_per_transfer_from_this)

			attached.vessel.trans_to_obj(src, amount)

/obj/item/weapon/reagent_containers/blood/MouseDrop(atom/over)
	. = ..()
	if(ishuman(over) && (usr == loc) && isliving(usr) && (get_dist(src, over) <= 1))
		attach_iv(over, usr)

/obj/item/weapon/reagent_containers/blood/examine(var/user)
	. = ..()
	to_chat(user, "<span class='notice'>Currently in [injecting ? "injection" : "extraction"] mode.</span>")
	if(attached)
		to_chat(user, "<span class='notice'>Currently [injecting ? "injecting" : "taking blood from"] <b>[attached]</b>.</span>")

/obj/item/weapon/reagent_containers/blood/AltClick(mob/user)
	. = ..()
	if(attached)
		to_chat(user, "<span class='notice'>\The IV bag needle is removed from <b>[attached]</b>.</span>")
		detach_iv()

/obj/item/weapon/reagent_containers/blood/CtrlClick(mob/user)
	. = ..()
	injecting = !injecting
	to_chat(user, "<span class='notice'>\The [src] will now [injecting ? "inject" : "take blood from"] the attached patient.</span>")

/obj/item/weapon/reagent_containers/blood/on_reagent_change()
	update_icon()

/obj/item/weapon/reagent_containers/blood/update_icon()
	overlays.Cut()
	var/percent = round(reagents.total_volume / volume * 100)
	if(reagents.total_volume)
		var/image/filling = image('icons/obj/bloodpack.dmi', "[round(percent,25)]")
		filling.color = reagents.get_color()
		overlays += filling
	overlays += image('icons/obj/bloodpack.dmi', "top")

/obj/item/reagent_containers/blood/proc/attach_iv(mob/living/target, mob/user)
	user.visible_message("<span class='notice'><b>[user]</b> attaches [src] to [target].</span>", \
					"<span class='notice'>I attach [src] to [target].</span>")
	add_fingerprint(user)
	attached = target
	START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/blood/proc/detach_iv()
	attached = null
	STOP_PROCESSING(SSobj, src)

/obj/item/weapon/reagent_containers/blood/APlus
	blood_type = "A+"

/obj/item/weapon/reagent_containers/blood/AMinus
	blood_type = "A-"

/obj/item/weapon/reagent_containers/blood/BPlus
	blood_type = "B+"

/obj/item/weapon/reagent_containers/blood/BMinus
	blood_type = "B-"

/obj/item/weapon/reagent_containers/blood/OPlus
	blood_type = "O+"

/obj/item/weapon/reagent_containers/blood/OMinus
	blood_type = "O-"

/obj/item/weapon/reagent_containers/blood/empty

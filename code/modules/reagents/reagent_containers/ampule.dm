/obj/item/weapon/reagent_containers/glass/ampule
	name = "ampule"
	desc = "An ampule."
	icon = 'icons/obj/syringe.dmi'
	icon_state = "ampule"
	item_state = null
	amount_per_transfer_from_this = 5
	w_class = 1
	slot_flags = null
	volume = 10
	flags = null
	var/closed = 1

/obj/item/weapon/reagent_containers/glass/ampule/attack_self()
	..()
	if(closed)
		to_chat(usr, "<span class = 'notice'>You crack \the [src], opening it.</span>")
		flags |= OPENCONTAINER
		icon_state = "[initial(icon_state)]_open"
		closed = 0
	else
		return
	update_icon()

/obj/item/weapon/reagent_containers/glass/ampule/afterattack()
	update_icon()

/obj/item/weapon/reagent_containers/glass/ampule/morphine
	name = "morphine ampule"
	desc = "Strong painkiller with a quick metabolization speed. Meant for life threatening injuries. WARNING! Do not administer orally!"
	New()
		..()
		reagents.add_reagent(/datum/reagent/morphine, 10)

/obj/item/weapon/reagent_containers/glass/ampule/epinephrine
	name = "epinephrine ampule"
	desc = "A neurotransmitter that is capable of restarting a heart with a single ampoule."
	New()
		..()
		reagents.add_reagent(/datum/reagent/adrenaline, 5)

/obj/item/weapon/reagent_containers/glass/ampule/naltamine
	name = "naltamine ampule"
	desc = "An opioid antagonist meant to neutralize the effects of morphine and prevent overdose."
	New()
		..()
		reagents.add_reagent(/datum/reagent/naltamine, 5)

/obj/item/weapon/reagent_containers/glass/ampule/talotropine
	name = "talotropine ampule"
	New()
		..()
		reagents.add_reagent(/datum/reagent/talotropine, 5)

/obj/item/weapon/reagent_containers/glass/ampule/aminocaproic
	name = "aminocaproic acid ampule"
	desc = "An anti-hemmorhage drug intended to stop acute bleeding and assist in blood clotting."
	New()
		..()
		reagents.add_reagent(/datum/reagent/aminocaproic, 10)



/obj/item/weapon/storage/box/ORP
	name = "\improper BAF ORP"
	desc = "That's an Operational Ration Pack, a ration pack used by British Armed Forces."
	icon_state = "orp"
	w_class = 2
	can_hold = list()
	storage_slots = 4
	max_w_class = 0
	foldable = 0
	icon = 'icons/obj/baf_mre.dmi'
	var/isopened = 0
/*ORP means Operational Ration Pack */
/obj/item/weapon/storage/box/ORP/New()
		..()
		pickflavor()

/obj/item/weapon/storage/box/ORP/proc/pickflavor()
	var/main = pick("bacon & beans", "corned beef hash", "hamburger & beans")
	var/soup = pick("beef & tomato", "vegetable", "cream of mushroom")
	var/side = pick("cracker", "biscuit", "oatmeal biscuit")
	var/desert = pick("milk chocolate bar", "boiled sweets")
	var/drink = pick("instant tea", "coffee")
	name = "[initial(name)] ([main])"
	new /obj/item/weapon/reagent_containers/food/snacks/baf_packaged_meal(src, main)
	new /obj/item/weapon/reagent_containers/food/snacks/baf_packaged_meal(src, soup)
	new /obj/item/weapon/reagent_containers/food/snacks/baf_packaged_meal(src, side)
	new /obj/item/weapon/reagent_containers/food/snacks/baf_packaged_meal(src, desert)
	/*new /obj/item/weapon/reagent_containers/food/condiment/mredrink(src, drink)*/

/obj/item/weapon/storage/box/ORP/update_icon()
	if(!contents.len)
		var/turf/T = get_turf(src)
		if(T)
			new /obj/item/trash/orp(T)
		qdel(src)
	else if(!isopened)
		isopened = 1
		icon_state = "orp_open"

/obj/item/weapon/reagent_containers/food/snacks/baf_packaged_meal
	name = "\improper ORP component"
	desc = "A package from an Operational Ration Pack, used by BAF. Contains a part of a meal, prepared for field consumption."
	wrapped = 1
	bitesize = 1
	icon_state = "entree"
	icon = 'icons/obj/baf_mre.dmi'
	var/flavor = "bacon & beans"//default value

	New(loc, newflavor)
		..()
		determinetype(newflavor)

	attack_self(mob/user as mob)
		if (wrapped)
			user << "<span class='notice'>You pull open the package of the meal!</span>"
			playsound(loc,'sound/effects/pageturn2.ogg', 15, 1)

			name = "\improper" + flavor
			desc = "The contents of a BAF ORP. This one is " + flavor + "."
			icon_state = flavor
			wrapped = 0

/obj/item/weapon/reagent_containers/food/snacks/baf_packaged_meal/proc/determinetype(newflavor)
	name = "\improper ORP component" + " (" + newflavor + ")"
	flavor = newflavor

	switch(newflavor)
		if("bacon & beans", "corned beef hash", "hamburger & beans")
			icon_state = "mainentree"
			reagents.add_reagent(/datum/reagent/nutriment/, 10)
			reagents.add_reagent(/datum/reagent/sodiumchloride, 1)
		if("beef & tomato", "vegetable", "cream of mushroom")
			icon_state = "soup"
			reagents.add_reagent(/datum/reagent/nutriment/, 6)
			reagents.add_reagent(/datum/reagent/sodiumchloride, 1)
		if("cracker", "biscuit", "oatmeal biscuit")
			icon_state = "side"
			reagents.add_reagent(/datum/reagent/nutriment/, 5)
			reagents.add_reagent(/datum/reagent/sodiumchloride, 1)
		if("milk chocolate bar", "boiled sweets")
			icon_state = "dessert"
			reagents.add_reagent(/datum/reagent/nutriment/, 2)
			reagents.add_reagent(/datum/reagent/sugar, 2)
			reagents.add_reagent(/datum/reagent/nutriment/coco, 1)

/*/obj/item/weapon/reagent_containers/food/condiment/mredrink
	name = "\improper instant drink"
	desc = "A package from a ration pack. Contains a drink powder, prepared for field consumption."
	possible_transfer_amounts = "1;5"
	amount_per_transfer_from_this = 1
	volume = 5
	icon_state = "drink"
	icon = 'icons/obj/us_mre.dmi'
	var/flavor = "instanttea"//default value

	New(loc, newflavor)
		..()
		determinetype(newflavor)

/obj/item/weapon/reagent_containers/food/condiment/mredrink/proc/determinetype(newflavor)
	name = "\improper MRE drink" + " (" + newflavor + ")"
	flavor = newflavor

	switch(newflavor)
		if("instant tea")
			icon_state = "drink"
			reagents.add_reagent(/datum/reagent/drink/instanttea/, 5)
		if("instant coffee")
			icon_state = "drink"
			reagents.add_reagent(/datum/reagent/drink/instantcoffee/, 5)*/

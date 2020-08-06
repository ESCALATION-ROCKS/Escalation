/obj/item/weapon/storage/box/MRE
	name = "\improper U.S MRE"
	desc = "That's the meal-ready-to-eat, a ration pack used by NATO armed forces."
	icon_state = "mre"
	w_class = 2
	can_hold = list()
	storage_slots = 4
	max_w_class = 0
	foldable = 0
	icon = 'icons/obj/us_mre.dmi'
	var/isopened = 0

/obj/item/weapon/storage/box/MRE/New()
		..()
		pickflavor()

/obj/item/weapon/storage/box/MRE/proc/pickflavor()
	var/main = pick("pork patty", "beans", "pork slices")
	var/second = pick("apple sauce", "cheese spread")
	var/side = pick("cracker")
	var/desert = pick("dried fruits", "chocolate brownie")
	name = "[initial(name)] ([main])"
	new /obj/item/weapon/reagent_containers/food/snacks/packaged_meal(src, main)
	new /obj/item/weapon/reagent_containers/food/snacks/packaged_meal(src, second)
	new /obj/item/weapon/reagent_containers/food/snacks/packaged_meal(src, side)
	new /obj/item/weapon/reagent_containers/food/snacks/packaged_meal(src, desert)

/obj/item/weapon/storage/box/MRE/update_icon()
	if(!contents.len)
		var/turf/T = get_turf(src)
		if(T)
			new /obj/item/trash/mre(T)
		qdel(src)
	else if(!isopened)
		isopened = 1
		icon_state = "mre_open"

/obj/item/weapon/reagent_containers/food/snacks/packaged_meal
	name = "\improper MRE component"
	desc = "A package from a Meal Ready-to-Eat, used by NATO. Contains a part of a meal, prepared for field consumption."
	wrapped = 1
	bitesize = 1
	icon_state = "entree"
	icon = 'icons/obj/us_mre.dmi'
	var/flavor = "boneless pork ribs"//default value

	New(loc, newflavor)
		..()
		determinetype(newflavor)

	attack_self(mob/user as mob)
		if (wrapped)
			user << "<span class='notice'>You pull open the package of the meal!</span>"
			playsound(loc,'sound/effects/pageturn2.ogg', 15, 1)

			name = "\improper" + flavor
			desc = "The contents of a U.S MRE. This one is " + flavor + "."
			icon_state = flavor
			wrapped = 0

/obj/item/weapon/reagent_containers/food/snacks/packaged_meal/proc/determinetype(newflavor)
	name = "\improper MRE component" + " (" + newflavor + ")"
	flavor = newflavor

	switch(newflavor)
		if("pork patty", "beans", "pork slices")
			icon_state = "mainentree"
			reagents.add_reagent(/datum/reagent/nutriment/, 5)
			reagents.add_reagent(/datum/reagent/sodiumchloride, 1)
		if("apple sauce", "cheese spread")
			icon_state = "side"
			reagents.add_reagent(/datum/reagent/nutriment/, 3)
			reagents.add_reagent(/datum/reagent/sodiumchloride, 1)
		if("cracker")
			icon_state = "snack"
			reagents.add_reagent(/datum/reagent/nutriment/, 2)
			reagents.add_reagent(/datum/reagent/sodiumchloride, 1)
		if("dried fruits", "chocolate brownie")
			icon_state = "dessert"
			reagents.add_reagent(/datum/reagent/nutriment/, 1)
			reagents.add_reagent(/datum/reagent/sugar, 1)
			reagents.add_reagent(/datum/reagent/nutriment/coco, 1)


/obj/item/weapon/reagent_containers/food/snacks/halbbitter
	name = "halb-bitter schokolade"
	desc = "A bar of German chocolate. A soldiers best friend"
	wrapped = 1
	bitesize = 3
	icon_state = "halbbitter"
	trash = /obj/item/trash/halbbitter
/obj/item/weapon/reagent_containers/food/snacks/halbbitter/New()
		..()
		reagents.add_reagent(/datum/reagent/sugar, 5)
		reagents.add_reagent(/datum/reagent/nutriment/coco, 10)

/obj/item/weapon/reagent_containers/food/snacks/halbbitter/attack_self(mob/user as mob)
		if (wrapped)
			to_chat(user,  "<span class='notice'>You pull open the package of the chocolate!</span>")	
			name = "halb-bitter schokolade"
			desc = "A bar of German chocolate. A soldiers best friend"
			icon_state = "halbbitter_open"
			wrapped = 0
		else 
			..()
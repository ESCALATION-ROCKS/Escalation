/obj/item/weapon/storage/box/MRE
	name = "\improper U.S MRE"
	desc = "That's the meal-ready-to-eat, a ration pack used by NATO armed forces."
	icon_state = "mre"
	w_class = 2
	can_hold = list()
	storage_slots = 5
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
	var/drink = pick("gatorade","instant tea", "instant coffee")
	name = "[initial(name)] ([main])"
	new /obj/item/weapon/reagent_containers/food/snacks/packaged_meal(src, main)
	new /obj/item/weapon/reagent_containers/food/snacks/packaged_meal(src, second)
	new /obj/item/weapon/reagent_containers/food/snacks/packaged_meal(src, side)
	new /obj/item/weapon/reagent_containers/food/snacks/packaged_meal(src, desert)
	new /obj/item/weapon/reagent_containers/food/condiment/mredrink(src, drink)

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
	bitesize = 5
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
			reagents.add_reagent(/datum/reagent/nutriment/, 10)
			reagents.add_reagent(/datum/reagent/nutriment/protein, 10)
			reagents.add_reagent(/datum/reagent/sodiumchloride, 2)
		if("apple sauce", "cheese spread")
			icon_state = "side"
			reagents.add_reagent(/datum/reagent/nutriment/, 5)
			reagents.add_reagent(/datum/reagent/sodiumchloride, 2)
		if("cracker")
			icon_state = "snack"
			reagents.add_reagent(/datum/reagent/nutriment/, 5)
			reagents.add_reagent(/datum/reagent/sodiumchloride, 2)
		if("dried fruits", "chocolate brownie")
			icon_state = "dessert"
			reagents.add_reagent(/datum/reagent/nutriment/, 5)
			reagents.add_reagent(/datum/reagent/sugar, 5)
			reagents.add_reagent(/datum/reagent/nutriment/coco, 5)

/obj/item/weapon/reagent_containers/food/condiment/mredrink
	name = "\improper ration drink"
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
			reagents.add_reagent(/datum/reagent/drink/instantcoffee/, 5)
		if("gatorade")
			icon_state = "drink"
			reagents.add_reagent(/datum/reagent/drink/gatoradepowder/, 5)

/obj/item/weapon/storage/box/ORP
	name = "\improper BAF ORP"
	desc = "That's an Operational Ration Pack, a ration pack used by British Armed Forces."
	icon_state = "orp"
	w_class = 2
	can_hold = list()
	storage_slots = 5
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
	var/second = pick("beef & tomato soup", "vegetable soup", "cream of mushroom soup")
	var/side = pick("cracker", "biscuit", "oatmeal biscuit")
	var/desert = pick("milk chocolate bar", "boiled sweets")
	var/drink = pick("instant tea", "instant coffee")
	name = "[initial(name)] ([main])"
	new /obj/item/weapon/reagent_containers/food/snacks/baf_packaged_meal(src, main)
	new /obj/item/weapon/reagent_containers/food/snacks/baf_packaged_meal(src, second)
	new /obj/item/weapon/reagent_containers/food/snacks/baf_packaged_meal(src, side)
	new /obj/item/weapon/reagent_containers/food/snacks/baf_packaged_meal(src, desert)
	new /obj/item/weapon/reagent_containers/food/condiment/mredrink(src, drink)

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
	bitesize = 5
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
			reagents.add_reagent(/datum/reagent/nutriment/protein, 10)
			reagents.add_reagent(/datum/reagent/sodiumchloride, 2)
		if("beef & tomato soup", "vegetable soup", "cream of mushroom soup")
			icon_state = "soup"
			reagents.add_reagent(/datum/reagent/nutriment/, 10)
			reagents.add_reagent(/datum/reagent/sodiumchloride, 2)
		if("cracker", "biscuit", "oatmeal biscuit")
			icon_state = "side"
			reagents.add_reagent(/datum/reagent/nutriment/, 5)
			reagents.add_reagent(/datum/reagent/sodiumchloride, 2)
		if("milk chocolate bar", "boiled sweets")
			icon_state = "dessert"
			reagents.add_reagent(/datum/reagent/nutriment/, 5)
			reagents.add_reagent(/datum/reagent/sugar, 5)
			reagents.add_reagent(/datum/reagent/nutriment/coco, 5)

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
		icon_state = "chickencurry_open"
		wrapped = 0
	else 
		..()

/obj/item/weapon/reagent_containers/food/snacks/beefmushrooms
	name = "beef & mushrooms"
	desc = "A can of beef & mushroom sautee with rice."
	w_class = 2
	center_of_mass = "x=16;y=14"
	icon_state = "beefmushrooms"
	trash = /obj/item/trash/tincan/beefmushrooms
	bitesize = 3
	wrapped = 1

/obj/item/weapon/reagent_containers/food/snacks/beefmushrooms/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 20)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 20)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/beefmushrooms/attack_self(mob/user as mob)
	if (wrapped)
		to_chat(user,  "<span class='notice'>You pull open the lid of the meal!</span>")
		icon_state = "beefmushrooms_open"
		wrapped = 0
	else 
		..()

/obj/item/weapon/reagent_containers/food/snacks/chickencurry
	name = "chicken curry"
	desc = "A can of chicken curry with rice."
	w_class = 2
	center_of_mass = "x=16;y=14"
	icon_state = "chickencurry"
	trash = /obj/item/trash/tincan/chickencurry
	bitesize = 3
	wrapped = 1

/obj/item/weapon/reagent_containers/food/snacks/chickencurry/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 20)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 20)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/chickencurry/attack_self(mob/user as mob)
	if (wrapped)
		to_chat(user,  "<span class='notice'>You pull open the lid of the meal!</span>")
		icon_state = "chickencurry_open"
		wrapped = 0
	else 
		..()

/obj/item/weapon/reagent_containers/food/snacks/finnchocolate
	name = "Karl Fazer chocolate"
	desc = "A bar of Finnish dark chocolate."
	wrapped = 1
	bitesize = 3
	icon_state = "karlfazer"
	trash = /obj/item/trash/karlfazer
/obj/item/weapon/reagent_containers/food/snacks/finnchocolate/New()
		..()
		reagents.add_reagent(/datum/reagent/sugar, 3)
		reagents.add_reagent(/datum/reagent/nutriment/coco, 15)

/obj/item/weapon/reagent_containers/food/snacks/finnchocolate/attack_self(mob/user as mob)
	if (wrapped)
		to_chat(user,  "<span class='notice'>You pull open the package of the chocolate!</span>")
		icon_state = "karlfazer_open"
		wrapped = 0
	else 
		..()

/obj/item/weapon/reagent_containers/food/snacks/finnoats
	name = "honey & oats bar"
	desc = "A bar of oats, held together by honey."
	wrapped = 1
	bitesize = 3
	icon_state = "finnoats"
	trash = /obj/item/trash/finnoats
/obj/item/weapon/reagent_containers/food/snacks/finnoats/New()
		..()
		reagents.add_reagent(/datum/reagent/sugar, 5)
		reagents.add_reagent(/datum/reagent/nutriment, 10)

/obj/item/weapon/reagent_containers/food/snacks/finnoats/attack_self(mob/user as mob)
	if (wrapped)
		to_chat(user,  "<span class='notice'>You pull open the package of the oats!</span>")
		icon_state = "finnoats_open"
		wrapped = 0
	else 
		..()

/obj/item/weapon/reagent_containers/food/snacks/breadsalmon
	name = "crisp bread w/ salmon"
	desc = "A piece of crisp bread with salmon spread over it."
	wrapped = 1
	bitesize = 3
	icon_state = "breadsalmon"
	trash = /obj/item/trash/crispbread
/obj/item/weapon/reagent_containers/food/snacks/breadsalmon/New()
		..()
		reagents.add_reagent(/datum/reagent/nutriment/protein, 5)
		reagents.add_reagent(/datum/reagent/nutriment, 10)

/obj/item/weapon/reagent_containers/food/snacks/breadsalmon/attack_self(mob/user as mob)
	if (wrapped)
		to_chat(user,  "<span class='notice'>You pull open the package of the bread!</span>")
		icon_state = "breadsalmon_open"
		wrapped = 0
	else 
		..()

/obj/item/weapon/reagent_containers/food/snacks/breadham
	name = "crisp bread w/ ham"
	desc = "A piece of crisp bread with ham spread over it."
	wrapped = 1
	bitesize = 3
	icon_state = "breadham"
	trash = /obj/item/trash/crispbread
/obj/item/weapon/reagent_containers/food/snacks/breadham/New()
		..()
		reagents.add_reagent(/datum/reagent/nutriment/protein, 5)
		reagents.add_reagent(/datum/reagent/nutriment, 10)

/obj/item/weapon/reagent_containers/food/snacks/breadham/attack_self(mob/user as mob)
	if (wrapped)
		to_chat(user,  "<span class='notice'>You pull open the package of the chocolate!</span>")
		icon_state = "breadham_open"
		wrapped = 0
	else 
		..()
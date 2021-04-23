
///////////////////////////////////////////////Condiments
//Notes by Darem: The condiments food-subtype is for stuff you don't actually eat but you use to modify existing food. They all
//	leave empty containers when used up and can be filled/re-filled with other items. Formatting for first section is identical
//	to mixed-drinks code. If you want an object that starts pre-loaded, you need to make it in addition to the other code.

//Food items that aren't eaten normally and leave an empty container behind.
/obj/item/weapon/reagent_containers/food/condiment
	name = "Condiment Container"
	desc = "Just your average condiment container."
	icon = 'icons/obj/food.dmi'
	icon_state = "emptycondiment"
	flags = OPENCONTAINER
	possible_transfer_amounts = "1;5;10"
	center_of_mass = "x=16;y=6"
	volume = 50

	attackby(var/obj/item/weapon/W as obj, var/mob/user as mob)
		return

	attack_self(var/mob/user as mob)
		return

	attack(var/mob/M as mob, var/mob/user as mob, var/def_zone)
		if(standard_feed_mob(user, M))
			return

	afterattack(var/obj/target, var/mob/user, var/proximity)
		if(!proximity)
			return

		if(standard_dispenser_refill(user, target))
			return
		if(standard_pour_into(user, target))
			return

		if(istype(target, /obj/item/weapon/reagent_containers/food/snacks)) // These are not opencontainers but we can transfer to them
			if(!reagents || !reagents.total_volume)
				to_chat(user, "<span class='notice'>There is no condiment left in \the [src].</span>")
				return

			if(!target.reagents.get_free_space())
				to_chat(user, "<span class='notice'>You can't add more condiment to \the [target].</span>")
				return

			var/trans = reagents.trans_to_obj(target, amount_per_transfer_from_this)
			to_chat(user, "<span class='notice'>You add [trans] units of the condiment to \the [target].</span>")
		else
			..()

	feed_sound(var/mob/user)
		playsound(user.loc, "drink", rand(40, 50), 1)

	self_feed_message(var/mob/user)
		to_chat(user, "<span class='notice'>You swallow some of contents of \the [src].</span>")

	on_reagent_change()
		if(reagents.reagent_list.len > 0)
			switch(reagents.get_master_reagent_type())
				if(/datum/reagent/nutriment/ketchup)
					name = "Ketchup"
					desc = "You feel more American already."
					icon_state = "ketchup"
					center_of_mass = "x=16;y=6"
				if(/datum/reagent/nutriment/barbecue)
					name = "Barbecue Sauce"
					desc = "Barbecue sauce, it's labeled 'sweet and spicy'"
					icon_state = "barbecue"
					center_of_mass = "x=16;y=6"
				if(/datum/reagent/capsaicin)
					name = "Hotsauce"
					desc = "You can almost TASTE the stomach ulcers now!"
					icon_state = "hotsauce"
					center_of_mass = "x=16;y=6"
				if(/datum/reagent/enzyme)
					name = "Universal Enzyme"
					desc = "Used in cooking various dishes."
					icon_state = "enzyme"
					center_of_mass = "x=16;y=6"
				if(/datum/reagent/nutriment/soysauce)
					name = "Soy Sauce"
					desc = "A salty soy-based flavoring."
					icon_state = "soysauce"
					center_of_mass = "x=16;y=6"
				if(/datum/reagent/frostoil)
					name = "Coldsauce"
					desc = "Leaves the tongue numb in its passage."
					icon_state = "coldsauce"
					center_of_mass = "x=16;y=6"
				if(/datum/reagent/sodiumchloride)
					name = "Salt Shaker"
					desc = "Salt. From space oceans, presumably."
					icon_state = "saltshaker"
					center_of_mass = "x=16;y=10"
				if(/datum/reagent/blackpepper)
					name = "Pepper Mill"
					desc = "Often used to flavor food or make people sneeze."
					icon_state = "peppermillsmall"
					center_of_mass = "x=16;y=10"
				if(/datum/reagent/nutriment/cornoil)
					name = "Corn Oil"
					desc = "A delicious oil used in cooking. Made from corn."
					icon_state = "oliveoil"
					center_of_mass = "x=16;y=6"
				if(/datum/reagent/sugar)
					name = "Sugar"
					desc = "Tastey space sugar!"
					center_of_mass = "x=16;y=6"
				if(/datum/reagent/drink/instanttea)
					name = "ration component (instant tea)"
					desc = "A package from a ration pack. Contains instant tea powder. Don't drink this straight, mix with 15u hot water!"
					icon_state = "instanttea"
					icon = 'icons/obj/coldwar/us_mre.dmi'
					center_of_mass = "x=16;y=6"
				if(/datum/reagent/drink/instantcoffee)
					name = "ration component (instant coffee)"
					desc = "A package from a ration pack. Contains instant coffee powder. Don't drink this straight, mix with 15u water!"
					icon_state = "instantcoffee"
					icon = 'icons/obj/coldwar/us_mre.dmi'
					center_of_mass = "x=16;y=6"
				if(/datum/reagent/drink/gatoradepowder)
					name = "ration component (gatorade powder)"
					desc = "A package from a ration pack. Contains gatorade drink powder. Don't drink this straight, mix with 15u water!"
					icon_state = "gatorade"
					icon = 'icons/obj/coldwar/us_mre.dmi'
					center_of_mass = "x=16;y=6"
				else
					name = "Misc Condiment Bottle"
					if (reagents.reagent_list.len==1)
						desc = "Looks like it is [reagents.get_master_reagent_name()], but you are not sure."
					else
						desc = "A mixture of various condiments. [reagents.get_master_reagent_name()] is one of them."
					icon_state = "mixedcondiments"
					center_of_mass = "x=16;y=6"
		/*else
			icon_state = "emptycondiment"
			name = "Condiment Bottle"
			desc = "An empty condiment bottle."
			center_of_mass = "x=16;y=6"
			return*/

/obj/item/weapon/reagent_containers/food/condiment/enzyme
	name = "Universal Enzyme"
	desc = "Used in cooking various dishes."
	icon_state = "enzyme"
/obj/item/weapon/reagent_containers/food/condiment/enzyme/New()
	. = ..()
	reagents.add_reagent(/datum/reagent/enzyme, 50)

/obj/item/weapon/reagent_containers/food/condiment/barbecue
	name = "Barbecue Sauce"
	desc = "Barbecue sauce, it's labeled 'sweet and spicy'"
	icon_state = "barbecue"
/obj/item/weapon/reagent_containers/food/condiment/barbecue/New()
	. = ..()
	reagents.add_reagent(/datum/reagent/nutriment/barbecue, 50)

/obj/item/weapon/reagent_containers/food/condiment/sugar/New()
	. = ..()
	reagents.add_reagent(/datum/reagent/sugar, 50)

/obj/item/weapon/reagent_containers/food/condiment/small
	possible_transfer_amounts = "1;20"
	amount_per_transfer_from_this = 1
	volume = 20

/obj/item/weapon/reagent_containers/food/condiment/small/on_reagent_change()
	return

/obj/item/weapon/reagent_containers/food/condiment/small/saltshaker
	name = "salt shaker"
	desc = "Salt. From space oceans, presumably."
	icon_state = "saltshakersmall"
	center_of_mass = "x=16;y=9"
	New()
		..()
		reagents.add_reagent(/datum/reagent/sodiumchloride, 20)

/obj/item/weapon/reagent_containers/food/condiment/small/peppermill
	name = "pepper mill"
	desc = "Often used to flavor food or make people sneeze."
	icon_state = "peppermillsmall"
	center_of_mass = "x=16;y=8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/blackpepper, 20)

/obj/item/weapon/reagent_containers/food/condiment/small/sugar
	name = "sugar"
	desc = "Sweetness in a bottle"
	icon_state = "sugarsmall"
	center_of_mass = "x=17;y=9"
/obj/item/weapon/reagent_containers/food/condiment/small/sugar/New()
	. = ..()
	reagents.add_reagent(/datum/reagent/sugar, 5)

/obj/item/weapon/reagent_containers/food/condiment/sugarsack
	name = "sugar"
	desc = "A sack full of sweetness!"
	icon_state = "sugar"
	center_of_mass = "x=17;y=9"
/obj/item/weapon/reagent_containers/food/condiment/sugarsack/New()
	. = ..()
	reagents.add_reagent(/datum/reagent/sugar, 30)

/obj/item/weapon/reagent_containers/food/condiment/sugarsack/on_reagent_change()
	return


/obj/item/weapon/reagent_containers/food/condiment/flour
	name = "flour sack"
	desc = "A big bag of flour. Good for baking!"
	icon = 'icons/obj/food.dmi'
	icon_state = "flour"
	item_state = "flour"
	on_reagent_change()	return
	randpixel = 10
	New()
		..()
		reagents.add_reagent(/datum/reagent/nutriment/flour, 30)


/obj/item/weapon/reagent_containers/food/condiment/sovietsugar
	name = "'Aeroflot' sugar pack"
	desc = "That's the sugar! Has a picture of the airplane on it"
	icon_state = "aeroflotsugar"
	icon = 'icons/obj/food.dmi'
	item_state = null
	possible_transfer_amounts = "1;5"
	amount_per_transfer_from_this = 1
	volume = 5
	New()
		..()
		reagents.add_reagent(/datum/reagent/sugar, 5)

/obj/item/weapon/reagent_containers/food/condiment/sovietsugar/on_reagent_change()
	return

/obj/item/weapon/reagent_containers/food/condiment/sovietsugar/zheldor
	name = "'Zheleznaya doroga' sugar pack"
	desc = "That's the sugar! Has a picture of the railway station on it"
	icon_state = "zheldorsugar"

/obj/item/weapon/reagent_containers/food/condiment/sovietsugar/finnsugar
	name = "'Karkkia' sugar pack"
	desc = "A simple sugar pack."
	icon_state = "finnsugar"

/obj/item/weapon/reagent_containers/food/condiment/sovietsugar/morflot
	name = "'Morflot' sugar pack"
	desc = "That's the sugar! Has a picture of the sun and a seagull on it"
	icon_state = "morflotsugar"

/obj/item/weapon/reagent_containers/food/condiment/sovietsugar/tsukor
	name = "'Tsukor'"
	desc = "That's the sugar! But you are not sure."
	icon_state = "tsukor"

/obj/item/weapon/reagent_containers/food/condiment/sovietsugar/traubenzucker
	name = "'Traubenzucker'"
	desc = "A pack of sugar and asparatame tablets. Although they are meant to be dissolved, nothing is stopping you from crunching them."
	icon_state = "traubenzucker"

/obj/item/weapon/reagent_containers/food/condiment/sovietsugar/finn
	name = "sugar pack"
	desc = "A bland-looking pack of sugar."
	icon_state = "finnsugar"

/obj/item/weapon/reagent_containers/food/condiment/soviettea
	name = "instant tea pouch"
	desc = "Some instant tart black tea powder. Don't drink this straight! Mix with 15u hot water!"
	icon_state = "soviettea"
	icon = 'icons/obj/food.dmi'
	item_state = null
	possible_transfer_amounts = "1;5"
	amount_per_transfer_from_this = 1
	volume = 5
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/instanttea, 5)

/obj/item/weapon/reagent_containers/food/condiment/soviettea/on_reagent_change()
	return

/obj/item/weapon/reagent_containers/food/condiment/instantcoffee
	name = "instant coffee pouch"
	desc = "Some instant coffee powder. Don't drink this straight! Mix with 15u hot water!"
	icon_state = "instantcoffee"
	icon = 'icons/obj/food.dmi'
	item_state = null
	possible_transfer_amounts = "1;5"
	amount_per_transfer_from_this = 1
	volume = 5
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/instantcoffee, 5)

/obj/item/weapon/reagent_containers/food/condiment/instantcoffee/on_reagent_change()
	return

/obj/item/weapon/reagent_containers/food/condiment/instantcocoa
	name = "instant cocoa powder pouch"
	desc = "Some instant cocoa powder. Don't drink this straight! Mix with 15u hot water!"
	icon_state = "instantcocoa"
	icon = 'icons/obj/food.dmi'
	item_state = null
	possible_transfer_amounts = "1;5"
	amount_per_transfer_from_this = 1
	volume = 5
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/instantcocoa, 5)

/obj/item/weapon/reagent_containers/food/condiment/instantcocoa/on_reagent_change()
	return
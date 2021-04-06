/obj/item/weapon/reagent_containers/food/drinks/cans
	volume = 40 //just over one and a half cups
	amount_per_transfer_from_this = 5
	flags = 0 //starts closed

//DRINKS

/obj/item/weapon/reagent_containers/food/drinks/cans/cola
	name = "\improper Coca Cola"
	desc = "The most popular drink on the market."
	icon_state = "cola"
	center_of_mass = "x=16;y=10"
/obj/item/weapon/reagent_containers/food/drinks/cans/cola/New()
	. = ..()
	reagents.add_reagent(/datum/reagent/drink/space_cola, 30)

/obj/item/weapon/reagent_containers/food/drinks/cans/waterbottle
	name = "bottled water"
	desc = "Introduced to the vending machines by Skrellian request, this water comes straight from the Martian poles."
	icon_state = "smallbottle"
	center_of_mass = "x=15;y=8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/water, 30)

/obj/item/weapon/reagent_containers/food/drinks/cans/kerosene
	name = "bottled kerosene"
	desc = "Used as a fuel for lanterns."
	icon_state = "kerosene"
	center_of_mass = "x=15;y=8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/fuel/kerosene, 30)


/obj/item/weapon/reagent_containers/food/drinks/cans/space_mountain_wind
	name = "\improper Mountain Dew"
	desc = "This can't be good for you, but it tastes 'great'!"
	icon_state = "space_mountain_wind"
	center_of_mass = "x=16;y=10"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/spacemountainwind, 30)

/obj/item/weapon/reagent_containers/food/drinks/cans/thirteenloko
	name = "\improper Thirteen Loko"
	desc = "The CMO has advised crew members that consumption of Thirteen Loko may result in seizures, blindness, drunkeness, or even death. Please Drink Responsibly."
	icon_state = "thirteen_loko"
	center_of_mass = "x=16;y=8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/ethanol/thirteenloko, 30)

/obj/item/weapon/reagent_containers/food/drinks/cans/dr_gibb
	name = "\improper Dr. Gibb"
	desc = "A delicious mixture of 42 different flavors."
	icon_state = "dr_gibb"
	center_of_mass = "x=16;y=10"
/obj/item/weapon/reagent_containers/food/drinks/cans/dr_gibb/New()
	. = ..()
	reagents.add_reagent(/datum/reagent/drink/dr_gibb, 30)

/obj/item/weapon/reagent_containers/food/drinks/cans/starkist
	name = "\improper Fanta"
	desc = "Fanta. Evokes the feeling of the Good Old Times."
	icon_state = "starkist"
	center_of_mass = "x=16;y=10"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/brownstar, 30)

/obj/item/weapon/reagent_containers/food/drinks/cans/space_up
	name = "\improper 7-UP"
	desc = "Tastes like dish soap."
	icon_state = "space-up"
	center_of_mass = "x=16;y=10"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/space_up, 30)

/obj/item/weapon/reagent_containers/food/drinks/cans/lemon_lime
	name = "\improper Lemon-Lime"
	desc = "You wanted ORANGE. It gave you Lemon Lime."
	icon_state = "lemon-lime"
	center_of_mass = "x=16;y=10"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/lemon_lime, 30)

/obj/item/weapon/reagent_containers/food/drinks/cans/iced_tea
	name = "\improper Vrisk Serket Iced Tea"
	desc = "That sweet, refreshing southern earthy flavor. That's where it's from, right? South Earth?"
	icon_state = "ice_tea_can"
	center_of_mass = "x=16;y=10"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/tea/icetea, 30)

/obj/item/weapon/reagent_containers/food/drinks/cans/grape_juice
	name = "\improper Grapel Juice"
	desc = "500 pages of rules of how to appropriately enter into a combat with this juice!"
	icon_state = "purple_can"
	center_of_mass = "x=16;y=10"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/juice/grape, 30)

/obj/item/weapon/reagent_containers/food/drinks/cans/tonic
	name = "\improper T-Borg's Tonic Water"
	desc = "Quinine tastes funny, but at least it'll keep that Space Malaria away."
	icon_state = "tonic"
	center_of_mass = "x=16;y=10"
/obj/item/weapon/reagent_containers/food/drinks/cans/tonic/New()
	. = ..()
	reagents.add_reagent(/datum/reagent/drink/tonic, 50)

/obj/item/weapon/reagent_containers/food/drinks/cans/sodawater
	name = "soda water"
	desc = "A can of soda water. Still water's more refreshing cousin."
	icon_state = "sodawater"
	center_of_mass = "x=16;y=10"
/obj/item/weapon/reagent_containers/food/drinks/cans/sodawater/New()
	. = ..()
	reagents.add_reagent(/datum/reagent/drink/sodawater, 50)

/obj/item/weapon/reagent_containers/food/drinks/cans/pepsi
	name = "\improper Pepsi"
	desc = "Your favourite slightly medicinal Coca Cola competitor."
	icon_state = "pepsi"
	center_of_mass = "x=16;y=8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/pepsi_cola, 30)

/obj/item/weapon/reagent_containers/food/drinks/cans/dr_pepper
	name = "\improper Dr. Pepper"
	desc = "The hell does 'Be a Pepper' mean?"
	icon_state = "dr-pepper"
	center_of_mass = "x=16;y=10"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/dr_pepper, 30)

/obj/item/weapon/reagent_containers/food/drinks/cans/sprite
	name = "\improper Sprite"
	desc = "Sugar free! SUGAR FREE?!?"
	icon_state = "sprite"
	center_of_mass = "x=16;y=10"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/sprite, 30)

/obj/item/weapon/reagent_containers/food/drinks/cans/dr_pepper_fake
	name = "\improper Dr. Pibb"
	desc = "Improved formula! Now with absolutely no relation to Dr. Pepper whatsoever."
	icon_state = "dr-pepperfake"
	center_of_mass = "x=16;y=10"
	New()
		..()
		reagents.add_reagent(/datum/reagent/drink/dr_pepper_fake, 30)

/obj/item/weapon/reagent_containers/food/snacks/armymaindish
	name = "main dish"
	desc = "That's the main dish of the MRE. Contains some sort of grain with the some sort of meat"
	icon_state = "maindish"
	trash = /obj/item/trash/frp
	filling_color = "#A66829"
	wrapped = 1
	center_of_mass = list("x"=15, "y"=12)

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 10)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 5)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/beef
	desc = "That's the main dish of the MRE. Contains beef"
	icon_state = "maindish-beef"

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/beef/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 15)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 10)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/vegan
	desc = "That's the main dish of the MRE. Contains vegetables, jeez!"
	icon_state = "maindish-salad"

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/vegan/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 10)
	bitesize = 1

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/lasagna
	desc = "That's the main dish of the MRE. Contains lasagna"
	icon_state = "maindish-lasagna"

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/lasagna/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 15)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 5)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/breads
	desc = "That's the main dish of the MRE. Contains nutrious breads"
	icon_state = "maindish-bread"

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/breads/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 15)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/armychocolate
	name = "milk chocolate bar"
	desc = "That's the bar of tasty chocolate"
	icon_state = "chocolatebarpack"
	trash = /obj/item/trash/chocolate
	w_class = 1
	wrapped = 1

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/armychocolate/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 5)
	reagents.add_reagent(/datum/reagent/sugar, 3)
	bitesize = 2

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/burrito
	name = "burrito"
	desc = "That's the packaged mexican food."
	icon_state = "chocolatebarpack"
	trash = /obj/item/trash/plasticpack
	w_class = 1
	wrapped = 1

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/burrito/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 4)
	reagents.add_reagent(/datum/reagent/capsaicin, 2)
	bitesize = 1

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/hotdog
	name = "hotdog"
	desc = "Bark!"
	icon_state = "hot_dogs"
	trash = /obj/item/trash/plasticpack
	w_class = 1
	wrapped = 1

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/hotdog/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 4)
	reagents.add_reagent(/datum/reagent/nutriment/ketchup, 1)
	bitesize = 1

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/potatopatty
	name = "potato patty"
	desc = "That's the packaged potato patty."
	icon_state = "potatopatty"
	trash = /obj/item/trash/plasticpack
	w_class = 1
	wrapped = 1
	nutriment_desc = list("raw potato" = 3)

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/potatopatty/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 3)
	bitesize = 0.5

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/frankfurters
	name = "frankfurters"
	desc = "That's the packaged traditional German dish."
	icon_state = "frankfurters"
	trash = /obj/item/trash/plasticpack
	w_class = 1
	wrapped = 1

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/frankfurters/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 4)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 2)
	bitesize = 1

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/meatpatty
	name = "beef patty"
	desc = "That's the packaged patty. Contains beef!"
	icon_state = "beefpatty"
	trash = /obj/item/trash/
	w_class = 1
	wrapped = 1

/obj/item/weapon/reagent_containers/food/snacks/armymaindish/meatpatty/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 3)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 2)
	bitesize = 1


/obj/item/weapon/reagent_containers/food/snacks/tincan
	name = "tin can"
	desc = "That's should now be here!"
	w_class = 2
	icon = 'icons/obj/food.dmi'
	filling_color = "#A66829"
	center_of_mass = list("x"=15, "y"=12)
	closed = 1

/obj/item/weapon/reagent_containers/food/snacks/tincan/condensedmilk
	name = "condensed milk"
	desc = "Tasty tasty sguschenka!"
	center_of_mass = "x=16;y=11"
	w_class = 2
	icon_state = "condensedmilk"
	trash = /obj/item/trash/tincan/condensedmilk

/obj/item/weapon/reagent_containers/food/snacks/tincan/condensedmilk/New()
	..()
	reagents.add_reagent(/datum/reagent/drink/milk, 30)
	reagents.add_reagent(/datum/reagent/sugar, 10)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/tincan/stew
	name = "stew"
	desc = "That's the so-called 'tushenka'."
	center_of_mass = "x=16;y=11"
	w_class = 2
	icon_state = "stewcan"
	trash = /obj/item/trash/tincan

/obj/item/weapon/reagent_containers/food/snacks/tincan/stew/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 25)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 15)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/tincan/stewpearlbarley
	name = "stew with pearl barley"
	desc = "Now with 'perlovka'!."
	w_class = 2
	center_of_mass = "x=16;y=11"
	icon_state = "pearlbarleystew"
	trash = /obj/item/trash/tincan/pearlbarleystew

/obj/item/weapon/reagent_containers/food/snacks/tincan/stewpearlbarley/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment/pearlbarley, 30)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 10)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/tincan/stewbuckwheat
	name = "stew with buckwheat"
	desc = "That's the 'grechka'. Still better than 'perlovka'!"
	w_class = 2
	center_of_mass = "x=16;y=11"
	icon_state = "stewbuckwheat"
	trash = /obj/item/trash/tincan/stewbuckwheat

/obj/item/weapon/reagent_containers/food/snacks/tincan/stewbuckwheat/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment/buckwheat, 30)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 10)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/tincan/buckwheat
	name = "buckwheat"
	desc = "No 'tushenka'. Better luck next time, comrade!"
	w_class = 2
	center_of_mass = "x=16;y=11"
	icon_state = "buckwheat"
	trash = /obj/item/trash/tincan/buckwheat
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/tincan/buckwheat/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment/buckwheat, 40)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/tincan/cannedbread
	name = "canned bread"
	desc = "A can of odd tasting 'Volkorn Brot'. Said to be nuclear war-proof."
	w_class = 2
	center_of_mass = "x=16;y=11"
	icon_state = "cannedbread"
	trash = /obj/item/trash/tincan/cannedbread
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/tincan/cannedbread/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment/cannedbread, 40)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/tincan/blutwurst
	name = "blutwurst"
	desc = "A can of blood sausages. Looks repulsive but leaves a nice taste in the mouth."
	w_class = 2
	center_of_mass = "x=16;y=14"
	icon_state = "blutwurst"
	trash = /obj/item/trash/tincan/blutwurst
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/tincan/blutwurst/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 20)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 20)
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/tincan/jagdwurst
	name = "jagdwurst"
	desc = "A can of liver sausages. They are better off inside a Wurstchen than a can."
	w_class = 2
	center_of_mass = "x=16;y=14"
	icon_state = "jagdwurst"
	trash = /obj/item/trash/tincan/jagdwurst
	bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/tincan/jagdwurst/New()
	..()
	reagents.add_reagent(/datum/reagent/nutriment, 20)
	reagents.add_reagent(/datum/reagent/nutriment/protein, 20)
	bitesize = 3
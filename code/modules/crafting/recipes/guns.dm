/datum/crafting_recipe/zipgun
	name = "Zipgun" 			//in-game display name
	parts = list(/obj/item/reciever= 1, /obj/item/stock = 1, /obj/item/pipe = 1)			//type paths of items consumed associated with how many are needed
	tools = list(/obj/item/weapon/screwdriver)			//type paths of items needed but not consumed
	result = list(/obj/item/weapon/gun/projectile/pirate = 1)		//type path of item resulting from this craft

	time = 0 			//time in 1/10th of second
	base_chance = 100 	//base chance to get it right without skills

/datum/crafting_recipe/revolver_one
	name = "Station made revolver one slot"
	tools = list(/obj/item/weapon/screwdriver)
	parts = list(/obj/item/reciever= 1, /obj/item/stock = 1, /obj/item/pipe = 1, /obj/item/cylinder/one_slot = 1, /obj/item/action = 1)
	result = list(/obj/item/weapon/gun/projectile/revolver/one_chamber = 1)
	time = 60
	base_chance = 100

/datum/crafting_recipe/revolver_two
	name = "Station made revolver two slot"
	tools = list(/obj/item/weapon/screwdriver)
	parts = list(/obj/item/reciever= 1, /obj/item/stock = 1, /obj/item/pipe = 1, /obj/item/cylinder/two_slot = 1, /obj/item/action = 1)
	result = list(/obj/item/weapon/gun/projectile/revolver/two_chamber = 1)
	time = 60
	base_chance = 100

/datum/crafting_recipe/revolver_three
	name = "Station made revolver three slot"
	tools = list(/obj/item/weapon/screwdriver)
	parts = list(/obj/item/reciever= 1, /obj/item/stock = 1, /obj/item/pipe = 1, /obj/item/cylinder/three_slot = 1, /obj/item/action = 1)
	result = list(/obj/item/weapon/gun/projectile/revolver/three_chamber = 1)
	time = 60
	base_chance = 100

/datum/crafting_recipe/revolver_four
	name = "Station made revolver four slot"
	tools = list(/obj/item/weapon/screwdriver)
	parts = list(/obj/item/reciever= 1, /obj/item/stock = 1, /obj/item/pipe = 1, /obj/item/cylinder/four_slot = 1, /obj/item/action = 1)
	result = list(/obj/item/weapon/gun/projectile/revolver/four_chamber = 1)
	time = 60
	base_chance = 100
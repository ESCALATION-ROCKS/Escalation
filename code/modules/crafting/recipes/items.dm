
/datum/crafting_recipe/knifeblade
	name = "Knife blade"
	tools = list(/obj/item/weapon/stone = 2)
	parts = list(/obj/item/weapon/stone = 1)
	result = list(/obj/item/weapon/crafty/knifeblade = 1)
	time = 60
	base_chance = 100

/datum/crafting_recipe/simpleknife
	name = "Makeshift knife"
	parts = list(/obj/item/weapon/material/lstick = 1, /obj/item/weapon/crafty/knifeblade = 1)
	result = list(/obj/item/weapon/material/knife/craftknife = 1)
	time = 60
	base_chance = 100

/datum/crafting_recipe/simplehatchet
	name = "Makeshift hatchet"
	parts = list(/obj/item/weapon/material/lstick = 1, /obj/item/weapon/crafty/knifeblade = 1)
	result = list(/obj/item/weapon/material/hatchet/crafthatchet = 1)
	time = 60
	base_chance = 100

/datum/crafting_recipe/sharprock
	name = "Sharp rock"
	tools = list(/obj/item/weapon/stone = 1)
	parts = list(/obj/item/weapon/stone = 1)
	result = list(/obj/item/weapon/material/sharprock = 1)
	time = 60
	base_chance = 200

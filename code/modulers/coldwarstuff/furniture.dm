/obj/structure/bed/chair/wood/sofa
	name = "sofa"
	desc = "A pretty old sofa, isn't it?"
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	base_icon = "sofa"
	icon_state = "sofa"
	color = null

/obj/structure/bed/chair/wood/sofa2
	name = "sofa"
	desc = "A pretty old sofa, isn't it?"
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	base_icon = "sofa1v"
	icon_state = "sofa1v"
	color = null

/obj/structure/sink/bath
	name = "bath tube"
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	icon_state = "bathtube"
	desc = "An old iron bath."
	anchored = 1
	density = 1

/obj/structure/gasradiator
	name = "radiator"
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	icon_state = "radiator"
	desc = "That's a radiator. Doesn't seem to be heating the room."
	anchored = 1

/obj/structure/radiole
	name = "VEF 'Rhapsodia'"
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	icon_state = "radiole"
	desc = "That's a radiole. Pretty useless at this time."
	anchored = 1

/obj/structure/gasstove
	name = "gas stove"
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	icon_state = "gasstove1"
	desc = "That's a gas stove. Haven't any gas sources connected to it, anyway."
	anchored = 1

	New()
		icon_state = "gasstove[rand(1,2)]"

/obj/structure/undies_wardrobe/soviet
	name = "underwear wardrobe"
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	icon_state = "wardrobe"
	density = 1
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

/obj/structure/bed/doublebed
	name = "double sized mattress"
	desc = "A matress for two, or one particularly fat german."
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	base_icon = "mattress-double"
	icon_state = "mattress-double"
	color = null

/obj/structure/bed/framelarge
	name = "double sized bedframe"
	desc = "A bedframe made out wooden planks."
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	base_icon = "bed-wooden-frame-double"
	icon_state = "bed-wooden-frame-double"
	color = null

/obj/structure/bed/framelarge/metal
	name = "double sized bedframe"
	desc = "A thin wiremesh bedframe made out iron."
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	base_icon = "bed-metal-frame-double"
	icon_state = "bed-metal-frame-double"
	color = null

/obj/structure/bed/chair/futon
	name = "futon"
	desc = "A futon for the intellectual."
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	base_icon = "futon"
	icon_state = "futon"
	color = null

/obj/structure/bed/chair/wood/sofa2
	name = "mattress"
	desc = "Hey you have one of these at home!"
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	base_icon = "mattress"
	icon_state = "mattress"
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

/obj/structure/dresser
	name = "dresser"
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	icon_state = "dresser"
	desc = "Why is there a pen cap but no pen in here?."
	anchored = 1
	density = 1

/obj/structure/nightstand
	name = "nightstand"
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	icon_state = "nightstand"
	desc = "A nightstand to go with your bed"
	anchored = 1
	density = 1

/obj/structure/holycross
	name = "stone cross"
	icon = 'icons/obj/coldwar/housefurniture.dmi'
	icon_state = "holycross"
	desc = "You don't like to think about these..."
	anchored = 1
	density = 1


/obj/item/weapon/light/bulb/red
	color = "#da0205"
	brightness_color = "#da0205"

/obj/item/weapon/light/bulb/neonblue
	brightness_color = "#008080"


/obj/item/weapon/light/bulb/techbright
	brightness_range = 5

/obj/machinery/light/coldtint
	current_light = /obj/item/weapon/light/tube/tinted/coldtint

/obj/item/weapon/light/tube/tinted
	name = "light tube (tinted)"
	desc = "A replacement light tube."
	brightness_color = "#F0008C" //PANK. Shouldn't show up normally, so it's a telltale color something's wrong.

/obj/item/weapon/light/tube/tinted/coldtint
	name = "light tube (cold-light)"
	desc = "A replacement light tube. This one emits soothing high-Kelvin light."
	icon_state = "ltube"
	base_state = "ltube"
	item_state = "c_tube"
	brightness_color = "#B0DCEA"

//super warm tint (color literally stolen from candles), for the Bar
/obj/machinery/light/warmtint
	current_light = /obj/item/weapon/light/tube/tinted/warmtint

/obj/item/weapon/light/tube/tinted/warmtint
	name = "light tube (incandescent)"
	desc = "A replacement light tube. This one emits amber low-Kelvin light."
	icon_state = "ltube"
	base_state = "ltube"
	item_state = "c_tube"
	brightness_color = "#E09D37"

//green tint
/obj/machinery/light/greentint
	current_light = /obj/item/weapon/light/tube/tinted/greentint

/obj/item/weapon/light/tube/tinted/greentint
	name = "light tube (green)"
	desc = "A replacement light tube. This one has an integrated green filter for vibrant green light."
	icon_state = "ltube"
	base_state = "ltube"
	item_state = "c_tube"
	brightness_color ="#A8FFB1"

/obj/item/weapon/light/tube/tinted/lighttinted
	name = "light tube (tinted)"
	brightness_color ="#B0C4DE"


/obj/machinery/light/floor
	icon_state = "floor_empty"
	base_state = "floor"
	desc = "A floor lighting fixture."
	light_type = /obj/item/weapon/light/bulb
	current_light = /obj/item/weapon/light/bulb/techbright
	construct_type = /obj/machinery/light_construct/floor
	layer = 2
	plane = -15

/obj/machinery/light/floor/neonblue
	current_light = /obj/item/weapon/light/bulb/neonblue

/obj/machinery/light/floortube
	icon_state = "floortube_empty"
	base_state = "floortube"
	desc = "A floor lighting fixture."
	current_light = /obj/item/weapon/light/tube/tinted/lighttinted
	construct_type = /obj/machinery/light_construct/floortube
	layer = 2
	plane = -15

/obj/item/weapon/light/tube/large
	w_class = ITEM_SIZE_SMALL
	name = "large light tube"
	brightness_range = 8


/obj/machinery/light/small/warmtint
	current_light = /obj/item/weapon/light/bulb/warmtint

/obj/structure/rail
	name = "rail"
	desc = "A huge metal bar."
	icon = 'icons/obj/rails.dmi'
	icon_state = "rail"
	density = 0
	anchored = 1
//	opasity = 1
	changey = 1
	pixeldisy = 8

/obj/structure/rail/light
	light_range = 5
	light_power = 1
	light_color = "#7DD3FF"
	icon_state = "light"

/obj/structure/rail/light/New()
	if(prob(90))
		icon_state = "lightout"
		update_icon()
		set_light(0)
		return ..()

/obj/structure/rail/light/Destroy()
	set_light(0)
	return ..()
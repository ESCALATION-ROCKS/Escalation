/obj/structure/electricpole
	name = "electric pole"
	desc = "That's a generic electric pole."
	icon = 'icons/obj/coldwar/electricpole.dmi'
	icon_state = "el_pole"
	density = 1
	plane = -10
	anchored = 1

/obj/machinery/transformer
	name = "power transformer"
	desc = "That's a pretty big power transformer. It emits weird relaxing hum."
	icon = 'icons/obj/coldwar/powertransformer.dmi'
	icon_state = "powertr"
	density = 1
	plane = -10
	anchored = 1

	process()
		playsound(src.loc, 'sound/effects/generatorhum.ogg', 100, 0)
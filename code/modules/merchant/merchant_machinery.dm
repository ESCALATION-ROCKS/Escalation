/obj/machinery/merchant_pad
	name = "Cargo Disposal Pad"
	desc = "Place things here to trade."
	icon = 'icons/obj/pipes/disposal.dmi'
	icon_state = "intake"
	anchored = 1
	density = 0

/obj/machinery/merchant_pad/proc/get_target()
	var/turf/T = get_turf(src)
	for(var/a in T)
		if(a == src || (!istype(a,/obj) && !istype(a,/mob/living)) || istype(a,/obj/effect))
			continue
		return a

/obj/machinery/merchant_pad/proc/get_targets()
	. = list()
	var/turf/T = get_turf(src)
	for(var/a in T)
		if(a == src || (!istype(a,/obj) && !istype(a,/mob/living)) || istype(a,/obj/effect))
			continue
		. += a
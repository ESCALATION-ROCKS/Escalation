/obj/machinery/hotplate

	name = "electric hotplate"
	icon = 'icons/obj/machines/kettle.dmi'
	icon_state = "hotplate"
	layer = BELOW_OBJ_LAYER
	density = 0
	anchored = 0

	power_channel = EQUIP
	use_power = 1
	idle_power_usage = 0

	desc = "The promise of a hot beverage for some, a fire hazard for others."

	overlays = new/list()

	var/obj/item/weapon/reagent_containers/beaker = null
	var/datum/thermal_manager/tmg = new /datum/thermal_manager/heater/hotplate()

	//We use this to know when to rebuild the icon.
	var/reagent_count = 0
	var/reagent_volume = 0

/obj/machinery/hotplate/New()
	//This is so it will match the tmg profile
	active_power_usage = tmg.max_power
	..()

/obj/machinery/hotplate/attackby(var/obj/item/O as obj, var/mob/user as mob)

	if ( !istype(O,/obj/item/weapon/reagent_containers/glass) && !istype(O,/obj/item/weapon/reagent_containers/food/drinks))
		return 1


	if (beaker)
		return 0
	else
		src.beaker =  O
		user.drop_item()
		O.loc = src
		update_icon()
		return 1

/obj/machinery/hotplate/attack_ai(mob/user as mob)
	return 0

/obj/machinery/hotplate/attack_hand(mob/user as mob)
	interact(user)

/obj/machinery/hotplate/attack_robot(var/mob/user)
	if(Adjacent(user))
		return attack_hand(user)

/obj/machinery/hotplate/examine(mob/user)
	..()
	if(stat) //none of this shows if there is no power.
		return
	if(get_dist(user,src) > 5)	//none of this shows if we are too far away.
		return
	if(Adjacent(user))			//which temperature to display: nothing, the room air or 20°C?
		var/T = T20C
		if(beaker && beaker.reagents.total_volume)
			T = beaker.reagents.temperature
		else if(use_power == 2)
			T = tmg.expected_temp
		else if(loc)
			var/datum/gas_mixture/air = loc.return_air()
			T = air.temperature
		to_chat(user,"The indicator reads: [round(T-T0C,0.1)]°C.")
	if(beaker)
		to_chat(user,"There is \a [beaker] on the heating pad.")

//interacting either ejects the beaker, or toggles power
/obj/machinery/hotplate/interact(mob/user as mob)
	if(beaker)
		if(stat)
			return
		beaker.loc = src.loc
		beaker = null
		update_icon()
		return

	to_chat(user,"You flick \the [src] power switch.")
	if(use_power == 1)
		update_use_power(2)
	else
		update_use_power(1)
	if(!stat)
		update_icon()

/obj/machinery/hotplate/process()
	if( beaker && (reagent_volume != beaker.reagents.total_volume || reagent_count != length(beaker.reagents.reagent_list)))
		update_icon()	//Update the icon if the reagent mix has changed.
	if(stat & BROKEN)
		update_use_power(0)
		update_icon()
		return
	if(stat & NOPOWER)
		return
	if(use_power != 2)
		return

	var/turf/simulated/location = loc
	var/datum/gas_mixture/air = null
	var/environment_temp = T20C

	if(location)
		air = loc.return_air()
		environment_temp = air.temperature

	var/heatloss = tmg.max_power

	if( beaker && beaker.reagents.total_volume)		//warm up the content.
		tmg.get_effective_power(beaker.reagents.temperature, tmg.max_power, environment_temp)
		beaker.reagents.adjust_energy(tmg.last_power_transfered)
		heatloss = tmg.last_power_lost
		//warning("Heating content: [tmg.last_power_transfered]J")

	if(air)
		if(heatloss)
			air.add_thermal_energy(heatloss)		//warm up the air with the leakage power.
			//warning("Heating air: [heatloss]J")

/obj/machinery/hotplate/update_icon()
	overlays.Cut()
	if(use_power == 2 && stat == 0)
		overlays += image(icon,icon_state = "on")
	if(beaker)
		reagent_volume = beaker.reagents.total_volume
		reagent_count = beaker.reagents.reagent_list
		var/mutable_appearance/B = new(beaker.appearance)
		B.pixel_y = -3
		B.pixel_x = -1
		overlays += B

/obj/machinery/hotplate/chiller
	name = "electric chiller"
	desc = "Little more than a gadget, but it can make ice if you give it enough time."
	icon_state = "chiller"
	tmg = new /datum/thermal_manager/cooler/chiller()

/obj/machinery/hotplate/chiller/process()
	if( beaker && (reagent_volume != beaker.reagents.total_volume || reagent_count != length(beaker.reagents.reagent_list)))
		update_icon()	//Update the icon if the reagent mix has changed.
	if(stat & BROKEN)
		update_use_power(0)
		update_icon()
		return
	if(stat & NOPOWER)
		return
	if(use_power != 2)
		return

	var/turf/simulated/location = loc
	var/datum/gas_mixture/air = null
	var/environment_temp = T20C

	if(location)
		air = loc.return_air()
		environment_temp = air.temperature

	var/heatloss = tmg.max_power

	if( beaker && beaker.reagents.total_volume)		//warm up the content.
		tmg.get_effective_power(beaker.reagents.temperature, tmg.max_power, environment_temp)
		beaker.reagents.adjust_energy(tmg.last_power_transfered)
		heatloss = tmg.max_power - tmg.last_power_transfered
		//warning("Heating content: [tmg.last_power_transfered]J")

	if(air)
		if(heatloss)
			air.add_thermal_energy(heatloss)		//warm up the air with the leakage power.
			//warning("Heating air: [heatloss]J")

/obj/machinery/hotplate/chiller/update_icon()
	overlays.Cut()
	if(use_power == 2 && stat == 0)
		overlays += image(icon,icon_state = "on")
	if(beaker)
		overlays += image(icon,icon_state = "beaker")
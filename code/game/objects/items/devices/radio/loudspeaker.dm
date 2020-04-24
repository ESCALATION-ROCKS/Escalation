/obj/item/device/radio/intercom/loudspeaker
	name = "loudspeaker"
	desc = "This is where your commandant shouts at you from."
	icon_state = "loudspeaker"
	canhear_range = 7
	listening = 1
	broadcasting = 0
	layer = MOB_LAYER + 1
	anchored = 1

/obj/item/device/radio/intercom/loudspeaker/station
	frequency  = 1449

/obj/item/device/radio/intercom/loudspeaker/interact(mob/user)
	return //It's just a loudspeaker

/obj/item/device/radio/intercom/loudspeaker/process()
	return //to stop icon from changing

/obj/item/device/radio/intercom/loudspeakerradio
	name = "radio set"
	desc = "Used for station-wide announcements"
	icon_state = "speakerradio"
	item_state = "speakerradio"
//	freerange = 0
	anchored = 1
	canhear_range = 1
	frequency  = 1449

/obj/item/device/radio/intercom/loudspeakerradio/process()
	if(world.time - last_tick > 30 || last_tick == -1)
		last_tick = world.time

		if(!src.loc)
			on = 0
		else
			var/area/A = src.loc.loc
			if(!A || !isarea(A))
				on = 0
			else
				on = A.powered(EQUIP) // set "on" to the power status

		if(!on)
			icon_state = "speakerradio"
		else
			icon_state = "speakerradio"
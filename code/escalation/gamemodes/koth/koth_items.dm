var/list/obj/machinery/capbeacon/cps = list()

/obj/machinery/capbeacon
	name = "Capture Beacon"
	desc = "Navigational beacon used by European forces to direct their armies. Useful for your team if captured."
	//icon = ''
	//icon_state = "comm_tower"
	density = TRUE
	anchored = TRUE
	var/time_to_hack = 200 // How much attackby() delay beacon will get//
	var/capture_points = 5 // How much point faction will get upon capturing//
	var/ppm = 8 // Points per minute, This can be less than 1 if you want less tickets//
	var/controlled_by

/obj/machinery/capbeacon/New()
	..()
	name = "Battlefield Navigational Beacon"
	cps.Add(src)
	update_desc()

/obj/machinery/capbeacon/Destroy()
	cps.Remove(src)
	..()

/obj/machinery/capbeacon/proc/update_desc()
	if(controlled_by)

		desc = "Navigational beacon used by European forces to direct their armies. Useful for your team if captured. This one is under [controlled_by]'s control."
	else
		desc = "Navigational beacon used by European forces to direct their armies. Useful for your team if captured. This one is not under anyone's control."

/obj/machinery/capbeacon/attack_hand(mob/living/user)
	. = ..()
	if(!ishuman(user))
		to_chat(user, "<span class = 'warning'>You are not a human, get outta' here.</span>")
		return
	var/mob/living/carbon/human/H = user
	if(controlled_by == H.team_picked)
		to_chat(H, "<span class = 'notice'>[get_area(loc)] is already captured by your faction!</span>")
		return
	if(do_after(user, 2))
		controlled_by = H.team_picked
		to_chat("[H.team_picked] has captured the hill beacon at [get_area(loc)].")
		update_desc()
		cap_tickets(controlled_by, capture_points)

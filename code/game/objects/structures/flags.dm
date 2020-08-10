/obj/structure/sign/flag
/*	var/ripped = 0

/obj/structure/sign/flag/attack_hand(mob/user as mob)
	if(!ripped)
		playsound(src.loc, 'sound/items/poster_ripped.ogg', 100, 1)
		for(var/i = 0 to 3)
			if(do_after(user, 10))
				playsound(src.loc, 'sound/items/poster_ripped.ogg', 100, 1)
			else
				return
		visible_message("<span class='warning'>[user] rips [src]!</span>" )
		icon_state += "_ripped"
		ripped = 1
*/
/obj/structure/sign/flag/provgov
	name = "\improper Provisional Government Flag"
	desc = "Obviously, that's a flag of the Provisional Government. You've get a bullet in your head if you ever mind something about ripping it."
	icon_state = "provgoverment_flag"
	layer = ABOVE_OBJ_LAYER + 0.1
	plane = ABOVE_HUMAN_PLANE

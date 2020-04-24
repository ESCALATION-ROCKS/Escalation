// -----------------------------
//       Quickdraw storage
// -----------------------------
//These items are pouches and cases made to be kept in belts or pockets to quickly draw objects from
//Largely inspired by the vest pouches on Colonial Marines

/obj/item/weapon/storage/
	var/quickmode = 0
	var/quick_allowed = 0

/obj/item/weapon/storage/attack_hand(mob/user as mob)
	if(src.loc == user) //If they aren't holding us, we do nothing special
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			if(quickmode)
				var/first_item = contents[1]
				if(first_item && !H.get_active_hand()) //Do we have anything to give you?
					H.put_in_hands(first_item)
					return

			if(H.l_store == src && !H.get_active_hand()) //overrides
				src.open(user)
				return
			if(H.r_store == src && !H.get_active_hand())
				src.open(user)
				return
	..() //Nothing special happened, go call the other proc


/obj/item/weapon/storage/New()
	..()
	if(!quick_allowed)
		verbs -= /obj/item/weapon/storage/verb/toggle_quickdraw

/obj/item/weapon/storage/verb/toggle_quickdraw()
	set name = "Switch Quickdraw Mode"
	set category = "Object"

	quickmode = !quickmode
	switch (quickmode)
		if(1)
			to_chat(usr, "[src] now draws the first object inside.")
		if(0)
			to_chat(usr, "[src] now opens as a container.")

/obj/item/weapon/storage/AltClick(mob/user)
	..()
	if(src.loc == user && quick_allowed) //Are they carrying us?
		toggle_quickdraw()

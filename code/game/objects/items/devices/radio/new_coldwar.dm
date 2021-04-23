
//backpack item
/obj/item/weapon/radioset
	name = "radio kit"
	icon = 'icons/obj/coldwar/radio.dmi'
	icon_state = "defibunit"
	item_state = "defibunit"
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_LARGE
	action_button_name = "Remove/Replace Headset"


	var/obj/item/device/radio/escalation/radio
	var/obj/item/device/radio/escalation/headset

/obj/item/weapon/radioset/New() //starts without a cell for rnd
	..()
	if(ispath(radio))
		radio = new radio(src, src)
	if(ispath(headset))
		headset = new headset(src, src)
	else
		radio = new(src, src)

	update_icon()

/obj/item/weapon/radioset/Destroy()
	. = ..()
	QDEL_NULL(radio)
	QDEL_NULL(headset)

/obj/item/weapon/radioset/update_icon()

	if(radio) //in case paddles got destroyed somehow.
		if(radio.loc == src)
			icon_state = "[initial(icon_state)]"
		else
			icon_state = "[initial(icon_state)]-inuse"

	if(headset) //in case paddles got destroyed somehow.
		if(headset.loc == src)
			icon_state = "[initial(icon_state)]"
		else
			icon_state = "[initial(icon_state)]-inuse"

/obj/item/weapon/radioset/ui_action_click()
	toggle_headset()

/obj/item/weapon/radioset/attack_hand(mob/user)
	if(loc == user)
		toggle_radio()
	else
		..()

/obj/item/weapon/radioset/MouseDrop()
	if(ismob(src.loc))
		if(!CanMouseDrop(src))
			return
		var/mob/M = src.loc
		if(!M.unEquip(src))
			return
		src.add_fingerprint(usr)
		M.put_in_any_hand_if_possible(src)


/obj/item/weapon/radioset/attackby(obj/item/weapon/W, mob/user, params)
	if(W == radio)
		reattach_radio(user)
	else
		return ..()

//Paddle stuff

/obj/item/weapon/radioset/verb/toggle_radio()
	set name = "Toggle Receiver"
	set category = "Object"

	var/mob/living/carbon/human/user = usr
	if(!radio)
		to_chat(user, "<span class='warning'>The receiver is missing!</span>")
		return

	if(radio.loc != src)
		reattach_radio(user) //Remove from their hands and back onto the defib unit
		return

	if(!slot_check())
		to_chat(user, "<span class='warning'>The [src] needs to be secured on your back before taking out the [radio].</span>")
	else
		if(!usr.put_in_hands(radio)) //Detach the paddles into the user's hands
			to_chat(user, "<span class='warning'>You need a free hand to hold the receiver!</span>")
		update_icon() //success

///headset code
/obj/item/weapon/radioset/verb/toggle_headset()
	set name = "Toggle Headset"
	set category = "Object"

	var/mob/living/carbon/human/user = usr
	if(!headset)
		to_chat(user, "<span class='warning'>The headset is missing!</span>")
		return

	if(headset.loc != src)
		reattach_headset(user) //Remove from their hands and back onto the defib unit
		return

	if(!slot_check())
		to_chat(user, "<span class='warning'>The [src] needs to be secured on your back before taking out the [radio].</span>")
	else
		if(!usr.put_in_hands(headset)) //Detach the paddles into the user's hands
			to_chat(user, "<span class='warning'>You need a free hand to hold the headset!</span>")
		update_icon() //success

//checks that the base unit is in the correct slot to be used
/obj/item/weapon/radioset/proc/slot_check()
	var/mob/M = loc
	if(!istype(M)) ///////everything is currently set to 1 to allow off-hand usage
		return 1

	if((slot_flags & SLOT_BACK) && M.get_equipped_item(slot_back) == src)
		return 1
	/*if((slot_flags & SLOT_GUN_SLOT) && M.get_equipped_item(slot_gun_slot) == src)
		return 1*/
	/*if((slot_flags & SLOT_BELT) && M.get_equipped_item(slot_belt) == src)
		return 1*/

	return 1

/obj/item/weapon/radioset/dropped(mob/user)
	..()
	reattach_radio(user) 

/obj/item/weapon/radioset/nato/headset/dropped(mob/user)
	..() 
	reattach_headset(user)

/obj/item/weapon/radioset/warpact/headset/dropped(mob/user)
	..()
	reattach_headset(user)

/obj/item/weapon/radioset/proc/reattach_radio(mob/user)
	if(!radio) return

	if(ismob(radio.loc))
		var/mob/M = radio.loc
		if(M.drop_from_inventory(radio, src))
			to_chat(user, "<span class='notice'>\The [radio] snaps back into the main unit.</span>")
	else
		radio.forceMove(src)

	update_icon()
	
/obj/item/weapon/radioset/proc/reattach_headset(mob/user)
	if(!headset) return

	if(ismob(headset.loc))
		var/mob/H = headset.loc
		if(H.drop_from_inventory(headset, src))
			to_chat(user, "<span class='notice'>\The [headset] snaps back into the main unit.</span>")
	else
		headset.forceMove(src)

	update_icon()
/*
	Base Unit Subtypes
*/

/obj/item/device/radio/escalation/linked
	var/obj/item/weapon/radioset/base_unit

/obj/item/device/radio/escalation/linked/New(newloc, var/obj/item/weapon/radioset/radios)
	base_unit = radios
	..(newloc)

/obj/item/device/radio/escalation/linked/Destroy()
	if(base_unit)
		//ensure the base unit's icon updates
		if(base_unit.radio == src)
			base_unit.radio = null
			base_unit.headset = null
			base_unit.update_icon()
		base_unit = null
	return ..()

/obj/item/device/radio/escalation/linked/dropped(mob/user)
	..() //update twohanding
	if(base_unit)
		base_unit.reattach_radio(user) //paddles attached to a base unit should never exist outside of their base unit or the mob equipping the base unit


/obj/item/device/radio/escalation/linked/nato/headset/dropped(mob/user)
	..() //update twohanding
	if(base_unit)
		base_unit.reattach_headset(user) //paddles attached to a base unit should never exist outside of their base unit or the mob equipping the base unit

/obj/item/device/radio/escalation/linked/warpact/headset/dropped(mob/user)
	..() //update twohanding
	if(base_unit)
		base_unit.reattach_headset(user) //paddles attached to a base unit should never exist outside of their base unit or the mob equipping the base unit


var/global/list/army_channels_ph = list(
	null
)

/obj/item/device/radio/escalation/
	icon = 'icons/obj/coldwar/radio.dmi'
	icon_state = "warpact_radio"
	item_state = "warpact_radio"

	flags = CONDUCT
	slot_flags = SLOT_BACK
	throw_speed = 2
	throw_range = 6
	w_class = ITEM_SIZE_HUGE

/obj/item/device/radio/escalation/New()
	..()
	internal_channels = army_channels_ph.Copy()

/obj/item/device/radio/escalation/linked/warpact
	name = "R-105D receiver"
	icon_state = "r105d-receiver"
	item_state = "r105d-receiver"
	frequency = 1449
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	badquality = 1

/obj/item/device/radio/escalation/linked/nato
	name = "AN/PRC-77 receiver"
	icon_state = "prc77-receiver"
	item_state = "prc77-receiver"
	frequency = 1351
	slot_flags = null
	w_class = ITEM_SIZE_HUGE
	badquality = 1

/obj/item/device/radio/escalation/linked/warpact/headset
	name = "R-105D headset"
	icon_state = "r105d-headset"
	item_state = "r105d-headset"
	frequency = 1449
	slot_flags = SLOT_EARS
	w_class = ITEM_SIZE_HUGE
	badquality = 1

/obj/item/device/radio/escalation/linked/nato/headset
	name = "AN/PRC-77 headset"
	icon_state = "prc77-headset"
	item_state = "prc77-headset"
	frequency = 1351
	slot_flags = SLOT_EARS
	w_class = ITEM_SIZE_HUGE
	badquality = 1


/obj/item/weapon/radioset/prc77
	name = "PRC-77"
	desc = "A standard-issued NATO radio set equipped with receiver."
	radio = /obj/item/device/radio/escalation/linked/nato
	headset = /obj/item/device/radio/escalation/linked/nato/headset
	icon_state = "prc77"
	item_state = "prc77"
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE


/obj/item/weapon/radioset/r105d
	name = "R-105D"
	desc = "A standard-issued Warsaw Pact radio set equipped with headset."
	radio = /obj/item/device/radio/escalation/linked/warpact
	headset = /obj/item/device/radio/escalation/linked/warpact/headset
	icon_state = "r105d"
	item_state = "r105d"
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE


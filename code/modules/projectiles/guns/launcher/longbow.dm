/obj/item/weapon/warrow
	name = "arrow"
	desc = "Just an arrow."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "arrow"
	var/icon_flight = "arrow-flight" //so it doesn't look so weird when shot
	flags = CONDUCT
	slot_flags = SLOT_BELT | SLOT_EARS
	throwforce = 3
	force = 3
	sharp = 1
	w_class = ITEM_SIZE_TINY

/obj/item/weapon/warrow/proc/removed() //Helper for metal rods falling apart.
	return

/obj/item/weapon/gun/launcher/longbow
	name = "longbow"
	desc = "Too simple but still effective."
	icon = 'icons/obj/coldwar/items.dmi'
	icon_state = "bow"
	item_state = "crossbow-solid"
	fire_sound = 'sound/weapons/punchmiss.ogg' // TODO: Decent THWOK noise.
	fire_sound_text = "a solid thunk"
	fire_delay = 15
	slot_flags = SLOT_BACK

	var/obj/item/weapon/warrow/arrow
	var/tension = 0                         // Current draw on the bow.
	var/max_tension = 3                     // Highest possible tension.
	var/release_speed = 7                   // Speed per unit of tension.
	var/current_user                        // Used to check if the crossbow has changed hands since being drawn.

/obj/item/weapon/gun/launcher/longbow/update_release_force()
	release_force = tension*release_speed

/obj/item/weapon/gun/launcher/longbow/consume_next_projectile(mob/user=null)
	if(tension <= 0)
		to_chat(user, "<span class='warning'>\The [src] is not drawn back!</span>")
		return null
	return arrow

/obj/item/weapon/gun/launcher/longbow/handle_post_fire(mob/user, atom/target)
	arrow = null
	tension = 0
	update_icon()
	arrow.icon_state = arrow.icon_flight
	..()

/obj/item/weapon/gun/launcher/longbow/attack_self(mob/living/user as mob)
	if(tension)
		if(arrow)
			user.visible_message("[user] relaxes the tension on [src]'s string and removes [arrow].","You relax the tension on [src]'s string and remove [arrow].")
			arrow.loc = get_turf(src)
			var/obj/item/weapon/warrow/A = arrow
			arrow = null
			A.removed(user)
		else
			user.visible_message("[user] relaxes the tension on [src]'s string.","You relax the tension on [src]'s string.")
		tension = 0
		update_icon()
	else
		draw(user)

/obj/item/weapon/gun/launcher/longbow/proc/draw(var/mob/user as mob)

	if(!arrow)
		to_chat(user, "You don't have anything nocked to [src].")
		return

	if(user.restrained())
		return

	current_user = user
	user.visible_message("[user] begins to draw back the string of [src].","<span class='notice'>You begin to draw back the string of [src].</span>")
	tension = 1

	while(arrow && tension && loc == current_user)
		if(!do_after(user, 2, src)) //crossbow strings don't just magically pull back on their own.
			user.visible_message("[usr] stops drawing and relaxes the string of [src].","<span class='warning'>You stop drawing back and relax the string of [src].</span>")
			tension = 0
			update_icon()
			return

		//double check that the user hasn't removed the arrow in the meantime
		if(!(arrow && tension && loc == current_user))
			return

		tension++
		update_icon()

		if(tension >= max_tension)
			tension = max_tension
			return

		user.visible_message("[usr] draws back the string of [src]!","<span class='notice'>You continue drawing back the string of [src]!</span>")

/obj/item/weapon/gun/launcher/longbow/proc/increase_tension(var/mob/user as mob)

	if(!arrow || !tension || current_user != user) //Arrow has been fired, bow has been relaxed or user has changed.
		return


/obj/item/weapon/gun/launcher/longbow/attackby(obj/item/W as obj, mob/user as mob)
	if(!arrow)
		if (istype(W,/obj/item/weapon/warrow))
			user.drop_from_inventory(W, src)
			arrow = W
			user.visible_message("[user] slides [arrow] into [src].","You slide [arrow] into [src].")
			update_icon()
			return
	else
		..()

/obj/item/weapon/gun/launcher/longbow/update_icon()
	if(tension > 1)
		icon_state = "bow-drawn"
	else if(arrow)
		icon_state = "bow-nocked"
	else
		icon_state = "bow"

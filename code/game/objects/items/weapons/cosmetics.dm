/obj/item/weapon/lipstick
	gender = PLURAL
	name = "red lipstick"
	desc = "A generic brand of lipstick."
	icon = 'icons/obj/items.dmi'
	icon_state = "lipstick"
	w_class = ITEM_SIZE_TINY
	slot_flags = null
	var/colour = "red"
	var/open = 0


/obj/item/weapon/lipstick/purple
	name = "purple lipstick"
	colour = "purple"

/obj/item/weapon/lipstick/jade
	name = "jade lipstick"
	colour = "jade"

/obj/item/weapon/lipstick/black
	name = "black lipstick"
	colour = "black"


/obj/item/weapon/lipstick/random
	name = "lipstick"

/obj/item/weapon/lipstick/random/New()
	colour = pick("red","purple","jade","black")
	name = "[colour] lipstick"



/obj/item/weapon/facepaint
	gender = PLURAL
	name = "facepaint"
	desc = "Paint, for your face. Who woulda thought?."
	icon = 'icons/obj/items.dmi'
	icon_state = "camo"
	var/colour = "green"
	w_class = 1.0
	var/uses = 1 ///////we dont want anyone to pick it off the ground and use it


///////////CM13 facepaints - ported by yours truly severepwnage (with no permission :trollface:)

/obj/item/weapon/facepaint/green
	name = "green facepaint"
	colour = "green"
	icon_state = "camogreen"

/obj/item/weapon/facepaint/brown
	name = "brown facepaint"
	colour = "brown"
	icon_state = "camobrown"

/obj/item/weapon/facepaint/black
	name = "black facepaint"
	colour = "black"
	icon_state = "camoblack"

/obj/item/weapon/facepaint/sniper
	name = "Full body camouflage paint"
	colour = "full"
	icon_state = "camofull"


/obj/item/weapon/facepaint/attack(mob/M as mob, mob/user as mob)
	if(!ismob(M)) return

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.lip_style)	//if they already have lipstick on
			to_chat(user, "<span class='warning'>You need to wipe the old paint off with paper first!</span>")
			return
		if(H == user)
			paint_face(H, user)
			return 1
		else
			to_chat(user, "<span class='notice'>You attempt to apply [src] on [H]...</span>")
			to_chat(H, "<span class='notice'>[user] is trying to apply [src] on your face...</span>")
			if(alert(H,"Will you allow [user] to paint your face?",,"Sure","No") == "Sure")
				if( user && loc == user && (user in range(1,H)) ) //Have to be close and hold the thing.
					paint_face(H, user)
					return 1

	to_chat(user, "<span class='warning'>Foiled!</span>")


/obj/item/weapon/facepaint/proc/paint_face(var/mob/living/carbon/human/H, var/mob/user)
	if(!H || !user) return //In case they're passed as null.
	user.visible_message("<span class='notice'>[user] carefully applies [src] on [H]'s face.</span>", \
						 "<span class='notice'>You apply [src].</span>")
	H.lip_style = colour
	H.update_lipstick()
	uses--
	if(!uses)
		qdel(src)


/////////////Disabled this so people won't put on fucking lipsticks they find around - severe
/*/obj/item/weapon/lipstick/attack_self(mob/user as mob)
	to_chat(user, "<span class='notice'>You twist \the [src] [open ? "closed" : "open"].</span>")
	open = !open
	if(open)
		icon_state = "[initial(icon_state)]_[colour]"
	else
		icon_state = initial(icon_state)

/obj/item/weapon/lipstick/attack(mob/M as mob, mob/user as mob)
	if(!open)	return

	if(!istype(M, /mob))	return

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.lip_style)	//if they already have lipstick on
			to_chat(user, "<span class='notice'>You need to wipe off the old lipstick first!</span>")
			return
		if(H == user)
			user.visible_message("<span class='notice'>[user] does their lips with \the [src].</span>", \
								 "<span class='notice'>You take a moment to apply \the [src]. Perfect!</span>")
			H.lip_style = colour
			H.update_body()
		else
			user.visible_message("<span class='warning'>[user] begins to do [H]'s lips with \the [src].</span>", \
								 "<span class='notice'>You begin to apply \the [src].</span>")
			if(do_after(user, 20, H) && do_after(H, 20, needhand = 0, progress = 0, incapacitation_flags = INCAPACITATION_NONE))	//user needs to keep their active hand, H does not.
				user.visible_message("<span class='notice'>[user] does [H]'s lips with \the [src].</span>", \
									 "<span class='notice'>You apply \the [src].</span>")
				H.lip_style = colour
				H.update_body()
	else
		to_chat(user, "<span class='notice'>Where are the lips on that?</span>")*/

//you can wipe off lipstick with paper! see code/modules/paperwork/paper.dm, paper/attack()


/obj/item/weapon/haircomb //sparklysheep's comb
	name = "purple comb"
	desc = "A pristine purple comb made from flexible plastic."
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	icon = 'icons/obj/items.dmi'
	icon_state = "purplecomb"
	item_state = "purplecomb"

/obj/item/weapon/haircomb/attack_self(mob/user)
	user.visible_message("<span class='notice'>[user] uses [src] to comb their hair with incredible style and sophistication. What a [user.gender == FEMALE ? "lady" : "guy"].</span>")
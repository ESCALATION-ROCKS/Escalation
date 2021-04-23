/obj/item/stack/bullets
	name = "bullets"
	desc = "It's a stack of bullets"
	singular_name = "bullet"
	icon = 'icons/obj/coldwar/ammo.dmi'
	icon_state = null
	w_class = ITEM_SIZE_TINY
	max_amount = 5
	flags = NOBLUDGEON

/obj/item/stack/bullets/New(var/amount = 1)
	if(isnum(amount))
		amount = amount
	update_icon()

/obj/item/stack/bullets/afterattack(var/obj/item/I as obj, mob/user as mob, proximity)
	if(amount <= 0)
		Destroy()
	update_icon()

/obj/item/stack/bullets/attack_self(var/mob/user)
	var/take_amount = input(user, "How many?:", "Character Name")  as num|null
	if(take_amount && take_amount < amount)
		amount -= take_amount
		var/obj/item/stack/bullets/new_stack = new src.type
		new_stack.amount = take_amount
		new_stack.update_icon()
		if(user.put_in_inactive_hand(new_stack))
			to_chat(user, "<span class='notice'>You remove [take_amount] from the [new_stack.name]</span>")
		else
			new_stack.dropInto(user.loc)

		update_icon()


/obj/item/stack/bullets/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, stacktype))
		if(add(1))
			W.Destroy()
	..()
	update_icon()

/obj/item/stack/bullets/update_icon()
	icon_state = "[initial(icon_state)][amount]"

/obj/item/stack/bullets/buckshot
	name = "buckshot shells"
	desc = "It's a stack of buckshot"
	singular_name = "buckshol"
	icon_state = "gshell"
	w_class = ITEM_SIZE_TINY
	max_amount = 5
	amount = 1
	flags = NOBLUDGEON
	stacktype = /obj/item/ammo_casing/shotgun/pellet

/obj/item/stack/bullets/beanbag
	name = "beanbag shells"
	desc = "It's a stack of beanbag shells"
	singular_name = "buckshol"
	icon_state = "bshell"
	w_class = ITEM_SIZE_TINY
	max_amount = 5
	amount = 1
	flags = NOBLUDGEON
	stacktype = /obj/item/ammo_casing/shotgun/beanbag

/obj/item/stack/bullets/a762x51
	name = "7.62x51 bullet stack"
	desc = "A normal looking bullet casing."
	singular_name = "Rifle bullet"
	icon_state = "rifle-casing"
	w_class = ITEM_SIZE_TINY
	max_amount = 5
	amount = 1
	flags = NOBLUDGEON
	stacktype = /obj/item/ammo_casing/a762x51
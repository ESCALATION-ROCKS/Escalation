/obj/item/weapon/masterkey
	slot_flags = SLOT_ID
	icon = 'icons/obj/items.dmi'
	icon_state = "keyring"
	name = "keyring"
	slot_flags = SLOT_EARS
	desc = "This holds your keys. Use this when you want to unlock something, dummy."
	w_class = 2

	New()
		update_icon_state()

/obj/item/weapon/masterkey/examine(mob/user)
	if (locate(src) in get_step(user, user.dir) || user.contents.Find(src))
		user << "<span class = 'notice'>[desc]. Right now it's holding [print_keys()].</span>"
	..()

/obj/item/weapon/masterkey/proc/print_keys()
	if (contents.len == 0)
		return "nothing"
	else
		var/ret = ""
		for (var/obj/item/weapon/key/key in contents)
			ret = "[ret],[key]"
		return ret


/obj/item/weapon/masterkey/proc/update_icon_state()
	switch (contents.len)
		if (0)
			icon_state = "keyring"
		if (1)
			icon_state = "keyring-1"
		if (2)
			icon_state = "keyring-2"
		if (3)
			icon_state = "keyring-3"
		if (4)
			icon_state = "keyring-4"
		if (5 to INFINITY)
			icon_state = "keyring-5"

/obj/item/weapon/masterkey/attack_self(mob/user)
	if (!contents.len)
		return // ������ ����� ������ ��������� ���� ��� ����� ����� ����� ������ ���� �� �� �
	else
		var/which
		var/obj/item/weapon/key/key
		which = input("Take out which key?", "Key Storage", key) as null|anything in contents
		if(which)
			contents -= which
			user.put_in_hands(which)
			update_icon_state()
			visible_message("<span class = 'notice'>[user] takes a key from their keychain.</span>", "<span class = 'notice'>You take out [which].</span>")

/obj/item/weapon/masterkey/attackby(obj/item/I as obj, mob/user as mob)
	if (istype(I, /obj/item/weapon/key))
		var/obj/item/weapon/key/key = I
		if(!user.unEquip(I))
			return
		I.forceMove(src)
		contents += key
		update_icon_state()
		visible_message("<span class = 'notice'>[user] puts a key in their keychain.</span>", "<span class = 'notice'>You put a key in your keychain.</span>")

/obj/item/weapon/masterkey/Initialize()
	update_icon_state()

/obj/item/weapon/masterkey/natosurgeon/New()
	new /obj/item/weapon/key/natomed (src)
	new /obj/item/weapon/key/natoofficer (src)
	update_icon_state()

/obj/item/weapon/masterkey/natopl/New()
	new /obj/item/weapon/key/natoofficer (src)
	new /obj/item/weapon/key/natonco (src)
	new /obj/item/weapon/key/natomed (src)
	update_icon_state()

/obj/item/weapon/masterkey/wpsurgeon/New()
	new /obj/item/weapon/key/wpmed (src)
	new /obj/item/weapon/key/wpofficer (src)
	update_icon_state()

/obj/item/weapon/masterkey/wppl/New()
	new /obj/item/weapon/key/wpmed (src)
	new /obj/item/weapon/key/wpofficer (src)
	new /obj/item/weapon/key/wpnco (src)
	update_icon_state()
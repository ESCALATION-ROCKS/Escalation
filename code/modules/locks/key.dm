/obj/item/weapon/key
	name = "key"
	desc = "Used to unlock things."
	icon = 'icons/obj/items.dmi'
	icon_state = "keys"
	w_class = 1
	slot_flags = SLOT_EARS
	var/key_data = ""

/obj/item/weapon/key/New()
	..()
	icon_state = "key[rand(1, 4)]"


/obj/item/weapon/key/New(var/newloc,var/data)
	if(data)
		key_data = data
	..(newloc)

/obj/item/weapon/key/proc/get_data(var/mob/user)
	return key_data

/obj/item/weapon/key/soap
	name = "soap key"
	desc = "a fragile key made using a bar of soap."
	var/uses = 0

/obj/item/weapon/key/soap/get_data(var/mob/user)
	uses--
	if(uses == 1)
		user << "<span class='warning'>\The [src] is going to break soon!</span>"
	else if(uses <= 0)
		user.drop_item(src)
		user << "<span class='warning'>\The [src] crumbles in your hands.</span>"
		qdel(src)
	return ..()


/obj/item/weapon/key/wpofficer
	key_data = "wpofficer"

/obj/item/weapon/key/wpnco
	key_data = "wpnco"

/obj/item/weapon/key/wpmed
	key_data = "wpmed"

/obj/item/weapon/key/natoofficer
	key_data = "natoofficer"

/obj/item/weapon/key/natonco
	key_data = "natonco"

/obj/item/weapon/key/natomed
	key_data = "natomed"


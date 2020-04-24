/obj/item/weapon/key
	name = "key"
	desc = "Used to unlock things."
	icon = 'icons/obj/items.dmi'
	icon_state = "keys"
	w_class = 1
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

/obj/item/weapon/key/nvasurg
	key_data = "nvasurg"

/obj/item/weapon/key/sasurg
	key_data = "sasurg"

/obj/item/weapon/key/wpmed
	key_data = "wpmed"

/obj/item/weapon/key/wpofficer
	key_data = "wpofficer"

/obj/item/weapon/key/ddrco
	key_data = "ddrco"

/obj/item/weapon/key/saco
	key_data = "saco"

/obj/item/weapon/key/sazampolit
	key_data = "sazampolit"

/obj/item/weapon/key/wpkapt
	key_data = "wpkapt"

/obj/item/weapon/key/sakapt
	key_data = "sakapt"

/obj/item/weapon/key/ddrkapt
	key_data = "ddrkapt"

/obj/item/weapon/key/bdwco
	key_data = "bdwco"

/obj/item/weapon/key/usmcco
	key_data = "usmcco"

/obj/item/weapon/key/usmckapt
	key_data = "usmckapt"

/obj/item/weapon/key/bdwkapt
	key_data = "bdwkapt"

/obj/item/weapon/key/usmcdoc
	key_data = "usmcdoc"

/obj/item/weapon/key/bdwdoc
	key_data = "bdwdoc"

/obj/item/weapon/key/natomed
	key_data = "natomed"

/obj/item/weapon/key/natoof
	key_data = "natoof"


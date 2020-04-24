/obj/item/weapon/storage/wardrobe
	name = "wardrobe"
	icon = 'icons/obj/objects.dmi'
	icon_state = "closet1"
	w_class = ITEM_SIZE_NO_CONTAINER
	max_w_class = ITEM_SIZE_HUGE
	max_storage_space = 56
	anchored = 1.0
	density = 0
	anchored = 0
	cant_hold = list(/obj/item/weapon/storage/secure/briefcase)

	attack_hand(mob/user as mob)
		return attack_self(user)

	New()
		pixel_x = 0
		pixel_y = 0

/obj/item/weapon/storage/wardrobe/alt1
	icon_state = "closet2"
/obj/item/weapon/storage/wardrobe/alt2
	icon_state = "closet3"
/obj/item/weapon/storage/wardrobe/alt3
	icon_state = "closet4"

/obj/item/weapon/storage/wardrobe/tumbo4ka
	name = "chest drawer"
	icon_state = "tumbo4ka1"
	max_storage_space = 25

/obj/item/weapon/storage/wardrobe/tumbo4ka/alt
	icon_state = "tumbo4ka2"

/obj/item/weapon/storage/wardrobe/tumbo4ka/cupboard
	icon_state = "cupboard"
	name = "cupboard"
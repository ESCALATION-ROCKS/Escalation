/obj/item/stack/metalcoil
	name = "metal coil"
	desc = "Just a coil. Can be used for building, or something."
	singular_name = "coil"
	icon = 'icons/obj/coldwar/items.dmi'
	icon_state = "coil"
	flags = CONDUCT
	w_class = ITEM_SIZE_LARGE
	force = 2.0
	throwforce = 15.0
	throw_speed = 5
	throw_range = 20
	matter = list(DEFAULT_WALL_MATERIAL = 1875)
	max_amount = 20
	center_of_mass = null
	attack_verb = list("hit", "bludgeoned", "whacked")

/obj/item/stack/rope
	name = "rope"
	desc = "Just a rope. Can be used for building, or something."
	singular_name = "rope"
	icon_state = "rope"
	icon = 'icons/obj/coldwar/items.dmi'
	flags = CONDUCT
	w_class = ITEM_SIZE_LARGE
	force = 5.0
	throwforce = 15.0
	throw_speed = 5
	throw_range = 20
	max_amount = 20
	center_of_mass = null
	attack_verb = list("hit", "bludgeoned", "whacked")
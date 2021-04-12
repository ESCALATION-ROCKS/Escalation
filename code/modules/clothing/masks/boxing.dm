/obj/item/clothing/mask/balaclava
	name = "balaclava"
	desc = "A black balaclava vowen from wool to keep your face warm."
	icon_state = "balaclava"
	item_state = "balaclava"
	wearable = 1
	flags_inv = BLOCKHAIR
	body_parts_covered = FACE|HEAD
	down_body_parts_covered = HEAD
	down_flags_inv = BLOCKHEADHAIR
	down_icon_state = "balaclava_r"
	item_flags = FLEXIBLEMATERIAL
	pull_mask = 1
	w_class = ITEM_SIZE_SMALL
	sprite_sheets = list(
		SPECIES_TAJARA = 'icons/mob/species/tajaran/mask.dmi',
		SPECIES_UNATHI = 'icons/mob/species/unathi/mask.dmi',
		)
	var/show_above_suit = 0

/obj/item/clothing/mask/balaclava/alt
	name = "balaclava"
	icon_state = "balaclavam"
	down_icon_state = "balaclava_r"
	wearable = 1

/obj/item/clothing/mask/balaclava/tactical
	name = "green balaclava"
	icon_state = "swatclava"
	down_icon_state = "swatclava_r"
	wearable = 1

/obj/item/clothing/mask/balaclava/tactical/alt
	name = "green balaclava"
	icon_state = "swatclavam"
	down_icon_state = "swatclava_r"
	wearable = 1

/obj/item/clothing/mask/balaclava/coif
	name = "heat-absorbent coif"
	desc = "A wool coif to keep your face warm."
	icon_state = "coif"
	item_state = "coif"
	wearable = 1
	item_flags = FLEXIBLEMATERIAL
	down_icon_state = "coif_r"

/obj/item/clothing/mask/tacticalmask
	name = "bandana"
	desc = "A tan piece of cloth you can cover your face with or hang around your neck."
	icon_state = "scarf_tan"
	item_state = "scarf_tan"
	flags_inv = null
	body_parts_covered = null
	pull_mask = 0
	var/show_above_suit = 0
	w_class = ITEM_SIZE_SMALL

/obj/item/clothing/mask/tacticalmask/blue
	name = "blue bandana"
	desc = "A blue piece of cloth you can cover your face with or hang around your neck."
	icon_state = "scarf_gray"
	item_state = "scarf_gray"

/obj/item/clothing/mask/tacticalmask/green
	name = "green bandana"
	desc = "A green piece of cloth you can cover your face with or hang around your neck."
	icon_state = "scarf_green"
	item_state = "scarf_green"

/obj/item/clothing/mask/luchador
	name = "Luchador Mask"
	desc = "Worn by robust fighters, flying high to defeat their foes!"
	icon_state = "luchag"
	item_state = "luchag"
	flags_inv = HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE
	w_class = ITEM_SIZE_SMALL
	siemens_coefficient = 3.0

/obj/item/clothing/mask/luchador/tecnicos
	name = "Tecnicos Mask"
	desc = "Worn by robust fighters who uphold justice and fight honorably."
	icon_state = "luchador"
	item_state = "luchador"

/obj/item/clothing/mask/luchador/rudos
	name = "Rudos Mask"
	desc = "Worn by robust fighters who are willing to do anything to win."
	icon_state = "luchar"
	item_state = "luchar"
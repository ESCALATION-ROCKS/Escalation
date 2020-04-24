/obj/item/weapon/material/twohanded/baseballbat
	name = "bat"
	desc = "HOME RUN!"
	icon_state = "metalbat0"
	base_icon = "metalbat"
	item_state = "metalbat"
	w_class = ITEM_SIZE_LARGE
	throwforce = 7
	attack_verb = list("smashed", "beaten", "slammed", "smacked", "struck", "battered", "bonked")
	hitsound = 'sound/weapons/genhit3.ogg'
	default_material = "wood"
	force_divisor = 1.1           // 22 when wielded with weight 20 (steel)
	unwielded_force_divisor = 0.9 // 15 when unwielded based on above.
	slot_flags = SLOT_BACK
	weapon_speed_delay = 10

/obj/item/weapon/material/twohanded/baseballbat/nailed
	name = "nailed bat"
	throwforce = 9
	force_divisor = 1.4           // 22 when wielded with weight 20 (steel)
	unwielded_force_divisor = 0.9 // 15 when unwielded based on above.
	slot_flags = SLOT_BACK


//Predefined materials go here.
/obj/item/weapon/material/twohanded/baseballbat/metal/New(var/newloc)
	..(newloc,"steel")

/obj/item/weapon/material/twohanded/baseballbat/uranium/New(var/newloc)
	..(newloc,"uranium")

/obj/item/weapon/material/twohanded/baseballbat/gold/New(var/newloc)
	..(newloc,"gold")

/obj/item/weapon/material/twohanded/baseballbat/platinum/New(var/newloc)
	..(newloc,"platinum")

/obj/item/weapon/material/twohanded/baseballbat/diamond/New(var/newloc)
	..(newloc,"diamond")
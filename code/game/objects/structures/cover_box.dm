/obj/structure/coverbox
	name = "metal coverbox"
	desc = "Strong coverbox, designed for usual needs."
	icon = 'icons/obj/structures.dmi'
	icon_state = "panel00"
	density = 0
	anchored = 1
	layer = 2.45

/obj/structure/coverbox/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/wrench))
		user << "\blue Now disassembling panel"
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		if(do_after(user,10))
			del(src)
		return

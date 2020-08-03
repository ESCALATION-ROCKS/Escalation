//holsters

/obj/item/weapon/storage/belt/holster
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_HUGE
	name = "pistol holster"
	desc = "This holster can hold pistol and one magazine."
	icon_state = "holster"
	item_state = null
	slot_flags = SLOT_NHOLSTER
	storage_slots = 3
	storage_slots = null
	use_sound = 'sound/items/interactions/holsteropen.wav'
	close_sound = 'sound/items/interactions/holsterclose.wav'
	var/icon_closed = "holster_empty" //Empty for now.
	var/holds_weapons_now = 0 //Generic variable to determine if the holster already holds a gun.
	var/holds_weapons_max = 1 //How many guns can it hold? I think this can be any thing from 1 to whatever. Should calculate properly.
	var/obj/item/current_item //The gun it holds, used for referencing later so we can update the icon.
	var/special_item
	var/holster_sound = null
	var/unholster_sound = null

	proc/update_icon_special() //Update icon is called from within the other storage procs, and we don't want that.
		if(holds_weapons_now) //So it has a gun, let's make an icon.
			icon_state = icon_closed
			item_state = "holster1"
		else
			overlays.Cut()
			icon = initial(icon)
			icon_state = initial(icon_state)
			item_state = initial(item_state)
			//update_inv_belt()

	//There are only two types here that can be inserted, and they are mutually exclusive. We only track the gun.
	can_be_inserted(obj/item/W as obj, stop_messages = 0) //We don't need to stop messages, but it can be left in.
		if( ..() ) //If the parent did their thing, this should be fine. It pretty much handles all the checks.
			if(istype(W,special_item)) //Is it a gun?
				if(holds_weapons_now == holds_weapons_max) //Are we at our gun capacity?
					if(!stop_messages) usr << "<span class='notice'>\The [src] already holds a special weapon.<span>"
					return //Nothing else to do.
				holds_weapons_now++ //Slide it in.
				playsound(src.loc, holster_sound, 50, 1)
				if(!current_item) //If there's no active gun, we want to make this our icon.
					current_item = W
				update_icon_special()
			else //Must be ammo.
		//We have slots open for the gun, so in total we should have storage_slots - weapons_max in slots, plus whatever is already in the belt.
				if(((storage_slots - holds_weapons_max) + holds_weapons_now) <= contents.len) // We're over capacity, and the space is reserved for a gun.
					if(!stop_messages) usr << "<span class='notice'>\The [src] can't hold any more magazines.<span>"
					return
			return 1

	remove_from_storage(obj/item/W as obj)
		if(..() ) //Same deal, this will handle things.
			if(istype(W,/obj/item/weapon)) //Is it a gun?
				holds_weapons_now-- //Remove it.
				playsound(src.loc, unholster_sound, 50, 1)
				if(W == current_item)
					current_item = null
				update_icon_special() //Update.
			return 1

/obj/item/weapon/storage/belt/holster/sa
	name = "Makarov holster"
	storage_slots = 3
	holster_sound = 'sound/effects/holster/holsterin.ogg'
	unholster_sound = 'sound/effects/holster/holsterout.ogg'
	special_item = /obj/item/weapon/gun/projectile/makarov
	desc = "This holster can hold Makarov pistol and one magazine."
	special_item = /obj/item/weapon/gun/projectile/makarov
	startswith = list(
		/obj/item/weapon/gun/projectile/makarov,
		/obj/item/ammo_magazine/a9x18
		)
	can_hold = list(
		/obj/item/weapon/gun/projectile/makarov,
		/obj/item/ammo_magazine/a9x18
		)

/obj/item/weapon/storage/belt/holster/csla
	name = "CZ82 holster"
	storage_slots = 3
	holster_sound = 'sound/effects/holster/holsterin.ogg'
	unholster_sound = 'sound/effects/holster/holsterout.ogg'
	special_item = /obj/item/weapon/gun/projectile/cz82
	desc = "This holster can hold CZ82 pistol and one magazine."
	startswith = list(
		/obj/item/weapon/gun/projectile/cz82,
		/obj/item/ammo_magazine/a9x18
		)
	can_hold = list(
		/obj/item/weapon/gun/projectile/cz82,
		/obj/item/ammo_magazine/a9x18
		)

/obj/item/weapon/storage/belt/holster/usmc
	special_item = /obj/item/weapon/gun/projectile/colt911
	holster_sound = 'sound/effects/holster/tactiholsterin.ogg'
	unholster_sound = 'sound/effects/holster/tactiholsterout.ogg'
	name = "ALICE M12 holster"
	icon_state = "alice_holster"
	icon_closed = "alice_holster_empty"
	storage_slots = 3
	desc = "This holster can hold a M1911A1 and one magazine."
	startswith = list(
		/obj/item/weapon/gun/projectile/colt911,
		/obj/item/ammo_magazine/c45m,
		)
	can_hold = list(
		/obj/item/weapon/gun/projectile/colt911,
		/obj/item/ammo_magazine/c45m,
		)

/obj/item/weapon/storage/belt/holster/aps
	special_item = /obj/item/weapon/gun/projectile/aps
	holster_sound = 'sound/effects/holster/holsterin.ogg'
	unholster_sound = 'sound/effects/holster/holsterout.ogg'
	name = "APS holster"
	icon_state = "apsholster"
	icon_closed = "apsholster_empty"
	storage_slots = 4

	desc = "This holster can hold an APS and two magazines."
	startswith = list(
		/obj/item/weapon/gun/projectile/aps,
		/obj/item/ammo_magazine/a9x18b,
		/obj/item/ammo_magazine/a9x18b,
		)
	can_hold = list(
		/obj/item/weapon/gun/projectile/aps,
		/obj/item/ammo_magazine/a9x18b,
		)

/obj/item/weapon/storage/belt/holster/bdw
	name = "P1 holster"
	storage_slots = 3
	holster_sound = 'sound/effects/holster/holsterin.ogg'
	unholster_sound = 'sound/effects/holster/holsterout.ogg'
	special_item = /obj/item/weapon/gun/projectile/walther
	desc = "This holster can hold Walter P1 and one magazine."
	startswith = list(
		/obj/item/weapon/gun/projectile/walther,
		/obj/item/ammo_magazine/a9x19
		)
	can_hold = list(
		/obj/item/weapon/gun/projectile/walther,
		/obj/item/ammo_magazine/a9x19
		)

/obj/item/weapon/storage/belt/holster/finn
	name = "Lahti holster"
	storage_slots = 3
	holster_sound = 'sound/effects/holster/holsterin.ogg'
	unholster_sound = 'sound/effects/holster/holsterout.ogg'
	special_item = /obj/item/weapon/gun/projectile/lahti
	desc = "This holster can hold Lahti and one magazine."
	startswith = list(
		/obj/item/weapon/gun/projectile/lahti,
		/obj/item/ammo_magazine/a9x19
		)
	can_hold = list(
		/obj/item/weapon/gun/projectile/lahti,
		/obj/item/ammo_magazine/a9x19
		)

/obj/item/weapon/storage/belt/holster/hk69
	name = "HK69 holster"
	storage_slots = 1
	max_w_class = ITEM_SIZE_HUGE
	holster_sound = 'sound/effects/holster/holsterin.ogg'
	unholster_sound = 'sound/effects/holster/holsterout.ogg'
	special_item = /obj/item/weapon/gun/launcher/grenade/hk69
	desc = "This holster can hold the HK69 Grenade Launcher."
	startswith = list(
		/obj/item/weapon/gun/launcher/grenade/hk69
		)
	can_hold = list(
		/obj/item/weapon/gun/launcher/grenade/hk69,
		/obj/item/weapon/grenade/frag/shell40mm
		)



/obj/item/weapon/storage/belt/holster/sheath
	name = "sheath"
	desc = "This sheath can hold a bayonet."
	max_storage_space = 2
	slot_flags = SLOT_NHOLSTER | SLOT_LPOUCH | SLOT_RPOUCH

/obj/item/weapon/storage/belt/holster/sheath/bdw
	name = "Kampfmesser M68 sheath"
	desc = "This sheath can hold a Kampfmesser M68 bayonet."
	special_item = /obj/item/weapon/material/knife/bayonet/bdw
	holster_sound = 'sound/effects/holster/sheathin.ogg'
	unholster_sound = 'sound/effects/holster/sheathout.ogg'
	icon_state = "kampfm_sheath"
	icon_closed = "kampfm_sheath_empty"
	startswith = list(
		/obj/item/weapon/material/knife/bayonet/bdw)
	can_hold = list(
		/obj/item/weapon/material/knife/bayonet/bdw)

/obj/item/weapon/storage/belt/holster/sheath/soviet74
	name = "6H4 sheath"
	desc = "This sheath can hold a 6H4 bayonet."
	special_item = /obj/item/weapon/material/knife/bayonet/sa/
	holster_sound = 'sound/effects/holster/sheathin.ogg'
	unholster_sound = 'sound/effects/holster/sheathout.ogg'
	icon_state = "6h4_sheath"
	icon_closed = "6h4_sheath_empty"
	startswith = list(
		/obj/item/weapon/material/knife/bayonet/sa/a6h4)
	can_hold = list(
		/obj/item/weapon/material/knife/bayonet/sa)

/obj/item/weapon/storage/belt/holster/sheath/sovietm
	name = "6H3 sheath"
	desc = "This sheath can hold a 6H3 bayonet."
	special_item = /obj/item/weapon/material/knife/bayonet/sa/
	icon_state = "6h3_sheath"
	icon_closed = "6h3_sheath_empty"
	startswith = list(
		/obj/item/weapon/material/knife/bayonet/sa/a6h3)
	can_hold = list(
		/obj/item/weapon/material/knife/bayonet/sa)

/obj/item/weapon/storage/belt/holster/sheath/usmc
	name = "M7 sheath"
	desc = "This sheath can hold a M7 bayonet."
	special_item = /obj/item/weapon/material/knife/bayonet/usmc
	holster_sound = 'sound/effects/holster/sheathin.ogg'
	unholster_sound = 'sound/effects/holster/sheathout.ogg'
	icon_state = "m9_sheath"
	icon_closed = "m9_sheath_empty"
	startswith = list(
		/obj/item/weapon/material/knife/bayonet/usmc)
	can_hold = list(
		/obj/item/weapon/material/knife/bayonet/usmc)

/obj/item/weapon/storage/belt/holster/sheath/ddr74
	name = "Modell AK74 bayonet sheath"
	desc = "This sheath can hold a Modell AK74 bayonet."
	special_item = /obj/item/weapon/material/knife/bayonet/sa/a6h4
	holster_sound = 'sound/effects/holster/sheathin.ogg'
	unholster_sound = 'sound/effects/holster/sheathout.ogg'
	icon_state = "6h4ddr_sheath"
	icon_closed = "6h4ddr_sheath_empty"
	startswith = list(
		/obj/item/weapon/material/knife/bayonet/sa/a6h4/ddr)
	can_hold = list(
		/obj/item/weapon/material/knife/bayonet/sa/a6h4/ddr)

/obj/item/weapon/storage/belt/holster/sheath/ddrm
	name = "Mehrzweckbajonett M1959 sheath"
	desc = "This sheath can hold a Mehrzweckbajonett M1959."
	special_item = /obj/item/weapon/material/knife/bayonet/sa/a6h3
	holster_sound = 'sound/effects/holster/sheathin.ogg'
	unholster_sound = 'sound/effects/holster/sheathout.ogg'
	icon_state = "6h3ddr_sheath"
	icon_closed = "6h3ddr_sheath_empty"
	startswith = list(
		/obj/item/weapon/material/knife/bayonet/sa/a6h3/ddr)
	can_hold = list(
		/obj/item/weapon/material/knife/bayonet/sa/a6h3/ddr)

/obj/item/weapon/storage/belt/holster/flaskstorage
	name = "flask pouch"
	desc = "This one can hold some kind of flask."
	max_storage_space = 2
	w_class = 2
	slot_flags = SLOT_NHOLSTER | SLOT_LPOUCH | SLOT_RPOUCH

/obj/item/weapon/storage/belt/holster/flaskstorage/nato
	special_item = /obj/item/weapon/reagent_containers/food/drinks/flask/wornflask/nato
	icon_state = "natoflask"
	icon_closed = "natoflask_empty"
	startswith = list(
		/obj/item/weapon/reagent_containers/food/drinks/flask/wornflask/nato)
	can_hold = list(
		/obj/item/weapon/reagent_containers/food/drinks/flask/wornflask)

/obj/item/weapon/storage/belt/holster/flaskstorage/soviet
	icon_state = "warpacflask"
	icon_closed = "warpacflask_empty"
	special_item = /obj/item/weapon/reagent_containers/food/drinks/flask/wornflask/
	startswith = list(
		/obj/item/weapon/reagent_containers/food/drinks/flask/wornflask/)
	can_hold = list(
		/obj/item/weapon/reagent_containers/food/drinks/flask/wornflask)



//generic pouches

// POUCHES //
/obj/item/weapon/storage/belt/suit/ammo/
	slot_flags = SLOT_LPOUCH | SLOT_RPOUCH

/obj/item/weapon/storage/belt/suit/ammo/bdw
	w_class = ITEM_SIZE_HUGE
	name = "G3 magazine pouch"
	desc = "Has enough space to hold two 7.62 STANAG magazines."
	icon_state = "bdw_ammo"
	item_state = "bdw_ammo"
	storage_slots = 2
	can_hold = list(
		/obj/item/ammo_magazine/c762x51s,
		/obj/item/ammo_magazine/a9x19
		)
	use_sound = 'sound/items/interactions/natopouchopen.wav'
	close_sound = 'sound/items/interactions/natopouchclose.wav'

/obj/item/weapon/storage/belt/suit/ammo/bdw/lmg
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_LARGE
	name = "MG3 box pouch"
	desc = "Has enough space to hold one MG3 box."
	icon_state = "bdw_ammo_lmg"
	storage_slots = 1
	can_hold = list(
		/obj/item/ammo_magazine/c762x51b/bdw
		)

/obj/item/weapon/storage/belt/suit/ammo/usmc
	w_class = ITEM_SIZE_HUGE
	name = "M16 magazine pouch"
	desc = "Has enough space to hold three 5.56 STANAG magazines."
	icon_state = "usmc_ammo"
	item_state = "usmc_ammo"
	storage_slots = 3
	can_hold = list(
		/obj/item/ammo_magazine/c556x45m,
		/obj/item/ammo_magazine/c762x51s,
		/obj/item/ammo_magazine/c45m
		)
	use_sound = 'sound/items/interactions/natopouchopen.wav'
	close_sound = 'sound/items/interactions/natopouchclose.wav'

/obj/item/weapon/storage/belt/suit/ammo/usmc/lmg
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_LARGE
	name = "M60 ammo pouch"
	desc = "Has enough space to hold one M60 box."
	icon_state = "usmc_ammo_lmg"
	item_state = "usmc_ammo_lmg"
	storage_slots = 1
	can_hold = list(
		/obj/item/ammo_magazine/c762x51b
		)

/obj/item/weapon/storage/belt/suit/ammo/sa
	w_class = ITEM_SIZE_HUGE
	name = "AK magazine pouch"
	desc = "Has enough space to hold four AK magazines."
	icon_state = "sa_ammo"
	item_state = "sa_ammo"
	storage_slots = 4
	can_hold = list(
		/obj/item/ammo_magazine/c545x39m,
		/obj/item/ammo_magazine/c762x39m,
		/obj/item/ammo_magazine/a9x18
		)
	use_sound = 'sound/items/interactions/sovietpouchopen.wav'
	close_sound = 'sound/items/interactions/sovietpouchclose.wav'
	open_delay = 5

/obj/item/weapon/storage/belt/suit/ammo/sa/rpk
	w_class = ITEM_SIZE_HUGE
	name = "RPK magazine pouch"
	desc = "Has enough space to hold four RPK magazines."
	icon_state = "sa_ammo"
	item_state = "sa_ammo"
	storage_slots = 4
	can_hold = list(
		/obj/item/ammo_magazine/c545x39m,
		/obj/item/ammo_magazine/c545x39b,
		/obj/item/ammo_magazine/c762x39m,
		/obj/item/ammo_magazine/c762x39b,
		/obj/item/ammo_magazine/a9x18
		)

/obj/item/weapon/storage/belt/suit/ammo/sa/svd
	w_class = ITEM_SIZE_HUGE
	name = "SVD magazine pouch"
	desc = "Has enough space to hold four SVD magazines."
	icon_state = "sa_svd"
	item_state = "sa_ammo"
	storage_slots = 4
	can_hold = list(
		/obj/item/ammo_magazine/c762x54s
		)

/obj/item/weapon/storage/belt/suit/ammo/sa/lmg
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_LARGE
	name = "PKM box pouch"
	desc = "Has enough space to hold to hold one box."
	icon_state = "sa_ammo_lmg"
	storage_slots = 1
	can_hold = list(
		/obj/item/ammo_magazine/c762x54b
		)

/obj/item/weapon/storage/belt/suit/ammo/sa/grenades
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_SMALL
	name = "grenade pouch"
	desc = "Can hold three grenades."
	icon_state = "sa_grenade"
	item_state = "sa_grenade"
	storage_slots = 3
	can_hold = list(/obj/item/weapon/grenade/frag/, /obj/item/weapon/grenade/smokebomb, /obj/item/weapon)


/obj/item/weapon/storage/belt/suit/ammo/nvaddr
	w_class = ITEM_SIZE_HUGE
	name = "strichtarn AK magazine pouch"
	desc = "Has enough space to hold four AK magazines."
	icon_state = "nvaddr_ammo"
	item_state = "nvaddr_ammo"
	storage_slots = 4
	can_hold = list(
		/obj/item/ammo_magazine/c545x39m,
		/obj/item/ammo_magazine/c545x39b,
		/obj/item/ammo_magazine/c762x39m,
		/obj/item/ammo_magazine/a9x18
		)
	use_sound = 'sound/items/interactions/sovietpouchopen.wav'
	close_sound = 'sound/items/interactions/sovietpouchclose.wav'
	open_delay = 5

/obj/item/weapon/storage/belt/suit/ammo/nvaddr/lmg
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_LARGE
	name = "strichtarn RPD drum pouch"
	desc = "Has enough space to hold one RPD drum."
	icon_state = "nvaddr_ammo_lmg"
	item_state = "nvaddr_ammo_lmg"
	storage_slots = 1
	can_hold = list(
		/obj/item/ammo_magazine/c762x39d
		)

/obj/item/weapon/storage/belt/suit/ammo/nvaddr/pkm
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_LARGE
	name = "PKM box pouch"
	desc = "Has enough space to hold one PKM box."
	icon_state = "nvaddr_ammo_pkm"
	item_state = "nvaddr_ammo_pkm"
	storage_slots = 1
	can_hold = list(
		/obj/item/ammo_magazine/c762x54b
		)

/obj/item/weapon/storage/belt/suit/ammo/nvaddr/rpk
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_LARGE
	name = "strichtarn RPK magazine pouch"
	desc = "Has enough space to hold four RPK magazines."
	icon_state = "nvaddr_ammo"
	item_state = "nvaddr_ammo"
	storage_slots = 4
	can_hold = list(
		/obj/item/ammo_magazine/c762x39b,
		/obj/item/ammo_magazine/c762x39m
		)

/obj/item/weapon/storage/belt/suit/ammo/nvaddr/grenades
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_SMALL
	name = "strichtarn grenade pouch"
	desc = "Can hold three grenades."
	icon_state = "nvaddr_grenade"
	item_state = "nvaddr_grenade"
	storage_slots = 3
	can_hold = list(/obj/item/weapon/grenade/frag/, /obj/item/weapon/grenade/smokebomb)

//finnish

/obj/item/weapon/storage/belt/suit/ammo/finn
	w_class = ITEM_SIZE_HUGE
	name = "RK magazine pouch"
	desc = "Has enough space to hold four RK magazines."
	icon_state = "sa_ammo"
	item_state = "sa_ammo"
	storage_slots = 4
	can_hold = list(
		/obj/item/ammo_magazine/c762x39m,
		/obj/item/ammo_magazine/a9x18
		)
	use_sound = 'sound/items/interactions/sovietpouchopen.wav'
	close_sound = 'sound/items/interactions/sovietpouchclose.wav'
	open_delay = 5

/obj/item/weapon/storage/belt/suit/ammo/finn/lmg
	w_class = ITEM_SIZE_HUGE
	max_w_class = ITEM_SIZE_LARGE
	name = "KK box pouch"
	desc = "Has enough space to hold one box."
	icon_state = "sa_ammo_lmg"
	storage_slots = 1
	can_hold = list(
		/obj/item/ammo_magazine/c762x39v
	)


/obj/item/weapon/storage/belt/suit/ammo/finn/grenades
	w_class = ITEM_SIZE_HUGE
	max_w_class = 2
	name = "strichtarn grenade pouch"
	desc = "Can hold three grenades."
	icon_state = "nvaddr_grenade"
	item_state = "nvaddr_grenade"
	storage_slots = 3
	can_hold = list(/obj/item/weapon/grenade/frag/, /obj/item/weapon/grenade/smokebomb)


//ugl nade pouches

/obj/item/weapon/storage/belt/suit/ammo/sa/ugrenades
	name = "soviet grenade satchel"
	desc = "Generic grenade satchel used by Warsaw pact. Has enough space to hold six underbarrel grenades."
	icon_state = "sa_ugl"
	storage_slots = 6
	can_hold = list (/obj/item/weapon/grenade/frag/vog25/, /obj/item/weapon/grenade/smokebomb/vog25, /obj/item/weapon/grenade/frag/shell40mm/, /obj/item/weapon/grenade/smokebomb/shell40mm)

/obj/item/weapon/storage/belt/suit/ammo/nvaddr/ugrenades
	name = "strichtarn grenade satchel"
	desc = "Strichtarn pattern grenade satchel used by Nationale Volksarmee. Has enough space to hold six underbarrel grenades."
	icon_state = "nnaddr_ugl"
	storage_slots = 6
	can_hold = list (/obj/item/weapon/grenade/frag/vog25/, /obj/item/weapon/grenade/smokebomb/vog25, /obj/item/weapon/grenade/frag/shell40mm/, /obj/item/weapon/grenade/smokebomb/shell40mm)

/obj/item/weapon/storage/belt/suit/ammo/usmc/ugrenades
	name = "grenade bandolier"
	desc = "Generic grenade satchel used by NATO forces. Has enough space to hold six underbarrel grenades."
	icon_state = "usmc_grenbandolier"
	storage_slots = 6
	can_hold = list (/obj/item/weapon/grenade/frag/shell40mm/, /obj/item/weapon/grenade/smokebomb/shell40mm, /obj/item/weapon/grenade/frag/vog25/, /obj/item/weapon/grenade/smokebomb/vog25)

/obj/item/weapon/storage/belt/suit/ammo/usmc/flarepouch
	name = "Flare Pouch."
	desc = "Generic flare pouch."
	icon_state = "usmc_grenbandolier" //FUCKING PLACEHOLDER
	storage_slots = 12
	can_hold = list (/obj/item/device/flashlight/flare/)

/obj/item/weapon/storage/belt/suit/ammo/bdw/flarepouch
	name = "Flare Pouch."
	desc = "Generic flare pouch."
	icon_state = "bdw_grenbandolier" //placeholder
	storage_slots = 12
	can_hold = list (/obj/item/device/flashlight/flare/)

/obj/item/weapon/storage/belt/suit/ammo/bdw/ugrenades
	name = "grenade bandolier"
	desc = "Generic grenade satchel used by NATO forces. Has enough space to hold six underbarrel grenades."
	icon_state = "bdw_grenbandolier"
	storage_slots = 6
	can_hold = list (/obj/item/weapon/grenade/frag/shell40mm/, /obj/item/weapon/grenade/smokebomb/shell40mm, /obj/item/weapon/grenade/frag/vog25/, /obj/item/weapon/grenade/smokebomb/vog25)
/obj/machinery/door/unpowered/simple/coldwar
	icon = 'icons/obj/doors/coldwardoors.dmi'
	icon_base = "epicfail"
	icon_state = "epicfail"
	density = 1
	opacity = 1

/obj/machinery/door/unpowered/simple/coldwar/wood ///////Doors mostly made out of wood
    name = "wooden door"
    desc = null
    color = null
	
/obj/machinery/door/unpowered/simple/coldwar/metal ///////Doors mostly made out of a metal
    name = "metal door"
    desc = null
    color = null
    /////material_name = steel

/obj/machinery/door/unpowered/simple/coldwar/glass /////// Doors that have large glass panels on them
    name = "glass door"
    desc = null
    color = null
    /////material_name = glass


/////////////Wood doors

/obj/machinery/door/unpowered/simple/coldwar/wood/classic
	icon_base = "classicdoor"
	icon_state = "classicdoor"

/obj/machinery/door/unpowered/simple/coldwar/wood/classic/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "wood", complexity)
	color = null

/obj/machinery/door/unpowered/simple/coldwar/wood/home
	icon_base = "homedoor"
	icon_state = "homedoor"

/obj/machinery/door/unpowered/simple/coldwar/wood/home/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "wood", complexity)
	color = null

/obj/machinery/door/unpowered/simple/coldwar/wood/parlor
	icon_base = "parlordoor"
	icon_state = "parlordoor"

/obj/machinery/door/unpowered/simple/coldwar/wood/parlor/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "wood", complexity)
	color = null

/obj/machinery/door/unpowered/simple/coldwar/wood/double
	icon_base = "doubledoor"
	icon_state = "doubledoor"

/obj/machinery/door/unpowered/simple/coldwar/wood/double/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "wood", complexity)
	color = null

/obj/machinery/door/unpowered/simple/coldwar/wood/room
	icon_base = "roomdoor"
	icon_state = "roomdoor"

/obj/machinery/door/unpowered/simple/coldwar/wood/room/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "wood", complexity)
	color = null

/obj/machinery/door/unpowered/simple/coldwar/wood/shed
	icon_base = "sheddoor"
	icon_state = "sheddoor"

/obj/machinery/door/unpowered/simple/coldwar/wood/shed/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "wood", complexity)
	color = null

/obj/machinery/door/unpowered/simple/coldwar/wood/hut ////A really weird wooden door with 1/4th of it gone, I don't know its purpose.
	icon_base = "hutdoor"
	icon_state = "hutdoor"

/obj/machinery/door/unpowered/simple/coldwar/wood/hut/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "wood", complexity)
	color = null
	glass = 1
	set_opacity(0)
	color = null

//////////////Metal doors

/obj/machinery/door/unpowered/simple/coldwar/metal/steel
	icon_state = "steeldoor"
	icon_base = "steeldoor"
	dir = 2 //////don't use the other dirs of this door, they're super fucking ugly

/obj/machinery/door/unpowered/simple/coldwar/metal/steel/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "steel", complexity)
	color = null

/obj/machinery/door/unpowered/simple/coldwar/metal/bulkhead
	icon_state = "bulkheaddoor" 
	icon_base = "bulkheaddoor"

/obj/machinery/door/unpowered/simple/coldwar/metal/bulkhead/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "steel", complexity)
	color = null

/obj/machinery/door/unpowered/simple/coldwar/metal/vault
	icon_state = "vaultdoor" 
	icon_base = "vaultdoor"

/obj/machinery/door/unpowered/simple/coldwar/metal/bulkhead/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "steel", complexity)
	color = null

//////////////Glass doors

/obj/machinery/door/unpowered/simple/coldwar/glass/exterior
	icon_base = "exteriordoor"
	icon_state = "exteriordoor"

/obj/machinery/door/unpowered/simple/coldwar/glass/exterior/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "wood", complexity)
	glass = 1
	set_opacity(0)
	color = null

/obj/machinery/door/unpowered/simple/coldwar/glass/interior
	icon_base = "interiordoor"
	icon_state = "interiordoor"

/obj/machinery/door/unpowered/simple/coldwar/glass/interior/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "wood", complexity)
	glass = 1
	set_opacity(0)
	color = null

/obj/machinery/door/unpowered/simple/coldwar/glass/store
	icon_base = "storedoor"
	icon_state = "storedoor"

/obj/machinery/door/unpowered/simple/coldwar/glass/store/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "glass", complexity)
	glass = 1
	set_opacity(0)
	color = null

/obj/machinery/door/unpowered/simple/coldwar/glass/bars
	icon_base = "barsdoor"
	icon_state = "barsdoor"

/obj/machinery/door/unpowered/simple/coldwar/glass/bars/New(var/newloc,var/material_name,var/complexity)
	..(newloc, "steel", complexity)
	glass = 1
	set_opacity(0)
	color = null
    ///////Not really glass, but it has been defined as glass for 3+ years and caused no problems. As long as it works...


/////////FOB door lock values for mapping convenience

/obj/machinery/door/unpowered/simple/coldwar/metal/steel/wpmed
	initial_lock_value = "wpmed"
/obj/machinery/door/unpowered/simple/coldwar/metal/steel/wpnco
	initial_lock_value = "wpnco"
/obj/machinery/door/unpowered/simple/coldwar/metal/steel/wpofficer
	initial_lock_value = "wpofficer"

/obj/machinery/door/unpowered/simple/coldwar/metal/steel/natomed
	initial_lock_value = "natomed"
/obj/machinery/door/unpowered/simple/coldwar/metal/steel/natonco
	initial_lock_value = "natonco"
/obj/machinery/door/unpowered/simple/coldwar/metal/steel/natoofficer
	initial_lock_value = "natoofficer"
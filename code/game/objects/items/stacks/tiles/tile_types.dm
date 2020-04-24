/* Diffrent misc types of tiles
 * Contains:
 *		Prototype
 *		Grass
 *		Wood
 *		Carpet
 *		Linoleum
 */

/obj/item/stack/tile
	name = "tile"
	singular_name = "tile"
	desc = "A non-descript floor tile."
	randpixel = 7
	w_class = ITEM_SIZE_NORMAL
	max_amount = 100
	icon = 'icons/obj/tiles.dmi'

/*
 * Grass
 */
/obj/item/stack/tile/grass
	name = "grass tile"
	singular_name = "grass floor tile"
	desc = "A patch of grass like they often use on golf courses."
	icon_state = "tile_grass"
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = 0
	origin_tech = list(TECH_BIO = 1)

/*
 * Wood
 */
/obj/item/stack/tile/wood
	name = "wood floor tile"
	singular_name = "wood floor tile"
	desc = "An easy to fit wooden floor tile."
	icon_state = "tile-wood"
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = 0

/obj/item/stack/tile/wood/cyborg
	name = "wood floor tile synthesizer"
	desc = "A device that makes wood floor tiles."
	uses_charge = 1
	charge_costs = list(250)
	stacktype = /obj/item/stack/tile/wood
	build_type = /obj/item/stack/tile/wood


/obj/item/stack/tile/floor
	name = "steel floor tile"
	singular_name = "steel floor tile"
	desc = "Those could work as a pretty decent throwing weapon." //why?
	icon_state = "tile"
	force = 6.0
	matter = list(DEFAULT_WALL_MATERIAL = 937.5)
	throwforce = 15.0
	throw_speed = 5
	throw_range = 20
	flags = CONDUCT

/obj/item/stack/tile/floor_white
	name = "white floor tile"
	singular_name = "white floor tile"
	icon_state = "tile_white"
	matter = list("plastic" = 937.5)

/obj/item/stack/tile/floor_white/fifty
	amount = 50

/obj/item/stack/tile/floor_dark
	name = "dark floor tile"
	singular_name = "dark floor tile"
	icon_state = "fr_tile"
	matter = list("plasteel" = 937.5)

/obj/item/stack/tile/floor_dark/fifty
	amount = 50

/obj/item/stack/tile/floor_freezer
	name = "freezer floor tile"
	singular_name = "freezer floor tile"
	icon_state = "tile_freezer"
	matter = list("plastic" = 937.5)

/obj/item/stack/tile/floor_freezer/fifty
	amount = 50

/obj/item/stack/tile/floor/cyborg
	name = "floor tile synthesizer"
	desc = "A device that makes floor tiles."
	gender = NEUTER
	matter = null
	uses_charge = 1
	charge_costs = list(250)
	stacktype = /obj/item/stack/tile/floor
	build_type = /obj/item/stack/tile/floor

/obj/item/stack/tile/linoleum
	name = "linoleum"
	singular_name = "linoleum"
	desc = "A piece of linoleum. It is the same size as a normal floor tile!"
	icon_state = "tile-linoleum"
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = 0

/obj/item/stack/tile/linoleum/fifty
	amount = 50

/obj/item/stack/tile/bunker
	name = "bunker floor tile"
	singular_name = "bunker floor tile"
	icon_state = "tile_bunker"
	matter = list("plastic" = 937.5)

/obj/item/stack/tile/bunker/fifty
	amount = 50

/obj/item/stack/tile/floor_hydro
	name = "hydro floor tile"
	singular_name = "hydro floor tile"
	icon_state = "tile_hydro"
	matter = list("plastic" = 937.5)

/obj/item/stack/tile/floor_hydro/fifty
	amount = 50

/obj/item/stack/tile/floor_showroom
	name = "showroom floor tile"
	singular_name = "showroom floor tile"
	icon_state = "tile_showroom"
	matter = list("plastic" = 937.5)

/obj/item/stack/tile/floor_showroom/fifty
	amount = 50

/obj/item/stack/tile/floor_cafe
	name = "cafe floor tile"
	singular_name = "cafe floor tile"
	icon_state = "tile_cafe"
	matter = list("plastic" = 937.5)

/obj/item/stack/tile/floor_cafe/fifty
	amount = 50

/obj/item/stack/tile/yellow
	name = "yellow floor tile"
	singular_name = "yellow floor tile"
	icon_state = "tile_bunker_yellow"
	matter = list("plastic" = 937.5)

/obj/item/stack/tile/yellow/fifty
	amount = 50

/obj/item/stack/tile/black
	name = "black floor tile"
	singular_name = "black floor tile"
	icon_state = "tile_bunker_black"
	matter = list("plastic" = 937.5)

/obj/item/stack/tile/black/fifty
	amount = 50

/obj/item/stack/tile/red
	name = "red floor tile"
	singular_name = "red floor tile"
	icon_state = "tile_bunker_red"
	matter = list("plastic" = 937.5)

/obj/item/stack/tile/red/fifty
	amount = 50

/obj/item/stack/tile/polar
	name = "polar floor tile"
	singular_name = "polar floor tile"
	icon_state = "tile_bunker_polar"
	matter = list("plastic" = 937.5)

/obj/item/stack/tile/polar/fifty
	amount = 50

/obj/item/stack/tile/bar
	name = "bar floor tile"
	singular_name = "bar floor tile"
	icon_state = "tile_bar"
	matter = list("plastic" = 937.5)

/obj/item/stack/tile/bar/fifty
	amount = 50

/*
 * Carpets
 */
/obj/item/stack/tile/carpet
	name = "brown carpet"
	singular_name = "brown carpet"
	desc = "A piece of brown carpet."
	icon_state = "tile_carpetbrown"
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = 0

/obj/item/stack/tile/carpet/fifty
	amount = 50

/obj/item/stack/tile/carpetblue
	name = "blue carpet"
	desc = "A piece of blue and gold carpet."
	singular_name = "blue carpet"
	icon_state = "tile_carpetblue"
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = 0

/obj/item/stack/tile/carpetblue/fifty
	amount = 50

/obj/item/stack/tile/carpetblue2
	name = "pale blue carpet"
	desc = "A piece of blue and silver carpet."
	singular_name = "pale blue carpet"
	icon_state = "tile_carpetblue2"
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = 0

/obj/item/stack/tile/carpetblue2/fifty
	amount = 50

/obj/item/stack/tile/carpetpurple
	name = "purple carpet"
	desc = "A piece of purple carpet."
	singular_name = "purple carpet"
	icon_state = "tile_carpetpurple"
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = 0

/obj/item/stack/tile/carpetpurple/fifty
	amount = 50

/obj/item/stack/tile/carpetorange
	name = "orange carpet"
	desc = "A piece of orange carpet."
	singular_name = "orange carpet"
	icon_state = "tile_carpetorange"
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = 0

/obj/item/stack/tile/carpetorange/fifty
	amount = 50

/obj/item/stack/tile/carpetgreen
	name = "green carpet"
	desc = "A piece of green carpet."
	singular_name = "green carpet"
	icon_state = "tile_carpetgreen"
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = 0

/obj/item/stack/tile/carpetgreen/fifty
	amount = 50

/obj/item/stack/tile/carpetred
	name = "red carpet"
	desc = "A piece of red carpet."
	singular_name = "red carpet"
	icon_state = "tile_carpetred"
	force = 1.0
	throwforce = 1.0
	throw_speed = 5
	throw_range = 20
	flags = 0

/obj/item/stack/tile/carpetred/fifty
	amount = 50
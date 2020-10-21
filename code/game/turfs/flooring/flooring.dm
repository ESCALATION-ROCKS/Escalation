var/list/flooring_types

/proc/get_flooring_data(var/flooring_path)
	if(!flooring_types)
		flooring_types = list()
	if(!flooring_types["[flooring_path]"])
		flooring_types["[flooring_path]"] = new flooring_path
	return flooring_types["[flooring_path]"]

// State values:
// [icon_base]: initial base icon_state without edges or corners.
// if has_base_range is set, append 0-has_base_range ie.
//   [icon_base][has_base_range]
// [icon_base]_broken: damaged overlay.
// if has_damage_range is set, append 0-damage_range for state ie.
//   [icon_base]_broken[has_damage_range]
// [icon_base]_edges: directional overlays for edges.
// [icon_base]_corners: directional overlays for non-edge corners.

/decl/flooring
	var/name
	var/desc
	var/icon
	var/icon_base

	var/has_base_range
	var/has_damage_range
	var/has_burn_range
	var/damage_temperature
	var/apply_thermal_conductivity
	var/apply_heat_capacity

	var/build_type      // Unbuildable if not set. Must be /obj/item/stack.
	var/build_cost = 1  // Stack units.
	var/build_time = 0  // BYOND ticks.

	var/descriptor = "tiles"
	var/flags
	var/can_paint
	var/list/footstep_sounds = list() // key=species name, value = list of soundss

/decl/flooring/proc/on_remove()
	return

/decl/flooring/grass
	can_paint = 1
	name = "grass"
	desc = "Do they smoke grass out in space, Bowie? Or do they smoke AstroTurf?"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_base = "grass"
	has_base_range = 3
	damage_temperature = T0C+80
	flags = TURF_HAS_EDGES | TURF_REMOVE_SHOVEL
	build_type = /obj/item/stack/tile/grass

/decl/flooring/asteroid
	name = "coarse sand"
	desc = "Gritty and unpleasant."
	icon = 'icons/turf/flooring/asteroid.dmi'
	icon_base = "asteroid"
	flags = TURF_HAS_EDGES | TURF_REMOVE_SHOVEL
	build_type = null

/decl/flooring/carpet
	name = "brown carpet"
	desc = "Comfy and fancy carpeting."
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_base = "brown"
	build_type = /obj/item/stack/tile/carpet
	damage_temperature = T0C+200
	flags = TURF_HAS_EDGES | TURF_HAS_CORNERS | TURF_REMOVE_CROWBAR | TURF_CAN_BURN
	footstep_sounds = list("human" = list(
		'sound/effects/footsteps/carpet1.wav',
		'sound/effects/footsteps/carpet2.wav',
		'sound/effects/footsteps/carpet3.wav',
		'sound/effects/footsteps/carpet4.wav',
		'sound/effects/footsteps/carpet5.wav'))

/decl/flooring/carpet/blue
	name = "blue carpet"
	icon_base = "blue1"
	build_type = /obj/item/stack/tile/carpetblue

/decl/flooring/carpet/blue2
	name = "pale blue carpet"
	icon_base = "blue2"
	build_type = /obj/item/stack/tile/carpetblue2

/decl/flooring/carpet/purple
	name = "purple carpet"
	icon_base = "purple"
	build_type = /obj/item/stack/tile/carpetpurple

/decl/flooring/carpet/orange
	name = "orange carpet"
	icon_base = "orange"
	build_type = /obj/item/stack/tile/carpetorange

/decl/flooring/carpet/green
	name = "green carpet"
	icon_base = "green"
	build_type = /obj/item/stack/tile/carpetgreen

/decl/flooring/carpet/red
	name = "red carpet"
	icon_base = "red"
	build_type = /obj/item/stack/tile/carpetred

/decl/flooring/tiling
	name = "floor"
	desc = "Scuffed from the passage of countless greyshirts."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "steel"
	has_damage_range = 4
	damage_temperature = T0C+1400
	flags = TURF_REMOVE_CROWBAR | TURF_CAN_BREAK | TURF_CAN_BURN
	build_type = /obj/item/stack/tile/floor
	can_paint = 1
	footstep_sounds = list("human" = list(
		'sound/effects/footsteps/tile1.wav',
		'sound/effects/footsteps/tile2.wav',
		'sound/effects/footsteps/tile3.wav',
		'sound/effects/footsteps/tile4.wav'))

/decl/flooring/linoleum
	name = "linoleum"
	desc = "It's like the 2390's all over again."
	icon = 'icons/turf/flooring/linoleum.dmi'
	icon_base = "lino"
	can_paint = 1
	build_type = /obj/item/stack/tile/linoleum
	flags = TURF_REMOVE_SCREWDRIVER

/decl/flooring/tiling/white
	desc = "How sterile."
	icon_base = "white"
	has_damage_range = null
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/floor_white
	has_damage_range = 4

/decl/flooring/tiling/dark
	desc = "How ominous."
	icon_base = "dark"
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/floor_dark
	has_damage_range = 4

/decl/flooring/tiling/freezer
	desc = "Don't slip."
	icon_base = "freezer"
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/floor_freezer
	has_damage_range = 4


/decl/flooring/tiling/bunker/
	name = "floor"
	desc = "Don't slip."
	icon = 'icons/turf/bunk.dmi'
	icon_base = "plating"
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/bunker
	has_damage_range = 4

/decl/flooring/tiling/bunker/hydro
	name = "floor"
	desc = "Don't slip."
	icon_base = "hydro"
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/floor_hydro
	has_damage_range = 4

/decl/flooring/tiling/bunker/showroom
	name = "floor"
	desc = "Don't slip."
	icon_base = "hydro"
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/floor_showroom
	has_damage_range = 4

/decl/flooring/tiling/bunker/cafe
	name = "floor"
	desc = "Don't slip."
	icon_base = "cafe"
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/floor_cafe
	has_damage_range = 4

/decl/flooring/tiling/bunker/yellow
	name = "floor"
	desc = "Don't slip."
	icon_base = "old_tile_cargo"
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/yellow
	has_damage_range = 4

/decl/flooring/tiling/bunker/black
	name = "floor"
	desc = "Don't slip."
	icon_base = "old_tile_black"
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/black
	has_damage_range = 4

/decl/flooring/tiling/bunker/red
	name = "floor"
	desc = "Don't slip."
	icon_base = "old_tile_red"
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/red
	has_damage_range = 4

/decl/flooring/tiling/bunker/polar
	name = "floor"
	desc = "Don't slip."
	icon_base = "polar"
	build_type = /obj/item/stack/tile/polar
	has_damage_range = 4

/decl/flooring/tiling/bar
	name = "floor"
	desc = "Don't slip."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "bar"
	flags = TURF_REMOVE_CROWBAR
	build_type = /obj/item/stack/tile/bar
	has_damage_range = 4

/decl/flooring/tiling/misc
	icon = 'icons/turf/flooring/misc.dmi'
	flags = TURF_REMOVE_CROWBAR
	can_paint = 0
	has_damage_range = 4

/decl/flooring/tiling/misc/sec
	icon_base = "sec_chess"

/decl/flooring/tiling/misc/med
	icon_base = "tealwh_chess"

/decl/flooring/tiling/misc/cargo
	icon_base = "cargo_chess"

/decl/flooring/tiling/misc/blue
	icon_base = "blue_chess"

/decl/flooring/tiling/misc/purple
	icon_base = "prwh_chess"

/decl/flooring/wood
	name = "wooden floor"
	desc = "Polished redwood planks."
	icon = 'icons/turf/flooring/wood.dmi'
	icon_base = "wood"
	has_damage_range = 6
	damage_temperature = T0C+200
	descriptor = "planks"
	can_paint = 1
	build_type = /obj/item/stack/tile/wood
	flags = TURF_CAN_BREAK | TURF_IS_FRAGILE | TURF_REMOVE_SCREWDRIVER
	footstep_sounds = list("human" = list(
		'sound/effects/footsteps/wood1.wav',
		'sound/effects/footsteps/wood2.wav',
		'sound/effects/footsteps/wood3.wav',
		'sound/effects/footsteps/wood4.wav',
		'sound/effects/footsteps/wood5.wav'))

/decl/flooring/reinforced
	name = "reinforced floor"
	desc = "Heavily reinforced with steel rods."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "reinforced"
	flags = TURF_REMOVE_WRENCH | TURF_ACID_IMMUNE
	build_type = /obj/item/stack/rods
	build_cost = 2
	build_time = 30
	apply_thermal_conductivity = 0.025
	apply_heat_capacity = 325000
	can_paint = 1
	footstep_sounds = list("human" = list(
		'sound/effects/footsteps/metalgrate1.wav',
		'sound/effects/footsteps/metalgrate2.wav',
		'sound/effects/footsteps/metalgrate3.wav',
		'sound/effects/footsteps/metalgrate4.wav'))

/decl/flooring/reinforced/circuit
	name = "processing strata"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_base = "bcircuit"
	build_type = null
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK | TURF_REMOVE_WRENCH
	can_paint = 1

/decl/flooring/reinforced/circuit/green
	icon_base = "gcircuit"

/decl/flooring/reinforced/circuit/red
	icon_base = "rcircuit"
	flags = TURF_ACID_IMMUNE
	can_paint = 0

/decl/flooring/reinforced/cult
	name = "engraved floor"
	desc = "Unsettling whispers waver from the surface..."
	icon = 'icons/turf/flooring/cult.dmi'
	icon_base = "cult"
	build_type = null
	has_damage_range = 6
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK | TURF_REMOVE_WRENCH
	can_paint = null

/decl/flooring/reinforced/cult/on_remove()
	cult.remove_cultiness(CULTINESS_PER_TURF)

/decl/flooring/reinforced/shuttle
	name = "floor"
	icon = 'icons/turf/shuttle.dmi'
	build_type = null
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK | TURF_REMOVE_WRENCH
	can_paint = 1

/decl/flooring/reinforced/shuttle/blue
	icon_base = "floor"

/decl/flooring/reinforced/shuttle/yellow
	icon_base = "floor2"

/decl/flooring/reinforced/shuttle/white
	icon_base = "floor3"

/decl/flooring/reinforced/shuttle/red
	icon_base = "floor4"

/decl/flooring/reinforced/shuttle/purple
	icon_base = "floor5"

/decl/flooring/reinforced/shuttle/darkred
	icon_base = "floor6"

/decl/flooring/reinforced/shuttle/black
	icon_base = "floor7"

/decl/flooring/diona
	name = "biomass"
	desc = "a mass of small intertwined aliens forming a floor... Creepy."
	icon = 'icons/turf/floors.dmi'
	icon_base = "diona"
	flags = TURF_ACID_IMMUNE | TURF_REMOVE_SHOVEL

/decl/flooring/reinforced/ramp
	name = "foot ramp"
	desc = "An archaic means of locomotion along the Z axis."
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_base = "ramptop"
	build_type = null
	flags = TURF_ACID_IMMUNE | TURF_CAN_BREAK
	can_paint = 1

/decl/flooring/reinforced/ramp/bottom
	icon_base = "rampbot"

/turf/unsimulated/floor
	name = "floor"
	icon = 'icons/turf/floors.dmi'
	icon_state = "Floor3"
	var/bound_height
	var/bound_width
	var/bound_y
	var/bound_x

/turf/unsimulated/floor/bluespace //non-doomsday version of bluespace for transit and wizden
	name = "\improper bluespace"
	icon = 'icons/turf/space.dmi'
	icon_state = "bluespace"
	desc = "Looks like infinity."
	permit_ao = FALSE

/turf/unsimulated/mask
	name = "mask"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rockvault"

/turf/unsimulated/floor/rescue_base
	icon_state = "asteroidfloor"

/turf/unsimulated/floor/shuttle_ceiling
	icon_state = "reinforced"

/turf/unsimulated/floor/road
	name = "road"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "roaddottedstripes"
	blend_with_neighbors = 5
	outdoors = 1
	movement_delay = 0.7
	permit_ao = FALSE
	footstep_sounds = list("human" = list(
		'sound/effects/footsteps/concrete1.wav',
		'sound/effects/footsteps/concrete2.wav',
		'sound/effects/footsteps/concrete3.wav',
		'sound/effects/footsteps/concrete4.wav',
		'sound/effects/footsteps/concrete5.wav',
		'sound/effects/footsteps/concrete6.wav',
		'sound/effects/footsteps/concrete7.wav',
		'sound/effects/footsteps/concrete8.wav'))

/turf/unsimulated/floor/fakestairs
	name = "stairs"
	icon = 'icons/turf/stairs.dmi'
	icon_state = "stairs"
	movement_delay = 0.6
	blend_with_neighbors = 0
	footstep_sounds = list("human" = list(
		'sound/effects/footsteps/tile1.wav',
		'sound/effects/footsteps/tile2.wav',
		'sound/effects/footsteps/tile3.wav',
		'sound/effects/footsteps/tile4.wav'))

/turf/unsimulated/floor/fakestairs/north
	dir = NORTH

/turf/unsimulated/floor/fakestairs/south
	dir = SOUTH

/turf/unsimulated/floor/fakestairs/east
	dir = EAST

/turf/unsimulated/floor/fakestairs/west
	dir = WEST

/turf/unsimulated/floor/fakestairslarge
	name = "stairs"
	icon = 'icons/turf/stairslarge.dmi'
	icon_state = "above"
	bound_height = 64
	bound_y = -32
	pixel_y = -32

/turf/unsimulated/floor/fakestairslarge/north
	dir = NORTH
	bound_height = 64
	bound_y = -32
	pixel_y = -32

/turf/unsimulated/floor/fakestairslarge/south
	dir = SOUTH
	bound_height = 64
	bound_y = -32
	pixel_y = -32

/turf/unsimulated/floor/fakestairslarge/east
	dir = EAST
	bound_width = 64
	bound_x = -32
	pixel_x = -32

/turf/unsimulated/floor/fakestairslarge/west
	dir = WEST
	bound_width = 64
	bound_x = -32
	pixel_x = -32
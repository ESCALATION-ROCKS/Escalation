/obj/turbolift_map_holder/redline
	name = "Redline turbolift map placeholder"
	depth = 6
	lift_size_x = 3
	lift_size_y = 3
	icon = 'icons/obj/turbolift_preview_2x2.dmi'
	dir = SOUTH
	floor_type = /turf/simulated/floor/tiled/bunker/polar/elevator
	wall_type = /turf/simulated/wall/voxshuttle/
	areas_to_use = list(/area/turbolift/floor8,
		/area/turbolift/floor7,
		/area/turbolift/floor6,
		/area/turbolift/floor5,
		/area/turbolift/floor4,
		/area/turbolift/floor3
		)

//Turbolift
/area/turbolift
	name = "\improper Turbolift"
	icon_state = "shuttle"
	requires_power = 0
	dynamic_lighting = 1
	flags = AREA_RAD_SHIELDED

/area/turbolift/start
	name = "\improper Turbolift Start"

/area/turbolift/floor8
	name = "\improper Worker District"
	base_turf = /turf/simulated/open

/area/turbolift/floor7
	name = "\improper Technical Floor"
	base_turf = /turf/simulated/open

/area/turbolift/floor6
	name = "\improper Hospital"
	base_turf = /turf/simulated/open

/area/turbolift/floor5
	name = "\improper Administrative Level"
	base_turf = /turf/simulated/open

/area/turbolift/floor4
	name = "\improper VPP Level"
	base_turf = /turf/simulated/open

/area/turbolift/floor3
	name = "\improper Subway Entrance"
	base_turf = /turf/simulated/open

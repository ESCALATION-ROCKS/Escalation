
var/list/interior_areas = list(/area/coldwar/sewer,
							/area/coldwar/underground,
							/area/coldwar/underground/bunker,
							/area/coldwar/verylargeenclosed,
							/area/coldwar/largeenclosed,
							/area/coldwar/mediumenclosed,
							/area/coldwar/smallenclosed,
							/area/coldwar/largesoftfloor,
							/area/coldwar/mediumsoftfloor,
							/area/coldwar/smallsoftfloor,
							/area/coldwar/usmcfob,
							/area/coldwar/warpactfob
							)

//////////////OUTSIDE AREAS

/area/coldwar
	name = "outside"
	icon_state = "outside"
	requires_power = 0
	sound_env = CITY
	dynamic_lighting = 1
	base_turf = /turf/unsimulated/ground/
	ambience = list (
	'sound/ambience/coldwar/0Background0.ogg',
	'sound/ambience/coldwar/0Background1.ogg',
	'sound/ambience/coldwar/0Background2.ogg',
	'sound/ambience/coldwar/0Background3.ogg',
	'sound/ambience/coldwar/0Background4.ogg',
	)

/area/coldwar/foboutside
	name = "fob outside"
	icon_state = "foboutside"
	sound_env = FOREST

/area/coldwar/forest
	name = "forest"
	icon_state = "forest"
	sound_env = FOREST

/area/coldwar/road
	name = "road"
	icon_state = "road"
	sound_env = CITY

/area/coldwar/parkinglot
	name = "parking lot"
	icon_state = "parkinglot"
	sound_env = PARKING_LOT

/area/coldwar/alley
	name = "alley"
	icon_state = "alley"
	sound_env = ALLEY


//////////////INTERIOR AREAS


/area/coldwar/sewer
	name = "sewer"
	icon_state = "sewer"
	sound_env = SEWER_PIPE
	base_turf = /turf/unsimulated/stone
	forced_ambience = list('sound/ambience/shipambience.ogg')
	/*ambience = list (
	'sound/ambience/coldwar/0Sewer1.ogg',
	'sound/ambience/coldwar/0Sewer2.ogg',
	'sound/ambience/coldwar/0Sewer3.ogg',
	'sound/ambience/coldwar/0Sewer4.ogg',
	'sound/ambience/coldwar/0Sewer5.ogg',
	'sound/ambience/coldwar/0Sewer6.ogg',
	'sound/ambience/coldwar/0Sewer7.ogg',
	'sound/ambience/coldwar/0Sewer8.ogg',
	'sound/ambience/coldwar/0Sewer9.ogg',
	'sound/ambience/coldwar/0Sewer0.ogg'
	)*/

/area/coldwar/underground
	name = "underground"
	icon_state = "underground"
	sound_env = TUNNEL_ENCLOSED
	base_turf = /turf/unsimulated/stone
	forced_ambience = list('sound/ambience/shipambience.ogg')
	/*ambience = list (
	'sound/ambience/coldwar/0Ugrnd1.ogg',
	'sound/ambience/coldwar/0Ugrnd2.ogg',
	'sound/ambience/coldwar/0Ugrnd3.ogg',
	'sound/ambience/coldwar/0Ugrnd4.ogg',
	'sound/ambience/coldwar/0Ugrnd5.ogg',
	'sound/ambience/coldwar/0Ugrnd6.ogg',
	'sound/ambiencenew/eerie_amb_1.ogg'
	)*/

/area/coldwar/underground/bunker
	name = "bunker"
	icon_state = "bunker"
	sound_env = LARGE_ENCLOSED

/area/coldwar/verylargeenclosed
	name = "very large hard floor"
	icon_state = "verylargeenclosed"
	sound_env = HANGAR

/area/coldwar/largeenclosed
	name = "large hard floor"
	icon_state = "largeenclosed"
	sound_env = LARGE_ENCLOSED

/area/coldwar/mediumenclosed
	name = "medium hard floor"
	icon_state = "mediumenclosed"
	sound_env = LIVINGROOM

/area/coldwar/smallenclosed
	name = "small hard floor"
	icon_state = "smallenclosed"
	sound_env = SMALL_ENCLOSED

/area/coldwar/largesoftfloor
	name = "large soft floor"
	icon_state = "largesoft"
	sound_env = LARGE_SOFTFLOOR

/area/coldwar/mediumsoftfloor
	name = "medium soft floor"
	icon_state = "mediumsoft"
	sound_env = MEDIUM_SOFTFLOOR

/area/coldwar/smallsoftfloor
	name = "small soft floor"
	icon_state = "smallsoft"
	sound_env = SMALL_SOFTFLOOR

/area/coldwar/usmcfob
	name = "USMC FOB"
	icon_state = "usmcfob"
	sound_env = LIVINGROOM

/area/coldwar/warpactfob
	name = "WARPACT FOB"
	icon_state = "warpactfob"
	sound_env = LIVINGROOM

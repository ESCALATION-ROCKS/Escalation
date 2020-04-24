/datum/map/ubahn
	base_floor_area = /area/metro/tunnel

/area/metro
	ambience = list('sound/ambience/cave1.ogg',
	'sound/ambience/cave2.ogg',
	'sound/ambience/cave3.ogg',
	'sound/ambience/cave4.ogg',
	'sound/ambience/cave5.ogg'
	)

/area/metro/tunnel
	name = "\improper Underground Tunnel"
	icon_state = "pmaint"
	sound_env = HANGAR
	ambience = list('sound/ambience/precursorfx1.ogg',
	'sound/ambience/precursorfx2.ogg',
	'sound/ambience/precursorfx3.ogg',
	'sound/ambience/precursorfx4.ogg'
	)

/area/metro/tunnel/northwest
	name = "\improper Northwest Tunnel"
	icon_state = "blue2"

/area/metro/tunnel/northeast
	name = "\improper Northeast Tunnel"
	icon_state = "red2"

/area/metro/tunnel/southeast
	name = "\improper Southeast Tunnel"
	icon_state = "red2"

/area/metro/tunnel/southwest
	name = "\improper Southwest Tunnel"
	icon_state = "blue2"

/area/metro/tunnel/stationeast
	name = "\improper Station East Tunnel"
	icon_state = "blue-red2"

/area/metro/tunnel/stationwest
	name = "\improper Station West"
	icon_state = "blue-red-d"


/area/metro/station
	name = "\improper Station South Section"
	icon_state = "hallF"
	sound_env = HANGAR

/area/metro/station/northsec
	name = "\improper Station North Section"
	icon_state = "hallC1"
	sound_env = HANGAR

/area/metro/cemetrycave
	name = "\improper Cemetry"
	icon_state = "cave"
	sound_env = CONCERT_HALL

/area/metro/chapel
	name = "\improper Chapel"
	icon_state = "chapel"
	sound_env = MEDIUM_SOFTFLOOR

/area/metro/hospital
	name = "\improper Hospital"
	icon_state = "medbay"
	sound_env = MEDIUM_SOFTFLOOR
	ambience = list('sound/ambience/hospital_fx1.ogg',
	'sound/ambience/hospital_fx2.ogg',
	'sound/ambience/hospital_fx3.ogg',
	'sound/ambience/hospital_fx4.ogg',
	'sound/ambience/hospital_fx5.ogg'
	)



/area/metro/kapobarracks
	name = "\improper VPP Barracks"
	icon_state = "brig"
	sound_env = LARGE_ENCLOSED


/area/metro/substationtunnel
	name = "\improper Sub-Station Tunnel"

/area/metro/statcomdeputy
	name = "\improper Station Commander Deputy office"
	sound_env = MEDIUM_SOFTFLOOR

/area/metro/stationkommandant
	name = "\improper Station Commanding Officer Office"
	icon_state = "captain"
	sound_env = MEDIUM_SOFTFLOOR

/area/metro/merchantoffice
	name = "\improper Merchant Office"
	icon_state = "quartoffice"
	sound_env = MEDIUM_SOFTFLOOR

/area/metro/intendantoffice
	name = "\improper Intendant Office"
	icon_state = "quart"
	sound_env = MEDIUM_SOFTFLOOR

/area/metro/dorms
	name = "\improper Dormitories"
	icon_state = "Sleep"
	sound_env = LARGE_ENCLOSED

/area/metro/bar
	name = "\improper Bar"
	icon_state = "cafeteria"
	sound_env = LARGE_ENCLOSED

/area/metro/bar/backstage
	name = "\improper Bar Backstage"
	icon_state = "bar"
	sound_env = MEDIUM_SOFTFLOOR

/area/metro/technical
	name = "\improper Technical Station"
	icon_state = "engineering"
	sound_env = CONCERT_HALL

/area/metro/jagerquarters
	name = "\improper Jaeger Quarters"
	icon_state = "crew_quarters"
	sound_env = MEDIUM_SOFTFLOOR

/area/metro/cave
	name = "\improper Cave"
	icon_state = "unexplored"
	sound_env = CAVE

/area/metro/cavelowerlvl
	name = "\improper Cave"
	icon_state = "exploration"
	sound_env = CAVE

/area/metro/technicallvl
	name = "\improper Technical Level"
	icon_state = "smaint"
	sound_env = CONCERT_HALL

/area/metro/ebenyas
	name = "\improper UNIDENTIFIED LOCATION"
	icon_state = "shuttle"
	requires_power = 0
	dynamic_lighting = 1
	flags = AREA_RAD_SHIELDED
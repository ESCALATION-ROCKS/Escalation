
/datum/map/redline
	name = "Redline"
	full_name = "The Red Line"
	path = "redline"
	base_turf_by_z = list("1" = /turf/simulated/floor/asteroid)

	lobby_icon = 'maps/redline/redline_lobby.dmi'

	station_levels = list(1, 2, 3, 4, 5, 6, 7, 8)
	contact_levels = list(1, 2, 3, 4, 5, 6, 7, 8)
	player_levels = list(1, 2, 3, 4, 5, 6, 7, 8)

	allowed_spawns = list("Communal Apartment", "Tunnel")
	default_spawn = "Communal Apartment"

	shuttle_docked_message = "The shuttle has docked."
	shuttle_leaving_dock = "The shuttle has departed from home dock."
	shuttle_called_message = "A scheduled transfer shuttle has been sent."
	shuttle_recall_message = "The shuttle has been recalled"
	emergency_shuttle_docked_message = "The emergency escape shuttle has docked."
	emergency_shuttle_leaving_dock = "The emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "An emergency escape shuttle has been sent."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled"
	usable_email_tlds = list("underground.sw")
	station_name  = "South Lincolnshire Station"
	station_short = "South Lincolnshire"
	dock_name     = "platform"
	boss_name     = "United Stations Provisional Government"
	boss_short    = "Central"
	company_name  = "Provisional Government"
	company_short = "Central"

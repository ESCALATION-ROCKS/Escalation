
/datum/map/escnew
	name = "embassy_1983"
	full_name = "Escalation: 1983 - Embassy"
	path = "embassy_1983"

	lobby_icon = 'maps/embassy_1983/escnew_lobby.dmi'
	lobby_screens = list("1983")

	station_levels = list(1, 2, 3)
	contact_levels = list(1, 2, 3)
	player_levels = list(1, 2, 3)

	allowed_spawns = list("Arrivals Shuttle")

	shuttle_docked_message = "The shuttle has docked."
	shuttle_leaving_dock = "The shuttle has departed from home dock."
	shuttle_called_message = "A scheduled transfer shuttle has been sent."
	shuttle_recall_message = "The shuttle has been recalled"
	emergency_shuttle_docked_message = "The emergency escape shuttle has docked."
	emergency_shuttle_leaving_dock = "The emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "An emergency escape shuttle has been sent."
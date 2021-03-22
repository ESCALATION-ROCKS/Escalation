var/global/list/turf/barraged_turfs = list()


SUBSYSTEM_DEF(artillery)
	name = "Artillery"
	init_order = INIT_ORDER_ARTILLERY
	wait = 4 SECONDS
	flags = SS_BACKGROUND
	runlevels = RUNLEVEL_GAME | RUNLEVEL_POSTGAME
	var/gibbing = 1



/datum/controller/subsystem/artillery/Initialize()
	..()
	adjustbarragedturfs()

/datum/controller/subsystem/artillery/proc/adjustbarragedturfs()
	for(var/obj/effect/landmark/artillery/T in landmarks_list)
		var/turf/TR = T.loc
		barraged_turfs |= TR

/datum/controller/subsystem/artillery/fire()
	spawn(0)
		var/turf/target = pick(barraged_turfs)
		target.artillery_act()
	sleep(rand(120,180))
	spawn(0)
		var/turf/target1 = pick(barraged_turfs)
		target1.artillery_act()

/turf/proc/artillery_act()
	if(prob(35))
		playsound(world, 'sound/effects/mortar_fire.ogg', 40, 1)
	sleep(rand(50,100))
	playsound(src, 'sound/effects/mortar_falling.ogg', 80, 1)
	sleep(rand(	30,60))
	explosion(src, 0, 2, 3, 4, 0, FALSE, FALSE, FALSE)
	sleep(rand(30,60))

/*/client/proc/stop_arty_gib()
	set name = "Stop Artillery Gibbing"
	set category = null //"EscAdmin" we dont use this anymore

	if(!holder)
		return

	SSartillery.gibbing = 0 GO FIND THIS VAR IN LANDMARKS.DM AND UNCOMMENT THE PROC FOR ANTI-RUSH GIBBING SYSTEM */

/client/proc/stop_art_shelling()
	set name = "Stop Artillery Shelling"
	set category = "EscAdmin"

	if(!holder)
		return

	SSartillery.pause()
	SSartillery.Destroy()
	SSartillery.flags = 0
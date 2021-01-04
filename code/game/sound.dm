//Sound environment defines. Reverb preset for sounds played in an area, see sound datum reference for more.
#define GENERIC 0
#define PADDED_CELL 1
#define ROOM 2
#define BATHROOM 3
#define LIVINGROOM 4
#define STONEROOM 5
#define AUDITORIUM 6
#define CONCERT_HALL 7
#define CAVE 8
#define ARENA 9
#define HANGAR 10
#define CARPETED_HALLWAY 11
#define HALLWAY 12
#define STONE_CORRIDOR 13
#define ALLEY 14
#define FOREST 15
#define CITY 16
#define MOUNTAINS 17
#define QUARRY 18
#define PLAIN 19
#define PARKING_LOT 20
#define SEWER_PIPE 21
#define UNDERWATER 22
#define DRUGGED 23
#define DIZZY 24
#define PSYCHOTIC 25

#define STANDARD_STATION STONEROOM
#define LARGE_ENCLOSED HANGAR
#define SMALL_ENCLOSED BATHROOM
#define TUNNEL_ENCLOSED CAVE
#define LARGE_SOFTFLOOR CARPETED_HALLWAY
#define MEDIUM_SOFTFLOOR LIVINGROOM
#define SMALL_SOFTFLOOR ROOM
#define ASTEROID CAVE
#define SPACE UNDERWATER

var/list/shatter_sound = list('sound/effects/Glassbr1.ogg','sound/effects/Glassbr2.ogg','sound/effects/Glassbr3.ogg')
var/list/explosion_sound = list('sound/effects/explosion1.ogg','sound/effects/explosion2.ogg','sound/effects/explosion3.ogg','sound/effects/explosion4.ogg','sound/effects/explosion5.ogg','sound/effects/explosion6.ogg')
var/list/spark_sound = list('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg','sound/effects/sparks4.ogg')
var/list/rustle_sound = list('sound/effects/rustle1.ogg','sound/effects/rustle2.ogg','sound/effects/rustle3.ogg','sound/effects/rustle4.ogg','sound/effects/rustle5.ogg')
var/list/punch_sound = list('sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg')
var/list/clown_sound = list('sound/effects/clownstep1.ogg','sound/effects/clownstep2.ogg')
var/list/swing_hit_sound = list('sound/weapons/genhit1.ogg', 'sound/weapons/genhit2.ogg', 'sound/weapons/genhit3.ogg')
var/list/hiss_sound = list('sound/voice/hiss1.ogg','sound/voice/hiss2.ogg','sound/voice/hiss3.ogg','sound/voice/hiss4.ogg')
var/list/page_sound = list('sound/effects/pageturn1.ogg', 'sound/effects/pageturn2.ogg','sound/effects/pageturn3.ogg')
var/list/lighter_sound = list('sound/items/lighter1.ogg','sound/items/lighter2.ogg','sound/items/lighter3.ogg')
var/list/keyboard_sound = list('sound/machines/keypress1.ogg','sound/machines/keypress2.ogg','sound/machines/keypress3.ogg','sound/machines/keypress4.ogg')
var/list/switch_sound = list('sound/machines/switch1.ogg','sound/machines/switch2.ogg','sound/machines/switch3.ogg','sound/machines/switch4.ogg')
var/list/button_sound = list('sound/machines/button1.ogg','sound/machines/button2.ogg','sound/machines/button3.ogg','sound/machines/button4.ogg')
var/list/computer_sound = list('sound/effects/compbeep1.ogg','sound/effects/compbeep2.ogg','sound/effects/compbeep3.ogg','sound/effects/compbeep4.ogg')

var/list/tilefootsteps = list('sound/effects/footsteps/tile1.wav','sound/effects/footsteps/tile2.wav','sound/effects/footsteps/tile3.wav','sound/effects/footsteps/tile4.wav')
var/list/dirtfootsteps = list('sound/effects/footsteps/dirt1.wav','sound/effects/footsteps/dirt2.wav','sound/effects/footsteps/dirt3.wav','sound/effects/footsteps/dirt4.wav','sound/effects/footsteps/dirt5.wav','sound/effects/footsteps/dirt6.wav','sound/effects/footsteps/dirt7.wav','sound/effects/footsteps/dirt8.wav')
var/list/woodfootsteps = list ('sound/effects/footsteps/wood1.wav','sound/effects/footsteps/wood2.wav','sound/effects/footsteps/wood3.wav','sound/effects/footsteps/wood4.wav','sound/effects/footsteps/wood5.wav','sound/effects/footsteps/wood6.wav','sound/effects/footsteps/wood7.wav','sound/effects/footsteps/wood8.wav')
var/list/carpetfootsteps = list ('sound/effects/footsteps/carpet1.wav','sound/effects/footsteps/carpet2.wav','sound/effects/footsteps/carpet3.wav','sound/effects/footsteps/carpet4.wav','sound/effects/footsteps/carpet5.wav','sound/effects/footsteps/carpet6.wav','sound/effects/footsteps/carpet7.wav','sound/effects/footsteps/carpet8.wav')
var/list/platingfootsteps = list('sound/effects/footsteps/metal1.wav','sound/effects/footsteps/metal2.wav', 'sound/effects/footsteps/metal3.wav', 'sound/effects/footsteps/metal4.wav')
var/list/metalgratefootsteps = list('sound/effects/footsteps/metalgrate1.wav','sound/effects/footsteps/metalgrate2.wav', 'sound/effects/footsteps/metalgrate3.wav', 'sound/effects/footsteps/metalgrate4.wav')

var/list/eat = list('sound/vo/eat.1.wav','sound/vo/eat.2.wav', 'sound/vo/eat.3.wav', 'sound/vo/eat.4.wav','sound/vo/eat.4.wav')
var/list/drink = list('sound/vo/drink.1.wav','sound/vo/drink.2.wav', 'sound/vo/drink.3.wav', 'sound/vo/drink.4.wav','sound/vo/drink.4.wav')
var/list/bodysplat = list('sound/effects/body/bodysplat.wav','sound/effects/body/bodysplat2.wav')
var/list/bonebreak = list('sound/effects/body/bonebreak.wav','sound/effects/body/bonebreak1.wav','sound/effects/body/bonebreak2.wav')
var/list/bul_impact = list('sound/effects/body/bulletbodyimpact_1.wav','sound/effects/body/bulletbodyimpact_2.wav','sound/effects/body/bulletbodyimpact_4.wav','sound/effects/body/bulletbodyimpact_5.wav','sound/effects/body/bulletbodyimpact_6.wav')
var/list/bullet_hit_object = list('sound/weapons/ric1.ogg', 'sound/weapons/ric2.ogg', 'sound/weapons/ric3.ogg', 'sound/weapons/ric4.ogg', 'sound/weapons/ric5.ogg', 'sound/weapons/ric6.ogg')
var/list/bodyscrape = list('sound/effects/bodyscrape-01.ogg','sound/effects/bodyscrape-02.ogg')
var/list/serinjury = list('sound/effects/body/desceration-01.ogg','sound/effects/body/desceration-02.ogg','sound/effects/body/desceration-03.ogg','sound/effects/body/desceration-04.ogg')
var/list/flop_sound = list('sound/effects/bodyfall1.ogg','sound/effects/bodyfall2.ogg','sound/effects/bodyfall3.ogg')
var/list/bullet_flyby = list('sound/weapons/flyby/bulletflyby.ogg', 'sound/weapons/flyby/bulletflyby2.ogg', 'sound/weapons/flyby/bulletflyby3.ogg')
var/list/explosion_small_sound = list('sound/effects/Explosion_small1.ogg', 'sound/effects/Explosion_small2.ogg', 'sound/effects/Explosion_small3.ogg')

var/list/armorhitsound = list('sound/effects/body/damage_armor_1.wav','sound/effects/body/damage_armor_2.wav', 'sound/effects/body/damage_armor_3.wav', 'sound/effects/body/damage_armor_4.wav', 'sound/effects/body/damage_armor_5.wav')
var/list/armorstepsound = list('sound/effects/equipnoise/gear1.wav','sound/effects/equipnoise/gear2.wav', 'sound/effects/equipnoise/gear3.wav', 'sound/effects/equipnoise/gear4.wav')

var/list/foliage = list('sound/effects/foliage_01.ogg','sound/effects/foliage_02.ogg', 'sound/effects/foliage_03.ogg', 'sound/effects/foliage_04.ogg', 'sound/effects/foliage_05.ogg')
var/list/foliagedry = list('sound/effects/foliage_forest_01.ogg','sound/effects/foliage_forest_02.ogg', 'sound/effects/foliage_forest_03.ogg', 'sound/effects/foliage_forest_04.ogg', 'sound/effects/foliage_forest_05.ogg')

var/list/casing_sound = list('sound/weapons/casings/casing_drop1.ogg','sound/weapons/casings/casing_drop2.ogg','sound/weapons/casings/casing_drop3.ogg')


/proc/playsound(var/atom/source, soundin, vol as num, vary, extrarange as num, falloff, var/is_global, var/frequency, var/is_ambiance = 0)

	soundin = get_sfx(soundin) // same sound for everyone

	if(isarea(source))
		error("[source] is an area and is trying to make the sound: [soundin]")
		return

	frequency = isnull(frequency) ? get_rand_frequency() : frequency // Same frequency for everybody
	var/turf/turf_source = get_turf(source)

 	// Looping through the player list has the added bonus of working for mobs inside containers
	for (var/P in GLOB.player_list)
		var/mob/M = P
		if(!M || !M.client)
			continue
		if(get_dist(M, turf_source) <= (world.view + extrarange) * 2)
			var/turf/T = get_turf(M)
			if(T && T.z == turf_source.z && (!is_ambiance || M.get_preference_value(/datum/client_preference/play_ambiance) == GLOB.PREF_YES))
				M.playsound_local(turf_source, soundin, vol, vary, frequency, falloff, is_global)

var/const/FALLOFF_SOUNDS = 0.5

/mob/proc/playsound_local(var/turf/turf_source, soundin, vol as num, vary, frequency, falloff, is_global)
	if(!src.client || ear_deaf > 0)	return
	var/sound/S = soundin
	if(!istype(S))
		soundin = get_sfx(soundin)
		S = sound(soundin)
		S.wait = 0 //No queue
		S.channel = 0 //Any channel
		S.volume = vol
		S.environment = -1
		if (vary)
			if(frequency)
				S.frequency = frequency
			else
				S.frequency = get_rand_frequency()

	//sound volume falloff with pressure
	var/pressure_factor = 1.0

	if(isturf(turf_source))
		// 3D sounds, the technology is here!
		var/turf/T = get_turf(src)

		//sound volume falloff with distance
		var/distance = get_dist(T, turf_source)

		S.volume -= max(distance - world.view, 0) * 2 //multiplicative falloff to add on top of natural audio falloff.

		var/datum/gas_mixture/hearer_env = T.return_air()
		var/datum/gas_mixture/source_env = turf_source.return_air()

		if (hearer_env && source_env)
			var/pressure = min(hearer_env.return_pressure(), source_env.return_pressure())

			if (pressure < ONE_ATMOSPHERE)
				pressure_factor = max((pressure - SOUND_MINIMUM_PRESSURE)/(ONE_ATMOSPHERE - SOUND_MINIMUM_PRESSURE), 0)
		else //in space
			pressure_factor = 0

		if (distance <= 1)
			pressure_factor = max(pressure_factor, 0.15)	//hearing through contact

		S.volume *= pressure_factor

		if (S.volume <= 0)
			return	//no volume means no sound

		var/dx = turf_source.x - T.x // Hearing from the right/left
		S.x = dx
		var/dz = turf_source.y - T.y // Hearing from infront/behind
		S.z = dz
		// The y value is for above your head, but there is no ceiling in 2d spessmens.
		S.y = 1
		S.falloff = (falloff ? falloff : FALLOFF_SOUNDS)

	if(!is_global)

		if(istype(src,/mob/living/))
			var/mob/living/carbon/M = src
			if (istype(M) && M.hallucination_power > 50 && M.chem_effects[CE_MIND] < 1)
				S.environment = PSYCHOTIC
			else if (M.druggy)
				S.environment = DRUGGED
			else if (M.ear_damage > 3)
				S.environment = UNDERWATER
				S.volume *= 0.3
			else if (M.drowsyness)
				S.environment = DIZZY
			else if (M.confused)
				S.environment = DIZZY
			else if (M.stat == UNCONSCIOUS)
				S.environment = UNDERWATER
			else if (pressure_factor < 0.5)
				S.environment = SPACE
			else
				var/area/A = get_area(src)
				S.environment = A.sound_env

		else if (pressure_factor < 0.5)
			S.environment = SPACE
		else
			var/area/A = get_area(src)
			S.environment = A.sound_env

	src << S

/client/proc/playtitlemusic()
	if(get_preference_value(/datum/client_preference/play_lobby_music) == GLOB.PREF_YES)
		GLOB.using_map.lobby_music.play_to(src)

/proc/get_rand_frequency()
	return rand(32000, 55000) //Frequency stuff only works with 45kbps oggs.

/proc/get_sfx(soundin)
	if(istext(soundin))
		switch(soundin)
			if ("shatter") soundin = pick(shatter_sound)
			if ("explosion") soundin = pick(explosion_sound)
			if ("sparks") soundin = pick(spark_sound)
			if ("rustle") soundin = pick(rustle_sound)
			if ("casing_drop") soundin = pick(casing_sound)
			if ("punch") soundin = pick(punch_sound)
			if ("clownstep") soundin = pick(clown_sound)
			if ("swing_hit") soundin = pick(swing_hit_sound)
			if ("hiss") soundin = pick(hiss_sound)
			if ("serinjury") soundin = pick(serinjury)
			if ("pageturn") soundin = pick(page_sound)
			if ("fracture") soundin = pick(bonebreak)
			if ("light_bic") soundin = pick(lighter_sound)
			if ("keyboard") soundin = pick(keyboard_sound)
			if ("switch") soundin = pick(switch_sound)
			if ("button") soundin = pick(button_sound)
			if ("computer") soundin = pick(computer_sound)
			if ("tilefootsteps") soundin = pick(tilefootsteps)
			if ("dirtfootsteps") soundin = pick(dirtfootsteps)
			if ("woodfootsteps") soundin = pick(woodfootsteps)
			if ("carpetfootsteps") soundin = pick(carpetfootsteps)
			if ("platingfootsteps") soundin = pick(platingfootsteps)
			if ("metalgratefootsteps") soundin = pick(metalgratefootsteps)
			if ("bul_impact") soundin = pick(bul_impact)
			if ("drink") soundin = pick(drink)
			if ("eat") soundin = pick(eat)
			if ("bodysplat") soundin = pick(bodysplat)
			if ("hitobject") soundin = pick(bullet_hit_object)
			if ("bodyfall") soundin = pick(flop_sound)
			if ("bodyscrape") soundin = pick(bodyscrape)
			if ("armorhitsound") soundin = pick(armorhitsound)
			if ("bullet_flyby") soundin = pick(bullet_flyby)
			if ("explosion_small") soundin = pick(explosion_small_sound)
			if ("foliage") soundin = pick(foliage)
			if ("foliagedry") soundin = pick(foliagedry)
			if ("armorstep") soundin = pick(armorstepsound)


			//if ("gunshot") soundin = pick(gun_sound)
	return soundin

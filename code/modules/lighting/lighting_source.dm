/var/total_lighting_sources = 0
// This is where the fun begins.
// These are the main datums that emit light.

/datum/light_source
	var/atom/top_atom        // The atom we're emitting light from(for example a mob if we're from a flashlight that's being held).
	var/atom/source_atom     // The atom that we belong to.

	var/turf/source_turf     // The turf under the above.
	var/turf/pixel_turf      // The turf the top_atom appears to over.
	var/light_power    // Intensity of the emitter light.
	var/light_range      // The range of the emitted light.
	var/light_color    // The colour of the light, string, decomposed by parse_light_color()

	// Variables for keeping track of the colour.
	var/lum_r
	var/lum_g
	var/lum_b

	// The lumcount values used to apply the light.
	var/tmp/applied_lum_r
	var/tmp/applied_lum_g
	var/tmp/applied_lum_b

	var/list/datum/lighting_corner/effect_str     // List used to store how much we're affecting corners.
	var/list/turf/affecting_turfs

	var/applied = FALSE // Whether we have applied our light yet or not.

	var/vis_update      // Whether we should smartly recalculate visibility. and then only update tiles that became(in)visible to us.
	var/needs_update    // Whether we are queued for an update.
	var/destroyed       // Whether we are destroyed and need to stop emitting light.
	var/force_update

// This macro will only offset up to 1 tile, but anything with a greater offset is an outlier and probably should handle its own lighting offsets.
// Anything pixelshifted 16px or more will be considered on the next tile.
#define GET_APPROXIMATE_PIXEL_DIR(PX, PY) ((!(PX) ? 0 : ((PX >= 16 ? EAST : (PX <= -16 ? WEST : 0)))) | (!PY ? 0 : (PY >= 16 ? NORTH : (PY <= -16 ? SOUTH : 0))))
#define UPDATE_APPROXIMATE_PIXEL_TURF var/_mask = GET_APPROXIMATE_PIXEL_DIR(top_atom.pixel_x, top_atom.pixel_y); pixel_turf = _mask ? (get_step(source_turf, _mask) || source_turf) : source_turf

/datum/light_source/New(var/atom/owner, var/atom/top)
	total_lighting_sources++
	source_atom = owner // Set our new owner.
	if(!source_atom.light_sources)
		source_atom.light_sources = list()

	source_atom.light_sources += src // Add us to the lights of our owner.
	top_atom = top
	if(top_atom != source_atom)
		if(!top.light_sources)
			top.light_sources     = list()

		top_atom.light_sources += src

	source_turf = top_atom
	UPDATE_APPROXIMATE_PIXEL_TURF
	light_power = source_atom.light_power
	light_range = source_atom.light_range
	light_color = source_atom.light_color

	PARSE_LIGHT_COLOR(src)

	effect_str      = list()
	affecting_turfs = list()

	update()


// Kill ourselves.
/datum/light_source/proc/destroy()
	total_lighting_sources--
	destroyed = TRUE
	force_update()
	if(source_atom && source_atom.light_sources)
		source_atom.light_sources -= src

	if(top_atom && top_atom.light_sources)
		top_atom.light_sources    -= src

// Call it dirty, I don't care.
// This is here so there's no performance loss on non-instant updates from the fact that the engine can also do instant updates.
// If you're wondering what's with the "BYOND" argument: BYOND won't let me have a() macro that has no arguments :|.
#define effect_update(BYOND)            \
	if(!needs_update)                  \
	{                                   \
		SSlighting.light_queue += src;  \
		needs_update            = TRUE; \
	}

// This proc will cause the light source to update the top atom, and add itself to the update queue.
/datum/light_source/proc/update(var/atom/new_top_atom)
	// This top atom is different.
	if(new_top_atom && new_top_atom != top_atom)
		if(top_atom != source_atom) // Remove ourselves from the light sources of that top atom.
			top_atom.light_sources -= src

		top_atom = new_top_atom

		if(top_atom != source_atom)
			if(!top_atom.light_sources)
				top_atom.light_sources = list()

			top_atom.light_sources += src // Add ourselves to the light sources of our new top atom.

	effect_update(null)

// Will force an update without checking if it's actually needed.
/datum/light_source/proc/force_update()
	force_update = 1

	effect_update(null)

// Will cause the light source to recalculate turfs that were removed or added to visibility only.
/datum/light_source/proc/vis_update()
	vis_update = 1

	effect_update(null)

// Will check if we actually need to update, and update any variables that may need to be updated.
/datum/light_source/proc/check()
	if(!source_atom || !light_range || !light_power)
		destroy()
		return 1

	if(!top_atom)
		top_atom = source_atom
		. = 1

	if(isturf(top_atom))
		if(source_turf != top_atom)
			source_turf = top_atom
			UPDATE_APPROXIMATE_PIXEL_TURF
			. = 1
	else if(top_atom.loc != source_turf)
		source_turf = top_atom.loc
		. = 1

	if(source_atom.light_power != light_power)
		light_power = source_atom.light_power
		. = 1

	if(source_atom.light_range != light_range)
		light_range = source_atom.light_range
		. = 1

	if(light_range && light_power && !applied)
		. = 1

	if(source_atom.light_color != light_color)
		light_color = source_atom.light_color
		PARSE_LIGHT_COLOR(src)
		. = 1

// Macro that applies light to a new corner.
// It is a macro in the interest of speed, yet not having to copy paste it.
// If you're wondering what's with the backslashes, the backslashes cause BYOND to not automatically end the line.
// As such this all gets counted as a single line.
// The braces and semicolons are there to be able to do this on a single line.

#define APPLY_CORNER(C)                      \
	. = LUM_FALLOFF(C, pixel_turf);          \
	. *= light_power;                        \
	var/OLD = effect_str[C];                 \
	effect_str[C] = .;                       \
											\
	C.update_lumcount                        \
	(                                        \
		(. * lum_r) - (OLD * applied_lum_r), \
		(. * lum_g) - (OLD * applied_lum_g), \
		(. * lum_b) - (OLD * applied_lum_b)  \
	);

#define REMOVE_CORNER(C)                     \
	. = -effect_str[C];                      \
	C.update_lumcount                        \
	(                                        \
		. * applied_lum_r,                   \
		. * applied_lum_g,                   \
		. * applied_lum_b                    \
	);

//Original lighting falloff calculation. This looks the best out of the three. However, this is also the most expensive.
//#define LUM_FALLOFF(C, T) (1 - CLAMP01(sqrt((C.x - T.x) ** 2 + (C.y - T.y) ** 2 + LIGHTING_HEIGHT) / max(1, light_range)))

//Cubic lighting falloff. This has the *exact* same range as the original lighting falloff calculation, down to the exact decimal, but it looks a little unnatural due to the harsher falloff and how it's generally brighter across the board.
//#define LUM_FALLOFF(C, T) (1 - CLAMP01((((C.x - T.x) * (C.x - T.x)) + ((C.y - T.y) * (C.y - T.y)) + LIGHTING_HEIGHT) / max(1, light_range*light_range)))

//Linear lighting falloff. This resembles the original lighting falloff calculation the best, but results in lights having a slightly larger range, which is most noticable with large light sources. This also results in lights being diamond-shaped, fuck. This looks the darkest out of the three due to how lights are brighter closer to the source compared to the original falloff algorithm. This falloff method also does not at all take into account lighting height, as it acts as a flat reduction to light range with this method.
//#define LUM_FALLOFF(C, T) (1 - CLAMP01(((abs(C.x - T.x) + abs(C.y - T.y))) / max(1, light_range+1)))

//Linear lighting falloff but with an octagonal shape in place of a diamond shape. Lummox JR please add pointer support.
#define GET_LUM_DIST(DISTX, DISTY) (DISTX + DISTY + abs(DISTX - DISTY)*0.4)
#define LUM_FALLOFF(C, T) (1 - CLAMP01(sqrt((C.x - T.x) ** 2 + (C.y - T.y) ** 2 + LIGHTING_HEIGHT) / max(1, light_range)))
//#define LUM_FALLOFF(C, T) (1 - CLAMP01(max(GET_LUM_DIST(abs(C.x - T.x), abs(C.y - T.y)),LIGHTING_HEIGHT) / max(1, light_range+1)))

/datum/light_source/proc/apply_lum()
	var/static/update_gen = 1
	applied = 1

	// Keep track of the last applied lum values so that the lighting can be reversed
	applied_lum_r = lum_r
	applied_lum_g = lum_g
	applied_lum_b = lum_b

	FOR_DVIEW(var/turf/T, light_range, source_turf, INVISIBILITY_LIGHTING)
		if(!T.lighting_corners_initialised)
			T.generate_missing_corners()

		for(var/datum/lighting_corner/C in T.get_corners())
			if(C.update_gen == update_gen)
				continue

			C.update_gen = update_gen
			C.affecting += src

			if(!C.active)
				effect_str[C] = 0
				continue

			APPLY_CORNER(C)



		if(!T.affecting_lights)
			T.affecting_lights = list()

		T.affecting_lights += src
		affecting_turfs    += T

		var/turf/simulated/open/O = T
		if(istype(O) && O.below)
			// Consider the turf below us as well. (Z-lights)
			//Do subprocessing for open turfs
			for(T = O.below; !isnull(T); T = process_the_turf(T,update_gen));

	END_FOR_DVIEW

	update_gen++

/datum/light_source/proc/process_the_turf(var/turf/T, update_gen)

	if(!T.lighting_corners_initialised)
		T.generate_missing_corners()

	for(var/datum/lighting_corner/C in T.get_corners())
		if(C.update_gen == update_gen)
			continue

		C.update_gen = update_gen
		C.affecting += src

		if(!C.active)
			effect_str[C] = 0
			continue

		APPLY_CORNER(C)

	if(!T.affecting_lights)
		T.affecting_lights = list()

	T.affecting_lights += src
	affecting_turfs    += T

	var/turf/simulated/open/O = T
	if(istype(O) && O.below)
		return O.below
	return null

/datum/light_source/proc/remove_lum()
	applied = FALSE

	for(var/turf/T in affecting_turfs)
		if(!T.affecting_lights)
			T.affecting_lights = list()
		else
			T.affecting_lights -= src

	affecting_turfs.Cut()

	for(var/datum/lighting_corner/C in effect_str)
		REMOVE_CORNER(C)

		C.affecting -= src

	effect_str.Cut()

/datum/light_source/proc/recalc_corner(var/datum/lighting_corner/C)
	if(effect_str.Find(C)) // Already have one.
		REMOVE_CORNER(C)

	APPLY_CORNER(C)

/datum/light_source/proc/smart_vis_update()
	var/list/datum/lighting_corner/corners = list()
	var/list/turf/turfs                    = list()
	FOR_DVIEW(var/turf/T, light_range, source_turf, 0)
		if(!T.lighting_corners_initialised)
			T.generate_missing_corners()
		corners |= T.get_corners()
		turfs   += T

		var/turf/simulated/open/O = T
		if(istype(O) && O.below)
			// Consider the turf below us as well. (Z-lights)
			for(T = O.below; !isnull(T); T = update_the_turf(T,corners, turfs));

	var/list/L = turfs - affecting_turfs // New turfs, add us to the affecting lights of them.
	affecting_turfs += L
	for(var/turf/T in L)
		if(!T.affecting_lights)
			T.affecting_lights = list(src)
		else
			T.affecting_lights += src

	L = affecting_turfs - turfs // Now-gone turfs, remove us from the affecting lights.
	affecting_turfs -= L
	for(var/turf/T in L)
		T.affecting_lights -= src

	for(var/datum/lighting_corner/C in corners - effect_str) // New corners
		C.affecting += src
		if(!C.active)
			effect_str[C] = 0
			continue

		APPLY_CORNER(C)

	for(var/datum/lighting_corner/C in effect_str - corners) // Old, now gone, corners.
		REMOVE_CORNER(C)
		C.affecting -= src
		effect_str -= C


/datum/light_source/proc/update_the_turf(var/turf/T, var/list/datum/lighting_corner/corners, var/list/turf/turfs)
	if(!T.lighting_corners_initialised)
		T.generate_missing_corners()
	corners |= T.get_corners()
	turfs   += T

	var/turf/simulated/open/O = T
	if(istype(O) && O.below)
		return O.below
	return null

#undef effect_update
#undef GET_LUM_DIST
#undef LUM_FALLOFF
#undef REMOVE_CORNER
#undef APPLY_CORNER

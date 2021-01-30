#if !defined(using_map_DATUM)
	#include "redline_areas.dm"
	#include "redline_jobs.dm"
	#include "redline_define.dm"
	#include "redline_outfits.dm"
	#include "redline-1.dmm"
	#include "redline-2.dmm"
	#include "redline-3.dmm"

	#include "loadout/_defines.dm"
	#include "loadout/loadout_accessories.dm"
	#include "loadout/loadout_eyes.dm"
	#include "loadout/loadout_gloves.dm"
	#include "loadout/loadout_head.dm"
	#include "loadout/loadout_shoes.dm"
	#include "loadout/loadout_suit.dm"
	#include "loadout/loadout_uniform.dm"
	#include "loadout/~define.dm"

	#include "../../code/modules/lobby_music/atriumcarceri.dm"
	#include "../../code/modules/lobby_music/angelsanddemons.dm"

	#define using_map_DATUM /datum/map/redline

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Red Line

#endif

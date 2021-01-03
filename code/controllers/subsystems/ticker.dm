#define SS_INIT_TICKER            -21
#define SS_PRIORITY_TICKER         200
#define SS_DISPLAY_TICKER         -10

SUBSYSTEM_DEF(ticker)
	name          = "Ticker"
	init_order    = SS_INIT_TICKER
	wait          = 2 SECONDS
	flags         = SS_KEEP_TIMING
	priority      = SS_PRIORITY_TICKER
	var/display_order = SS_DISPLAY_TICKER

	var/lastTickerTimeDuration
	var/lastTickerTime


/datum/controller/subsystem/ticker/New()
	NEW_SS_GLOBAL(SSticker)


/datum/controller/subsystem/ticker/Initialize(timeofday)
	lastTickerTime = world.timeofday

	if (!ticker)
		ticker = new

	spawn (0)
		if (ticker)
			ticker.pregame()

	..()


/datum/controller/subsystem/ticker/fire(resumed = FALSE)
	var/currentTime = world.timeofday

	if(currentTime < lastTickerTime) // check for midnight rollover
		lastTickerTimeDuration = (currentTime - (lastTickerTime - TICKS_IN_DAY)) / TICKS_IN_SECOND
	else
		lastTickerTimeDuration = (currentTime - lastTickerTime) / TICKS_IN_SECOND

	lastTickerTime = currentTime

	ticker.process()


/datum/controller/subsystem/ticker/proc/getLastTickerTimeDuration()
	return lastTickerTimeDuration
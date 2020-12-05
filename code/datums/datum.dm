/datum
	var/tmp/gc_destroyed //Time when this object was destroyed.
	var/tmp/is_processing = FALSE
	var/list/active_timers  //for SStimer

#ifdef TESTING
	var/tmp/running_find_references
	var/tmp/last_find_references = 0
#endif

/datum/proc/Process()
	set waitfor = 0
	return PROCESS_KILL
/mob/living/carbon/MiddleClickOn(atom/A)
	if(!A)
		return
	var/direction = get_dir(src, A)
	var/saythis = "Here!"
	switch(direction)
		if(NORTH)
			saythis = "North!"
		if(NORTHEAST)
			saythis = "Northeast!"
		if(EAST)
			saythis = "East!"
		if(SOUTHEAST)
			saythis = "Southeast!"
		if(SOUTH)
			saythis = "South!"
		if(SOUTHWEST)
			saythis = "Southwest!"
		if(WEST)
			saythis = "West!"
		if(NORTHWEST)
			saythis = "Northwest!"
	say(saythis)
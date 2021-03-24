/mob/living/death()
	if(hiding)
		hiding = FALSE
	reset_layer()
	. = ..()

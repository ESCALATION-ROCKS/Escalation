/*
For zooming with scope or binoculars. This is called from
modules/mob/mob_movement.dm if you move you will be zoomed out
modules/mob/living/carbon/human/life.dm if you die, you will be zoomed out.
*/

/mob/
	var/zoom = 0

//Looking through a scope or binoculars should /not/ improve your periphereal vision. Still, increase viewsize a tiny bit so that sniping isn't as restricted to NSEW
/mob/verb/zoom() //tileoffset is client view offset in the direction the user is facing. viewsize is how far out this thing zooms. 7 is normal view
	set category = "Object"
	set name = "Look into distance"

	if(!src.client)
		return
	var/cannotzoom = FALSE
	if(src.incapacitated(INCAPACITATION_DISABLED))
		to_chat(src, "<span class='warning'>You are unable to focus your vision.</span>")
		cannotzoom = TRUE

	if(!zoom && !cannotzoom)
		src.toggle_zoom_hud()
		zoom = TRUE
		var/tilesize = 50
		var/viewoffset = tilesize * 7
		var/pixel_x_final = 0
		var/pixel_y_final = 0
		if(src.dir & NORTH)
			pixel_y_final += viewoffset
		if(src.dir & SOUTH)
			pixel_y_final += -viewoffset
		if(src.dir & EAST)
			pixel_x_final += viewoffset
		if(src.dir & WEST)
			pixel_x_final += -viewoffset
		client.view = 10
		sleep(0.2 SECONDS)
		animate(client, pixel_x = pixel_x_final, time = 0.5 SECONDS)
		animate(client, pixel_y = pixel_y_final, time = 0.5 SECONDS)
		src.visible_message("[src] looks off into the distance.")
		src.set_face_dir()
		src.m_intent = "walk"
	else
		src.toggle_zoom_hud()
		zoom = FALSE
		client.view = world.view
		sleep(0.2 SECONDS)
		animate(client, pixel_x = 0, time = 0.5 SECONDS)
		animate(client, pixel_y = 0, time = 0.5 SECONDS)
		src.set_face_dir(facingdirnull = TRUE)
		src.m_intent = "run"

	return

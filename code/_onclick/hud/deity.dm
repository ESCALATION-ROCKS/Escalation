/mob/living/deity/InitializeHud(var/datum/hud/HUD)
	HUD.deity_hud()

/datum/hud/proc/deity_hud(ui_style = 'icons/mob/screen1_Midnight.dmi')
	src.adding = list()
	if(screentip_text)
		adding += screentip_text
	src.other = list()

	var/obj/screen/using

	using = new /obj/screen/intent()
	src.adding += using
	action_intent = using

	mymob.client.screen = list()
	mymob.client.screen += src.adding
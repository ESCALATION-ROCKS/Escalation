/obj/item/device/communicator/stationary
	name = "stationary commlink"
	icon = 'icons/obj/device.dmi'
	icon_state = "communicator_stationary"
	w_class = 5
	slot_flags = null

/obj/item/device/communicator/stationary/attack_hand(mob/user)
	initialize_exonet(user)
	alert_called = 0
	update_icon()
	ui_interact(user)
	if(video_source)
		watch_video(user)

/obj/item/device/communicator/stationary/attack_self(mob/user)
	return 0
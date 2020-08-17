/obj/item/device/boombox
	name = "boombox"
	icon = 'icons/obj/boombox.dmi'
	icon_state = "boombox"
	item_state = "boombox"
	var/obj/item/device/cassete/casseta = null
	var/datum/sound_token/sound_token
	var/playing = 0
	var/sound_id
	w_class = ITEM_SIZE_LARGE

/obj/item/device/boombox/nato
	icon_state = "boombox_nato"

/obj/item/device/boombox/New()
	..()
	sound_id = "[type]_[sequential_id(type)]"


/obj/item/device/boombox/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/device/cassete))
		if(casseta)
			to_chat(user, "<span class='warning'>There is already cassete inside.</span>")
			return
		if(!user.unEquip(I))
			return
		I.forceMove(src)
		casseta = I
		visible_message("<span class='notice'>[user] insert cassete into [src].</span>")
		playsound(get_turf(src), 'sound/items/boombox_casette.wav', 50, 1)
		return
	..()


/obj/item/device/boombox/MouseDrop(var/obj/over_object)
	if (!over_object || !(ishuman(usr) || issmall(usr)))
		return

	if (!(src.loc == usr))
		return

	switch(over_object.name)
		if("r_hand")
			eject()
		if("l_hand")
			eject()




/obj/item/device/boombox/proc/eject()
	if(usr.incapacitated())
		return
	if(!casseta)
		to_chat(usr, "<span class='warning'>There is no cassete inside.</span>")
		return

	if(playing)
		StopPlaying()
	visible_message("<span class='notice'>[usr] ejects cassete from [src].</span>")
	playsound(get_turf(src), 'sound/items/boombox_casette.wav', 50, 1)
	usr.put_in_hands(casseta)
	casseta = null

/obj/item/device/boombox/attack_self(mob/user)
	if(playing)
		StopPlaying()
		playsound(get_turf(src), 'sound/items/boombox_play.wav', 50, 1)
		return
	else
		StartPlaying()
		playsound(get_turf(src), 'sound/items/boombox_play.wav', 50, 1)


/obj/item/device/boombox/proc/StopPlaying() //TODO çàïèëèòü àïòåéäóñ èêîíñ
	playing = 0
	QDEL_NULL(sound_token)

/obj/item/device/boombox/proc/StartPlaying()
	if(isnull(casseta))
		return
	if(!casseta.sound_inside)
		return

	QDEL_NULL(sound_token)
	sound_token = sound_player.PlayLoopingSound(src, sound_id, casseta.sound_inside, volume = 50, range = 14, falloff = 3, prefer_mute = TRUE, ignore_vis = TRUE, streaming = TRUE)
	playing = 1

/obj/item/device/cassete
	name = "cassette"
	icon = 'icons/obj/boombox.dmi'
	icon_state = "cassette"
	var/sound/sound_inside
	w_class = ITEM_SIZE_TINY


/obj/item/cassetka_console
	name = "Downloading Console"
	icon = 'icons/obj/boombox.dmi'
	icon_state = "console"

// will write console cooldown later $_$ <==== my_ebalo

obj/item/cassetka_console/attack_hand(mob/user) //later do file size check %_%
	var/N = input("Music name") as text|null
	if(N)
		var/sound/S = input("Pick a song") as sound|null
		if(S)
			var/obj/item/device/cassete/casseta = new()
			casseta.sound_inside = S
			casseta.name = "[N]"
			casseta.loc = src.loc
			to_chat(user, "Tape completed.")



/obj/item/device/cassete/keineheimat
	name = "cassette - 'Ideal - Keine Heimat'"
	sound_inside = 'sound/music/keineheimat.ogg'

/obj/item/device/cassete/derkommissar
	name = "cassette - 'Falco - Der Kommisar'"
	sound_inside = 'sound/music/derkommisar.ogg'

/obj/item/device/cassete/luftballons
	name = "cassette - 'Nena - 99 Luftballons'"
	sound_inside = 'sound/music/luftballons.ogg'

/obj/item/device/cassete/liedvonvaterland
	name = "cassette - 'Lied von Vaterland'"
	sound_inside = 'sound/music/dasliedvomvaterland.ogg'

/obj/item/device/cassete/sagmirwodustehst
	name = "cassette - 'Sag mir, wo du stehst'"
	sound_inside = 'sound/music/sagmirwodustehst.ogg'

/obj/item/device/cassete/elektrichka
	name = "cassette - 'Kino - Elektrichka'"
	sound_inside = 'sound/music/elektrichka.ogg'

/obj/item/device/cassete/hardtimes
	name = "cassette - 'The Jetzons - Hard Times'"
	sound_inside = 'sound/music/hardtimes.ogg'

/obj/item/device/cassete/youvegotanotherthingcoming
	name = "cassette - 'Judas Priest - You've Got Another Thing Coming'"
	sound_inside = 'sound/music/youvegotanotherthingcoming.ogg'

/obj/item/device/cassete/themanwhosoldtheworld
	name = "cassette - 'Midge Ure - The Man Who Sold The World'"
	sound_inside = 'sound/music/soldworld.ogg'

/obj/item/device/cassete/outoftouch
	name = "cassette - 'Hall and Oates - Out Of Touch'"
	sound_inside = 'sound/music/outoftouch.ogg'


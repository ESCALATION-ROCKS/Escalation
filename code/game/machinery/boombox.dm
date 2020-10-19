/obj/item/device/boombox
	name = "boombox"
	icon = 'icons/obj/boombox.dmi'
	icon_state = "boombox"
	item_state = "boombox"
	var/obj/item/device/cassette/casseta = null
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
	if(istype(I, /obj/item/device/cassette))
		if(casseta)
			to_chat(user, "<span class='warning'>There is already cassette inside.</span>")
			return
		if(!user.unEquip(I))
			return
		I.forceMove(src)
		casseta = I
		visible_message("<span class='notice'>[user] insert cassette into [src].</span>")
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
		to_chat(usr, "<span class='warning'>There is no cassette inside.</span>")
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


/obj/item/device/boombox/proc/StopPlaying()
	playing = 0
	QDEL_NULL(sound_token)

/obj/item/device/boombox/proc/StartPlaying()
	StopPlaying()
	if(isnull(casseta))
		return
	if(casseta.sound_inside)
		return

	sound_token = sound_player.PlayLoopingSound(src, sound_id, casseta.sound_inside, volume = 50, range = 14, falloff = 3, prefer_mute = TRUE, ignore_vis = TRUE)
	playing = 1

/obj/item/device/cassette
	name = "cassette tape"
	desc = "A cassette tape."
	icon = 'icons/obj/boombox.dmi'
	icon_state = "cassette"
	var/sound/sound_inside
	w_class = ITEM_SIZE_TINY
	var/uploader_idiot
	var/current_side = 1
	var/sound/a_side
	var/sound/b_side

/*
/obj/item/device/cassette/New()
	icon_state = "cassette_[rand(0,12)]"
*/

/obj/item/device/cassette/attack_self(mob/user)
	. = ..()
	if(current_side == 1)
		sound_inside = b_side
		current_side = 2
		to_chat(user, "<span class='notice'>You flip the cassette over to the b-side.")
	else
		sound_inside = a_side
		current_side = 1
		to_chat(user, "<span class='notice'>You flip the cassette over to the a-side.")

/obj/item/device/cassette/tape1/New()
	..()
	name = "Tape No. 1"
	a_side = pick('sound/music/keineheimat.ogg','sound/music/derkommisar.ogg')
	b_side = 'sound/music/luftballons.ogg'
	sound_inside = a_side

/*
/obj/item/device/cassette/keineheimat
	name = "cassette - 'Ideal - Keine Heimat'"
	sound_inside = 'sound/music/keineheimat.ogg'

/obj/item/device/cassette/derkommissar
	name = "cassette - 'Falco - Der Kommisar'"
	sound_inside = 'sound/music/derkommisar.ogg'

/obj/item/device/cassette/luftballons/New()
	..()
	name = "cassette - 'Nena - 99 Luftballons'"
	sound_inside = 'sound/music/luftballons.ogg'

/obj/item/device/cassette/liedvonvaterland
	name = "cassette - 'Lied von Vaterland'"
	sound_inside = 'sound/music/dasliedvomvaterland.ogg'

/obj/item/device/cassette/sagmirwodustehst
	name = "cassette - 'Sag mir, wo du stehst'"
	sound_inside = 'sound/music/sagmirwodustehst.ogg'

/obj/item/device/cassette/elektrichka
	name = "cassette - 'Kino - Elektrichka'"
	sound_inside = 'sound/music/elektrichka.ogg'

/obj/item/device/cassette/hardtimes
	name = "cassette - 'The Jetzons - Hard Times'"
	sound_inside = 'sound/music/hardtimes.ogg'

/obj/item/device/cassette/youvegotanotherthingcoming
	name = "cassette - 'Judas Priest - You've Got Another Thing Coming'"
	sound_inside = 'sound/music/youvegotanotherthingcoming.ogg'

/obj/item/device/cassette/themanwhosoldtheworld
	name = "cassette - 'Midge Ure - The Man Who Sold The World'"
	sound_inside = 'sound/music/soldworld.ogg'

/obj/item/device/cassette/outoftouch
	name = "cassette - 'Hall and Oates - Out Of Touch'"
	sound_inside = 'sound/music/outoftouch.ogg'
*/
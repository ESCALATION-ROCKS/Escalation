/obj/item/device/boombox
	name = "boombox"
	icon = 'icons/obj/coldwar/boombox.dmi'
	icon_state = "boombox"
	item_state = "boombox"
	var/obj/item/device/cassette/casseta = null
	var/datum/sound_token/sound_token
	var/playing = 0
	var/sound_id
	w_class = ITEM_SIZE_NO_CONTAINER

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
	if(!casseta.sound_inside)
		return

	sound_token = sound_player.PlayLoopingSound(src, sound_id, casseta.sound_inside, volume = 40, range = 10, falloff = 3, prefer_mute = TRUE, ignore_vis = TRUE)
	playing = 1

/obj/item/device/cassette
	name = "cassette tape"
	desc = "A cassette tape."
	icon = 'icons/obj/coldwar/boombox.dmi'
	icon_state = "cassette_0"
	var/sound/sound_inside
	w_class = ITEM_SIZE_TINY
	var/uploader_idiot
	var/current_side = 1
	var/sound/a_side
	var/sound/b_side



/obj/item/device/cassette/New()
	icon_state = "cassette_[rand(0,12)]"

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
		
//1983 Tapes

/obj/item/device/cassette/nato/New()
	..()
	name = "pop music tape"
	desc = "A tape with a minimalist design. It reads 'Alphaville - Big In Japan'"
	a_side = 'sound/music/biginjapan.ogg'
	b_side = null
	sound_inside = a_side

/obj/item/device/cassette/warpact/New()
	..()
	name = "marschmusik tape"
	desc = "A tape with an unit number stamped on it. It reads 'Unterwegs!'"
	a_side = 'sound/music/unterwegs.ogg'
	b_side = null
	sound_inside = a_side


/*/obj/item/device/cassette/bdw/tape1/New()
	..()
	name = "Tape No. 1"
	desc = "Side A - Luftballons, Side B - Keine Heimat"
	a_side = 'sound/music/luftballons.ogg'
	b_side = 'sound/music/keineheimat.ogg'
	sound_inside = a_side

/obj/item/device/cassette/nva/tape2/New()
	..()
	name = "Tape No. 2"
	desc = "Side A - Das Lied Vom Vaterland, Side B - Aufmarsch"
	a_side = 'sound/music/dasliedvomvaterland.ogg'
	b_side = 'sound/music/aufmarsch.ogg'
	sound_inside = a_side

/obj/item/device/cassette/usa/tape3/New()
	..()
	name = "Tape No. 3"
	desc = "Side A - Out of Touch, Side B - Hard Times"
	a_side = 'sound/music/outoftouch.ogg'
	b_side = 'sound/music/hardtimes.ogg'
	sound_inside = a_side

/obj/item/device/cassette/usmc/tape4/New()
	..()
	name = "Tape No. 4"
	desc = "Side A - Another thing coming, Side B - Run to the hills"
	a_side = 'sound/music/youvegotanotherthingcoming.ogg'
	b_side = 'sound/music/runtothehills.ogg'
	sound_inside = a_side

/obj/item/device/cassette/usmc/tape5/New()
	..()
	name = "Tape No. 5"
	desc = "Side A - The Trooper, Side B - Die by the sword"
	a_side = 'sound/music/thetrooper.ogg'
	b_side = 'sound/music/diebythesword.ogg'
	sound_inside = a_side

/obj/item/device/cassette/bdw/tape6/New()
	..()
	name = "Tape No. 6"
	desc = "Side A - Der Kommissar, Side B - Bruttosozialprodukt"
	a_side = 'sound/music/derkommisar.ogg'
	b_side = 'sound/music/bruttosozialprodukt.ogg'
	sound_inside = a_side

/obj/item/device/cassette/usa/tape7/New()
	..()
	name = "Tape No. 7"
	desc = "Side A - Africa, Side B - Safety Dance"
	a_side = 'sound/music/africa.ogg'
	b_side = 'sound/music/safetydance.ogg'
	sound_inside = a_side

/obj/item/device/cassette/usmc/tape8/New()
	..()
	name = "Tape No. 8"
	desc = "Side A - Ironman, Side B - Electric Funeral"
	a_side = 'sound/music/ironman.ogg'
	b_side = 'sound/music/electricfuneral.ogg'
	sound_inside = a_side

/obj/item/device/cassette/usa/tape9/New()
	..()
	name = "Tape No. 9"
	desc = "Side A - Blue Monday, Side B - No Tengo Dinero"
	a_side = 'sound/music/bluemonday.ogg'
	b_side = 'sound/music/notengodinero.ogg'
	sound_inside = a_side

/obj/item/device/cassette/usmc/tape10/New()
	..()
	name = "Tape No. 10"
	desc = "Side A - Walk all over you, Side B - Chinatown"
	a_side = 'sound/music/walkalloveryou.ogg'
	b_side = 'sound/music/chinatown.ogg'
	sound_inside = a_side

/obj/item/device/cassette/bdw/tape11/New()
	..()
	name = "Tape No. 11"
	desc = "Side A - Ma Baker, Side B - Rasputin"
	a_side = 'sound/music/mabaker.ogg'
	b_side = 'sound/music/rasputin.ogg'
	sound_inside = a_side

/obj/item/device/cassette/bdw/tape12/New()
	..()
	name = "Tape No. 12"
	desc = "Side A - Ich Komme, Side B - Kosmonaut"
	a_side = 'sound/music/ichkomme.ogg'
	b_side = 'sound/music/kosmonaut.ogg'
	sound_inside = a_side

/obj/item/device/cassette/nva/tape13/New()
	..()
	name = "Tape No. 13"
	desc = "Side A - Unterwegs, Side B - We are friends forever"
	a_side = 'sound/music/unterwegs.ogg'
	b_side = 'sound/music/wearefriendsforever.ogg'
	sound_inside = a_side

/obj/item/device/cassette/nva/tape14/New()
	..()
	name = "Tape No. 14"
	desc = "Side A - Was wollen wir trinken, Side B - Oktobersong"
	a_side = 'sound/music/waswollenwirtrinken.ogg'
	b_side = 'sound/music/oktobersong.ogg'
	sound_inside = a_side

/obj/item/device/cassette/nva/tape15/New()
	..()
	name = "Tape No. 15"
	desc = "Side A - Sag mir wo dus tehst, Side B - Moorsoldaten"
	a_side = 'sound/music/sagmirwodustehst.ogg'
	b_side = 'sound/music/moorsoldaten.ogg'
	sound_inside = a_side

/obj/item/device/cassette/sa/tape16/New()
	..()
	name = "Tape No. 16"
	desc = "Side A - Slavianka, Side B - Katyusha"
	a_side = 'sound/music/farewellofslavianka.ogg'
	b_side = 'sound/music/katyusha.ogg'
	sound_inside = a_side

/obj/item/device/cassette/sa/tape17/New()
	..()
	name = "Tape No. 17"
	desc = "Side A - Nu Pogodi, Side B - Ya asphalt"
	a_side = 'sound/music/nupogodi.ogg'
	b_side = 'sound/music/yaasphalt.ogg'
	sound_inside = a_side

/obj/item/device/cassette/sa/tape18/New()
	..()
	name = "Tape No. 18"
	desc = "Side A - Vremya, Side B - Electrichka"
	a_side = 'sound/music/timenomoney.ogg'
	b_side = 'sound/music/elektrichka.ogg'
	sound_inside = a_side


/obj/item/device/cassette/sa/tape19/New()
	..()
	name = "Tape No. 19"
	desc = "Side A - Belaya Armiya, Chorniy Baron, Side B - Dark eyed cossack girl"
	a_side = 'sound/music/belaya.ogg'
	b_side = 'sound/music/cossackgirl.ogg'
	sound_inside = a_side*/
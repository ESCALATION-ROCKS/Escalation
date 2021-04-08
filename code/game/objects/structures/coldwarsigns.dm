/obj/structure/sign/russian
	name = "incomprehensible sign"
	desc = "A sign written in russian."

/obj/structure/sign/russian/electrical_danger
	icon_state = "RU_electrical_danger"

/obj/structure/sign/russian/caution
	icon_state = "RU_caution"

/obj/structure/sign/russian/staff_only
	icon_state = "RU_staff_only"

/obj/structure/sign/double/leaving	//The sign is 64x32, so it needs two tiles. ;3
	name = "warning message"
	desc = "You can read on it: 'You are leaving controlled sector'"

/obj/structure/sign/double/leaving/left
	icon_state = "leaving_left"

/obj/structure/sign/double/leaving/right
	icon_state = "leaving_right"

/obj/structure/sign/double/leaving/leftalt
	icon_state = "leaving_leftalt"

/obj/structure/sign/double/leaving/rightalt
	icon_state = "leaving_rightalt"


/obj/structure/sign/stop
	name = "STOP sign"
	icon = 'icons/obj/coldwardecorations.dmi'
	desc = "A warning sign which reads 'STOP'."
	icon_state = "stop"

/obj/structure/sign/donotenter
	name = "warning sign"
	icon = 'icons/obj/coldwardecorations.dmi'
	desc = "A warning sign which means do not entering this area."
	icon_state = "donotenter"

/obj/structure/sign/zebracrossing
	name = "zebra crossing sign"
	icon = 'icons/obj/coldwardecorations.dmi'
	desc = "That's a zebra crossing sign."
	icon_state = "zebracrossing"

/obj/structure/sign/parking
	name = "parking sign"
	icon = 'icons/obj/coldwardecorations.dmi'
	desc = "That's a parking sign."
	icon_state = "parking"

/obj/structure/sign/honeckerportrait
	name = "Honecker's portrait"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "portrait1"

/obj/structure/sign/andropovportrait
	name = "Andropov's portrait"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "portrait2"

/obj/structure/sign/stalinportrait
	name = "Stalin's portrait"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "portrait3"

/obj/structure/sign/leninportrait
	name = "Lenin's portrait"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "portrait4"

/obj/structure/sign/randomportrait
	name = "a portrait"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "portrait4"

/obj/structure/sign/randomportrait/New()
	..()
	icon_state = "portrait[rand(1, 4)]"


/obj/structure/sign/informativeplaque
    name = "an informative plaque"
    desc = "You can barely make anything out of this."
    icon = 'icons/obj/coldwardecorations.dmi'
    icon_state = "plaque1"

/obj/structure/sign/informativeplaque/New()
	..()
	icon_state = "plaque[rand(1, 3)]"

/obj/structure/sign/clock
	name = "clock"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "clocks"
	desc = "That's one looks like it doesn't work."

/obj/structure/sign/pinkfloyd
	name = "Pink Floyd poster"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "pinkfloyd"
	desc = "Comfortably numb."

/obj/structure/sign/posterlove
	name = "poster"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "post"

/obj/structure/sign/postermovie
	name = "movie poster"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "post2"

/obj/structure/sign/postereighties
	name = "odd poster"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "post3"

/obj/structure/sign/russian1
	name = "russiansign"
	icon = 'icons/obj/decals48.dmi'
	icon_state = "pereyaslavskoe"
	
/obj/structure/sign/russian2
	name = "russiansign"
	icon = 'icons/obj/decals48.dmi'
	icon_state = "graevka"

/obj/structure/sign/mcdonalds1
	name = "mcdonalds"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "mcdonalds1"

/obj/structure/sign/mcdonalds2
	name = "mcdonalds"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "mcdonalds2"

/obj/structure/sign/mcdonalds3
	name = "mcdonaldsr"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "mcdonalds3"

/obj/structure/sign/posterart
	name = "art poster"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "post4"

/obj/structure/sign/tv1
	name = "TV"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "rubin714"
	desc = "That's a Rubin-714, a Soviet-made TV. By the way, it doesn't seem to be working."

/obj/structure/sign/tv2
	name = "TV"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "rubin102"
	desc = "That's a Rubin-102, a Soviet-made TV. By the way, it doesn't seem to be working."

/obj/structure/sign/tv3
	name = "TV"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "rassvet307"
	desc = "That's a Rassvet-307, a Soviet-made TV. By the way, it doesn't seem to be working."

/obj/structure/sign/nes
	name = "NES"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "nes"
	desc = "That's the Nintendo Entertainment System."
	anchored = 0

/obj/structure/sign/powsock
	name = "power socket"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "rozetka"
	desc = "That's the power socket."
	anchored = 1

/obj/structure/sign/vhs
	name = "VHS player"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "vhsplayer"
	desc = "Does not have any cassette in it."
	anchored = 0

/obj/structure/sign/vinyl
	name = "Vinyl player"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "vinilplayer"
	desc = "An old vinyl player. Get with the times, old man!"
	anchored = 0

/obj/structure/sign/vinil
	name = "Vinyl"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "vinil"
	desc = "Put this in a player."
	anchored = 0

/obj/structure/sign/vhstape
	name = "VHS tape"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "vhs"
	desc = "Put this in a player."
	anchored = 0

/obj/structure/sign/vhsbox
	name = "VHS box"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "animal"
	desc = "A VHS box with a VHS tape in it."
	anchored = 0

/obj/structure/sign/money1
	name = "pile of money"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "money1"
	desc = "That's some bling there."
	anchored = 0

/obj/structure/sign/jew
	name = "davids star"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "davidstar"
	desc = "This indicates that there are Jews nearby."
	anchored = 1

/obj/structure/sign/muslim
	name = "'Allah' caligraphy"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "allah"
	desc = "This indicates that there are Muslims nearby."
	anchored = 1

/obj/structure/sign/prayermat
	name = "prayer mat"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "prayermat"
	desc = "Muslims pray on this."
	anchored = 1

/obj/structure/sign/prayermat2
	name = "prayer mat"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "prayermat2"
	desc = "Muslims pray on this."
	anchored = 1

/obj/structure/sign/mannequinmale
	name = "mannequin"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "mannequin_male"
	desc = "A storefront mannequin modeled after a muscular male."
	anchored = 1

/obj/structure/sign/mannequinfemale
	name = "mannequin"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "mannequin_female"
	desc = "A storefront mannequin modeled after a curvy female."
	anchored = 1

/obj/structure/sign/money2
	name = "tower of money"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "money2"
	desc = "You're stacking it high!."
	anchored = 0

/obj/structure/sign/money3
	name = "bunch of money"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "money3"
	desc = "You're the boss!."
	anchored = 0

/obj/structure/sign/trash
	name = "trash bags"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "trash"
	desc = "Nasty."
	anchored = 0

/obj/structure/sign/carpetleft
	name = "carpet"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "carpet1"
	desc = "That's a carpet"

/obj/structure/sign/carpetright
	name = "carpet"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "carpet2"
	desc = "That's a carpet"

/obj/structure/sign/cmd64
	name = "Commodore 64"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "cmd64"
	desc = "That's the Commodore 64, a computer used in a wide range of applications."

/obj/structure/sign/cashregister
	name = "cash register"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "cashregister"
	desc = "That's a regular cash register."

/obj/structure/sign/alpha1
	name = "ALPHA-1"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "alpha1"

/obj/structure/sign/alpha2
	name = "ALPHA-2"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "alpha2"

/obj/structure/sign/bravo2
	name = "BRAVO-2"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "bravo2"

/obj/structure/sign/bravo1
	name = "BRAVO-1"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "bravo1"

/obj/structure/sign/charlie1
	name = "CHARLIE-1"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "charlie1"

/obj/structure/sign/charlie2
	name = "CHARLIE-2"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "charlie2"

/obj/structure/sign/hospital
	name = "HOSPITAL"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "hospital"

/obj/structure/sign/command
	name = "COMMAND"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "command"

/obj/structure/sign/toiletsm
	name = "male restroom"
	icon = 'icons/obj/coldwardecorations.dmi'
	desc = "Toilets ahead."
	icon_state = "maletoilet"

/obj/structure/sign/toiletsf
	name = "male restroom"
	icon = 'icons/obj/coldwardecorations.dmi'
	desc = "Toilets ahead."
	icon_state = "femaletoilet"

/obj/structure/sign/toilets
	name = "unisex restroom"
	icon = 'icons/obj/coldwardecorations.dmi'
	desc = "Toilets ahead."
	icon_state = "unisextoilet"

/obj/structure/sign/warning/nosmoking_1
	name = "NO SMOKING"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "nosmoking"

/obj/structure/clock
	name = "clock"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "clock"
	anchored = 1
	density = 1
	opacity = 1

/*/obj/structure/clock/examine(mob/user)
	to_chat(user, "The time [stationtime2text()] is displayed in the corner of the screen.")*/

//////////TIRES
/obj/structure/tires
	name = "pile of tires"
	desc = "Can be used as a makeshift reinforcement. Probably."
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "tires"
	opacity = 0
	density = 0
	anchored = 1
	/*var/pass_chance = 50*/

/obj/structure/tires/New()
	dir = pick(1,2,4,8)
	update_icon()
/*/obj/structure/tires/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile) && prob(pass_chance))
		return 1
	else
		return 0*/

/obj/structure/tires/big
	name = "pile of tires"
	desc = "Can be used as a makeshift reinforcement. Probably."
	icon_state = "tiresbig"
	appearance_flags = PIXEL_SCALE
	opacity = 0
	density = 1
	anchored = 1
	/*pass_chance = 85*/

/////////////ROAD SIGNS


/obj/structure/sign/raduzhnoe
	name = "Raduzhnoe village"
	icon = 'icons/obj/decals48.dmi'
	icon_state = "raduzhnoe"

/obj/structure/sign/stogovka
	name = "Stogovka river"
	icon = 'icons/obj/decals48.dmi'
	icon_state = "stogovka"

/obj/structure/sign/cafe
	name = "cafe sign"
	icon_state = "cafesign"

/obj/structure/sign/gasoline
	name = "gasoline sign"
	icon_state = "gasolinesign"

/obj/structure/sign/human
	name = "'human on the road' sign"
	icon_state = "humansign"

/obj/structure/sign/way
	name = "direction sign"
	icon_state = "waysign"


/obj/structure/sign/roadsign
	icon = 'icons/obj/road_signs.dmi'
	plane = -15
	density = 1

/obj/structure/sign/roadsign/medical
	name = "medical sign"
	icon_state = "medical"

/obj/structure/sign/roadsign/stop
	name = "stop sign"
	icon_state = "stop"

/obj/structure/sign/roadsign/warning
	name = "warning sign"
	icon_state = "warning"

/obj/structure/sign/roadsign/forward
	name = "forward sign"
	icon_state = "forward"

/obj/structure/sign/roadsign/bus
	name = "bus stop sign"
	icon_state = "busstop"



////////////////FLAGPOLES & 48X FLAGS

/obj/structure/sign/flag
	icon = 'icons/obj/flags.dmi'

/obj/structure/sign/flag/ussr
	name = "USSR flag"
	icon_state = "sovietflag"

/obj/structure/sign/flag/germanflag
	name = "German flag"
	icon_state = "germanflag"

/obj/structure/sign/flag/ddrflag
	name = "DDR flag"
	icon_state = "ddrflag"

/obj/structure/sign/flag/natoflag
	name = "NATO flag"
	icon_state = "natoflag"

/obj/structure/sign/flag/usaflag
	name = "USA flag"
	icon_state = "usaflag"

/obj/structure/sign/flag/usmcflag
	name = "USMC flag"
	icon_state = "usmcflag"

/obj/structure/sign/flag/finnflag
	name = "Finnish flag"
	icon_state = "finnflag"

/obj/structure/sign/flag/britflag
	name = "British flag"
	icon_state = "britishflag"

/obj/structure/sign/flag/czechflag
	name = "Czechoslovakia flag"
	icon_state = "cslaflag"

/obj/structure/sign/flag/heerflag
	name = "Austria flag"
	icon_state = "heerflag"

///////////REGULAR 32X FLAGS

/obj/structure/sign/soviet_flag
	name = "Soviet flag"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "soviet_flag"
	desc = "That's the Soviet Union flag."

/obj/structure/sign/ddr_flag
	name = "DDR flag"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "ddr_flag"
	desc = "That's the Deutsche Demokratische Republik flag."

/obj/structure/sign/czech_flag
	name = "Czechoslovakia flag"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "csla_flag"
	desc = "That's the Czechoslovakia flag."

/obj/structure/sign/heer_flag
	name = "Austria flag"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "heer_flag"
	desc = "That's the Austria flag."

/obj/structure/sign/westgerman_flag
	name = "West German flag"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "westgerman_flag"
	desc = "That's the West Germany flag."

/obj/structure/sign/ass_flag
	name = "Gabol portrait"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "assflag"
	desc = "That's the portrait of the St. MrGabol100."

/obj/structure/sign/usmc_flag
	name = "USA flag"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "usa_flag"
	desc = "That's the United States of America flag."

/obj/structure/sign/finn_flag
	name = "Finnish flag"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "finn_flag"
	desc = "That's the Finland flag."

/obj/structure/sign/british_flag
	name = "British flag"
	icon = 'icons/obj/coldwardecorations.dmi'
	icon_state = "brit_flag"
	desc = "That's the Great Britain flag."









/////////DECORATIVE MANNEQUINS FROM BAY12 - ONLY FOR DECORATING ARCADES ETC. DON'T USE THESE ANYWHERE ELSE LOOKS WACKY AS FUCK


/obj/structure/sign/mannequincool1
	name = "decorative mannequin"
	icon = 'icons/obj/fancydecals.dmi'
	icon_state = "syndicatemelee"
	desc = "A decorative mannequin. It looks damn cool!"
	anchored = 1

/obj/structure/sign/mannequincool2
	name = "decorative mannequin"
	icon = 'icons/obj/fancydecals.dmi'
	icon_state = "syndicateranged"
	desc = "A decorative mannequin. It looks damn cool!"
	anchored = 1
	
/obj/structure/sign/mannequincool3
	name = "decorative mannequin"
	icon = 'icons/obj/fancydecals.dmi'
	icon_state = "syndicatemeleespace"
	desc = "A decorative mannequin. It looks damn cool!"
	anchored = 1

/obj/structure/sign/mannequincool4
	name = "decorative mannequin"
	icon = 'icons/obj/fancydecals.dmi'
	icon_state = "syndicaterangedspace"
	desc = "A decorative mannequin. It looks damn cool!"
	anchored = 1

/obj/structure/sign/mannequincool5
	name = "decorative mannequin"
	icon = 'icons/obj/fancydecals.dmi'
	icon_state = "piratemelee"
	desc = "A decorative mannequin. It looks damn cool!"
	anchored = 1
	
/obj/structure/sign/mannequincool6
	name = "decorative mannequin"
	icon = 'icons/obj/fancydecals.dmi'
	icon_state = "pirateranged"
	desc = "A decorative mannequin. It looks damn cool!"
	anchored = 1
	
/obj/structure/sign/mannequincool7
	name = "clown mannequin"
	icon = 'icons/obj/fancydecals.dmi'
	icon_state = "clown"
	desc = "A mannequin of Ronald McDonald!"
	anchored = 1
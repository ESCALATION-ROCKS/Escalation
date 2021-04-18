/obj/structure/sign
	icon = 'icons/obj/decals.dmi'
	anchored = 1
	opacity = 0
	density = 0
	layer = ABOVE_WINDOW_LAYER
	w_class = ITEM_SIZE_NORMAL

/obj/structure/sign/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			qdel(src)
			return
		if(3.0)
			qdel(src)
			return
		else
	return

/obj/structure/sign/attackby(obj/item/tool as obj, mob/user as mob)	//deconstruction
	if(istype(tool, /obj/item/weapon/screwdriver) && !istype(src, /obj/structure/sign/double))
		to_chat(user, "You unfasten the sign with your [tool.name].")
		var/obj/item/sign/S = new(src.loc)
		S.name = name
		S.desc = desc
		S.icon_state = icon_state
		S.sign_state = icon_state
		qdel(src)
	else ..()

/obj/item/sign
	name = "sign"
	desc = ""
	icon = 'icons/obj/decals.dmi'
	w_class = ITEM_SIZE_NORMAL		//big
	var/sign_state = ""

/obj/item/sign/attackby(obj/item/tool as obj, mob/user as mob)	//construction
	if(istype(tool, /obj/item/weapon/screwdriver) && isturf(user.loc))
		var/direction = input("In which direction?", "Select direction.") in list("North", "East", "South", "West", "Cancel")
		if(direction == "Cancel") return
		var/obj/structure/sign/S = new(user.loc)
		switch(direction)
			if("North")
				S.pixel_y = 32
			if("East")
				S.pixel_x = 32
			if("South")
				S.pixel_y = -32
			if("West")
				S.pixel_x = -32
			else return
		S.name = name
		S.desc = desc
		S.icon_state = sign_state
		to_chat(user, "You fasten \the [S] with your [tool].")
		qdel(src)
	else ..()

/obj/structure/sign/double/map
	name = "map"
	desc = "A framed map."

/obj/structure/sign/double/map/New()
	..()
	desc = "A framed map of the [station_name()]."

/obj/structure/sign/double/map/left
	icon_state = "map-left"

/obj/structure/sign/double/map/right
	icon_state = "map-right"

/obj/structure/sign/monkey_painting
	name = "\improper Mr. Deempisi portrait"
	desc = "Under the painting a plaque reads: 'While the meat grinder may not have spared you, fear not. Not one part of you has gone to waste... You were delicious.'"
	icon_state = "monkey_painting"

/obj/structure/sign/warning
	name = "\improper WARNING"
	icon_state = "securearea"

/obj/structure/sign/warning/detailed
	icon_state = "securearea2"

/obj/structure/sign/warning/New()
	..()
	desc = "A warning sign which reads '[sanitize(name)]'."

/obj/structure/sign/warning/airlock
	name = "\improper EXTERNAL AIRLOCK"
	icon_state = "doors"

/obj/structure/sign/warning/biohazard
	name = "\improper BIOHAZARD"
	icon_state = "bio"

/obj/structure/sign/warning/bomb_range
	name = "\improper BOMB RANGE"
	icon_state = "blast"

/obj/structure/sign/warning/caution
	name = "\improper CAUTION"

/obj/structure/sign/warning/compressed_gas
	name = "\improper COMPRESSED GAS"
	icon_state = "hikpa"

/obj/structure/sign/warning/deathsposal
	name = "\improper DISPOSAL LEADS TO SPACE"
	icon_state = "deathsposal"

/obj/structure/sign/warning/docking_area
	name = "\improper KEEP CLEAR: DOCKING AREA"

/obj/structure/sign/warning/engineering_access
	name = "\improper ENGINEERING ACCESS"

/obj/structure/sign/warning/fall
	name = "\improper FALL HAZARD"
	icon_state = "falling"

/obj/structure/sign/warning/fire
	name = "\improper DANGER: FIRE"
	icon_state = "fire"

/obj/structure/sign/warning/high_voltage
	name = "\improper HIGH VOLTAGE"
	icon_state = "shock"

/obj/structure/sign/warning/hot_exhaust
	name = "\improper HOT EXHAUST"
	icon_state = "fire"

/obj/structure/sign/warning/internals_required
	name = "\improper INTERNALS REQUIRED"

/obj/structure/sign/warning/lethal_turrets
	name = "\improper LETHAL TURRETS"
	icon_state = "turrets"

/obj/structure/sign/warning/lethal_turrets/New()
	..()
	desc += " Enter at own risk!."

/obj/structure/sign/warning/mail_delivery
	name = "\improper MAIL DELIVERY"
	icon_state = "mail"

/obj/structure/sign/warning/moving_parts
	name = "\improper MOVING PARTS"
	icon_state = "movingparts"

/obj/structure/sign/warning/nosmoking_2
	name = "\improper NO SMOKING"
	icon_state = "nosmoking2"

/obj/structure/sign/warning/pods
	name = "\improper ESCAPE PODS"
	icon_state = "pods"

/obj/structure/sign/warning/radioactive
	name = "\improper RADIOACTIVE AREA"
	icon_state = "radiation"

/obj/structure/sign/warning/secure_area
	name = "\improper SECURE AREA"

/obj/structure/sign/warning/secure_area/armory
	name = "\improper ARMORY"
	icon_state = "armory"

/obj/structure/sign/warning/server_room
	name = "\improper SERVER ROOM"
	icon_state = "server"

/obj/structure/sign/warning/siphon_valve
	name = "\improper SIPHON VALVE"

/obj/structure/sign/warning/vacuum
	name = "\improper HARD VACUUM AHEAD"
	icon_state = "space"

/obj/structure/sign/warning/vent_port
	name = "\improper EJECTION/VENTING PORT"

/obj/structure/sign/redcross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "redcross"

/obj/structure/sign/greencross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "greencross"

/obj/structure/sign/bluecross_1
	name = "infirmary"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "bluecross"

/obj/structure/sign/bluecross_2
	name = "infirmary"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "bluecross2"

/obj/structure/sign/goldenplaque
	name = "The Most Robust Men Award for Robustness"
	desc = "To be Robust is not an action or a way of life, but a mental state. Only those with the force of Will strong enough to act during a crisis, saving friend from foe, are truly Robust. Stay Robust my friends."
	icon_state = "goldenplaque"

/obj/structure/sign/goldenplaque/security
	name = "motivational plaque"
	desc = "A plaque engraved with a generic motivational quote and picture. ' Greater love hath no man than this, that a man lay down his life for his friends. John 15:13 "

/obj/structure/sign/goldenplaque/medical
	name = "medical certificate"
	desc = "A picture next to a long winded description of medical certifications and degrees."

/obj/structure/sign/kiddieplaque
	name = "\improper AI developers plaque"
	desc = "An extremely long list of names and job titles and a picture of the design team responsible for building this AI Core."
	icon_state = "kiddieplaque"

/obj/structure/sign/memorialplaque
	name = "\improper memorial plaque"
	desc = "An extremely long list of names. They're all died defending the Subway."
	icon_state = "memorialplaque"

/obj/structure/sign/memorialplaque/right
	icon_state = "memorialplaque2"

/obj/structure/sign/atmosplaque
	name = "\improper engineering memorial plaque"
	desc = "This plaque memorializes those engineers and technicians who made the ultimate sacrifice to save their vessel and its crew."
	icon_state = "atmosplaque"

/obj/structure/sign/floorplaque
	name = "\improper commemorative plaque"
	desc = "A list of dead explorers who gave their lives in search of the next great discovery. Hope you don't join them."
	icon_state = "floorplaque"

/obj/structure/sign/double/solgovflag
	name = "Sol Central Government Flag"
	desc = "The flag of the Sol Central Government, a symbol of many things to many people."

/obj/structure/sign/double/solgovflag/left
	icon_state = "solgovflag-left"

/obj/structure/sign/double/solgovflag/right
	icon_state = "solgovflag-right"

/obj/structure/sign/double/provgovflag
	name = "Provisional Government Flag"
	desc = "Such a pompous symbol for such a pathethic state, isn't it?"

/obj/structure/sign/double/provgovflag/left
	icon_state = "provgovflag-left"

/obj/structure/sign/double/provgovflag/right
	icon_state = "provgovflag-right"

/obj/structure/sign/double/maltesefalcon	//The sign is 64x32, so it needs two tiles. ;3
	name = "The Maltese Falcon"
	desc = "The Maltese Falcon, Space Bar and Grill."

/obj/structure/sign/double/maltesefalcon/left
	icon_state = "maltesefalcon-left"

/obj/structure/sign/double/maltesefalcon/right
	icon_state = "maltesefalcon-right"

/obj/structure/sign/warning/science
	name = "\improper SCIENCE!"
	icon_state = "science1"

/obj/structure/sign/warning/science/anomalous_materials
	name = "\improper ANOMALOUS MATERIALS"

/obj/structure/sign/warning/science/mass_spectrometry
	name = "\improper MASS SPECTROMETRY"

/obj/structure/sign/science_1
	name = "\improper RESEARCH WING"
	desc = "A sign labelling the research wing."
	icon_state = "science1"

/obj/structure/sign/science_2
	name = "\improper RESEARCH"
	desc = "A sign labelling an area where research is performed."
	icon_state = "science2"

/obj/structure/sign/xenobio_1
	name = "\improper XENOBIOLOGY"
	desc = "A sign labelling an area as a place where xenobiological entites are researched."
	icon_state = "xenobio"

/obj/structure/sign/xenobio_2
	name = "\improper XENOBIOLOGY"
	desc = "A sign labelling an area as a place where xenobiological entites are researched."
	icon_state = "xenobio2"

/obj/structure/sign/xenobio_3
	name = "\improper XENOBIOLOGY"
	desc = "A sign labelling an area as a place where xenobiological entites are researched."
	icon_state = "xenobio3"

/obj/structure/sign/xenobio_4
	name = "\improper XENOBIOLOGY"
	desc = "A sign labelling an area as a place where xenobiological entites are researched."
	icon_state = "xenobio4"

/obj/structure/sign/xenoarch
	name = "\improper XENOARCHAEOLOGY"
	desc = "A sign labelling an area as a place where xenoarchaeological finds are researched."
	icon_state = "xenobio4"

/obj/structure/sign/chemistry
	name = "\improper CHEMISTRY"
	desc = "A sign labelling an area containing chemical equipment."
	icon_state = "chemistry1"

/obj/structure/sign/xenoflora
	name = "\improper XENOFLORA"
	desc = "A sign labelling an area as a place where xenobiological plants are researched."
	icon_state = "hydro4"

/obj/structure/sign/botany
	name = "\improper BOTANY"
	desc = "A warning sign which reads 'BOTANY!'."
	icon_state = "hydro3"

/obj/structure/sign/hydro
	name = "\improper HYDROPONICS"
	desc = "A sign labelling an area as a place where plants are grown."
	icon_state = "hydro1"

/obj/structure/sign/hydrostorage
	name = "\improper HYDROPONICS STORAGE"
	desc = "A sign labelling an area as a place where plant growing supplies are kept."
	icon_state = "hydro3"

/obj/structure/sign/solgov
	name = "\improper SolGov Seal"
	desc = "A sign which signifies who this vessel belongs to."
	icon_state = "solgovseal"

/obj/structure/sign/directions
	name = "direction sign"
	desc = "A direction sign, claiming to know the way."
	icon_state = "direction"

/obj/structure/sign/directions/New()
	..()
	desc = "A direction sign, pointing out which way \the [src] is."

/obj/structure/sign/directions/science
	name = "\improper Research Division"
	icon_state = "direction_sci"

/obj/structure/sign/directions/engineering
	name = "\improper Engineering Bay"
	icon_state = "direction_eng"

/obj/structure/sign/directions/security
	name = "\improper Security Wing"
	icon_state = "direction_sec"

/obj/structure/sign/directions/medical
	name = "\improper Medical Bay"
	icon_state = "direction_med"

/obj/structure/sign/directions/evac
	name = "\improper Evacuation Wing"
	icon_state = "direction_evac"

/obj/structure/sign/directions/bridge
	name = "\improper Bridge"
	icon_state = "direction_bridge"

/obj/structure/sign/directions/supply
	name = "\improper Supply Office"
	icon_state = "direction_supply"

/obj/structure/sign/directions/infirmary
	name = "\improper Infirmary"
	icon_state = "direction_infirm"

/obj/structure/sign/directions/examroom
	name = "\improper Exam Room"
	icon_state = "examroom"

/obj/structure/sign/deck/bridge
	name = "\improper Bridge Deck"
	icon_state = "deck-b"

/obj/structure/sign/deck/first
	name = "\improper First Deck"
	icon_state = "deck-1"

/obj/structure/sign/deck/second
	name = "\improper Second Deck"
	icon_state = "deck-2"

/obj/structure/sign/deck/third
	name = "\improper Third Deck"
	icon_state = "deck-3"

/obj/structure/sign/deck/fourth
	name = "\improper Fourth Deck"
	icon_state = "deck-4"

/obj/structure/sign/soviet/passport
	name = "My comrade"
	desc = "A sign depicting a passport os USSR-3, the slogan reads 'Moy tovarysch.'"
	icon_state = "sovietposter"

/obj/structure/sign/soviet/ks13glory
	name = "KS13"
	desc = "A sign which reads 'Glory to the space station of The New Comintern!"
	icon_state = "KC13glory"

/obj/structure/sign/soviet/armyglory
	name = "Space Army"
	desc = "A sign which reads 'Glory to the Space Army!"
	icon_state = "glorytospacearmy"

/obj/structure/sign/double/planet
	name = "planet"
	desc = "A framed picture of the planet."

/obj/structure/sign/double/planet/left
	icon_state = "planet-left"

/obj/structure/sign/double/planet/right
	icon_state = "planet-right"

/obj/structure/sign/double/sky
	name = "cloudy sky"
	desc = "A framed picture of the cloudy sky."

/obj/structure/sign/double/sky/left
	icon_state = "sky-left"

/obj/structure/sign/double/sky/right
	icon_state = "sky-right"

/obj/structure/sign/double/mountain
	name = "mountain"
	desc = "A framed picture of the mountain."

/obj/structure/sign/double/mountain/left
	icon_state = "mountain-left"

/obj/structure/sign/double/mountain/right
	icon_state = "mountain-right"

/obj/structure/sign/securearea
	name = "\improper SECURE AREA"
	desc = "A warning sign which reads 'SECURE AREA'."
	icon_state = "securearea"

/obj/structure/sign/medbaylogo
	name = "\improper medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here.'"
	icon_state = "medlogo"

/obj/structure/sign/medbaylogo2
	name = "\improper medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here.'"
	icon_state = "medlogo2"

/obj/structure/sign/sovietradiation
	name = "\improper RADIOACTIVE AREA"
	desc = "A warning sign which reads 'RADIOACTIVE AREA'."
	icon_state = "goonradiation"

/obj/structure/sign/soviet
	name = "\improper SOVIET SERP AND MOLOT"
	desc = "In NanoTrasen, you can always find a party, in Space Soviet Russia, Party finds YOU!!"
	icon_state = "sovietbanner"

/obj/structure/sign/casino
	name = "Casino Night"
	desc = "Come on in and have a drink!."
	icon_state = "casino"

//Tau Ceti hell signs
/obj/structure/sign/velocity
	name = "Direction sign"
	icon_state = "tablo01"

/obj/structure/sign/dock
	name = "LED Display"
	icon_state = "dock1"

/obj/structure/sign/dock/tablo2
	icon_state = "dock2"

/obj/structure/sign/dock/tablo3
	icon_state = "dock3"

/obj/structure/sign/dock/tablo4
	icon_state = "dock4"

/obj/structure/sign/dock/tablo5
	icon_state = "dock5"

/obj/structure/sign/dock/arrival
	icon_state = "arrival"

/*####################D2 SIGNS####################*/
/*
obj/structure/sign/noshitlers
	name = "No shitlers!"
	desc = "A warning sign which reads 'No shitlers allowed!'"
	icon_state = "noshitlers"
*/

//Sometime

/obj/structure/sign/cleanhands
	name = "CLEAN HANDS!"
	desc = "A warning sign which reads 'Clean hands! Save Lives!'"
	icon_state = "cleanhands"

/obj/structure/sign/silenceplease
	name = "Silence please!"
	desc = "A warning sign which reads 'Silence please!'"
	icon_state = "silenceplease"

/obj/structure/sign/medholo
	name = "Medical Hologram"
	desc = "A medical hologram. Looks very nice."
	icon_state = "medholo"

/obj/structure/sign/noshit
	name = "People DIE if you KILL!"
	desc = "A warning sign which reads 'People DIE if you KILL!'"
	icon_state = "noshit"

/*
/obj/structure/sign/double/laundromat
	name = "Laundromat"
	icon = 'icons/obj/barsigns.dmi'
	desc = "Laundromat"
	icon_state = "laundromat"

/obj/structure/sign/double/church
	name = "Jesus Chatline"
	icon = 'icons/obj/barsigns.dmi'
	desc = ""
	icon_state = "church"

/obj/structure/sign/double/bully
	name = "No cyberbullying!"
	icon = 'icons/obj/barsigns.dmi'
	desc = ""
	icon_state = "bully"
*/

/obj/structure/sign/double/chan
	name = "for chan poster"
	icon_state = "4chan"

/obj/structure/sign/double/chan/left1
	icon_state = "chan0"

/obj/structure/sign/double/chan/left2
	icon_state = "chan1"

/obj/structure/sign/double/chan/right1
	icon_state = "chan2"

/obj/structure/sign/double/chan/right2
	icon_state = "chan3"

/obj/structure/sign/medicalarrow
	name = "Medical Arrow"
	desc = ""
	icon_state = "medicalfs"


/*####################DECK SIGNS####################*/
/obj/structure/sign/deck/bridge
	name = "Bridge"
	desc = ""

	bridge0
		icon_state = "bridge0"
	bridge1
		icon_state = "bridge1"
	bridge2
		icon_state = "bridge2"

/obj/structure/sign/deck/sub
	name = "Sub Deck"
	desc = ""

	sub0
		icon_state = "sub0"
	sub1
		icon_state = "sub1"

/obj/structure/sign/deck/main
	name = "Main Deck"
	desc = ""

	main0
		icon_state = "main0"
	main1
		icon_state = "main1"

/obj/structure/sign/deck/engine
	name = "Engine Deck"
	desc = ""

	enge0
		icon_state = "enge0"
	enge1
		icon_state = "enge1"
	enge2
		icon_state = "enge2"
	enge3
		icon_state = "enge3"

/*####################SIGNS OF DEPATRTAMENTS####################*/

/obj/structure/sign/departments/library
	desc = "Library"
	name = "Library"
	icon_state = "library"

/obj/structure/sign/departments/old/lounge
	desc = "The Lounge"
	name = "The Lounge"
	icon_state = "lounge_old"

/obj/structure/sign/departments/Storage
	desc = "Storage"
	name = "Storage"
	icon_state = "Storage"

/obj/structure/sign/departments/old/AI
	desc = "AI"
	name = "AI"
	icon_state = "AI_old"

/obj/structure/sign/departments/old/kitchen
	desc = "Kitchen"
	name = "Kitchen"
	icon_state = "kitchen_old"

/obj/structure/sign/departments/old/bar
	desc = "Bar"
	name = "Bar"
	icon_state = "bar_old"

/obj/structure/sign/departments/old/medbay
	desc = "Medbay"
	name = "Medbay"
	icon_state = "medbay_old"

/obj/structure/sign/departments/hydroponics
	desc = "Hydroponics"
	name = "Hydroponics"
	icon_state = "hydroponics"

/obj/structure/sign/departments/old/engineering
	desc = "Engineering"
	name = "Engineering"
	icon_state = "engineering_old"

/obj/structure/sign/departments/old/bridge
	desc = "Bridge"
	name = "Bridge"
	icon_state = "bridge_old"

/obj/structure/sign/departments/brig
	desc = "Brig"
	name = "Brig"
	icon_state = "brig"

/obj/structure/sign/departments/old/atmos
	desc = "Atmospherics"
	name = "Atmospherics"
	icon_state = "atmos_old"

/obj/structure/sign/departments/crew
	desc = "Dormitory"
	name = "Dormitory"
	icon_state = "crew"
/obj/structure/sign/departments/old/tele
	desc = "Teleporter"
	name = "Teleporter"
	icon_state = "Teleporter_old"

/obj/structure/sign/departments/qm
	desc = "Quatermaster"
	name = "Quatermaster"
	icon_state = "Quatermaster"

/obj/structure/sign/departments/old/gas
	desc = "Gas Storage"
	name = "Gas Storage"
	icon_state = "Gas Storage_old"

/obj/structure/sign/departments/chemist
	name = "Chemist"
	desc = "Chemist"
	icon_state = "Chemist"

/obj/structure/sign/departments/morgue
	name = "Morgue"
	desc = "Morgue"
	icon_state = "Morgue"

/obj/structure/sign/departments/emt
	name = "E.M.T"
	desc = "E.M.T"
	icon_state = "EMT"

/obj/structure/sign/departments/genetics
	name = "Genetics"
	desc = "Genetics"
	icon_state = "genetics"

/obj/structure/sign/departments/virology
	name = "Virology"
	desc = "Virology"
	icon_state = "virology"

/obj/structure/sign/departments/cryo
	name = "Cryogenics"
	desc = "Cryogenics"
	icon_state = "Cryogenics"

/obj/structure/sign/departments/chiefengineer
	name = "Chief Engineer"
	desc = "Chef Engineer's office"
	icon_state = "chief"

/obj/structure/sign/departments/old/virology
	name = "Virology"
	desc = "Virology Lab"
	icon_state = "Virology_old"

/obj/structure/sign/departments/old/bank
	name = "Bank"
	desc = "Bank"
	icon_state = "Bank_old"

/obj/structure/sign/departments/old/brig
	name = "Brig"
	desc = "Brig"
	icon_state = "Brig_old"

/obj/structure/sign/departments/old/chemist
	name = "Chemist"
	desc = "Chem. Lab"
	icon_state = "Chemist_old"

/obj/structure/sign/departments/old/dorm
	name = "Dormitories"
	desc = "Dormitories"
	icon_state = "Crew_old"

/obj/structure/sign/departments/old/cryo
	name = "Cryogenics"
	desc = "Cryogenics"
	icon_state = "Cryogenics_old"

/obj/structure/sign/departments/old/robotics
	name = "Mech Bay"
	desc = "Mech Bay"
	icon_state = "Robotics_old"

/obj/structure/sign/departments/old/store
	name = "Store"
	desc = "Store"
	icon_state = "Storage_old"

/obj/structure/sign/departments/cargo
	name = "Cargobay"
	desc = "Cargobay"
	icon_state = "Cargobay"

/obj/structure/sign/departments/bank
	name = "Bank"
	desc = "Bank"
	icon_state = "Bank"

/obj/structure/sign/departments/emergency
	name = "E.R"
	desc = "Emergency Response"
	icon_state = "emergency"


/*####################TG SIGNS####################*/

/obj/structure/sign/directions/science
	name = "science department"
	desc = "A direction sign, pointing out which way the Science department is."
	icon_state = "direction_sci"

/obj/structure/sign/directions/engineering
	name = "engineering department"
	desc = "A direction sign, pointing out which way the Engineering department is."
	icon_state = "direction_eng"

/obj/structure/sign/directions/security
	name = "security department"
	desc = "A direction sign, pointing out which way the Security department is."
	icon_state = "direction_sec"

/obj/structure/sign/directions/evac
	name = "escape arm"
	desc = "A direction sign, pointing out which way the escape shuttle dock is."
	icon_state = "direction_evac"

/obj/structure/sign/chemtable
	name = "The Periodic Table"
	desc = "A very colorful and detailed table of all the chemical elements you could blow up or burn down a chemistry laboratory with, titled 'The Space Periodic Table - To be continued'. Just the mere sight of it makes you feel smarter."
	icon_state = "periodic"

/*####################GEMINI SIGNS####################*/

/obj/structure/sign/minerscape
	name = "escape arrow"
	desc = "The marker of direction to escape shuttle"
	icon_state = "whitescape"

/obj/structure/sign/minerscape/red
	color = "red"

/obj/structure/sign/minerscape/green
	color = "green"

/obj/structure/sign/minerscape/yellow
	color = "yellow"

/obj/structure/sign/minerscape/blue
	color = "blue"

/obj/structure/sign/minerscape/cyan
	color = "cyan"




/*|	                                             */
/*| Neon Signs
   ----------------------------------------------*/

   //| Note: for a more varied range of colors, I chose not to use the pre- #defined colors and instead individually converted the RGB values from each sprite into hex code - Mal

/obj/machinery/sign/neon/Destroy()
	set_light(0)
	return ..()

/obj/machinery/sign/neon
	desc = "A glowing sign."
	icon = 'icons/obj/neondecor.dmi'
	light_range  = 4
	light_power = 1
	anchored = 1
	opacity = 0
	density = 0
	layer = ABOVE_WINDOW_LAYER
	var/neonsound = 'sound/machines/neon_sign_01.ogg'
	var/loudness = 15

/obj/machinery/sign/neon/process()
	playsound(loc, src.neonsound, src.loudness)


/obj/machinery/sign/neon/item
	name = "item store"
	icon_state = "item"
	light_color = "#B79F41" //copper

/obj/machinery/sign/neon/motel
	name = "motel"
	icon_state = "motel"
	light_color = "#59FF9B" //teal

/obj/machinery/sign/neon/hotel
	name = "hotel"
	icon_state = "hotel"
	light_color = "#59FF9B" //teal

/obj/machinery/sign/neon/flashhotel
	name = "hotel"
	icon_state = "flashhotel"
	light_color = "#FF8FF8" //hot pink

/obj/machinery/sign/neon/lovehotel
	name = "hotel"
	icon_state = "lovehotel"
	light_color = "#59FF9B" //teal

/obj/machinery/sign/neon/sushi
	name = "sushi"
	icon_state = "sushi"
	light_color = "#7DD3FF"  //sky blue

/obj/machinery/sign/neon/bakery
	name = "bakery"
	icon_state = "bakery"
	light_color = "#FF8FEE" //hot pink

/obj/machinery/sign/neon/beer
	name = "pub"
	icon_state = "beer"
	light_color = "#CBDC54" //yellow

/obj/machinery/sign/neon/inn
	name = "inn"
	icon_state = "inn"
	light_color = "#F070FF"  //deeper hot pink

/obj/machinery/sign/neon/cafe
	name = "cafe"
	icon_state = "cafe"
	light_color = "#FF8FEE" //hot pink

/obj/machinery/sign/neon/diner
	name = "diner"
	icon_state = "diner"
	light_color = "#59FF9B" //teal

/obj/machinery/sign/neon/bar_alt
	name = "bar"
	icon_state = "bar_alt"
	light_color = "#39FFA4" //teal

/obj/machinery/sign/neon/casino
	name = "casino"
	icon_state = "casino"
	light_color = "#6CE08A" //teal

/obj/machinery/sign/neon/cupcake
	name = "casino"
	icon_state = "casino"
	light_color = "#F4A9D8" //pink!

/obj/machinery/sign/neon/peace
	name = "peace"
	icon_state = "peace"
	light_color = "#8559FF" //a cross between the blue and purple

/obj/machinery/sign/neon/sale
	name = "sale"
	icon_state = "sale"
	light_color = "#6EB6FF" //sky blue

/obj/machinery/sign/neon/exit
	name = "exit"
	icon_state = "exit"
	light_color = "#7FEA6A" //lime green

/obj/machinery/sign/neon/disco
	name = "disco"
	icon_state = "disco"

/obj/machinery/sign/neon/close
	name = "close"
	icon_state = "close"
	light_color = "#7FEA6A" //lime green

/obj/machinery/sign/neon/open
	name = "open"
	icon_state = "open"
	light_color = "#FFFFFF" //white

/obj/machinery/sign/neon/lowham
	name = "Lowham Station sign"
	icon_state = "lowham"
	light_color = "#dd0048" //red


/obj/machinery/sign/neon/phone
	name = "phone"
	icon_state = "phone"
	light_color = "#7FEA6A" //lime green

/obj/machinery/sign/neon/armory
	name = "armory"
	icon_state = "armory"
	light_color = "#7FEA6A" //lime green

/obj/machinery/sign/neon/pizza
	name = "pizza"
	icon_state = "pizza"
	light_color = "#33CC00" //green

/obj/machinery/sign/neon/clothes
	name = "clothes"
	icon_state = "clothes"
	light_color = "#FF9326" //orange

/obj/machinery/sign/neon/bar
	name = "bar sign"
	desc = "The sign says 'Bar' on it."
	icon_state = "bar"
	light_color = "#63C4D6" //light blue

/obj/machinery/sign/neon/beamer
	name = "beamer"
	icon_state = "beamer1"
	light_color = "#63C4D6" //light blue

/obj/machinery/sign/neon/beamer1
	name = "beamer"
	icon_state = "beamer"
	light_color = "#63C4D6" //light blue

/obj/machinery/sign/neon/double/genstore1
	name = "General Store"
	icon_state = "generalstore1"
	light_color = "#dd0048" //red

/obj/machinery/sign/neon/double/genstore2
	name = "General Store"
	icon_state = "generalstore2"
	light_color = "#dd0048"


/obj/machinery/sign/neon/double/sunrise1
	name = "Sunrise"
	icon_state = "sunrise1"
	light_color = "#CBDC54" //yellow

/obj/machinery/sign/neon/double/sunrise2
	name = "Sunrise"
	icon_state = "sunrise2"
	light_color = "#CBDC54" //yellow

/obj/machinery/sign/neon/polizei
	name = "police sign"
	icon_state = "einzwei"
	light_color = "#0900ff"// blue

/obj/machinery/sign/neon/bbc
	name = "TV set"
	desc = "It looks like the buttons on it are stuck."
	icon_state = "bbc"
	light_color = "#CD5C5C"// dark red
	neonsound = 'sound/machines/tv_loop1.ogg'
	loudness = 50

/*|	                                             */
/*| Misc Wall Decor
   ----------------------------------------------*/

/obj/structure/sign/decor
	name = "Decoration"
	icon = 'icons/obj/fancydecals.dmi'

/obj/structure/sign/decor/painting
	name = "painting"
	icon = 'icons/obj/fancydecals.dmi'
	icon_state = "0,0"
	pixel_y = 32

/obj/structure/sign/decor/number
	name = "Door Number"
	icon_state = "door1"

/obj/structure/sign/decor/techshop
	name = "tech shop"
	icon_state = "techshop"

/*|	                                             */
/*| Normal Signs
   ----------------------------------------------*/


/obj/structure/sign/rent
	name = "Rent sign"
	icon = 'icons/obj/fancydecals.dmi'
	icon_state = "rent"
	desc = "A sign that says 'For Rent' on it. This house might be vacant."

/obj/structure/sign/coffee
	name = "Coffee And Sweets"
	desc = "A sign which reads 'Coffee and Sweets'."
	icon_state = "coffee-left"

/obj/structure/sign/cells
	name = "\improper Cells"
	desc = "A sign which reads 'Cells'."
	icon_state = "cells"

/obj/structure/sign/techshop
	name = "\improper techshop"
	desc = "A sign which reads 'tech shop'."
	icon_state = "techshop"

/obj/structure/sign/briefroom
	name = "\improper Brief Room"
	desc = "A warning sign which reads 'Brief Room'."
	icon_state = "briefroom"


/obj/structure/sign/metromap
	name = "\improper subway scheme"
	icon_state = "map"


/obj/structure/sign/chinese
	name = "incomprehensible sign"
	desc = "A sign written using traditional chinese characters."

/obj/structure/sign/chinese/restricted_area
	icon_state = "CH_restricted_area"

/obj/structure/sign/chinese/caution
	icon_state = "CH_caution"

/obj/structure/sign/chinese/danger
	icon_state = "CH_danger"

/obj/structure/sign/chinese/electrical_equipment
	icon_state = "CH_electrical_equipment"

/obj/structure/sign/chinese/access_restricted
	icon_state = "CH_access_restricted"

/obj/structure/sign/chinese/notice
	icon_state = "CH_notice"

/obj/structure/sign/chinese/security
	icon_state = "CH_security"

/obj/structure/sign/chinese/engineering
	icon_state = "CH_engineering"

/obj/structure/sign/chinese/science
	icon_state = "CH_science"

/obj/structure/sign/chinese/medbay
	icon_state = "CH_medbay"

/obj/structure/sign/chinese/evacuation
	icon_state = "CH_evacuation"


/obj/structure/sign/floor/
	name = "floor sign"
	icon = 'icons/obj/decals.dmi'
	icon_state = "white_1"

/obj/structure/sign/floor/one
	name = "floor sign"
	icon_state = "white_1"

/obj/structure/sign/floor/two
	icon_state = "white_2"

/obj/structure/sign/floor/a
	icon_state = "white_a"

/obj/structure/sign/floor/b
	icon_state = "white_b"

/obj/structure/sign/floor/c
	icon_state = "white_c"

/obj/structure/sign/floor/d
	icon_state = "white_d"

/obj/structure/sign/floor/ex
	icon_state = "white_ex"

/obj/structure/sign/floor/m
	icon_state = "white_m"

/obj/structure/sign/floor/cmo
	icon_state = "white_cmo"

/obj/structure/sign/floor/v
	icon_state = "white_v"

/obj/structure/sign/floor/p
	icon_state = "white_p"

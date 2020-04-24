obj/machinery/scanner
	name = "refugee terminal"
	icon = 'icons/obj/computer.dmi'
	icon_state = "refugeeterminal"
	density = 1
	anchored = 1
	var/lastuser = null

obj/machinery/scanner/New()
	..()
	set_light(0.3, 0.1, 4, 2, "#1CB200")

obj/machinery/scanner/attack_hand(mob/living/carbon/human/user)
	if(!ishuman(user) || lastuser == user.real_name)
		return
	lastuser = user.real_name
	//var/datum/data/record/G = new /datum/data/record(  )
	var/dna = user.dna.unique_enzymes
	var/bloodtype = user.b_type
	var/fingerprint = md5(user.dna.uni_identity)
	var/list/marks = list()
	var/text = {"
	<font size=5><center>PROVISIONAL GOVERNMENT REFUGEE CARD</center></font><br>
	<hr>
	<b><u>Name</u></b>: <field> <br>
	<b><u>Age</u></b>: <field> <br>
	<b><u>Sex</u></b>: <field> <br>

	<b><u>DNA</u></b>: [dna] <br>
	<b><u>Blood Type</u></b>: [bloodtype] <br>
	<b><u>Fingerprint</u></b>: [fingerprint] <br>

	<b><u>Station</u></b>: Lowham Station <br>

	<b><u>Confirmed by</u></b>: <field> <br>

	<b><u>Black Marks</u></b>:<br> "}
	for(var/A in marks)
		text += "\red[A]<br>"
	user << "\blue You feel a sting as the scanner takes a sample from your finger."
	var/obj/item/weapon/paper/refugeecard/print = new(src.loc)
	print.name = "Refugee Card"
	print.info = text
	print.stamped = 1


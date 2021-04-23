/obj/item/weapon/gunsmith
	name = "firearms parts"
	desc = "Details and parts of a firearms."
	icon = 'icons/obj/coldwar/ammo.dmi'
	icon_state = "acc_l"
	w_class = 2.0
	throwforce = 5
	throw_speed = 4
	throw_range = 5
	force = 5.0
	origin_tech = "combat=2"
	var/partcondition = 100
	var/condef = null
	var/trigger = 0
	var/barrel = 0
	var/temp_partcondition = 0
	var/tempname = null
	var/frametype = 0

//	var/partpercondition = 100 maybe make good, mod, bad conds.


	New()
		..()
		partcondition = rand (20, 100) //phleg


	examine()
		..()

		switch(partcondition)
			if(0 to 40)
				condef = "bad"
			if(40 to 70)
				condef = "average"
			if(70 to 100)
				condef = "good"

		usr << "Part in [condef] condition"
		return

/obj/item/weapon/gunsmith/frame
	name = "Frame"
	desc = "Modular frame with grip."
	icon_state = "frame_p"

	attackby(var/obj/item/A as obj, mob/user as mob)
		var/obj/item/weapon/gunsmith/trigger/T = A
		var/obj/item/weapon/gunsmith/barrel/B = A
		var/obj/item/weapon/gunsmith/acc/AS = A

		if(istype(T, /obj/item/weapon/gunsmith/trigger))
			if(trigger == 0)
				user << "\blue You began attaching part."
				sleep(50)
				user << "\blue Success!"
				src.trigger = 1
				src.desc += " [T.name]."
				temp_partcondition += T.partcondition
				update_icon()
				del(T)
				return
			else
				user << "\blue [src] already has a [T.name]"
				return

		if(istype(B, /obj/item/weapon/gunsmith/barrel))
			if(barrel == 0)
				user << "\blue You began attaching part."
				sleep(50)
				user << "\blue Success!"
				src.barrel = 1
				src.desc += " [B.name]."
				temp_partcondition += B.partcondition
				update_icon()
				del(B)
				return
			else
				user << "\blue [src] already has a [B.name]"
				return

		if(istype(AS, /obj/item/weapon/gunsmith/acc))
			if(src.frametype == AS.frametype)
				if(barrel == 1 && trigger == 1)
					user << "\blue You have started to construct weapons."
					sleep(80)
					if(prob(temp_partcondition/3))
						user << "\blue Success!"
						new AS.tempname (user.loc)
						del(AS)
						del(src)
						return
					else
						user << "\blue Fail. Try again."
				else
					user << "\blue The [src] need the trigger and the barrel."
					return
			else
				user << "\blue Incorrect frame for the assembly of these parts."
				return

	update_icon()
		..()
		overlays = null
		if(trigger == 1)
			overlays += "trigger"
		if(barrel == 1)
			overlays += "barrel"
		return

/obj/item/weapon/gunsmith/frame/frame_p
	name = "Pistol frame"
	desc = "Modular frame with pistol grip."
	icon_state = "frame_p"
	frametype = 1

/obj/item/weapon/gunsmith/frame/frame_r
	name = "Revolver frame"
	desc = "Modular frame with revolver grip."
	icon_state = "frame_r"
	frametype = 2

/obj/item/weapon/gunsmith/trigger
	name = "Trigger group"
	desc = "Modular trigger group. May used with any firearms."
	icon_state = "trigger"
	partcondition = 100

	New()
		..()
		partcondition = rand (20, 100) //phleg


/obj/item/weapon/gunsmith/barrel
	name = "Barrel"
	desc = "Modular barrel base."
	icon_state = "barrel"
	partcondition = 100

	New()
		..()
		partcondition = rand (20, 100) //phleg

/obj/item/weapon/gunsmith/acc
	name = "accesory firearms parts"
	desc = "The box with the necessary parts."
	icon_state = "acc_s"
	frametype = 0

/obj/item/weapon/gunsmith/acc/acc_s
	desc = "The box with the necessary parts."
	icon_state = "acc_s"
	frametype = 0

/obj/item/weapon/gunsmith/acc/acc_l
	desc = "The large box with the necessary parts."
	icon_state = "acc_l"
	frametype = 0

//==========firearms_small_acc===
/*
/obj/item/weapon/gunsmith/acc/acc_s/crossbow
	name = "Crossbow parts"
	desc = "The box with the necessary parts."
	icon_state = "acc_s"
	tempname = /obj/item/weapon/gun/projectile/crossbow
	frametype = 1

/obj/item/weapon/gunsmith/acc/acc_s/lferus
	name = "L-Ferus parts"
	desc = "The box with the necessary parts."
	icon_state = "acc_s"
	tempname = /obj/item/weapon/gun/projectile/lferus
	frametype = 1

/obj/item/weapon/gunsmith/acc/acc_s/doubly
	name = "Doubly parts"
	desc = "The box with the necessary parts."
	icon_state = "acc_s"
	tempname = /obj/item/weapon/gun/projectile/doubly
	frametype = 2

/obj/item/weapon/gunsmith/acc/acc_s/handy
	name = "Handy parts"
	desc = "The box with the necessary parts."
	icon_state = "acc_s"
	tempname = /obj/item/weapon/gun/projectile/handy
	frametype = 1

/obj/item/weapon/gunsmith/acc/acc_s/hamlet
	name = "Hamlet SMG parts"
	desc = "The box with the necessary parts."
	icon_state = "acc_s"
	tempname = /obj/item/weapon/gun/projectile/automatic/hamlet
	frametype = 1

/obj/item/weapon/gunsmith/acc/acc_s/canis
	name = "Canis parts"
	desc = "The box with the necessary parts."
	icon_state = "acc_s"
	tempname = /obj/item/weapon/gun/projectile/canis
	frametype = 2

/obj/item/weapon/gunsmith/acc/acc_s/sleuthds
	name = "Sleuth DS parts"
	desc = "The box with the necessary parts."
	icon_state = "acc_s"
	tempname = /obj/item/weapon/gun/projectile/sleuthds
	frametype = 2

/obj/item/weapon/gunsmith/acc/acc_s/nipper
	name = "Nipper parts"
	desc = "The box with the necessary parts."
	icon_state = "acc_s"
	tempname = /obj/item/weapon/gun/projectile/nipper
	frametype = 2

/obj/item/weapon/gunsmith/acc/acc_s/swamper
	name = "Swamper parts"
	desc = "The box with the necessary parts."
	icon_state = "acc_s"
	tempname = /obj/item/weapon/gun/projectile/swamper
	frametype = 2

/obj/item/weapon/gunsmith/acc/acc_s/smithw
	name = "Smith-W parts"
	desc = "The box with the necessary parts."
	icon_state = "acc_s"
	tempname = /obj/item/weapon/gun/projectile/smithw
	frametype = 1

/obj/item/weapon/gunsmith/acc/acc_s/mac
	name = "MAC-15 parts"
	desc = "The box with the necessary parts."
	icon_state = "acc_s"
	tempname = /obj/item/weapon/gun/projectile/automatic/mac
	frametype = 1

//==========firearms_large_acc===

/obj/item/weapon/gunsmith/acc/acc_l/bazooka
	name = "Rocket launcher parts"
	desc = "The large box with the necessary parts."
	icon_state = "acc_l"
	tempname = /obj/item/weapon/gun/projectile/bazooka
	frametype = 1

/obj/item/weapon/gunsmith/acc/acc_l/gauss
	name = "Gauss rifle parts"
	desc = "The large box with the necessary parts."
	icon_state = "acc_l"
	tempname = /obj/item/weapon/gun/projectile/gauss
	frametype = 2

/obj/item/weapon/gunsmith/acc/acc_l/garand
	name = "Garand M1 rifle parts"
	desc = "The large box with the necessary parts."
	icon_state = "acc_l"
	tempname = /obj/item/weapon/gun/projectile/garand
	frametype = 2

/obj/item/weapon/gunsmith/acc/acc_l/springfield
	name = "Springfield A7 rifle parts"
	desc = "The large box with the necessary parts."
	icon_state = "acc_l"
	tempname = /obj/item/weapon/gun/projectile/springfield
	frametype = 2

/obj/item/weapon/gunsmith/acc/acc_l/tommy
	name = "Tommy SMG parts"
	desc = "The large box with the necessary parts."
	icon_state = "acc_l"
	tempname = /obj/item/weapon/gun/projectile/automatic/tommy
	frametype = 1

/obj/item/weapon/gunsmith/acc/acc_l/trencher
	name = "Trencher parts"
	desc = "The large box with the necessary parts."
	icon_state = "acc_l"
	tempname = /obj/item/weapon/gun/projectile/shotgun/pump/trencher
	frametype = 1

/obj/item/weapon/gunsmith/acc/acc_l/doublebarrel
	name = "Double barrel shotgun parts"
	desc = "The large box with the necessary parts."
	icon_state = "acc_l"
	tempname = /obj/item/weapon/gun/projectile/shotgun/doublebarrel
	frametype = 2

/obj/item/weapon/gunsmith/acc/acc_l/cerber
	name = "Cerber parts"
	desc = "The large box with the necessary parts."
	icon_state = "acc_l"
	tempname = /obj/item/weapon/gun/projectile/shotgun/cerber
	frametype = 2

/obj/item/weapon/gunsmith/acc/acc_l/winch
	name = "Winch M1887 parts"
	desc = "The large box with the necessary parts."
	icon_state = "acc_l"
	tempname = /obj/item/weapon/gun/projectile/winch
	frametype = 2
*/
//==========firearms_upgrades===

/obj/item/weapon/gunsmith/upgrade
	name = "accesory firearms parts"
	desc = "The box with the necessary parts."
	icon_state = "acc_u"

/obj/item/weapon/gunsmith/upgrade/suppressor //-noise -dam -acc
	name = "Suppressor"
	desc = "Reduced muzzle velocity and noise, resulting in less accuracy and damage."
	icon_state = "acc_u"

/obj/item/weapon/gunsmith/upgrade/barrelarm //+dam +blowback
	name = "Improved barrel"
	desc = "Increases the muzzle velocity of a firearm, contributing to both damage and recoil"
	icon_state = "acc_u"

/obj/item/weapon/gunsmith/upgrade/rapidblowback //-blowback +noise -acc
	name = "Improved trigger"
	desc = "Fire rate faster, at the cost of reduced accuracy and increased noise."
	icon_state = "acc_u"

/obj/item/weapon/gunsmith/upgrade/autofire //+automatic 2 round
	name = "Auto fire kit"
	desc = "Converts a pistol to a fully-automatic weapon. However, it reduces accuracy, while increasing noise and recoil."
	icon_state = "acc_u"

/obj/item/weapon/gunsmith/upgrade/stabilizer //+blowback +acc
	name = "Stabilizer"
	desc = "Reduces vibration, greatly reducing recoil and increasing accuracy."
	icon_state = "acc_u"
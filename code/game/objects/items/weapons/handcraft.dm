/*

"Added a whole lot of crafting recipes and reorganised the code for easier future usage." - Silentium 25.03.16


 To do list:

- Finish the damn explosions.
- Finish the damn workbench.
- Fix engrish names and descriptions.
- Remaster the whole crafting code to make it look less like spaghetti.

*/

/*
/obj/structure/workbench //phleg WIP
	name = "Workbench"
	desc = "Convenient universal workbench."
	icon = 'structures.dmi'
	icon_state = "workbench"
	density = 1
	anchored = 1.0

*/
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////AMMO AND WEAPONS///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////


/obj/item/stack/rods/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/rasp))
		user << "\blue You begin to carve a hole inside one of these rods while also trying to create some rifling."
		if(do_after(user, 80))
			if(prob(60))
				new /obj/item/weapon/crafty/craftgunframe(user.loc)
				user << "\blue After fiddling around with the rod you chose, you are left with a good frame for a gun."
			else
				user << "\red You wasted the rod with faulty rifling. Perhaps you should practice with something more susceptible to rifling (/)(°,,°)(/)"
			use(1)
		else
			user << "\red Crafting have been interrupted."
	return ..()


/obj/item/weapon/crafty/craftgunframe/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/metalparts))
		user << "\blue You try to insert a makeshift trigger mechanism inside the frame"
		if(do_after(user, 80))
			if(prob(40))
				new /obj/item/weapon/crafty/zipgunframe(user.loc)
				user << "\blue You've successfully installed a makeshift trigger mechanism"
			else
				user << "\red While trying to insert the thing in, you accidentally screwed up both of them. Just like your first time."
			del(W)
			del(src)
		else
			user << "\red Crafting have been interrupted."

	if (istype(W, /obj/item/weapon/material/lstick))
		user << "\blue You try to attach a handguard underneath the barrel."
		if (!do_after(user, 80))
			user << "\red Crafting have been interrupted."
			return
		new /obj/item/weapon/crafty/rifleframe(user.loc)
		user << "\blue Done."
		del(W)
		del(src)
	return ..()

/obj/item/weapon/crafty/zipgunframe/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/material/lstick))
		user << "\blue You begin to attach a grip to the frame"
		if (!do_after(user, 80))
			user << "\red Crafting have been interrupted."
			return
		new /obj/item/weapon/gun/projectile/zipgun(user.loc)
		user << "\blue Done."
		del(W)
		del(src)
	return ..()

/obj/item/weapon/crafty/crossbowframe/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/metalparts))
		if(src.crafting_stage==0)
			user << "\blue You try to reinforce the frame with scrap metal."
			if(do_after(user, 80))
				if(prob(60))
					src.crafting_stage = 1
					user << "\blue The frame is now reinforced."
				else
					user << "\red You have wasted the frame with your poor crafting. You ain't gonna craft a weapon without experience, you know."
					del(src)
				del(W)
			else
				user << "\red Crafting have been interrupted."


	if (istype(W, /obj/item/weapon/material/lstick))
		if(src.crafting_stage==1)
			user << "\blue You begin to bend the stick so as to use it in the crossbow..."
			if(do_after(user, 80))
				if(prob(75))
					src.crafting_stage = 2
					user << "\blue The frame is almost complete."
				else
					user << "\red The stick has cracked in half. Just like your life at some point that you ended up here."
				del(W)
			else
				user << "\red Crafting have been interrupted."

	if (istype(W, /obj/item/stack/cable_coil))
		if(src.crafting_stage==2)
			if(W:amount >= 5)
				user << "\blue You begin to finish the crossbow by adding what propels bolts: the wire"
				if(do_after(user, 80))
					W:use(5)
					if(prob(74))
						new /obj/item/weapon/gun/launcher/crossbow(user.loc)
						user << "\blue The crossbow is complete"
						del(src)
						return
					if(prob(20))
						user << "\red You have messed it up, wasting the cable. Go and get wasted too."
					if(prob(6))
						user << "\red \bold You have messed it up so hard you broke the frame. Don't get too excited about things lest they kill you."
						del(src)
				else
					user << "\red Crafting have been interrupted."
			else
				user << "\blue You need at least five pieces of cable to do that."
	return ..()

/obj/item/weapon/crafty/rifleframe/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/metalparts))
		if(src.crafting_stage==0)
			user << "\blue You begin to reinforce the frame with scrap metal"
			if(do_after(user, 120))
				if(prob(35))
					user << "\blue The frame is now reinforced"
					src.crafting_stage = 1
					qdel(W)
				else
					user << "\red The frame has fallen apart. Just like the moral norms."
					qdel(src)
				qdel(W)
			else
				user << "\red Crafting have been interrupted."

	if (istype(W, /obj/item/weapon/material/lstick))
		if(src.crafting_stage==1)
			user << "\blue You try to attach the stick to the frame to use it as a stock, creating a makeshift rifle"
			if(!do_after(user, 80))
				user << "\red Crafting have been interrupted."
				return
			new /obj/item/weapon/gun/projectile/craftrifle(user.loc)
			user << "\blue Done."
			qdel(W)
			qdel(src)
	return ..()


/obj/item/weapon/material/lstick/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/material/lstick))
		user << "\blue You begin to stick the sticks together to create a simple wooden frame"
		if(!do_after(user, 80))
			user << "\red Crafting have been interrupted."
			return
		new /obj/item/weapon/crafty/crossbowframe(user.loc)
		user << "\blue Done."
		qdel(W)
		qdel(src)

/*	if (istype(W, /obj/item/weapon/wirecutters))
		user << "\blue You try to carve a couple of bolts out of the stick"
		if(do_after(user, 80))
			var/lolz = rand(0, 3)
			for (var/i=0, i<lolz, i++)
				new /obj/item/ammo_magazine/bolt(user.loc)
			user << "\red You have managed to obtain [lolz] \s bolt out of that little stick. [lolz>1 ? "\bold Somehow." : null]"
			del(src)
		else
			user << "\red Crafting have been interrupted."

	if (istype(W, /obj/item/weapon/metalparts))
		user << "\blue You try to attach some sharp metal parts aiming to create something like an arrow or two"
		if(do_after(user, 100))
			if(prob(70))
				user << "\blue You have put together a couple of arrows"
				new /obj/item/weapon/reagent_containers/arrow(user.loc)
				new /obj/item/weapon/reagent_containers/arrow(user.loc)
			else
				user << "\red Your \"arrows\" turned out to be less than useful. You ain't better at this either."
			del(W)
			del(src)
*/
	if (istype(W, /obj/item/weapon/material/butterfly) ||\
		istype(W, /obj/item/weapon/scalpel) ||\
		istype(W, /obj/item/weapon/material/knife) ||\
		istype(W, /obj/item/weapon/material/knife/craftknife))
		user << "\blue You begin to cut the stick to make it look something like a bat"
		if(do_after(user, 80))
			if(prob(70))
				new /obj/item/weapon/material/twohanded/baseballbat(user.loc)
				user << "\blue After a lot of struggle you are left with a bat-like club"
			else
				user << "\red You had cut too much of it, making it very fragile and wanting to break. So you did. RIP Bat"
			qdel(src)
		else
			user << "\red Crafting have been interrupted."

/*	if (istype(W, /obj/item/stack/cable_coil))
		user << "\blue You begin to stretch the cable and tie the ends to the stick, creating a somewhat decent bow."
		if (W:amount < 5)
			user << "\blue Actually no, you didn't. You need at least five pieces of cable to do this."
			return
		if(do_after(user, 80))
			if(prob(65))
				W:use(5)
				new /obj/item/weapon/gun/bow(user.loc)
				user << "\blue After struggling to make it so that the bow's bowstring would last for a little longer than Space China's export's average lifetime is, you've finished making a bow."
			else
				user << pick(\
							"\red The cable won, breaking the stick in half under tension. Give her a golden fire extinguisher or something.",\
							"\red The stick won, ripping the cable at the point of the highest stress. It was a tough fight for the stick and your mighty touch broke it in half"\
						)
			del(src)
		else
			user << "\red Crafting have been interrupted."
*/
	if (istype(W, /obj/item/weapon/crafty/knifeblade))
		user << "\blue Dark Days lies ahead and so you decide to prepare in advance by starting to craft the almighty Knife Spear while you can"
		if(!do_after(user, 80))
			user << "\red Crafting have been interrupted."
			return
		new /obj/item/weapon/material/twohanded/spear/wooden(user.loc)
		user << "\blue Done. Get a vehicle soon."
		qdel(W)
		qdel(src)

	if (istype(W, /obj/item/weapon/stone))
		user << "\blue You try to find such a position for a stone on the stick so that you can use it as a makeshift multitool commonly known as a hatchet."
		if(!do_after(user, 80))
			user << "\red Crafting have been interrupted."
			return
		new /obj/item/weapon/material/hatchet(user.loc)
		user << "\blue That took you much lesser than expected. Don't expect any peace treaty, though."
		qdel(W)
		qdel(src)
	return ..()

/obj/item/weapon/stone/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/stone))
		user << "\blue Just like a true homo sapiens you are. Grinding two rocks against each other."
		if(do_after(user, 100))
			if(prob(70))
				new /obj/item/weapon/crafty/knifeblade(user.loc)
				user << "\blue You have sharpened one of the rocks using another and called it a knife. Onwards, humanity!"
			else
				user << "\red \bold What the hell? How can you call yourself a M-A-N if you can't even do something as simple as this?"
			qdel(W)
			qdel(src)
		else
			user << "\red Crafting have been interrupted."
	return ..()


/obj/item/weapon/crafty/knifeblade/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/material/lstick))
		user << "\blue You thrust the stick inside the rock, trying to connect them and make a knife."
		if(!do_after(user, 80))
			user << "\red Crafting have been interrupted."
			return
		new /obj/item/weapon/material/knife/craftknife(user.loc)
		user << "\blue Done."
		qdel(W)
		qdel(src)
	return ..()


/obj/item/weapon/material/twohanded/baseballbat/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/metalparts))
		user << "\blue You begin to push some small sharp piece of scrap metal inside the bat."
		if(do_after(user, 80))
			if(prob(80))
				new /obj/item/weapon/material/twohanded/baseballbat/nailed(user.loc)
				user << "\blue \bold Nailed it."
			else
				user << "\red The bat couldn't hold together anymore after you widened so many holes in it by putting nails in."
			qdel(W)
			qdel(src)
		else
			user << "\red Crafting have been interrupted."
	return ..()

var/list/eligible_casings_for_refill = list(
/obj/item/ammo_casing/c45,
/obj/item/ammo_casing/c38,
/obj/item/ammo_casing/c9mm,
/obj/item/ammo_casing/a10mm,
/obj/item/ammo_casing/a762,
/obj/item/ammo_casing/a145,
/obj/item/ammo_casing/a556,
/obj/item/ammo_casing/a357,
/obj/item/ammo_casing/shotgun
)
/obj/item/ammo_casing/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if (istype(W, /obj/item/weapon/reagent_containers))
		if (type in eligible_casings_for_refill)
			if(W.reagents.has_reagent("gpowder", 1))
				user << "\blue You scoop up some casings and try to refill them with gunpowder."
				if(!do_after(user, 30))
					user << "\red Crafting have been interrupted."
					return
				var/to_delete = rand(1, min(4, (W.reagents.get_reagent_amount("gpowder"))))
				if(W.reagents.has_reagent("gpowder", to_delete)) // That's a very rough estimate after all. We've got no tools.
					user << "\blue You have managed to refill that [src.caliber] bullet shell with gunpowder. [to_delete == 1 ? " It's a shame those are not one of these corporate Full Metal Jackets." : null]"
					new type(user.loc)
				else
					user << "\red You couldn't refill this casing with what little of gunpowder you had. Both are wasted now."
				W.reagents.remove_reagent("gpowder", to_delete)
				qdel(src)
			else
				user << "\red There is obviously not enough gunpowder to refill that casing."
	return ..()


/obj/item/weapon/metalparts/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if (istype(W, /obj/item/weapon/wirecutters))
		user << "\blue You begin to cut some metal to make it pointy."
		if(do_after(user, 80))
			if(prob(50))
				new /obj/item/weapon/material/star/scout/(user.loc)
				user << "\blue Done but remember: it's stabby-stabby, not cutty-cutty. Some pink-haired girls can do both, though."
			else
				user << "\red Your have ruined a perfectly good metal blank with your sloppy cutting."
			qdel(src)
		else
			user << "\red Crafting have been interrupted."

	if (istype(W, /obj/item/weapon/rasp))
		user << "\blue You try to sharpen a metal blank you found nearby."
		if(do_after(user, 100))
			if(prob(70))
				new /obj/item/weapon/material/knife/sharpening(user.loc)
				user << "\blue After some time, you are left with a good way to stab someone's guts."
			else
				user << "\red Your overly intense rubbing made the blank too brittle, rendering you useless."
			qdel(src)
		else
			user << "\red Crafting have been interrupted."

	if (istype(W, /obj/item/device/multitool))
		user << "\blue You try to weave a chain."
		if(do_after(user, 90))
			if(prob(80))
				new /obj/item/weapon/chain(user.loc)
				user << "\blue The original person? You are not Dick Eastwood, right, Edwin? Be aware of them using the chain you've just made."
			else
				user << "\red Your weaving sucks. At least you won't cause any trouble for people around you. The metal is completely useless now."
			qdel(src)
		else
			user << "\red Crafting have been interrupted."

	if (istype(W, /obj/item/stack/cable_coil))
		if (W:amount >= 5)
			user << "\blue You wind some thin long tubes to form an improvised weapon."
			W:use(5)
			new /obj/item/weapon/lpipe(user.loc)
		else if (W:amount < 5)
			user << "\red You need at least five pieces of cable to do this."

	if (istype(W, /obj/item/weapon/lhammer) || istype(W, /obj/item/weapon/material/hatchet))
		user << "\blue You begin to hammer some metal to create something to improve yourself in unarmed combat."
		if(do_after(user, 90))
			if(prob(80))
				new /obj/item/weapon/brassk(user.loc)
				user << "\blue You have managed to connect a lot of loose metal into a brass knuckle. Don't ask for details."
			else
				user << "\red Turns out it was rusted. You discovered that after striking it with \the [W.name]."
			qdel(src)

	if (istype(W, /obj/item/weapon/chain))
		if(prob(80))
			usr << "\blue You begin linking your metal parts with the chain"
			sleep(90)
			new /obj/item/weapon/chainedmetal(user.loc)
			qdel(W)
			qdel(src)
			return
		if(prob(20))
			user << "\blue You begin linking your metal parts with the chain..."
			sleep(90)
			user << "\blue You failed, making a mess too complex to be any good."
			qdel(W)
			qdel(src)
			return


/obj/item/weapon/reagent_containers/food/drinks/bottle/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if(src.reagents.has_reagent("fuel"))
//		if (istype(W, /obj/item/weapon/reagent_containers/glass/rag))
//			user << "\blue You're putting a rag into the bottle, making an improvised incendiary bomb..."
//			sleep(50)
//			new /obj/item/weapon/molotovbomb(user.loc)
//			del(W)
//			del(src)
//			return
		if (istype(W, /obj/item/weapon/metalparts))
			if(prob(65))
				usr << "\blue You're adding ignition mechanism to the bottle, making a grenade frame..."
				sleep(80)
				new /obj/item/weapon/crafty/nadeframe(user.loc)
				qdel(W)
				qdel(src)
				return
			if(prob(35))
				usr << "\blue You're adding ignition mechanism to the bottle, making a grenade frame..."
				sleep(80)
				usr << "\blue You messed up, rendering your metal parts useless."
				qdel(W)
				return

	else
		usr << "\blue It doesn't contain any fuel."
	return

/obj/item/weapon/crafty/nadeframe/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if (istype(W, /obj/item/weapon/flame/lighter) || istype(W, /obj/item/weapon/flame/lighter/zippo) || istype(W, /obj/item/weapon/flame/match))
		if(src.crafting_stage==0)
			if(prob(90))
				usr << "\blue You're adding your [W] as a fuse to the frame, finishing a weak grenade..."
				sleep(80)
				new /obj/item/weapon/grenade/frag/shell(user.loc)
				qdel(W)
				qdel(src)
				return
			if(prob(6))
				usr << "\blue You're adding your [W] as a fuse to the frame, finishing a weak grenade..."
				sleep(80)
				usr << "\blue You messed up, but managed to avoid triggering the ignition mechanism. Unfortunately, the frame is now useless."
				qdel(W)
				qdel(src)
				return
			if(prob(4))
				usr << "\blue You're adding your [W] as a fuse to the frame, finishing a weak grenade..."
				sleep(80)
				usr << "\red You messed up, triggering the ignition mechanism! Uh oh..."
				sleep(10)
				usr << "\blue Fortunately for you, Silentium was too lazy to code the proper explosion. Consider yourself dead, brag about it on the forums."
				qdel(W)
				qdel(src)
				return

		if(src.crafting_stage==1)
			if(prob(90))
				usr << "\blue You're adding your [W] as a fuse to the frame, finishing a frag grenade..."
				sleep(80)
				new /obj/item/weapon/grenade/frag/(user.loc)
				qdel(W)
				qdel(src)
				return
			if(prob(6))
				usr << "\blue You're adding your [W] as a fuse to the frame, finishing a frag grenade..."
				sleep(80)
				usr << "\blue You messed up, but managed to avoid triggering the ignition mechanism. Unfortunately, the frame is now useless."
				qdel(W)
				qdel(src)
				return
			if(prob(4))
				usr << "\blue You're adding your [W] as a fuse to the frame, finishing a frag grenade..."
				sleep(80)
				usr << "\red You've messed up, triggering the ignition mechanism! Uh oh..."
				sleep(10)
				usr << "\blue Fortunately for you, Silentium was too lazy to code the proper explosion. Consider yourself dead, brag about it on the forums."
				qdel(W)
				qdel(src)
				return

	if (istype(W, /obj/item/weapon/metalparts))
		if(src.crafting_stage==0)
			usr << "\blue You add metal parts to the fuel inside to increase the lethality."
			src.crafting_stage = 1
			qdel(W)
			return


//////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////TRAPS/////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////


/obj/item/weapon/grenade/frag/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
/*	if (istype(W, /obj/item/stack/cable_coil))
		if(W:amount >= 5)
			if(prob(99))
				usr << "\blue You're making a booby trap..."
				sleep(60)
				usr << "\blue You've finished a booby trap. Watch out not to walk into it yourself."
				new /obj/item/weapon/mine/boobytrap(user.loc)
				W:amount -= 5
				if(!W:amount) del(W)
				qdel(src)
				return
			if(prob(1))
				usr << "\blue You're making a booby trap..."
				sleep(60)
				usr << "\red You've messed up, triggering the grenade! Uh oh..."
				activate(src)
		else
			usr << "\blue You need at least five pieces of cable to do that."
			return
*/
/*
/obj/item/weapon/material/twohanded/spear/wooden/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if (istype(W, /obj/item/weapon/material/kitchen/utensil/fork) || istype(W, /obj/item/weapon/material/kitchen/utensil/spoon))
		usr << "\blue You start digging the hole in the ground, making a spike trap. It might take a LONG time, considering the quality of your tool."
		sleep(300)
		usr << "\blue You've finished a spike trap. Watch out not to walk in it yourself."
//		new /obj/structure/trap/spike(user.loc)
		del(W)
		del(src)
		return

	if (istype(W, /obj/item/weapon/shovel))
		usr << "\blue You start digging the hole in the ground, making a spike trap..."
		sleep(150)
		usr << "\blue You've finished a spike trap. Watch out not to walk in it yourself."
//		new /obj/structure/trap/spike(user.loc)
		del(src)
		return


//////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////ARMOR/////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////


/obj/item/weapon/chainedmetal/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if (istype(W, /obj/item/device/multitool))
		if(prob(80))
			usr << "\blue You're making improvised armor..."
			sleep(150)
			new /obj/item/clothing/suit/armor/platearmor(user.loc)
			del(src)
			return
		if(prob(20))
			usr << "\blue You're making improvised armor..."
			sleep(150)
			usr << "\blue You failed, and now the metal is too damaged to be any good."
			del(src)
			return

*/
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////MISCELLANOUS///////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
/*
/obj/item/clothing/under/attackby(obj/item/I, mob/user)
	if(is_sharp(I) || accessories.len == null)
		user.visible_message("<span class='notice'>\The [user] begins cutting up \the [src] with \a [I].</span>", "<span class='notice'>You begin cutting up \the [src] with \the [I].</span>")
		if(do_after(user, 50, src))
			to_chat(user, "<span class='notice'>You cut \the [src] into pieces!</span>")
			for(var/i in 1 to rand(0,2))
				new /obj/item/weapon/reagent_containers/glass/rag(get_turf(src))
				new /obj/item/stack/medical/bruise_pack/craft(get_turf(src))
			qdel(src)
		return
	..()

*/

//obj/item/weapon/rack_parts/attackby(obj/item/weapon/W as obj, mob/user as mob)

/*
//Crafting

/obj/item/weapon/corncob/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if(istype(W, /obj/item/weapon/circular_saw) || istype(W, /obj/item/weapon/hatchet) || istype(W, /obj/item/weapon/kitchen/utensil/knife) || istype(W, /obj/item/weapon/wirecutters))
		user << "<span class='notice'>You use [W] to fashion a pipe out of the corn cob!</span>"
		new /obj/item/clothing/mask/pipe/cobpipe (user.loc)
		del(src)
		return

/obj/item/weapon/reagent_containers/food/snacks/grown/pumpkin/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if(istype(W, /obj/item/weapon/circular_saw) || istype(W, /obj/item/weapon/hatchet) || istype(W, /obj/item/weapon/twohanded/fireaxe) || istype(W, /obj/item/weapon/kitchen/utensil/knife) || istype(W, /obj/item/weapon/melee/energy))
		user.show_message("<span class='notice'>You carve a face into [src]!</span>", 1)
		new /obj/item/clothing/head/helmet/hardhat/pumpkinhead (user.loc)
		del(src)
		return

/obj/item/weapon/reagent_containers/food/snacks/grown/potato/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if(istype(W, /obj/item/weapon/cable_coil))
		if(W:amount >= 5)
			W:amount -= 5
			if(!W:amount) del(W)
			user << "<span class='notice'>You add some cable to the potato and slide it inside the battery encasing.</span>"
			new /obj/item/weapon/cell/potato(user.loc)
			del(src)
			return

*/
/obj/machinery/metal_press
	name = "Metal Press"
	desc = "It presses metal.  Use it to make shape metal."
	icon_state = "press"
	density = 1
	anchored = 1
	use_power = 1
	idle_power_usage = 10
	active_power_usage = 2000
	clicksound = "keyboard"
	clickvol = 30
	var/obj/item/inserted_object = null
	var/show_category = "All"


	var/busy = 0
	var/disabled = 0

	var/mat_efficiency = 1
	var/build_time = 20


/obj/machinery/metal_press/New()

	..()
	//Create parts for lathe.
	component_parts = list()
	component_parts += new /obj/item/weapon/circuitboard/autolathe(src)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(src)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(src)
	component_parts += new /obj/item/weapon/stock_parts/matter_bin(src)
	component_parts += new /obj/item/weapon/stock_parts/manipulator(src)
	component_parts += new /obj/item/weapon/stock_parts/console_screen(src)
	RefreshParts()

/obj/machinery/metal_press/Destroy()
	return ..()

/obj/machinery/metal_press/proc/update_recipe_list()
	return

/obj/machinery/metal_press/interact(mob/user as mob)

	update_recipe_list()

	if(disabled)
		to_chat(user, "<span class='danger'>\The [src] is disabled!</span>")
		return


	if(!disabled)
		//var/index = text2num(href_list["make"])
		var/obj/item/making

		// May want to use this later
		//making = machine_recipes[index]
		making = inserted_object

		busy = 1
		update_use_power(2)

		playsound(src,'sound/mecha/hydraulic.ogg',40,1)
		sleep(build_time)

		busy = 0
		update_use_power(1)

		//Sanity check.
		if(!making || !src) return

		//press the item, for better or worse
		var/path = making.press()
		var/obj/item/I
		if (path)
			I = new path(loc)
		if(istype(I, /obj/item/stack))
			var/obj/item/stack/S = I
			S.amount = 0
		//consume object
		inserted_object = 0

//THE OBJECT BEING ADDED IS THE LETTER "O" NOT A 0(ZERO)
/obj/machinery/metal_press/attackby(var/obj/item/O as obj, var/mob/user as mob)

	if(busy)
		to_chat(user, "<span class='notice'>\The [src] is busy. Please wait for completion of previous operation.</span>")
		return

	if(default_deconstruction_screwdriver(user, O))
		updateUsrDialog()
		return
	if(default_deconstruction_crowbar(user, O))
		return
	if(default_part_replacement(user, O))
		return

	if(stat)
		return

	if(O.loc != user && !(istype(O,/obj/item/stack)))
		return 0

	if(is_robot_module(O))
		return 0

	if(istype(O,/obj/item/stack))
		to_chat(user, "<span class='notice'>The stack is to big for the mill!</span>")
		return
	//Resources are being loaded.
	var/obj/item/eating = O
	//You can put ANYTHING in as long as it's not full
	// TODO: needs size check
	if (inserted_object)
		to_chat(user, "<span class='notice'>\The [src] is full. Please remove the object from the metal_press in order to insert another.</span>")
		return
	else
		inserted_object = eating
		to_chat(user, "You fill \the [src] to capacity with \the [eating].")

	flick("metal_press_o", src) // Plays metal insertion animation. Work out a good way to work out a fitting animation. ~Z

	user.remove_from_mob(O)
	qdel(O)

	return

/obj/machinery/metal_press/attack_hand(mob/user as mob)
	//user.set_machine(src)
	interact(user)

/obj/machinery/metal_press/update_icon()
	icon_state = (panel_open ? "autolathe_t" : "autolathe")

//Updates overall lathe storage size.
/obj/machinery/metal_press/RefreshParts()
	..()
	var/mb_rating = 0
	var/man_rating = 0
	for(var/obj/item/weapon/stock_parts/matter_bin/MB in component_parts)
		mb_rating += MB.rating
	for(var/obj/item/weapon/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating

	build_time = 50 / man_rating
	mat_efficiency = 1.1 - man_rating * 0.1// Normally, price is 1.25 the amount of material, so this shouldn't go higher than 0.8. Maximum rating of parts is 3

/obj/machinery/metal_press/dismantle()
	inserted_object = null
	..()
	return 1
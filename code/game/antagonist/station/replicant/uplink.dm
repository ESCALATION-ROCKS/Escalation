/obj/machinery/replicant_uplink
	name = "Equipment Cache"
	desc = ""
	icon = 'icons/obj/fancydecals.dmi'
	icon_state = "equipcache"
	density = 1
	anchored = 1
	use_power = 0
	var/processing = 0
	var/points = 110
	var/menustat = "menu"

/obj/machinery/replicant_uplink/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(default_deconstruction_screwdriver(user, O))
		return
	if(default_deconstruction_crowbar(user, O))
		return
	if(default_part_replacement(user, O))
		return
	else if(processing)
		to_chat(user, "<span class='notice'>\The [src] is currently processing.</span>")
	update_icon()
	return

/obj/machinery/replicant_uplink/interact(mob/user as mob)
	if(stat & BROKEN)
		return
	user.set_machine(src)
	var/dat = "<TITLE>Uplink</TITLE>Uplink:<BR>"
	if (processing)
		dat += "<FONT COLOR=red>Uplink is processing your request! Please wait...</FONT>"
	else
		dat += "Infiltration points: [points] points.<HR>"
		switch(menustat)
			if("menu")
				dat += "<A href='?src=\ref[src];action=detach'>Detach Container</A><BR><BR>"
				dat += "Weaponry<BR>"
				dat += "<A href='?src=\ref[src];action=create;item=wpntier1;cost=10'>Makeshift Knife</A> <FONT COLOR=blue>([round(10)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=wpntier2;cost=20'>Pistol (9x19) with ammunition</A> <FONT COLOR=blue>([round(20)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=wpntier2ammo;cost=10'>9x19 ammo (two magazines)</A> <FONT COLOR=blue>([round(10)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=wpntier2add;cost=10'>Silencer (fits for 9mm)</A> <FONT COLOR=blue>([round(10)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=wpntier3;cost=50'>Assault rifle (5.56x45) with ammunition</A> <FONT COLOR=blue>([round(50)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=wpntier3ammo;cost=10'>5.56 ammo (two magazines)</A> <FONT COLOR=blue>([round(10)])</FONT><BR>"
				dat += "Clothing and armor<BR>"
				dat += "<A href='?src=\ref[src];action=create;item=clt1;cost=5'>Clothing pack</A> <FONT COLOR=blue>([round(5)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=clt2;cost=15'>Tactical clothing pack</A> <FONT COLOR=blue>([round(15)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=clt3;cost=10'>Light armor vest</A> <FONT COLOR=blue>([round(10)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=clt4;cost=5'>Tactical gloves</A> <FONT COLOR=blue>([round(5)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=clt5;cost=5'>Shockproof helmet</A> <FONT COLOR=blue>([round(5)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=clt6;cost=10'>Combat helmet</A> <FONT COLOR=blue>([round(10)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=clt7;cost=15'>Medium armor vest</A> <FONT COLOR=blue>([round(15)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=clt8;cost=20'>Heavy armor vest</A> <FONT COLOR=blue>([round(20)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=clt9;cost=10'>Satchel</A> <FONT COLOR=blue>([round(10)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=clt10;cost=5'>Duty belt</A> <FONT COLOR=blue>([round(5)])</FONT><BR>"
				dat += "Other<BR>"
				dat += "<A href='?src=\ref[src];action=create;item=ethanol;cost=10'>Three ethanol autoinjectors</A> <FONT COLOR=blue>([round(10)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=firstaid;cost=5'>First-aid kit</A> <FONT COLOR=blue>([round(5)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=cheapcard;cost=5'>Refugee card (cheap)</A> <FONT COLOR=blue>([round(5)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=advcard;cost=20'>Refugee card (advanced)</A> <FONT COLOR=blue>([round(20)])</FONT><BR>"
				dat += "<A href='?src=\ref[src];action=create;item=passport;cost=40'>Advanced Multipassport</A> <FONT COLOR=blue>([round(40)])</FONT><BR>"
			if("nopoints")
				dat += "<FONT COLOR=red>Error: Out of infiltration points.</FONT><BR>Please, contact your system administrator.<BR>"
				dat += "<A href='?src=\ref[src];action=menu'>Return to menu</A>"
			if("complete")
				dat += "Operation complete.<BR>"
				dat += "<A href='?src=\ref[src];action=menu'>Return to menu</A>"
			if("void")
				dat += "<FONT COLOR=red>Error: Out of infiltration points.</FONT><BR>Please, contact your system administrator.<BR>"
				dat += "<A href='?src=\ref[src];action=menu'>Return to menu</A>"
	user << browse(dat, "window=biogenerator")
	onclose(user, "biogenerator")
	return

/obj/machinery/replicant_uplink/attack_hand(mob/user as mob)
	interact(user)

/obj/machinery/replicant_uplink/proc/create_product(var/item, var/cost)
	cost = round(cost)
	if(cost > points)
		menustat = "nopoints"
		return 0
	processing = 1
	update_icon()
	updateUsrDialog()
	points -= cost
	sleep(30)
	switch(item)
		if("wpntier1")
			new/obj/item/weapon/material/knife/craftknife(loc)
		if("wpntier2")
			new/obj/item/weapon/gun/projectile/pistol/deputy(loc)
			new/obj/item/ammo_magazine/a9mmpistol(loc)
		if("wpntier2ammo")
			new/obj/item/ammo_magazine/a9mmpistol(loc)
			new/obj/item/ammo_magazine/a9mmpistol(loc)
		if("wpntier2add")
			new/obj/item/weapon/gunsmith/upgrade/suppressor(loc)
		if("wpntier3")
			new/obj/item/weapon/gun/projectile/automatic/ar/redline(loc)
			new/obj/item/ammo_magazine/a556x45rifle(loc)
		if("wpntier3ammo")
			new/obj/item/ammo_magazine/a556x45rifle(loc)
			new/obj/item/ammo_magazine/a556x45rifle(loc)

		if("clt1")
			new/obj/random/shoes(loc)
			new/obj/random/clothing(loc)
			new/obj/random/clothing(loc)
			new/obj/random/clothing(loc)
		if("clt2")
			new/obj/item/clothing/shoes/tactical(loc)
			new/obj/item/clothing/accessory/ubac/green(loc)
			new/obj/item/clothing/under/formal_pants/khaki(loc)
		if("clt3")
			new/obj/item/clothing/accessory/armorplate/steel/(loc)
			new/obj/item/clothing/accessory/storage/pouches/green(loc)
			new/obj/item/clothing/suit/armor/pcarrier/green(loc)
		if("clt4")
			new/obj/item/clothing/gloves/thick/combat(loc)
		if("clt5")
			new/obj/item/clothing/head/helmet/shockproof(loc)
		if("clt6")
			new/obj/item/clothing/head/helmet/(loc)
		if("clt7")
			new/obj/item/clothing/accessory/armorplate/ceramic(loc)
			new/obj/item/clothing/accessory/storage/pouches/green(loc)
			new/obj/item/clothing/suit/armor/pcarrier/green(loc)
			new/obj/item/clothing/accessory/legguards/green(loc)
			new/obj/item/clothing/accessory/neckguard/green(loc)
		if("clt8")
			new/obj/item/clothing/accessory/armorplate/ceramic/classvi(loc)
			new/obj/item/clothing/accessory/storage/pouches/green(loc)
			new/obj/item/clothing/suit/armor/pcarrier/green(loc)
			new/obj/item/clothing/accessory/groinplate/green(loc)
			new/obj/item/clothing/accessory/legguards/green(loc)
			new/obj/item/clothing/accessory/neckguard/green(loc)
			new/obj/item/clothing/accessory/storage/pouches/medium/green(loc)
		if("clt9")
			new/obj/item/weapon/storage/backpack/satchel(loc)
		if("clt10")
			new/obj/item/weapon/storage/belt/security/duty(loc)
		if("ethanol")
			new/obj/item/weapon/reagent_containers/hypospray/autoinjector/ethanol(loc)
			new/obj/item/weapon/reagent_containers/hypospray/autoinjector/ethanol(loc)
			new/obj/item/weapon/reagent_containers/hypospray/autoinjector/ethanol(loc)
		if("firstaid")
			new/obj/item/weapon/storage/firstaid/regular(loc)
		if("cheapcard")
			new/obj/item/weapon/card/id/refugeecard/cheapreplicant/(loc)
		if("advcard")
			new/obj/item/weapon/card/id/refugeecard/replicant(loc)
		if("passport")
			new/obj/item/weapon/card/id/syndicate(loc)


	processing = 0
	menustat = "complete"
	update_icon()
	return 1

/obj/machinery/replicant_uplink/Topic(href, href_list)
	if(stat & BROKEN) return
	if(usr.stat || usr.restrained()) return
	if(!in_range(src, usr)) return

	usr.set_machine(src)

	switch(href_list["action"])
		if("create")
			create_product(href_list["item"], text2num(href_list["cost"]))
		if("menu")
			menustat = "menu"
	updateUsrDialog()
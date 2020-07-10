/decl/hierarchy/outfit/standard_space_gear
	name = "Standard space gear"
	shoes = /obj/item/clothing/shoes/black
	head = /obj/item/clothing/head/helmet/space
	suit = /obj/item/clothing/suit/space
	uniform = /obj/item/clothing/under/color/grey
	back = /obj/item/weapon/tank/jetpack/oxygen
	mask = /obj/item/clothing/mask/breath
	flags = OUTFIT_HAS_JETPACK

/decl/hierarchy/outfit/soviet_soldier
	name = "Soviet soldier"
	uniform = /obj/item/clothing/under/soviet
	shoes = /obj/item/clothing/shoes/combat
	head = /obj/item/clothing/head/ushanka
	gloves = /obj/item/clothing/gloves/thick/combat
	back = /obj/item/weapon/storage/backpack/satchel
	belt = /obj/item/weapon/gun/projectile/revolver/mateba

/decl/hierarchy/outfit/soviet_soldier/admiral
	name = "Soviet admiral"
	head = /obj/item/clothing/head/hgpiratecap
	l_ear = /obj/item/device/radio/headset/heads/captain
	glasses = /obj/item/clothing/glasses/thermal/plain/eyepatch
	suit = /obj/item/clothing/suit/hgpirate

	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/centcom/station
	id_pda_assignment = "Admiral"

/decl/hierarchy/outfit/merchant
	name = "Merchant"
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/device/radio/headset
	uniform = /obj/item/clothing/under/color/grey
	id_slot = slot_wear_id
	id_type = /obj/item/weapon/card/id/merchant
	pda_slot = slot_r_store
	pda_type = /obj/item/device/pda/chef //cause I like the look
	id_pda_assignment = "Merchant"

/decl/hierarchy/outfit/merchant/vox
	name = "Merchant - Vox"
	shoes = /obj/item/clothing/shoes/jackboots/unathi
	uniform = /obj/item/clothing/under/vox/vox_robes
	suit = /obj/item/clothing/suit/armor/vox_scrap

/decl/hierarchy/outfit/hev/blackmesa/leader
	name = "Coldwar - BLACK MESA HEV SL"
	uniform = /obj/item/clothing/under/usmc/woodland/alt/ssgt
	suit = /obj/item/clothing/suit/armor/vest/hev
	shoes = /obj/item/clothing/shoes/usmc/field
	l_pocket = /obj/item/weapon/storage/belt/holster/sheath/usmc
	back_2 = /obj/item/weapon/gun/projectile/automatic/rifle/m16a2
	left_pouch = /obj/item/weapon/storage/belt/suit/ammo/usmc
	right_pouch = /obj/item/weapon/storage/belt/suit/ammo/usmc
	back = /obj/item/weapon/radioset/prc77
	holster = /obj/item/weapon/storage/belt/holster/usmc
	head = /obj/item/clothing/head/helmet/coldwar/hev_helm/
	l_pocket = /obj/item/weapon/masterkey/usmcsarge
	r_pocket = null
	l_ear = /obj/item/device/binoculars/nato
	belt = /obj/item/weapon/storage/belt/harness/usmc

/decl/hierarchy/outfit/hev/blackmesa
	name = "Coldwar - BLACK MESA HEV Rifleman"
	uniform = /obj/item/clothing/under/usmc/woodland/alt/pfc
	suit = /obj/item/clothing/suit/armor/vest/hev
	shoes = /obj/item/clothing/shoes/usmc/field
	holster = /obj/item/weapon/storage/belt/holster/sheath/usmc
	back_2 = /obj/item/weapon/gun/projectile/automatic/rifle/m16a1
	left_pouch = /obj/item/weapon/storage/belt/suit/ammo/usmc
	right_pouch = /obj/item/weapon/storage/belt/suit/ammo/usmc
	r_pocket = null
	back = /obj/item/weapon/storage/backpack/usmc_buttpack
	head = /obj/item/clothing/head/helmet/coldwar/hev_helm/
	belt = /obj/item/weapon/storage/belt/harness/usmc
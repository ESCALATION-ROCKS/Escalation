var/list/outfits_decls_
var/list/outfits_decls_root_
var/list/outfits_decls_by_type_

/proc/outfit_by_type(var/outfit_type)
	if(!outfits_decls_root_)
		init_outfit_decls()
	return outfits_decls_by_type_[outfit_type]

/proc/outfits()
	if(!outfits_decls_root_)
		init_outfit_decls()
	return outfits_decls_

/proc/init_outfit_decls()
	if(outfits_decls_root_)
		return
	outfits_decls_ = list()
	outfits_decls_by_type_ = list()
	outfits_decls_root_ = new/decl/hierarchy/outfit()

/decl/hierarchy/outfit
	name = "Naked"

	var/uniform = null
	var/suit = null
	var/back = null
	var/gun_slot = null
	var/belt = null
	var/gloves = null
	var/shoes = null
	var/head = null
	var/mask = null
	var/l_ear = null
	var/r_ear = null
	var/glasses = null
	var/id = null
	var/l_pocket = null
	var/r_pocket = null
	var/suit_store = null
	var/r_hand = null
	var/l_hand = null
	var/list/backpack_contents = list() // In the list(path=count,otherpath=count) format
	var/left_pouch = null
	var/right_pouch = null
	var/holster = null

	var/id_type
	var/id_desc
	var/id_slot

	var/pda_type
	var/pda_slot

	var/id_pda_assignment

	var/backpack = /obj/item/weapon/storage/backpack
	var/satchel_one  = /obj/item/weapon/storage/backpack/satchel_norm
	var/satchel_two  = /obj/item/weapon/storage/backpack/satchel
	var/messenger_bag = /obj/item/weapon/storage/backpack/messenger
	var/satchel_black = /obj/item/weapon/storage/backpack/satchel_black

	var/sabackpack = /obj/item/weapon/storage/backpack/sakitbag
	var/sasatchel  = /obj/item/weapon/storage/backpack/gassoviet

	var/cslabackpack = /obj/item/weapon/storage/backpack/sakitbag/csla
	var/cslasatchel  = /obj/item/weapon/storage/backpack/gassoviet/csla

	var/usabackpack = /obj/item/weapon/storage/backpack/alice/medium
	var/usasatchel  = /obj/item/weapon/storage/backpack/usmc_buttpack

	var/usmcbackpack = /obj/item/weapon/storage/backpack/alice/medium
	var/usmcsatchel  = /obj/item/weapon/storage/backpack/usmc_buttpack

	var/bdhbackpack = /obj/item/weapon/storage/backpack/alice/heer
	var/bdhsatchel  = /obj/item/weapon/storage/backpack/heer_buttpack

	var/bdwbackpack = /obj/item/weapon/storage/backpack/alice/medium
	var/bdwsatchel  = /obj/item/weapon/storage/backpack/bundes_buttpack

	var/nvabackpack = /obj/item/weapon/storage/backpack/sakitbag/nvaddr
	var/nvasatchel  = /obj/item/weapon/storage/backpack/gassoviet/nva

	var/bafbackpack = /obj/item/weapon/storage/backpack/baf/medium
	var/bafsatchel  = /obj/item/weapon/storage/backpack/baf_buttpack

	var/finnbackpack = /obj/item/weapon/storage/backpack/finn/finn_backpack
	var/finnsatchel  = /obj/item/weapon/storage/backpack/finn/finn_buttpack

	var/espbackpack = /obj/item/weapon/storage/backpack/sakitbag/esp
	var/espsatchel  = /obj/item/weapon/storage/backpack/gassoviet/esp

	var/frabackpack = /obj/item/weapon/storage/backpack/alice/fra
	var/frasatchel  = /obj/item/weapon/storage/backpack/fra_buttpack

	var/flags

/decl/hierarchy/outfit/New()
	..()

	if(is_hidden_category())
		return
	outfits_decls_by_type_[type] = src
	dd_insertObjectList(outfits_decls_, src)

/decl/hierarchy/outfit/proc/pre_equip(mob/living/carbon/human/H) //////extremely shitty code that needs optimization
	/*if(flags & OUTFIT_HAS_BACKPACK)
		switch(H.backbag)
			if(2) back = backpack
			if(3) back = satchel_one
			if(4) back = satchel_two
			if(5) back = messenger_bag
			if(6) back = satchel_black
			else back = null*/
	if(flags & OUTFIT_HAS_SABACKPACK)
		switch(H.backbag)
			if(1) back = sabackpack
			if(2) back = sasatchel
			else back = null
	if(flags & OUTFIT_HAS_CSLABACKPACK)
		switch(H.backbag)
			if(1) back = cslabackpack
			if(2) back = cslasatchel
			else back = null
	if(flags & OUTFIT_HAS_USABACKPACK)
		switch(H.backbag)
			if(1) back = usabackpack
			if(2) back = usasatchel
			else back = null
	if(flags & OUTFIT_HAS_USMCBACKPACK)
		switch(H.backbag)
			if(1) back = usmcbackpack
			if(2) back = usmcsatchel
			else back = null
	if(flags & OUTFIT_HAS_BDHBACKPACK)
		switch(H.backbag)
			if(1) back = bdhbackpack
			if(2) back = bdhsatchel
			else back = null
	if(flags & OUTFIT_HAS_BDWBACKPACK)
		switch(H.backbag)
			if(1) back = bdwbackpack
			if(2) back = bdwsatchel
			else back = null
	if(flags & OUTFIT_HAS_NVABACKPACK)
		switch(H.backbag)
			if(1) back = nvabackpack
			if(2) back = nvasatchel
			else back = null
	if(flags & OUTFIT_HAS_BAFBACKPACK)
		switch(H.backbag)
			if(1) back = bafbackpack
			if(2) back = bafsatchel
			else back = null
	if(flags & OUTFIT_HAS_FINNBACKPACK)
		switch(H.backbag)
			if(1) back = finnbackpack
			if(2) back = finnsatchel
			else back = null
	if(flags & OUTFIT_HAS_ESPBACKPACK)
		switch(H.backbag)
			if(1) back = espbackpack
			if(2) back = espsatchel
			else back = null
	if(flags & OUTFIT_HAS_FRABACKPACK)
		switch(H.backbag)
			if(1) back = frabackpack
			if(2) back = frasatchel
			else back = null
	
/decl/hierarchy/outfit/proc/post_equip(mob/living/carbon/human/H)
	if(flags & OUTFIT_HAS_JETPACK)
		var/obj/item/weapon/tank/jetpack/J = locate(/obj/item/weapon/tank/jetpack) in H
		if(!J)
			return
		J.toggle()
		J.toggle_valve()

// A proc for non-human species, specially Unathi and Tajara, since they e.g.
// can't normally wear gloves as humans. Correct this issue by trying again, but
// apply some changes to the said item.
//
// Currently checks for gloves
//
// If you want to add more items that has species restriction, consider follow-
// ing the same format as the gloves shown in the code below. Thanks.
/decl/hierarchy/outfit/proc/check_and_try_equip_xeno(mob/living/carbon/human/H)
	var/datum/species/S = H.species
	if (!S || istype(S, /datum/species/human)) // null failcheck & get out here you damn humans
		return

	// Gloves
	if (gloves && !H.get_equipped_item(slot_gloves)) // does mob not have gloves, despite the outfit has one specified?
		var/obj/item/clothing/gloves/G = new gloves(H) // we've no use of a null object, instantize one
		if (S.get_bodytype(H) in G.species_restricted) // what was the problem?
			if ("exclude" in G.species_restricted) // are they excluded?
				G.cut_fingertops()
				// I could optimize this bit when we are trying to apply the gloves to e.g. Vox, a species still restricted despite G.cut_fingertops(). But who cares if this is codebase is like a plate of spaghetti twice over the brim, right? RIGHT?
				H.equip_to_slot_or_del(G,slot_gloves) // try again
		else
			qdel(G)
	// end Gloves

// end of check_and_try_equip_xeno

/decl/hierarchy/outfit/proc/equip(mob/living/carbon/human/H, var/rank, var/assignment)
	equip_base(H)
	post_equip(H)
	H.regenerate_icons()

	rank = id_pda_assignment || rank
	assignment = id_pda_assignment || assignment || rank
	var/obj/item/weapon/card/id/W = equip_id(H, rank, assignment)
	if(W)
		rank = W.rank
		assignment = W.assignment
	equip_pda(H, rank, assignment)

	for(var/path in backpack_contents)
		var/number = backpack_contents[path]
		for(var/i=0,i<number,i++)
			H.equip_to_slot_or_del(new path(H), slot_in_backpack)
	if(W) // We set ID info last to ensure the ID photo is as correct as possible.
		H.set_id_info(W)
	return 1



/decl/hierarchy/outfit/proc/equip_base(mob/living/carbon/human/H)
	pre_equip(H)

	//Start with uniform,suit,backpack for additional slots
	if(uniform)
		H.equip_to_slot_or_del(new uniform(H),slot_w_uniform)
	if(suit)
		H.equip_to_slot_or_del(new suit(H),slot_wear_suit)
	if(back)
		H.equip_to_slot_or_del(new back(H),slot_back)
	if(gun_slot)
		H.equip_to_slot_or_del(new gun_slot(H),slot_gun_slot)
	if(belt)
		H.equip_to_slot_or_del(new belt(H),slot_belt)
	if(gloves)
		H.equip_to_slot_or_del(new gloves(H),slot_gloves)
	if(shoes)
		H.equip_to_slot_or_del(new shoes(H),slot_shoes)
	if(mask)
		H.equip_to_slot_or_del(new mask(H),slot_wear_mask)
	if(holster)
		H.equip_to_slot_or_del(new holster(H),slot_holster)
	if(left_pouch)
		H.equip_to_slot_or_del(new left_pouch(H),slot_left_pouch)
	if(right_pouch)
		H.equip_to_slot_or_del(new right_pouch(H),slot_right_pouch)
	if(head)
		H.equip_to_slot_or_del(new head(H),slot_head)
	if(l_ear)
		H.equip_to_slot_or_del(new l_ear(H),slot_l_ear)
	if(r_ear)
		H.equip_to_slot_or_del(new r_ear(H),slot_r_ear)
	if(glasses)
		H.equip_to_slot_or_del(new glasses(H),slot_glasses)
	if(id)
		H.equip_to_slot_or_del(new id(H),slot_wear_id)
	if(l_pocket)
		H.equip_to_slot_or_del(new l_pocket(H),slot_l_store)
	if(r_pocket)
		H.equip_to_slot_or_del(new r_pocket(H),slot_r_store)
	if(suit_store)
		H.equip_to_slot_or_del(new suit_store(H),slot_s_store)

	if(l_hand)
		H.put_in_l_hand(new l_hand(H))
	if(r_hand)
		H.put_in_r_hand(new r_hand(H))
//	if(H.species)
//		H.species.equip_survival_gear(H, flags&OUTFIT_EXTENDED_SURVIVAL)
	check_and_try_equip_xeno(H)

/decl/hierarchy/outfit/proc/equip_id(mob/living/carbon/human/H, rank, assignment)
	if(!id_slot || !id_type)
		return
	var/obj/item/weapon/card/id/W = new id_type(H)
	if(id_desc)
		W.desc = id_desc
	if(rank)
		W.rank = rank
	if(assignment)
		W.assignment = assignment
	H.set_id_info(W)
	if(H.equip_to_slot_or_del(W, id_slot))
		return W

/decl/hierarchy/outfit/proc/equip_pda(mob/living/carbon/human/H, rank, assignment)
	if(!pda_slot || !pda_type)
		return
	var/obj/item/device/pda/heads/pda = new pda_type(H)
	pda.set_owner_rank_job(H.real_name, rank, assignment)
	if(H.equip_to_slot_or_del(pda, pda_slot))
		return pda

/decl/hierarchy/outfit/dd_SortValue()
	return name

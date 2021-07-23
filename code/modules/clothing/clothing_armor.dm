/obj/item/clothing
	var/possible_damage_states = 0

/obj/item/clothing/damage_armor(damage, zone)
	. = ..()
	if(!possible_damage_states)
		return
	var/damage_state = CEIL(armor_integrity[armor_integrity[1]]/armor_integrity_starting * possible_damage_states)
	if(damage_state)
		icon_state = "[initial(icon_state)]_[damage_state]"

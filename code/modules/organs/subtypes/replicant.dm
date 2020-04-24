/obj/item/organ/mmi_holder/posibrain/terminator
	name = "brain"
	organ_tag = "brain"
	parent_organ = "chest"
	vital = 1

/obj/item/organ/internal/data
	name = "data core"
	organ_tag = "data core"
	parent_organ = "groin"
	icon = 'icons/obj/cloning.dmi'
	icon_state = "harddisk"
	vital = 0

/obj/item/organ/data/Initialize()
	robotize()
	. = ..()

/obj/item/organ/cell/terminator
	name = "shielded microbattery"
	desc = "A small, powerful cell for use in fully prosthetic bodies. Equipped with a Faraday shield."
	icon = 'icons/obj/power.dmi'
	icon_state = "scell"
	organ_tag = "shielded cell"
	parent_organ = "chest"
	vital = 1

/obj/item/organ/cell/Initialize()
	robotize()
	. = ..()

/obj/item/organ/internal/replicell
	name = "bioelectrical cell"
	parent_organ = BP_HEAD
	icon_state = "scell"
	organ_tag = BP_BIOCELL
	var/stored_biopower = 0
	var/max_biopower = 500

/obj/item/organ/internal/replicell/Initialize()
	robotize()
	. = ..()

/obj/item/organ/internal/lungs/replica/Initialize()
	robotize()
	. = ..()

/obj/item/organ/internal/liver/replica/Initialize()
	robotize()
	. = ..()

/obj/item/organ/internal/heart/replica/Initialize()
	robotize()
	. = ..()

/obj/item/organ/internal/kidneys/replica/Initialize()
	robotize()
	. = ..()


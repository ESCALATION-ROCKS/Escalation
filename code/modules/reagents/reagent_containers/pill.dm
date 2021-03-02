///////////////////////////////////////////bay12 snowflake pills - we dont use these/////////////////////////////////////


//Pills
/obj/item/weapon/reagent_containers/pill/antitox
	name = "Anti-toxins pill"
	desc = "Neutralizes many common toxins."
	icon_state = "pill17"
	New()
		..()
		reagents.add_reagent(/datum/reagent/dylovene, 25)

/obj/item/weapon/reagent_containers/pill/tox
	name = "Toxins pill"
	desc = "Highly toxic."
	icon_state = "pill5"
	New()
		..()
		reagents.add_reagent(/datum/reagent/toxin, 50)

/obj/item/weapon/reagent_containers/pill/cyanide
	name = "Cyanide pill"
	desc = "Don't swallow this."
	icon_state = "pill5"
	New()
		..()
		reagents.add_reagent(/datum/reagent/toxin/cyanide, 50)

/obj/item/weapon/reagent_containers/pill/adminordrazine
	name = "Adminordrazine pill"
	desc = "It's magic. We don't have to explain it."
	icon_state = "pill16"
	New()
		..()
		reagents.add_reagent(/datum/reagent/adminordrazine, 50)

/obj/item/weapon/reagent_containers/pill/stox
	name = "Sleeping pill"
	desc = "Commonly used to treat insomnia."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/soporific, 15)

/obj/item/weapon/reagent_containers/pill/kelotane
	name = "Kelotane pill"
	desc = "Used to treat burns."
	icon_state = "pill11"
	New()
		..()
		reagents.add_reagent(/datum/reagent/kelotane, 15)

/obj/item/weapon/reagent_containers/pill/paracetamol
	name = "Paracetamol pill"
	desc = "Weak painkiller with a very slow metabolization speed. Meant for trivial injuries and cracked bones. Do NOT administer more than 20u."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/paracetamol, 10)

/obj/item/weapon/reagent_containers/pill/tramadol
	name = "Tramadol pill"
	desc = "A simple painkiller."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/tramadol, 15)

/obj/item/weapon/reagent_containers/pill/inaprovaline
	name = "Inaprovaline pill"
	desc = "Used to stabilize patients."
	icon_state = "pill20"
	New()
		..()
		reagents.add_reagent(/datum/reagent/inaprovaline, 30)

/obj/item/weapon/reagent_containers/pill/dexalin
	name = "Dexalin pill"
	desc = "Used to treat oxygen deprivation."
	icon_state = "pill16"
	New()
		..()
		reagents.add_reagent(/datum/reagent/dexalin, 15)

/obj/item/weapon/reagent_containers/pill/dexalin_plus
	name = "Dexalin Plus pill"
	desc = "Used to treat extreme oxygen deprivation."
	icon_state = "pill8"
	New()
		..()
		reagents.add_reagent(/datum/reagent/dexalinp, 15)

/obj/item/weapon/reagent_containers/pill/dermaline
	name = "Dermaline pill"
	desc = "Used to treat burn wounds."
	icon_state = "pill12"
	New()
		..()
		reagents.add_reagent(/datum/reagent/dermaline, 15)

/obj/item/weapon/reagent_containers/pill/dylovene
	name = "Dylovene pill"
	desc = "A broad-spectrum anti-toxin."
	icon_state = "pill13"
	New()
		..()
		reagents.add_reagent(/datum/reagent/dylovene, 15)

/obj/item/weapon/reagent_containers/pill/inaprovaline
	name = "Inaprovaline pill"
	desc = "Used to stabilize patients."
	icon_state = "pill20"
	New()
		..()
		reagents.add_reagent(/datum/reagent/inaprovaline, 30)

/obj/item/weapon/reagent_containers/pill/bicaridine
	name = "Bicaridine pill"
	desc = "Used to treat physical injuries."
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent(/datum/reagent/bicaridine, 20)

/obj/item/weapon/reagent_containers/pill/happy
	name = "Happy pill"
	desc = "Happy happy joy joy!"
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent(/datum/reagent/space_drugs, 15)
		reagents.add_reagent(/datum/reagent/sugar, 15)

/obj/item/weapon/reagent_containers/pill/zoom
	name = "Zoom pill"
	desc = "Zoooom!"
	icon_state = "pill18"
	New()
		..()
		reagents.add_reagent(/datum/reagent/impedrezene, 10)
		reagents.add_reagent(/datum/reagent/synaptizine, 5)
		reagents.add_reagent(/datum/reagent/hyperzine, 5)

/obj/item/weapon/reagent_containers/pill/tetracetam
	name = "tetracetam pill"
	desc = "Contains tetracetam."
	icon_state = "pill9"
	New()
		..()
		reagents.add_reagent(/datum/reagent/tetracetam, 15)

/obj/item/weapon/reagent_containers/pill/oxaprofen
	name = "oxaprofen pill"
	desc = "Contains oxaprofen."
	icon_state = "pill9"
	New()
		..()
		reagents.add_reagent(/datum/reagent/oxaprofen, 15)

/obj/item/weapon/reagent_containers/pill/diet
	name = "diet pill"
	desc = "Guaranteed to get you slim!"
	icon_state = "pill9"
	New()
		..()
		reagents.add_reagent(/datum/reagent/lipozine, 2)

/obj/item/weapon/reagent_containers/pill/noexcutite
	name = "Noexcutite pill"
	desc = "Feeling jittery? This should calm you down."
	icon_state = "pill9"

obj/item/weapon/reagent_containers/pill/noexcutite/New()
		..()
		reagents.add_reagent(/datum/reagent/noexcutite, 15)

//Baycode specific Psychiatry pills.
/obj/item/weapon/reagent_containers/pill/methylphenidate
	name = "Methylphenidate pill"
	desc = "Improves the ability to concentrate."
	icon_state = "pill8"

/obj/item/weapon/reagent_containers/pill/methylphenidate/New()
		..()
		reagents.add_reagent(/datum/reagent/methylphenidate, 15)

/obj/item/weapon/reagent_containers/pill/citalopram
	name = "Citalopram pill"
	desc = "Mild anti-depressant."
	icon_state = "pill8"

/obj/item/weapon/reagent_containers/pill/citalopram/New()
		..()
		reagents.add_reagent(/datum/reagent/citalopram, 15)

/obj/item/weapon/reagent_containers/pill/paroxetine
	name = "Paroxetine pill"
	desc = "Before you swallow a bullet: try swallowing this!"
	icon_state = "pill20"

/obj/item/weapon/reagent_containers/pill/paroxetine/New()
		..()
		reagents.add_reagent(/datum/reagent/paroxetine, 10)

/obj/item/weapon/reagent_containers/pill/antidexafen
	name = "cold medicine pill"
	desc = "Safe for babies!"
	icon_state = "pill20"

/obj/item/weapon/reagent_containers/pill/antidexafen/New()
		..()
		reagents.add_reagent(/datum/reagent/antidexafen, 10)
		reagents.add_reagent(/datum/reagent/drink/juice/lemon, 5)
		reagents.add_reagent(/datum/reagent/menthol, REM*0.2)


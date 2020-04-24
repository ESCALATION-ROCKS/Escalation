/obj/structure/table/standard
	icon_state = "plain_preview"
	color = COLOR_OFF_WHITE
	material = DEFAULT_TABLE_MATERIAL

/obj/structure/table/steel
	icon_state = "plain_preview"
	color = COLOR_GRAY40
	material = DEFAULT_WALL_MATERIAL

/obj/structure/table/marble
	icon_state = "stone_preview"
	color = COLOR_GRAY80
	material = "marble"

/obj/structure/table/reinforced
	icon_state = "reinf_preview"
	color = COLOR_OFF_WHITE
	material = DEFAULT_TABLE_MATERIAL
	reinforced = DEFAULT_WALL_MATERIAL

/obj/structure/table/steel_reinforced
	icon_state = "reinf_preview"
	color = COLOR_GRAY40
	material = DEFAULT_WALL_MATERIAL
	reinforced = DEFAULT_WALL_MATERIAL

/obj/structure/table/woodentable
	icon_state = "plain_preview"
	color = COLOR_BROWN_ORANGE
	material = "wood"

/obj/structure/table/gamblingtable
	icon_state = "gamble_preview"
	carpeted = 1
	material = "wood"

/obj/structure/table/glass
	icon_state = "plain_preview"
	color = COLOR_DEEP_SKY_BLUE
	alpha = 77 // 0.3 * 255
	material = "glass"

/obj/structure/table/holotable
	icon_state = "holo_preview"
	color = COLOR_OFF_WHITE
/obj/structure/table/holotable/New()
	material = "holo[DEFAULT_TABLE_MATERIAL]"
	..()

/obj/structure/table/holo_woodentable
	icon_state = "holo_preview"
	material = "holowood"

//BENCH PRESETS
/obj/structure/table/bench/standard
	icon_state = "plain_preview"
	color = "#EEEEEE"

/obj/structure/table/bench/standard/New()
	material = get_material_by_name(DEFAULT_TABLE_MATERIAL)
	..()

/obj/structure/table/bench/steel
	icon_state = "plain_preview"
	color = "#666666"

/obj/structure/table/bench/steel/New()
	material = get_material_by_name(DEFAULT_WALL_MATERIAL)
	..()


/obj/structure/table/bench/marble
	icon_state = "stone_preview"
	color = "#CCCCCC"

/obj/structure/table/bench/marble/New()
	material = get_material_by_name("marble")
	..()
/*
/obj/structure/table/bench/reinforced
	icon_state = "reinf_preview"
	color = "#EEEEEE"

/obj/structure/table/bench/reinforced/New()
	material = get_material_by_name(DEFAULT_TABLE_MATERIAL)
	reinforced = get_material_by_name(DEFAULT_WALL_MATERIAL)
	..()

/obj/structure/table/bench/steel_reinforced
	icon_state = "reinf_preview"
	color = "#666666"

/obj/structure/table/bench/steel_reinforced/New()
	material = get_material_by_name(DEFAULT_WALL_MATERIAL)
	reinforced = get_material_by_name(DEFAULT_WALL_MATERIAL)
	..()

/obj/structure/table/bench/wooden_reinforced
	icon_state = "reinf_preview"
	color = "#824B28"

/obj/structure/table/bench/wooden_reinforced/New()
	material = get_material_by_name("wood")
	reinforced = get_material_by_name(DEFAULT_WALL_MATERIAL)
	..()
*/
/obj/structure/table/bench/wooden
	icon_state = "plain_preview"
	color = "#824B28"

/obj/structure/table/bench/wooden/New()
	material = get_material_by_name("wood")
	..()

/obj/structure/table/bench/padded
	icon_state = "padded_preview"

/obj/structure/table/bench/padded/New()
	material = get_material_by_name(DEFAULT_WALL_MATERIAL)
	carpeted = 1
	..()

/obj/structure/table/bench/glass
	icon_state = "plain_preview"
	color = "#00E1FF"
	alpha = 77 // 0.3 * 255

/obj/structure/table/bench/glass/New()
	material = get_material_by_name("glass")
	..()

/obj/structure/table/greenmetal
	icon_state = "greenmetal_preview"
	material = "greenmetal"
	color = null
	flipped = -1

/obj/structure/table/army
	icon_state = "army_preview"
	material = "army"
	color = null
	flipped = -1

/obj/structure/table/fancy
	icon_state = "fancy_preview"
	material = "fancy"
	color = null
	flipped = -1

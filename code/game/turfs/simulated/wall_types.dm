/turf/simulated/wall/r_wall
	icon_state = "rgeneric"
/turf/simulated/wall/r_wall/New(var/newloc)
	..(newloc, "plasteel","plasteel") //3strong
/turf/simulated/wall/ocp_wall
	icon_state = "rgeneric"
/turf/simulated/wall/ocp_wall/New(var/newloc)
	..(newloc, "osmium-carbide plasteel", "osmium-carbide plasteel")




/turf/simulated/wall/cult
	icon_state = "cult"

/turf/simulated/wall/cult/New(var/newloc, var/reinforce = 0)
	..(newloc,"cult",reinforce ? "cult2" : null)

/turf/simulated/wall/cult/reinf/New(var/newloc)
	..(newloc, 1)

/turf/simulated/wall/cult/dismantle_wall()
	cult.remove_cultiness(CULTINESS_PER_TURF)
	..()

/turf/unsimulated/wall/cult
	name = "cult wall"
	desc = "Hideous images dance beneath the surface."
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "cult"

/turf/simulated/wall/iron/New(var/newloc)
	..(newloc,"iron")
/turf/simulated/wall/uranium/New(var/newloc)
	..(newloc,"uranium")
/turf/simulated/wall/diamond/New(var/newloc)
	..(newloc,"diamond")
/turf/simulated/wall/gold/New(var/newloc)
	..(newloc,"gold")
/turf/simulated/wall/silver/New(var/newloc)
	..(newloc,"silver")
/turf/simulated/wall/phoron/New(var/newloc)
	..(newloc,"phoron")
/turf/simulated/wall/sandstone/New(var/newloc)
	..(newloc,"sandstone")
/turf/simulated/wall/wood/New(var/newloc)
	..(newloc,"wood")
/turf/simulated/wall/ironphoron/New(var/newloc)
	..(newloc,"iron","phoron")
/turf/simulated/wall/golddiamond/New(var/newloc)
	..(newloc,"gold","diamond")
/turf/simulated/wall/silvergold/New(var/newloc)
	..(newloc,"silver","gold")
/turf/simulated/wall/sandstonediamond/New(var/newloc)
	..(newloc,"sandstone","diamond")


// Kind of wondering if this is going to bite me in the butt.
/turf/simulated/wall/voxshuttle/New(var/newloc)
	..(newloc,"voxalloy")
/turf/simulated/wall/voxshuttle/attackby()
	return
/turf/simulated/wall/titanium/New(var/newloc)
	..(newloc,"titanium")

/turf/simulated/wall/alium
	icon_state = "jaggy"
	floor_type = /turf/simulated/floor/fixed/alium

/turf/simulated/wall/alium/New(var/newloc)
	..(newloc,"alien alloy")

/turf/simulated/wall/alium/ex_act(severity)
	if(prob(explosion_resistance))
		return
	..()

/turf/simulated/wall/concrete
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "dontuseme"
	color = "#CCCCCC"

/turf/simulated/wall/concrete/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "concrete")

/turf/simulated/wall/armedconcrete
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "concrete_preview"
	color = "#CCCCCC"

/turf/simulated/wall/armedconcrete/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "concrete", "steel")

turf/simulated/wall/titanium
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "concrete_preview"
	color = "#D1E6E3"

/turf/simulated/wall/titanium/New(var/newloc)
	icon_state = null
	color = null
	..(newloc,"titanium")


//////////////////////////////////////////////////COLDWAR BLOCKS/////////////////////////////////////////////


/////////////COLDWAR BRICK BLOCKS

/turf/simulated/wall/brick
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "brick_preview"
	color = "#732E24"

/turf/simulated/wall/brick/New(var/newloc)
	icon_state = null
	color = "#732E24"
	..(newloc, "brick")

/turf/simulated/wall/brick_white
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "brick_preview"
	color = "#ffffff"

/turf/simulated/wall/brick_white/New(var/newloc)
	icon_state = null
	color = "#ffffff"
	..(newloc,"brick")

/turf/simulated/wall/brick_red
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "brick_preview"
	color = "#7D4C4C"

/turf/simulated/wall/brick_red/New(var/newloc)
	icon_state = null
	color = "#7D4C4C"
	..(newloc,"brick")

/turf/simulated/wall/brick_orange
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "brick_preview"
	color = "#FFA500"

/turf/simulated/wall/brick_orange/New(var/newloc)
	icon_state = null
	color = "#FFA500"
	..(newloc,"brick")

/turf/simulated/wall/brick_yellow
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "brick_preview"
	color = "#FFFF00"

/turf/simulated/wall/brick_yellow/New(var/newloc)
	icon_state = null
	color = "#FFFF00"
	..(newloc,"brick")

/turf/simulated/wall/brick_green
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "brick_preview"
	color = "#008000"

/turf/simulated/wall/brick_green/New(var/newloc)
	icon_state = null
	color = "#008000"
	..(newloc,"brick")

/turf/simulated/wall/brick_purple
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "brick_preview"
	color = "#800080"

/turf/simulated/wall/brick_purple/New(var/newloc)
	icon_state = null
	color = "#800080"
	..(newloc,"brick")

/turf/simulated/wall/brick_blue
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "brick_preview"
	color = "#161691"

/turf/simulated/wall/brick_blue/New(var/newloc)
	icon_state = null
	color = "#161691"
	..(newloc,"brick")

/turf/simulated/wall/brick_black
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "brick_preview"
	color = "#424242"

/turf/simulated/wall/brick_black/New(var/newloc)
	icon_state = null
	color = "#424242"
	..(newloc,"brick")

/turf/simulated/wall/brick_aged
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "brick_preview"
	color = "#6B533B"

/turf/simulated/wall/brick_aged/New(var/newloc)
	icon_state = null
	color = "#6B533B"
	..(newloc,"brick")

/turf/simulated/wall/brick_whitewashed
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "brick_preview"
	color = "#FCF2D8"

/turf/simulated/wall/brick_whitewashed/New(var/newloc)
	icon_state = null
	color = "#FCF2D8"
	..(newloc,"brick")

///////////////COLDWAR CONCRETE BLOCKS


/turf/simulated/wall/concrete_black
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "concreteblack-preview"
	color = null

/turf/simulated/wall/concrete_black/New(var/newloc)
	icon_state = "null"
	color = null
	..(newloc, "concreteblack")

/turf/simulated/wall/concrete_black_r
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "concreteblackr-preview"
	color = null

/turf/simulated/wall/concrete_black_r/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "concreteblackr")

/turf/simulated/wall/concrete_pink
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "concretepink-preview"
	color = null

/turf/simulated/wall/concrete_pink/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "concretepink")

/turf/simulated/wall/concrete_grey
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "concretegrey-preview"
	color = null

/turf/simulated/wall/concrete_grey/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "concretegrey")

/turf/simulated/wall/concrete_red
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "concretered-preview"
	color = null

/turf/simulated/wall/concrete_red/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "concretered")

/turf/simulated/wall/concrete_cian
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "concretecian-preview"
	color = null

/turf/simulated/wall/concrete_cian/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "concretecian")



//////////COLDWAR WOOD BLOCKS

/turf/simulated/wall/woodalt
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "woodalt_preview"
	color = null

/turf/simulated/wall/woodalt/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "rich wood")


//////////COLDWAR TENT BLOCKS

/turf/simulated/wall/tentcloth
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "concrete_preview"
	color = "#5E5C4E"

/turf/simulated/wall/tentcloth/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "tent cloth")


/turf/simulated/wall/tentcloth_black
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "concrete_preview"
	color = "#424242"

/turf/simulated/wall/tentcloth_black/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "tent cloth black")
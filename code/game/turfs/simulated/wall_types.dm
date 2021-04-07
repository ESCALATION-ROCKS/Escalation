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
	icon_state = "concrete_preview"
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


/turf/simulated/wall/tentcloth
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "concrete_preview"
	color = "#5E5C4E"

/turf/simulated/wall/tentcloth/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "tent cloth")

turf/simulated/wall/titanium
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "concrete_preview"
	color = "#D1E6E3"

/turf/simulated/wall/titanium/New(var/newloc)
	icon_state = null
	color = null
	..(newloc,"titanium")

/turf/simulated/wall/brick
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "brick_preview"
	color = "#732E24"

/turf/simulated/wall/brick/New(var/newloc)
	icon_state = null
	color = "#a13423"
	..(newloc, "brick")

/turf/simulated/wall/brick/white/New(var/newloc)
	icon_state = null
	color = "#fffdd0"
	..(newloc,"brick")

/turf/simulated/wall/concrete_black/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "concreteblack")

/turf/simulated/wall/concrete_black_r/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "concreteblack", "concreteblack")

/turf/simulated/wall/concrete_pink/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "concretepink")

/turf/simulated/wall/concrete_grey/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "concretegrey")

/turf/simulated/wall/concrete_red/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "concretered")

/turf/simulated/wall/concrete_cian/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "concretecian")

/turf/simulated/wall/woodalt
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "woodalt_preview"
	color = null

/turf/simulated/wall/woodalt/New(var/newloc)
	icon_state = null
	color = null
	..(newloc, "rich wood")

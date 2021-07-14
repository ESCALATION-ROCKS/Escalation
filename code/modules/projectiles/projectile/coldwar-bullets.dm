//Cold war stuff

//Rifle caliber
/obj/item/projectile/bullet/rifle/a762x39
	penetrating = 1
	penetration_modifier = 0.3
	embed = 1
	kill_count = 120
	agony = 20

/obj/item/projectile/bullet/rifle/a762x39/Initialize()
	damage = rand(32, 41)
	penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x39/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a762x39/ap
	penetration_modifier = 0.3

/obj/item/projectile/bullet/rifle/a762x51
	penetrating = 1
	penetration_modifier = 0.4
	embed = 1
	kill_count = 120
	agony = 20

/obj/item/projectile/bullet/rifle/a762x51/New()
	damage = rand(35, 44)
	penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x51/tr
	icon_state = "bullet_tracer"
	penetrating = 1
	penetration_modifier = 0.4
	embed = 1
	kill_count = 120
	agony = 20
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a762x51/tr/New()
	damage = rand(40, 50)
	penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x51/ap
	penetration_modifier = 0.4

/obj/item/projectile/bullet/rifle/a762x54
	penetrating = 1
	penetration_modifier = 0.4
	embed = 1
	kill_count = 120
	agony = 20

/obj/item/projectile/bullet/rifle/a762x54/New()
	damage = rand(37, 46)
	penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x54/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a762x54/ap
	penetration_modifier = 0.4

/obj/item/projectile/bullet/rifle/a762x53
	penetrating = 1
	penetration_modifier = 0.4
	embed = 1
	kill_count = 120
	agony = 20

/obj/item/projectile/bullet/rifle/a762x53/New()
	damage = rand(37, 46)
	penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x53/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a762x53/ap
	penetration_modifier = 0.4

/obj/item/projectile/bullet/rifle/a545x39
	penetration_modifier = 0.3
	embed = 1
	kill_count = 120
	agony = 20

/obj/item/projectile/bullet/rifle/a545x39/New()
	damage = rand(34,  38)
	penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a545x39/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a545x39/ap
	penetration_modifier = 0.2

/obj/item/projectile/bullet/rifle/a556x45
	penetration_modifier = 0.5 //slightly less energy than 545 but does more internal damage
	embed = 1
	kill_count = 120
	agony = 20

/obj/item/projectile/bullet/rifle/a556x45/New()
	damage = rand(30, 35)
	penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a556x45/tr
	icon_state = "bullet_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a556x45/ap
	penetration_modifier = 0.5

//Pistol caliber
/obj/item/projectile/bullet/rifle/a45
	penetration_modifier = 0.7 //does big internal organ damage if it penetrates
	agony = 50
	kill_count = 25

/obj/item/projectile/bullet/rifle/a45/New()
	damage = rand(28, 33)

/obj/item/projectile/bullet/rifle/a45/tr
	icon_state = "bullet_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a9x19
	penetration_modifier = 0.5 ///does big internal organ damage if penetrates
	agony = 46
	kill_count = 25

/obj/item/projectile/bullet/rifle/a9x19/New()
	damage = rand(23, 29)

/obj/item/projectile/bullet/rifle/a9x19/tr
	icon_state = "bullet_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a9x18
	penetration_modifier = 0.5 ///does big internal organ damage if penetrates
	agony = 42
	kill_count = 25

/obj/item/projectile/bullet/rifle/a9x18/New()
	damage = rand(21, 28)

/obj/item/projectile/bullet/rifle/a9x18/tr
	icon_state = "bullet_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a127x108mm
	penetration_modifier = 0.9 ///12mm shells gotta hurt
	agony = 80
	penetrating = 3
	kill_count = 250
	armor_penetration = 90
	armor_damage = 100

/obj/item/projectile/bullet/rifle/a127x108mm/New()
	damage = rand(46, 54)

/obj/item/projectile/bullet/rifle/a127x108mm/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a50cal
	penetration_modifier = 0.9 ///12mm shells gotta hurt
	agony = 80
	penetrating = 3
	kill_count = 250
	armor_penetration = 90
	armor_damage = 100

/obj/item/projectile/bullet/rifle/a50cal/New()
	damage = rand(48, 51)

/obj/item/projectile/bullet/rifle/a50cal/tr
	icon_state = "bullet_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

//////////Refer to bullets.dm pellet/ for balancing shot shells.
/obj/item/projectile/bullet/pellet/ga12 //Based on #00 load
	penetration_modifier = 0.6
	kill_count = 25
	agony = 40
	name = "#00 buckshot pellet"
	icon_state = "pellets" //TODO: would be nice to have it's own icon state
	pellets = 9		//number of pellets
	range_step = 2		//projectile will lose a fragment each time it travels this distance.
	base_spread = 98	//lower means the pellets spread more across body parts. If zero then this is considered a shrapnel explosion instead of a shrapnel cone
	spread_step = 2   //higher means the pellets spread more across body parts with distance
	//Pretty tight grouping and low range so armors actually fucking work against it. Solution is to aim for limbs

/obj/item/projectile/bullet/pellet/ga12/New()
	damage = rand(30, 45)

/obj/item/projectile/bullet/rifle/ga12/slug
	penetration_modifier = 0.3
	agony = 36
	kill_count = 60
	armor_penetration = 8 //low chance of going through
	armor_damage = 35

/obj/item/projectile/bullet/rifle/ga12/slug/New()
	damage = rand(25, 32)

/obj/item/projectile/bullet/rifle/ga12/flec //Very very tight grouping so its a rifle bullet
	icon_state = "bullet_flechette"
	penetration_modifier = 0.1
	agony = 36
	kill_count = 80
	armor_penetration = 75
	armor_damage = 65

/obj/item/projectile/bullet/rifle/ga12/flec/New()
	damage = rand(25, 28)

/obj/item/projectile/bullet/pellet/ga6
	penetration_modifier = 0.5
	kill_count = 20
	agony = 42
	name = "buckshot pellet"
	icon_state = "pellets"
	pellets = 9
	range_step = 2		//projectile will lose a fragment each time it travels this distance.
	base_spread = 98	//lower means the pellets spread more across body parts. If zero then this is considered a shrapnel explosion instead of a shrapnel cone
	spread_step = 2   //higher means the pellets spread more across body parts with distance
	//Pretty tight grouping and low range so armors actually fucking work against it. Solution is to aim for limbs
	armor_damage = 12

/obj/item/projectile/bullet/pellet/ga6/New()
	damage = rand(35, 50)

/obj/item/projectile/bullet/rifle/ga6/slug
	penetration_modifier = 0.3
	agony = 46
	kill_count = 50
	armor_penetration = 10 //low chance of going through
	armor_damage = 25

/obj/item/projectile/bullet/rifle/ga6/slug/New()
	damage = rand(27, 38)

/obj/item/projectile/bullet/rifle/ga6/flec //Very very tight grouping so its a rifle bullets
	icon_state = "bullet_flechette"
	penetration_modifier = 0.1
	agony = 28
	kill_count = 60
	armor_penetration = 65
	armor_damage = 65

/obj/item/projectile/bullet/rifle/ga6/flec/New()
	damage = rand(30, 35)

/obj/item/projectile/bullet/ags30x29mm
	name = "AGS' bullet"
	icon_state = "vog"
	agony = 80
	damage = 50
	penetrating = 0
	step_delay = 1.2
	kill_count = 60
	armor_penetration = 90
	armor_damage = 75

/obj/item/projectile/bullet/ags30x29mm/on_impact(var/atom/target, var/blocked = 0)
	explosion(target, 0, 1, 3, 3, 0)

/obj/item/projectile/bullet/mk19_40x53mm
	name = "MK19' bullet"
	icon_state = "vog"
	kill_count = 60
	penetrating = 0
	damage = 50
	agony = 80
	armor_penetration = 60
	armor_damage = 65

/obj/item/projectile/bullet/mk19_40x53mm/on_impact(var/atom/target, blocked = 0)
	explosion(target, 0, 1, 3, 3, 0)

/obj/item/projectile/bullet/rpgrocket
	name = "rpg rocket"
	icon_state = "rocket"
	damage = 0
	nodamage = 1
	penetrating = 0
	kill_count = 37
	step_delay = 0.90
	fire_sound = null//here we gonna use sound in AGS and not in bullets

	muzzle_type = /obj/effect/projectile/rocket/rpg
	breech_type = /obj/effect/projectile/rocket/rpg/breech

	//armor shouldn't block rpgs EVER
	armor_damage = 200
	armor_penetration = 200
	var/ricochetchance = 0

/obj/item/projectile/bullet/rpgrocket/muzzle_effect(var/matrix/T)
	if(silenced)
		return

	if(ispath(muzzle_type))
		var/obj/effect/projectile/M = new muzzle_type(get_turf(src))

		if(istype(M))
			M.set_transform(T)
			M.pixel_x = location.pixel_x
			M.pixel_y = location.pixel_y
			M.activate()

	if(ispath(breech_type))
		var/obj/effect/projectile/M1 = new breech_type(get_turf(src))

		if(istype(M1))
			M1.set_transform(T)
			M1.pixel_x = -location.pixel_x
			M1.pixel_y = -location.pixel_y
			M1.activate()

/obj/item/projectile/bullet/rpgrocket/on_impact(var/atom/target, var/blocked = 0)
	explosion(target, 1, 3, 5, 4)

/obj/item/projectile/bullet/rpgrocket/he
	penetrating = 0

/obj/item/projectile/bullet/rpgrocket/he/on_impact(var/atom/target, var/blocked = 0)
	explosion(target, 1, 3, 5, 4)

/obj/item/projectile/bullet/rpgrocket/thermobaric
	penetrating = 0

/obj/item/projectile/bullet/rpgrocket/thermobaric/on_impact(var/atom/target, var/blocked = 0)
	///doesnt work atm
	explosion(target, 0, 2, 2, 3)

/obj/item/projectile/bullet/rpgrocket/gustaf
	icon_state = "gustaf"

/obj/item/projectile/bullet/rpgrocket/finn
	icon_state = "finn"

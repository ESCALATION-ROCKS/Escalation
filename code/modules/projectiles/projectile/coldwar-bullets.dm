	//Cold war stuff

//Rifle caliber

/obj/item/projectile/bullet/rifle/a762x39
	penetrating = 1
	armor_penetration = 98 //was 23
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


/obj/item/projectile/bullet/rifle/a762x51
	penetrating = 1
	armor_penetration = 98 //was 34
	penetration_modifier = 0.4
	embed = 1
	kill_count = 120
	agony = 20

	New()
		damage = rand(35, 44)
		penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x51/tr
	icon_state = "bullet_tracer"
	penetrating = 1
	armor_penetration = 98 //was 34
	penetration_modifier = 0.4
	embed = 1
	agony = 20
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

	New()
		damage = rand(40, 50)
		penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x54
	penetrating = 1
	armor_penetration = 98 //was 31
	penetration_modifier = 0.4
	embed = 1
	kill_count = 120
	agony = 20

	New()
		damage = rand(37, 46)
		penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x54/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER


/obj/item/projectile/bullet/rifle/a762x53
	penetrating = 1
	armor_penetration = 98 //was 31
	penetration_modifier = 0.4
	embed = 1
	kill_count = 120
	agony = 20

	New()
		damage = rand(37, 46)
		penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a762x53/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a545x39
	armor_penetration = 98 //was 26
	penetration_modifier = 0.3
	embed = 1
	kill_count = 120
	agony = 20

	New()
		damage = rand(34,  38)
		penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a545x39/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER


/obj/item/projectile/bullet/rifle/a556x45
	armor_penetration = 98 //was 29
	penetration_modifier = 0.5 //slightly less energy than 545 but does more internal damage
	embed = 1
	kill_count = 120
	agony = 20

	New()
		damage = rand(30, 35)
		penetrating = rand(0, 1)

/obj/item/projectile/bullet/rifle/a556x45/tr
	icon_state = "bullet_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

//Pistol caliber


/obj/item/projectile/bullet/rifle/a45
	armor_penetration = -10 //was 4
	penetration_modifier = 0.7 //does big internal organ damage if it penetrates
	agony = 25
	kill_count = 25

	New()
		damage = rand(28, 33)

/obj/item/projectile/bullet/rifle/a45/tr
	icon_state = "bullet_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER


/obj/item/projectile/bullet/rifle/a9x19
	armor_penetration = 0 //was 12
	penetration_modifier = 0.5 ///does big internal organ damage if penetrates
	agony = 23
	kill_count = 25

	New()
		damage = rand(23, 29)

/obj/item/projectile/bullet/rifle/a9x19/tr
	icon_state = "bullet_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER


/obj/item/projectile/bullet/rifle/a9x18
	armor_penetration = -5 //was 8
	penetration_modifier = 0.5 ///does big internal organ damage if penetrates
	agony = 21
	kill_count = 25

	New()
		damage = rand(21, 28)


/obj/item/projectile/bullet/rifle/a9x18/tr
	icon_state = "bullet_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a127x108mm
//	fire_sound = 'sound/weapons/gunshot/heavy_mg/kord1.ogg'
	armor_penetration = 98 //was 54
	penetration_modifier = 0.9 ///12mm shells gotta hurt
	agony = 46
	penetrating = 3
	kill_count = 250

	New()
		damage = rand(46, 54)

/obj/item/projectile/bullet/rifle/a127x108mm/tr
	icon_state = "green_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER

/obj/item/projectile/bullet/rifle/a50cal
//	fire_sound = 'sound/weapons/gunshot/heavy_mg/kord1.ogg'
	armor_penetration = 98 //was 45
	penetration_modifier = 0.9 ///12mm shells gotta hurt
	agony = 42
	penetrating = 3
	kill_count = 250

	New()
		damage = rand(48, 51)

/obj/item/projectile/bullet/rifle/a50cal/tr
	icon_state = "bullet_tracer"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	layer = BEAM_PROJECTILE_LAYER



//////////Refer to bullets.dm pellet/ for balancing shot shells.

/obj/item/projectile/bullet/pellet/ga12 //Based on #00 load
	armor_penetration = -15 // - does jackshit against armor
	penetration_modifier = 0.6
	kill_count = 25
	agony = 20
	name = "#00 buckshot pellet"
	icon_state = "pellets" //TODO: would be nice to have it's own icon state
	pellets = 9		//number of pellets
	range_step = 2		//projectile will lose a fragment each time it travels this distance.
	base_spread = 98	//lower means the pellets spread more across body parts. If zero then this is considered a shrapnel explosion instead of a shrapnel cone
	spread_step = 2   //higher means the pellets spread more across body parts with distance
	//Pretty tight grouping and low range so armors actually fucking work against it. Solution is to aim for limbs

	New()
		damage = rand(30, 45)

/obj/item/projectile/bullet/rifle/ga12/slug
	armor_penetration = 15 //low chance of going through
	penetration_modifier = 0.3
	agony = 18
	kill_count = 60

	New()
		damage = rand(25, 32)

/obj/item/projectile/bullet/rifle/ga12/flec //Very very tight grouping so its a rifle bullet
	armor_penetration = 98 //was 20
	icon_state = "bullet_flechette"
	penetration_modifier = 0.1
	agony = 16
	kill_count = 80

	New()
		damage = rand(25, 28)

/obj/item/projectile/bullet/pellet/ga6
	armor_penetration = -10
	penetration_modifier = 0.5
	kill_count = 20
	agony = 21
	name = "buckshot pellet"
	icon_state = "pellets"
	pellets = 9
	range_step = 2		//projectile will lose a fragment each time it travels this distance.
	base_spread = 98	//lower means the pellets spread more across body parts. If zero then this is considered a shrapnel explosion instead of a shrapnel cone
	spread_step = 2   //higher means the pellets spread more across body parts with distance
	//Pretty tight grouping and low range so armors actually fucking work against it. Solution is to aim for limbs

	New()
		damage = rand(35, 50)

/obj/item/projectile/bullet/rifle/ga6/slug
	armor_penetration = 10 //low chance of going through
	penetration_modifier = 0.3
	agony = 23
	kill_count = 50

	New()
		damage = rand(27, 38)

/obj/item/projectile/bullet/rifle/ga6/flec //Very very tight grouping so its a rifle bullet
	armor_penetration = 98 //was 20
	icon_state = "bullet_flechette"
	penetration_modifier = 0.1
	agony = 18
	kill_count = 60

	New()
		damage = rand(30, 35)

/obj/item/projectile/bullet/ags30x29mm
	name = "AGS' bullet"
	icon_state = "vog"
	agony = 40
	armor_penetration = 98
	damage = 50
	penetrating = 0
	step_delay = 1.2
	kill_count = 60

/obj/item/projectile/bullet/ags30x29mm/on_impact(var/atom/target, var/blocked = 0)
	explosion(target, 0, 1, 3, 3, 0)

/obj/item/projectile/bullet/mk19_40x53mm
	name = "MK19' bullet"
	icon_state = "vog"
	damage = 50
	agony = 40
	kill_count = 60
	penetrating = 0

/obj/item/projectile/bullet/mk19_40x53mm/on_impact(var/atom/target, blocked = 0)
	explosion(target, 0, 1, 3, 3, 0)

/obj/item/projectile/bullet/rpgrocket
	name = "rpg rocket"
	icon_state = "rocket"
	damage = 0
	nodamage = 1
	step_delay = 1
	penetrating = 0
	kill_count = 40
	fire_sound = null//here we gonna use sound in AGS and not in bullets
	var/ricochetchance = 0

	muzzle_type = /obj/effect/projectile/rocket/rpg
	breech_type = /obj/effect/projectile/rocket/rpg/breech

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
	explosion(target, 1, 2, 3, 2)

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

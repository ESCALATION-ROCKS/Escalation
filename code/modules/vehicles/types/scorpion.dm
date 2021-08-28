
/obj/vehicles/t64_tank
	name = "T-64"
	desc = "The T-64 Main Battle Tank is equipped with a 125mm smoothbore gun loaded with HE shells and 7.62 mm PKMT coaxial machine firing 7.62mm AP rounds. This will present a great foe to any force."

	icon = 'code/modules/vehicles/types/T64.dmi'
	icon_state = "move"
	anchored = 1

	bound_height = 96
	bound_width = 96
	pixel_x = -72
	pixel_y = -100
	comp_prof = /datum/component_profile/scorpion

	ammo_containers = newlist(/obj/item/ammo_magazine/scorp_coax,/obj/item/ammo_magazine/scorp_shell)

	exposed_positions = list("driver" = 0,"passenger" = 5,"gunner" = 5)

	occupants = list(2,1)

	vehicle_size = ITEM_SIZE_VEHICLE_LARGE

	move_sound = 'sound/effects/boat_engine_1.wav'

	vehicle_view_modifier = 1.65

	light_color = "#E1FDFF"

	can_smoke = 1
	smoke_ammo = 10
	smoke_ammo_max = 10
	smoke_step_dist = 2
	smoke_delay = 1

	can_overrun_cover = 0

	min_speed = 13
	max_speed = 5
	acceleration = 4
	drag = 5

/obj/item/vehicle_component/health_manager/scorpion
	integrity = 1000
	resistances = list("bullet"=100,"energy"=85,"emp"=40,"bomb"=40)
	repair_materials = list("plasteel")

/datum/component_profile/scorpion
	pos_to_check = "gunner"
	gunner_weapons = list(/obj/item/weapon/gun/vehicle_turret/t64_turret)
	vital_components = newlist(/obj/item/vehicle_component/health_manager/scorpion)


/obj/item/weapon/gun/vehicle_turret/t64_turret
	name = "Main Cannon"
	desc = "A slow firing but devastatinly damaging cannon."
	w_class = 5
	one_hand_penalty = 5
	force = 15
	accuracy = 2.6
	fire_sound = 'sound/weapons/gunshot/rpg_fire.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.ogg'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.ogg'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.ogg'
	dist_shot_sound = 'sound/weapons/gunshot/dist/ak_dist.ogg'

	firemodes = list(
		list(mode_name="Main-Cannon", projectile_type=/obj/item/projectile/bullet/scorp_cannon, burst=1, fire_delay=3, move_delay=null, one_hand_penalty=4, burst_accuracy=null, dispersion=list(0.0, 0.1, 0.2), automatic = 0),
		list(mode_name="Coaxial-Machinegun", projectile_type=/obj/item/projectile/bullet/rifle/a762x54, burst=5, fire_delay=1.5, move_delay=2, one_hand_penalty=5, burst_accuracy=list(2,1,1), dispersion=list(0.1, 0.3, 0.4)),
		)

/datum/vehicle_gun/scorp_cannon
	name = "Main Cannon"
	desc = "A slow firing but devastatinly damaging cannon."
	burst_size = 1
	burst_delay = 1
	dispersion = list(0)
	fire_delay = 40
	fire_sound = 'sound/weapons/gunshot/rpg_fire.ogg'
	mag_used = /obj/item/ammo_magazine/scorp_shell

/datum/vehicle_gun/scorp_machinegun
	name = "Coaxial Machinegun"
	desc = "A short burst machinegun, used for anti-infantry purposes."
	burst_size = 10
	burst_delay = 1
	dispersion = list(0.55)
	fire_delay = 8
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	mag_used = /obj/item/ammo_magazine/scorp_coax

/obj/item/ammo_magazine/scorp_coax
	name = "Internal Co-axial Ammunition Storage"
	caliber = "762x54"
	max_ammo = 300
	ammo_type = /obj/item/ammo_casing/a762x54

/obj/item/ammo_magazine/scorp_shell
	name = "Internal Shell Rack"
	max_ammo = 30
	ammo_type = /obj/item/ammo_casing/scorp_round

/obj/item/ammo_casing/scorp_round
	name = "125mm Shell"
	caliber = "125mm Shell"
	projectile_type = /obj/item/projectile/bullet/scorp_cannon

/obj/item/projectile/bullet/scorp_cannon
	name = "125mm Shell"
	damage = 250
	damage_type = "bomb"
	damtype = "bomb"
	armor_penetration = 50
	icon_state = "rocket"

/obj/item/projectile/bullet/scorp_cannon/on_impact(var/atom/impacted)
	explosion(get_turf(impacted),0,1,3,5,guaranteed_damage = 50,guaranteed_damage_range = 2)
	. = ..()

/obj/item/projectile/bullet/scorp_cannon/attack_mob()
	damage_type = BRUTE
	damtype = BRUTE
	return ..()
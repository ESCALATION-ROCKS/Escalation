/datum/thermal_manager

	//Helpers to auto calculate thermal losses
	var/max_power 		= 0			//In Watts, maximum wattage this machine can ever consume/tick, this affects power consumption and leakage heating.
	var/expected_temp 	= 0			//In °C, the temperature we wish the machine to be able to reach and us only used to calculate the thermal loss factor.
	var/efficiency		= 1.0		//Limits how much power actually ends up heating the reagents, this is not ment to be a realistic value, adjust for gameplay.

	var/thermal_loss_factor = 0		//You can calculate this yourself but don't be a moron and just use compute_thermal_loss()

	//output values you can use optionally
	var/last_power_used	= 0
	var/last_power_transfered = 0
	var/last_power_lost	= 0
	//debug
	var/last_power_sum	= 0

/datum/thermal_manager/proc/compute_thermal_loss(var/P)
	if(thermal_loss_factor)
		return;
	expected_temp +=T0C
	thermal_loss_factor = (P*efficiency)/(expected_temp**4 - T20C**4)

/datum/thermal_manager/New()
	compute_thermal_loss(max_power)

/datum/thermal_manager/proc/get_thermal_loss(var/current_temp, var/env_temp = T20C)
	return (current_temp**4 - env_temp**4) * thermal_loss_factor

/datum/thermal_manager/proc/get_effective_power(var/current_temp, var/power, var/env_temp = T20C)

	var/P = power*efficiency
	var/R = get_thermal_loss(current_temp, env_temp)

	last_power_used = power
	last_power_transfered = P-R

	return last_power_transfered




// For the sake of keeping things sane and simple, loss is clamped.
/datum/thermal_manager/heater/get_effective_power(var/target_temp, var/power, var/env_temp = T20C)
	var/P = max(0,..(target_temp, power, env_temp))

	last_power_lost = power - P
	last_power_sum = P + last_power_lost
	return P

/datum/thermal_manager/cooler/New()
	compute_thermal_loss(-max_power)

// For the sake of keeping things sane and simple, loss is clamped.
/datum/thermal_manager/cooler/get_effective_power(var/target_temp, var/power, var/env_temp = T20C)
	var/P = min(0,..(target_temp, -power, env_temp))
	last_power_used *= -1
	last_power_lost = last_power_used - last_power_transfered
	last_power_sum  = last_power_lost
	return P

/datum/thermal_manager/heater/hotplate
	max_power		= 1000
	expected_temp	= 110
	efficiency		= 0.3  //333Watts of power on the beaker

/datum/thermal_manager/heater/lab_heater
	max_power		= 3000
	expected_temp	= 250
	efficiency		= 0.3

/datum/thermal_manager/cooler/lab_freezer
	max_power		= 300
	efficiency		= 2.0	//1Watt of power to move 2Watt of heat is the usual for refrigerators.
	expected_temp	= -40

/datum/thermal_manager/cooler/chiller
	max_power		= 145
	efficiency		= 2.0
	expected_temp	= -2
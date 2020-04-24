/datum/modifier/mutation


/datum/modifier/mutation/flimsy
	name = "flimsy"
	desc = "You're more fragile than most, and have less of an ability to endure harm."

	on_created_text = "<span class='warning'>You feel rather weak.</span>"
	on_expired_text = "<span class='notice'>You feel your strength returning to you.</span>"

	max_health_percent = 0.8

/datum/modifier/mutation/frail
	name = "frail"
	desc = "Your body is very fragile, and has even less of an ability to endure harm."

	on_created_text = "<span class='warning'>You feel really weak.</span>"
	on_expired_text = "<span class='notice'>You feel your strength returning to you.</span>"

	max_health_percent = 0.6

/datum/modifier/mutation/weak
	name = "weak"
	desc = "A lack of physical strength causes a diminshed capability in close quarters combat"

	outgoing_melee_damage_percent = 0.8

/datum/modifier/mutation/wimpy
	name = "wimpy"
	desc = "An extreme lack of physical strength causes greatly diminished capability in close quarters combat."

	outgoing_melee_damage_percent = 0.6

/datum/modifier/mutation/haemophilia
	name = "haemophilia"
	desc = "You bleed much faster than average."

	bleeding_rate_percent = 3.0

/datum/modifier/mutation/inaccurate
	name = "Inaccurate"
	desc = "You're rather inexperienced with guns, you've never used one in your life, or you're just really rusty.  \
	Regardless, you find it quite difficult to land shots where you wanted them to go."

	accuracy = -15
	accuracy_dispersion = 1

/datum/modifier/mutation/high_metabolism
	name = "High Metabolsim"
	desc = "Your body's metabolism is faster than average."

	metabolism_percent = 2.0
	incoming_healing_percent = 1.4

/datum/modifier/mutation/low_metabolism
	name = "Low Metabolism"
	desc = "Your body's metabolism is slower than average."

	metabolism_percent = 0.5
	incoming_healing_percent = 0.6

/datum/modifier/mutation/larger
	name = "Larger"
	desc = "Your body is larger than average."

	icon_scale_percent = 1.1

/datum/modifier/mutation/large
	name = "Large"
	desc = "Your body is a bit larger than average."

	icon_scale_percent = 1.05

/datum/modifier/mutation/small
	name = "Small"
	desc = "Your body is a bit smaller than average."

	icon_scale_percent = 0.95

/datum/modifier/mutation/smaller
	name = "Smaller"
	desc = "Your body is smaller than average."

	icon_scale_percent = 0.9

/datum/modifier/mutation/avianbone
	name = "Avian Bone Syndrome"
	desc = "Your bones are hollow."

/datum/modifier/mutation/thickbones
	name = "Thick Bones"
	desc = "Your bones are sturdier then a normal human has."

/datum/modifier/mutation/highadrenaline
	name = "Adrenaline High"
	desc = "Your body will secrete even more adrenaline in stress situations."

/datum/modifier/mutation/noadrenaline
	name = "No Adrenaline"
	desc = "For some reasons your adrenal glands can't secrete adrenaline as well as noradrenaline."

/datum/modifier/mutation/bethaemopoesis
	name = "Better Haemopoesis"
	desc = "Your wounds will salve more efficient and the blood will restore quickly."

/datum/modifier/mutation/lactose
	name = "Lactose Intolerance"
	desc = "Your own body is unable to digest a lactose-based products."

/datum/modifier/mutation/alcoholmet
	name = "Alcohol Metabolism"
	desc = "You are able to get the nutrients from alcohol."

/datum/modifier/trait/colorblind_taj
	name = "Colorblind - B+R"
	desc = "You are colorblind. You have a minor issue with blue colors and have difficulty recognizing them from red colors."

	client_color = MATRIX_Taj_Colorblind

/datum/modifier/trait/colorblind_vulp
	name = "Colorblind - G+R"
	desc = "You are colorblind. You have a severe issue with green colors and have difficulty recognizing them from red colors."

	client_color = MATRIX_Vulp_Colorblind

/datum/modifier/trait/colorblind_mono
	name = "Colorblind - Mono"
	desc = "You are colorblind. Your condition is rare, but you can see no colors at all."

	client_color = MATRIX_Monochromia
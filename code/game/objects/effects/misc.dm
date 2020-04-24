//The effect when you wrap a dead body in gift wrap
/obj/effect/spresent
	name = "strange present"
	desc = "It's a ... present?"
	icon = 'icons/obj/items.dmi'
	icon_state = "strangepresent"
	density = 1
	anchored = 0

/obj/effect/temporary_effect
	name = "self deleting effect"
	desc = "How are you examining what which cannot be seen?"
	icon = 'icons/effects/effects.dmi'
	invisibility = 0
	var/time_to_die = 10 SECONDS // Afer which, it will delete itself.

/obj/effect/temporary_effect/New()
	..()
	if(time_to_die)
		spawn(time_to_die)
			qdel(src)

/obj/effect/stop
	var/victim = null
	icon_state = "empty"
	name = "Geas"
	desc = "You can't resist."

/obj/effect/fireflies
	name = "fireflies"
	icon = 'icons/effects/effects.dmi'
	icon_state = "fireflies"
	opacity = 0
	anchored = 1
	mouse_opacity = 0

	New()
		set_light(0.2, 0.2, 3, 1, "#EEE8AA")

// The manifestation of Zeus's might. Or just a really unlucky day.
// This is purely a visual effect, this isn't the part of the code that hurts things.
/obj/effect/temporary_effect/lightning_strike
	name = "lightning"
	desc = "How <i>shocked</i> you must be, to see this text. You must have <i>lightning</i> reflexes. \
	The humor in this description is just so <i>electrifying</i>."
	icon = 'icons/effects/96x256.dmi'
	icon_state = "lightning_strike"
	plane = EFFECTS_ABOVE_LIGHTING_PLANE
	time_to_die = 1 SECOND
	pixel_x = -32

/obj/effect/temporary_effect/lightning_strike/Initialize()
	icon_state += "[rand(1,2)]" // To have two variants of lightning sprites.
	animate(src, alpha = 0, time = time_to_die - 1)
	. = ..()
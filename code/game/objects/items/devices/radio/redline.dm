var/global/list/army_internal_channels = list(
	num2text(PUB_FREQ) = list(),
	num2text(MIL_FREQ) = list()
)


var/global/list/med_internal_channels = list(
	num2text(PUB_FREQ) = list(),
	num2text(MED_FREQ) = list()
)

var/global/list/tech_internal_channels = list(
	num2text(PUB_FREQ) = list(),
	num2text(ENG_FREQ) = list()
)
/obj/item/device/radio/vpp/Initialize()
	..()
	internal_channels = army_internal_channels.Copy()

/obj/item/device/radio/medical/Initialize()
	..()
	internal_channels = med_internal_channels.Copy()

/obj/item/device/radio/tech/Initialize()
	..()
	internal_channels = tech_internal_channels.Copy()


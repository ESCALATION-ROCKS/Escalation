/datum/trader/ship/gunshop
	name = "Gun Shop Employee"
	name_language = TRADER_DEFAULT_NAME
	origin = "Gun Shop"
	possible_origins = list("Rooty Tootie's Point-n-Shooties", "Duncan Wu's Gun Show", "Bang-Bang Shop", "Wild-Wild-West Shop", "Jacobs", "Vladof", "Keleshnikov", "Hunting Depot", "Big Game Hunters")
	speech = list("hail_generic"    = "Hello hello! I hope you have your permit, oh who are we kidding, you're welcome anyways!",
				"hail_deny"         = "Law dictates that you can fuck off.",

				"trade_complete"    = "Thanks for buying your guns from ORIGIN!",
				"trade_blacklist"   = "We may deal in guns, but that doesn't mean we'll trade for illegal goods...",
				"trade_no_goods"    = "Cash for guns, thats the deal.",
				"trade_not_enough"  = "Guns are expensive! Give us more if you REALLY want it.",
				"how_much"          = "Well, I'd love to give this little beauty to you for VALUE.",

				"compliment_deny"   = "If we were in the same room right now, I'd probably punch you.",
				"compliment_accept" = "Ha! Good one!",
				"insult_good"       = "I expected better from you. I suppose in that, I was wrong.",
				"insult_bad"        = "If I had my gun I'd shoot you!"
				)

	possible_trading_items = list(/obj/item/weapon/gun/projectile/automatic/smg/mpistol    = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/automatic/smg/fourty    = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/automatic/ar/redline    = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/pistol/guardian    = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/pistol/deputy    = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/rifle/boltaction    = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/rifle/    = TRADER_THIS_TYPE,
								/obj/item/weapon/storage/box/shotgunammo	= TRADER_THIS_TYPE,
								/obj/item/weapon/storage/box/shotgunshells	= TRADER_THIS_TYPE,
								/obj/item/ammo_magazine/box/paper			= TRADER_SUBTYPES_ONLY,
								/obj/item/weapon/storage/fancy/ammo_can 	= TRADER_SUBTYPES_ONLY,
								/obj/item/clothing/accessory/holster        = TRADER_ALL)

	possible_wanted_items = list(/obj/item/weapon/gun/projectile/automatic/smg/mpistol    = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/automatic/smg/fourty    = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/automatic/ar/redline    = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/pistol/guardian    = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/pistol/deputy    = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/rifle/boltaction    = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/rifle/    = TRADER_THIS_TYPE)
/*
/datum/trader/ship/egunshop
	name = "Energy Gun Shop Employee"
	name_language = TRADER_DEFAULT_NAME
	origin = "EGun Shop"
	possible_origins = list("The Emperor's Lasgun Shop", "Hypireon", "Milawan", "Future-Guns", "Solar-Army")
	speech = list("hail_generic"    = "Welcome to the future of warfare! ORIGIN, your one-stop-shop for energy weaponry.",
				"hail_deny"         = "I'm sorry, your communication channel has been blacklisted.",

				"trade_complete"    = "Thank you, your purchase has been logged and you have automatically liked our Spacebook page.",
				"trade_blacklist"   = "I'm sorry, is that a joke?",
				"trade_no_goods"    = "We deal in cash.",
				"trade_not_enough"  = "State of the art weaponry costs more than that.",
				"how_much"          = "All our quality weapons are priceless, but I'd give that to you for VALUE.",

				"compliment_deny"   = "If I was dumber I probably would have believed you.",
				"compliment_accept" = "Yes, I am very smart.",
				"insult_good"       = "Energy weapons are TWICE the gun bullet-based guns are!",
				"insult_bad"        = "Thats... very mean. I won't think twice about blacklisting your channel, so stop."
				)

	possible_trading_items = list(/obj/item/weapon/gun/energy/taser                      = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/energy/stunrevolver                 = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/energy/xray                         = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/energy/laser                        = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/energy/gun                          = TRADER_THIS_TYPE,
								/obj/item/weapon/cell                                    = TRADER_THIS_TYPE,
								/obj/item/weapon/cell/crap                               = TRADER_THIS_TYPE,
								/obj/item/weapon/cell/high                               = TRADER_THIS_TYPE,
								/obj/item/weapon/cell/super                              = TRADER_THIS_TYPE,
								/obj/item/weapon/cell/hyper                              = TRADER_THIS_TYPE,
								/obj/item/clothing/accessory/holster                     = TRADER_ALL)

/datum/trader/dogan
	name = "Dogan"
	origin = "Dogan's Gun Beacon"
	speech = list("hail_generic"    = "Hello! This is an automatic recording of me, Mr. Dogan! I hope you like the... GUNS... I've got in store for you today.",
				"hail_deny"         = "I formally welcome you to... NOT... visit our store!",

				"trade_complete"    = "Thank you for... PURCHASING... that quality... ITEM... from me!",
				"trade_blacklist"   = "Thank you for... that quality... ILLEGAL OFFER THAT I WILL REFUSE... from me!",
				"trade_no_goods"    = "Thank you for... that quality... OFFER THAT ISNT MONEY THAT I WILL REFUSE... from me!",
				"trade_not_enough"  = "Thank you for... that quality... OFFER THAT IS NOT ENOUGH... from me!",
				"how_much"          = "Thank you for... ASKING ME ABOUT MY PRICES... that quality... ITEM IS WORTH VALUE... from me!",

				"compliment_deny"   = "Thank you for... that quality... COMPLIMENT... from me!",
				"compliment_accept" = "Thank you for... that quality... COMPLIMENT... from me!",
				"insult_good"       = "Thank you for... that quality... INSULT... from me!",
				"insult_bad"        = "Thank you for... that quality... INSULT... from me!"
				)
	compliment_increase = 0
	insult_drop = 0

	possible_trading_items = list(/obj/item/weapon/gun/projectile/pirate                = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/pistol/sec/MK           = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/silenced/cheap          = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/heavysniper/ant         = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/energy/laser/dogan                 = TRADER_THIS_TYPE,
								/obj/item/weapon/gun/projectile/automatic/mini_uzi/usi  = TRADER_THIS_TYPE,
								/obj/item/clothing/accessory/holster                    = TRADER_ALL)
*/
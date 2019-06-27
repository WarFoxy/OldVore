/datum/supply_pack/randomised/misc/lavalamps
	num_contained = 10
	contains = list(
			/obj/item/device/flashlight/lamp/lava/red,
			/obj/item/device/flashlight/lamp/lava/blue,
			/obj/item/device/flashlight/lamp/lava/cyan,
			/obj/item/device/flashlight/lamp/lava/green,
			/obj/item/device/flashlight/lamp/lava/orange,
			/obj/item/device/flashlight/lamp/lava/purple,
			/obj/item/device/flashlight/lamp/lava/pink
			)
	name = "LavaLamps crate"
	cost = 15
	containertype = /obj/structure/closet/crate
	containername = "LavaLamps crate"

/datum/supply_pack/med/biohazard
	name = "Toxin create"
	contains = list(
			/obj/item/weapon/reagent_containers/glass/beaker/carpotoxin = 2,
			/obj/item/weapon/reagent_containers/glass/beaker/spidertoxin = 2
			)
	cost = 80
	contraband = 1
	containertype = /obj/structure/closet/crate/medical
	containername = "Toxin create"
/obj/item/weapon/rig/haydee
	name = "haydee control module"
	suit_type = "haydee"
	desc = "An advanced nanosuit that protects against hazardous, low pressure environments. Shines with a high polish."
	icon = 'updates/warfoxy/haydee/backitem.dmi'
	mob_icon  = 'updates/warfoxy/haydee/back.dmi'
	icon_state = "haydee"
	w_class = ITEMSIZE_TINY
	armor = list(melee = 15, bullet = 15, laser = 15,energy = 15, bomb = 0, bio = 100, rad = 100)
	slowdown = 0
	offline_slowdown = 0
	offline_vision_restriction = 0
	siemens_coefficient= 0.75
	rigsuit_max_pressure = 20 * ONE_ATMOSPHERE			  // Max pressure the rig protects against when sealed
	rigsuit_min_pressure = 0							  // Min pressure the rig protects against when sealed

	helm_type = /obj/item/clothing/head/helmet/space/rig/haydee
	chest_type = /obj/item/clothing/suit/space/haydee
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/haydee
	boot_type =  /obj/item/clothing/shoes/haydee

	allowed = list(
		/obj/item/device/suit_cooling_unit,
		/obj/item/weapon/storage/backpack
		)

	req_access = list()
	req_one_access = list()
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	icon_override = 'updates/warfoxy/haydee/back.dmi'

/obj/item/clothing/head/helmet/space/rig/haydee
	name = "haydee helmet"
	icon = 'updates/warfoxy/haydee/helmitem.dmi'
	camera_networks = list()
	icon_override = 'updates/warfoxy/haydee/helm.dmi'

/obj/item/clothing/suit/space/haydee
	name = "haydee"
	slowdown = 0
	flags_inv = HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER //HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER
	icon = 'updates/warfoxy/haydee/chestitem.dmi'
	icon_override = 'updates/warfoxy/haydee/chest.dmi'

/obj/item/clothing/gloves/gauntlets/rig/haydee
	name = "haydee gauntlets"
	icon = 'updates/warfoxy/haydee/gloveitem.dmi'
	siemens_coefficient = 0
	icon_override = 'updates/warfoxy/haydee/glove.dmi'

/obj/item/clothing/shoes/haydee
	name = "haydee shoes"
	icon = 'updates/warfoxy/haydee/bootitem.dmi'
	icon_override = 'updates/warfoxy/haydee/boot.dmi'


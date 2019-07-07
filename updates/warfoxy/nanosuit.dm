/obj/item/weapon/rig/nanosuit
	name = "nanosuit control module"
	suit_type = "nanosuit"
	desc = "An advanced nanosuit that protects against hazardous, low pressure environments. Shines with a high polish."
	icon = 'updates/warfoxy/nanosuit/backitem.dmi'
	mob_icon  = 'updates/warfoxy/nanosuit/back.dmi'
	icon_state = "nanosuit"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 100, rad = 100)
	slowdown = 0
	offline_slowdown = 0
	offline_vision_restriction = 0
	siemens_coefficient= 0.75
	rigsuit_max_pressure = 20 * ONE_ATMOSPHERE			  // Max pressure the rig protects against when sealed
	rigsuit_min_pressure = 0							  // Min pressure the rig protects against when sealed

	helm_type = /obj/item/clothing/head/helmet/space/rig/nanosuit
	chest_type = /obj/item/clothing/suit/space/nanosuit
	glove_type = /obj/item/clothing/gloves/gauntlets/rig/nanosuit
	boot_type =  /obj/item/clothing/shoes/nanosuit
	air_type = null

	allowed = list(
		/obj/item/device/suit_cooling_unit,
		/obj/item/weapon/storage/backpack
		)

	req_access = list()
	req_one_access = list()
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	icon_override = 'updates/warfoxy/nanosuit/back.dmi'

/obj/item/clothing/head/helmet/space/rig/nanosuit
	name = "nanosuit helmet"
	icon = 'updates/warfoxy/nanosuit/helmitem.dmi'
	camera_networks = list()
	icon_override = 'updates/warfoxy/nanosuit/helm.dmi'

/obj/item/clothing/suit/space/nanosuit
	name = "nanosuit"
	slowdown = 0
	flags_inv = null //HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL|HIDETIE|HIDEHOLSTER
	icon = 'updates/warfoxy/nanosuit/chestitem.dmi'
	icon_override = 'updates/warfoxy/nanosuit/chest.dmi'

/obj/item/clothing/gloves/gauntlets/rig/nanosuit
	name = "nanosuit gauntlets"
	icon = 'updates/warfoxy/nanosuit/gloveitem.dmi'
	siemens_coefficient = 0
	icon_override = 'updates/warfoxy/nanosuit/glove.dmi'

/obj/item/clothing/shoes/nanosuit
	name = "nanosuit shoes"
	icon = 'updates/warfoxy/nanosuit/bootitem.dmi'
	icon_override = 'updates/warfoxy/nanosuit/boot.dmi'

/obj/item/clothing/suit/space/nanosuit/verb/setalpha(A as num)
	set name = "Set suit transparency"
	set desc = "Set suit transparency"
	set category = "Hardsuit"
	set src = usr.contents
	src.alpha = A
	src.update_icon()
	usr.update_icon()
	usr.update_inv_wear_suit()

/obj/item/clothing/suit/space/nanosuit/verb/setcolor(A as text)
	set name = "Set suit color"
	set desc = "Set suit color"
	set category = "Hardsuit"
	set src = usr.contents
	src.icon_state = "nanosuit_sealed_color"
	src.color = A
	src.update_icon()
	usr.update_icon()
	usr.update_inv_wear_suit()

/obj/item/clothing/suit/space/nanosuit/verb/setmode(A as num)
	set name = "Set suit mode"
	set desc = "Set suit mode"
	set category = "Hardsuit"
	set src = usr.contents
	src.icon_state = "nanosuit_sealed_[A]"
	src.update_icon()
	usr.update_icon()
	usr.update_inv_wear_suit()

/obj/item/clothing/head/helmet/space/rig/nanosuit/verb/setmode(A as num)
	set name = "Set helmet mode"
	set desc = "Set helmet mode"
	set category = "Hardsuit"
	set src = usr.contents
	src.icon_state = "nanosuit_sealed_[A]"
	src.update_icon()
	usr.update_icon()
	usr.update_inv_head()
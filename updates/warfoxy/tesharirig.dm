/obj/item/weapon/rig/resomi
    name = "Resomi hazard environment protection"
    desc = "Very rare and advanced hardsuit with exoskeleton-servomotor complex, aimed at preserving the life of the operator during battles or emergency at any costs. This one seems to be the one of the old versions without energy shield protection, nanobot repair system and AR-compatibility."
    suit_type = "Nansi (Defender)"
    icon = 'updates/warfoxy/tesharirig/backitem.dmi'
    mob_icon  = 'updates/warfoxy/tesharirig/back.dmi'
    icon_state = "resomi_rig"
    icon_override = 'updates/warfoxy/tesharirig/back.dmi'
    armor = list(melee = 80, bullet = 70, laser = 60, energy = 45, bomb = 80, bio = 100, rad = 60)
    offline_slowdown = 4
    offline_vision_restriction = TINT_HEAVY

    allowed = list(/obj/item/device/flashlight, /obj/item/weapon/tank, /obj/item/ammo_magazine, /obj/item/ammo_casing, /obj/item/weapon/handcuffs, /obj/item/weapon/rcd, /obj/item/weapon/storage/briefcase/inflatable, /obj/item/weapon/melee/baton, /obj/item/weapon/gun, /obj/item/weapon/storage/firstaid, /obj/item/weapon/reagent_containers/hypospray, /obj/item/weapon/storage/belt/utility, /obj/item/device/suit_cooling_unit)

    chest_type = /obj/item/clothing/suit/space/rig/resomi
    helm_type = /obj/item/clothing/head/helmet/space/rig/resomi
    boot_type = /obj/item/clothing/shoes/magboots/rig/resomi
    glove_type = /obj/item/clothing/gloves/rig/resomi

/obj/item/clothing/head/helmet/space/rig/resomi
	icon = 'updates/warfoxy/tesharirig/helmitem.dmi'
	camera_networks = list()
	icon_override = 'updates/warfoxy/tesharirig/helm.dmi'

/obj/item/clothing/suit/space/rig/resomi
	icon = 'updates/warfoxy/tesharirig/chestitem.dmi'
	icon_override = 'updates/warfoxy/tesharirig/chest.dmi'

/obj/item/clothing/gloves/rig/resomi
	icon = 'updates/warfoxy/tesharirig/gloveitem.dmi'
	icon_override = 'updates/warfoxy/tesharirig/glove.dmi'

/obj/item/clothing/shoes/magboots/rig/resomi
	icon = 'updates/warfoxy/tesharirig/bootitem.dmi'
	icon_override = 'updates/warfoxy/tesharirig/boot.dmi'
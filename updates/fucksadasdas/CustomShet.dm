//Fuck this Shet
/obj/item/clothing/suit/space/void/engineering/seromi
	name = "Specially refitted teshari voidsuit"
	desc = "The best choice if you are 11 years old and you like pink color"

	icon = 'updates/fucksadasdas/Bled_Fuck_CustomShet_Icone.dmi'
	icon_state = "rig-engineering-seromi-item"

	icon_override = 'updates/fucksadasdas/Bled_Fuck_CustomShet_Icone.dmi'
	item_state = "rig-engineering-seromi"

	species_restricted = list(SPECIES_TESHARI)
	w_class = 4
	slowdown = 0

/obj/item/clothing/head/helmet/space/void/engineering/seromi
	name = "Specially refitted teshari voidsuit helmet"
	desc = "The best choice if you are 11 years old and you like pink color"

	icon = 'updates/fucksadasdas/Bled_Fuck_CustomShet_Icone.dmi'
	icon_state = "rig0-engineering-seromi-item"

	icon_override = 'updates/fucksadasdas/Bled_Fuck_CustomShet_Icone.dmi'
	item_state = "rig0-engineering-seromi"

	species_restricted = list(SPECIES_TESHARI)

/obj/item/clothing/mask/bandana/red/seromi
	icon = 'updates/fucksadasdas/Bled_Fuck_CustomShet_Icone.dmi'
	icon_state = "bandred-item"

	icon_override = 'updates/fucksadasdas/Bled_Fuck_CustomShet_Icone.dmi'
	item_state = "bandred"

/obj/item/clothing/mask/bandana/blue/seromi
	icon = 'updates/fucksadasdas/Bled_Fuck_CustomShet_Icone.dmi'
	icon_state = "bandblue-item"

	icon_override = 'updates/fucksadasdas/Bled_Fuck_CustomShet_Icone.dmi'
	item_state = "bandblue"

/obj/item/clothing/mask/bandana/green/seromi
	icon = 'updates/fucksadasdas/Bled_Fuck_CustomShet_Icone.dmi'
	icon_state = "bandgreen-item"

	icon_override = 'updates/fucksadasdas/Bled_Fuck_CustomShet_Icone.dmi'
	item_state = "bandgreen"

/obj/item/weapon/gun/energy/kinetic_accelerator/adv
	name = "armed proto-kinetic accelerator"
	desc = "A self recharging, ranged mining tool that does increased damage in low temperature. Capable of holding up to six slots worth of mod kits."
	origin_tech = list(TECH_COMBAT = 5, TECH_POWER = 4, TECH_ENGINEERING = 3)
	can_flashlight = TRUE
	flight_x_offset = 15
	flight_y_offset = 9
	charge_cost = 60 // 40 shots on weapon power cell
	fire_delay = 8
	max_mod_capacity = 300

/obj/machinery/mineral/equipment_vendor/i_hate_this_place
	name = "amproved  mining equipment vendor"
	icon = 'updates/fucksadasdas/Bled_Fuck_CustomShet_Icone.dmi'
	icon_state = "mining"
	prize_list = list(
		new /datum/data/mining_equipment("1 Marker Beacon",				/obj/item/stack/marker_beacon,										10),
		new /datum/data/mining_equipment("10 Marker Beacons",			/obj/item/stack/marker_beacon/ten,									100),
		new /datum/data/mining_equipment("30 Marker Beacons",			/obj/item/stack/marker_beacon/thirty,								300),
		new /datum/data/mining_equipment("Whiskey",						/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey,		125),
		new /datum/data/mining_equipment("Absinthe",					/obj/item/weapon/reagent_containers/food/drinks/bottle/absinthe,	125),
		new /datum/data/mining_equipment("Cigar",						/obj/item/clothing/mask/smokable/cigarette/cigar/havana,			150),
		new /datum/data/mining_equipment("Soap",						/obj/item/weapon/soap/nanotrasen,									200),
		new /datum/data/mining_equipment("Laser Pointer",				/obj/item/device/laser_pointer,										900),
		new /datum/data/mining_equipment("Geiger Counter",				/obj/item/device/geiger,											750),
		new /datum/data/mining_equipment("Plush Toy",					/obj/random/plushie,												300),
		new /datum/data/mining_equipment("GPS Device",					/obj/item/device/gps/mining,										100),
		// TODO new /datum/data/mining_equipment("Advanced Scanner",	/obj/item/device/t_scanner/adv_mining_scanner,						800),
		new /datum/data/mining_equipment("Fulton Beacon",				/obj/item/fulton_core,												500),
		new /datum/data/mining_equipment("Shelter Capsule",				/obj/item/device/survivalcapsule,									500),
		// TODO new /datum/data/mining_equipment("Explorer's Webbing",	/obj/item/storage/belt/mining,										500),
		new /datum/data/mining_equipment("Umbrella",					/obj/item/weapon/melee/umbrella/random,								200),
		new /datum/data/mining_equipment("Point Transfer Card",			/obj/item/weapon/card/mining_point_card,							500),
		new /datum/data/mining_equipment("Survival Medipen",			/obj/item/weapon/reagent_containers/hypospray/autoinjector/miner,	500),
		new /datum/data/mining_equipment("Mini-Translocator",			/obj/item/device/perfect_tele/one_beacon,							1200),
		// new /datum/data/mining_equipment("Kinetic Crusher",			/obj/item/twohanded/required/kinetic_crusher,						750),
		new /datum/data/mining_equipment("Kinetic Accelerator",			/obj/item/weapon/gun/energy/kinetic_accelerator,					900),
		new /datum/data/mining_equipment("Kinetic Accelerator Armed",			/obj/item/weapon/gun/energy/kinetic_accelerator/adv,		5000),
		new /datum/data/mining_equipment("Resonator",					/obj/item/resonator,												900),
		new /datum/data/mining_equipment("Fulton Pack",					/obj/item/extraction_pack,											1200),
		new /datum/data/mining_equipment("Silver Pickaxe",				/obj/item/weapon/pickaxe/silver,									1200),
		//new /datum/data/mining_equipment("Mining Conscription Kit",	/obj/item/storage/backpack/duffelbag/mining_conscript,				1000),
		new /datum/data/mining_equipment("Space Cash",					/obj/item/weapon/spacecash/c1000,									3000),
		new /datum/data/mining_equipment("Industrial Hardsuit - Control Module",	/obj/item/weapon/rig/industrial,						2000),
		new /datum/data/mining_equipment("Industrial Hardsuit - Plasma Cutter",		/obj/item/rig_module/device/plasmacutter,				800),
		new /datum/data/mining_equipment("Industrial Hardsuit - Drill",				/obj/item/rig_module/device/drill,						2000),
		new /datum/data/mining_equipment("Industrial Hardsuit - Ore Scanner",		/obj/item/rig_module/device/orescanner,					1000),
		new /datum/data/mining_equipment("Industrial Hardsuit - Material Scanner",	/obj/item/rig_module/vision/material,					500),
		new /datum/data/mining_equipment("Industrial Hardsuit - Maneuvering Jets",	/obj/item/rig_module/maneuvering_jets,					1250),
		new /datum/data/mining_equipment("Industrial Hardsuit - Miners Scanner",	/obj/item/rig_module/vision/mining,						700),
		new /datum/data/mining_equipment("Hardsuit - Intelligence Storage",	/obj/item/rig_module/ai_container,								2500),
		new /datum/data/mining_equipment("Hardsuit - Smoke Bomb Deployer",	/obj/item/rig_module/grenade_launcher/smoke,					2000),
		new /datum/data/mining_equipment("Industrial Equipment - Phoron Bore",	/obj/item/weapon/gun/magnetic/matfed,					3000),
		new /datum/data/mining_equipment("Industrial Equipment - Sheet-Snatcher",/obj/item/weapon/storage/bag/sheetsnatcher,					500),
		new /datum/data/mining_equipment("Digital Tablet - Standard",	/obj/item/modular_computer/tablet/preset/custom_loadout/standard,	500),
		new /datum/data/mining_equipment("Digital Tablet - Advanced",	/obj/item/modular_computer/tablet/preset/custom_loadout/advanced,	1000),
		new /datum/data/mining_equipment("Diamond Pickaxe",				/obj/item/weapon/pickaxe/diamond,									2000),
		new /datum/data/mining_equipment("Super Resonator",				/obj/item/resonator/upgraded,										2500),
		new /datum/data/mining_equipment("Jump Boots",					/obj/item/clothing/shoes/bhop,										2500),
		new /datum/data/mining_equipment("Luxury Shelter Capsule",		/obj/item/device/survivalcapsule/luxury,							3100),
		new /datum/data/mining_equipment("KA White Tracer Rounds",		/obj/item/borg/upgrade/modkit/tracer,								125),
		new /datum/data/mining_equipment("KA Adjustable Tracer Rounds",	/obj/item/borg/upgrade/modkit/tracer/adjustable,					175),
		new /datum/data/mining_equipment("KA Super Chassis",			/obj/item/borg/upgrade/modkit/chassis_mod,							250),
		new /datum/data/mining_equipment("KA Hyper Chassis",			/obj/item/borg/upgrade/modkit/chassis_mod/orange,					300),
		new /datum/data/mining_equipment("KA Range Increase",			/obj/item/borg/upgrade/modkit/range,								1000),
		new /datum/data/mining_equipment("KA Damage Increase",			/obj/item/borg/upgrade/modkit/damage,								1000),
		new /datum/data/mining_equipment("KA Efficiency Increase",		/obj/item/borg/upgrade/modkit/efficiency,							1200),
		new /datum/data/mining_equipment("KA AoE Damage",				/obj/item/borg/upgrade/modkit/aoe/mobs,								2000),
		new /datum/data/mining_equipment("KA AoE Damage Advanced",		/obj/item/borg/upgrade/modkit/aoe/turfs,							2500),
		new /datum/data/mining_equipment("KA AoE Damage Improved",		/obj/item/borg/upgrade/modkit/aoe/turfs/andmobs,					3000),
		new /datum/data/mining_equipment("KA Pressure Regulator",		/obj/item/borg/upgrade/modkit/indoors,								7000),
		new /datum/data/mining_equipment("KA Holster",				/obj/item/clothing/accessory/holster/waist/kinetic_accelerator,			350),
		new /datum/data/mining_equipment("Fine Excavation Kit - Chisels",/obj/item/weapon/storage/excavation,								500),
		new /datum/data/mining_equipment("Fine Excavation Kit - Measuring Tape",/obj/item/device/measuring_tape,							125),
		new /datum/data/mining_equipment("Fine Excavation Kit - Hand Pick",/obj/item/weapon/pickaxe/hand,									375),
		new /datum/data/mining_equipment("Explosive Excavation Kit - Plastic Charge",/obj/item/weapon/plastique/seismic,					750),
		new /datum/data/mining_equipment("Injector (L) - Glucose",/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/glucose,	450),
		new /datum/data/mining_equipment("Injector (L) - Panacea",/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/purity,	500),
		new /datum/data/mining_equipment("Injector (L) - Trauma",/obj/item/weapon/reagent_containers/hypospray/autoinjector/biginjector/brute,	500),
		new /datum/data/mining_equipment("Nanopaste Tube",				/obj/item/stack/nanopaste,											1000),
		new /datum/data/mining_equipment("Misc: Graviton Visor",		/obj/item/clothing/glasses/graviton,								1500),
		new /datum/data/mining_equipment("Defense Equipment - Phase Pistol",/obj/item/weapon/gun/energy/phasegun/pistol,					400),
		new /datum/data/mining_equipment("Defense Equipment - Smoke Bomb",/obj/item/weapon/grenade/smokebomb,								100),
		new /datum/data/mining_equipment("Defense Equipment - Razor Drone Deployer",/obj/item/weapon/grenade/spawnergrenade/manhacks/station,	1000),
		new /datum/data/mining_equipment("Defense Equipment - Sentry Drone Deployer",/obj/item/weapon/grenade/spawnergrenade/ward,			1500),
		new /datum/data/mining_equipment("Defense Equipment - Steel Machete",	/obj/item/weapon/material/knife/machete,					500),
		new /datum/data/mining_equipment("Fishing Net",					/obj/item/weapon/material/fishing_net,								500),
		new /datum/data/mining_equipment("Titanium Fishing Rod",		/obj/item/weapon/material/fishing_rod/modern,						1000),
		new /datum/data/mining_equipment("Durasteel Fishing Rod",		/obj/item/weapon/material/fishing_rod/modern/strong,				7500)
		)

/obj/item/weapon/gun/energy/frontier/locked/netgun
	name = "frontier energy net gun"
	desc = "Two drunk designer engineers gathered like that and argued over a bottle of vodka who could make the most powerful laser. The man won with this gun."
	mode_name = "stun"
	fire_sound = 'sound/weapons/eluger.ogg'
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 5, TECH_MAGNET = 5)
	projectile_type = /obj/item/projectile/beam/stun/blue
	charge_cost = 240
	fire_delay = 5

	firemodes = list(
		list(mode_name="stun", projectile_type=/obj/item/projectile/beam/stun/blue, fire_sound='sound/weapons/Taser.ogg', charge_cost=240, fire_delay=5),
		list(mode_name="capture", projectile_type=/obj/item/projectile/beam/energy_net, fire_sound = 'sound/weapons/eluger.ogg', charge_cost=800, fire_delay=32)
	)

/obj/machinery/equipment_vendor/exploration/i_hate_this_place
	name = "exploration equipment vendor"
	desc = "An equipment vendor for explorers, points collected with cataloguers can be spent here."
	icon = 'icons/obj/machines/mining_machines_vr.dmi'
	icon_state = "exploration"
	prize_list = list(
		new /datum/data/exploration_equipment("1 Marker Beacon",			/obj/item/stack/marker_beacon,										1),
		new /datum/data/exploration_equipment("10 Marker Beacons",			/obj/item/stack/marker_beacon/ten,									10),
		new /datum/data/exploration_equipment("30 Marker Beacons",			/obj/item/stack/marker_beacon/thirty,								30),
		new /datum/data/exploration_equipment("GPS Device",					/obj/item/device/gps/explorer,										5),
		new /datum/data/exploration_equipment("Whiskey",					/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey,		5),
		new /datum/data/exploration_equipment("Absinthe",					/obj/item/weapon/reagent_containers/food/drinks/bottle/absinthe,	5),
		new /datum/data/exploration_equipment("Cigar",						/obj/item/clothing/mask/smokable/cigarette/cigar/havana,			10),
		new /datum/data/exploration_equipment("Soap",						/obj/item/weapon/soap/nanotrasen,									10),
		new /datum/data/exploration_equipment("Laser Pointer",				/obj/item/device/laser_pointer,										10),
		new /datum/data/exploration_equipment("Plush Toy",					/obj/random/plushie,												10),
		new /datum/data/exploration_equipment("Shelter Capsule",			/obj/item/device/survivalcapsule,									50),
		new /datum/data/exploration_equipment("Point Transfer Card",		/obj/item/weapon/card/exploration_point_card,						20),
		new /datum/data/exploration_equipment("Survival Medipen",			/obj/item/weapon/reagent_containers/hypospray/autoinjector/miner,	15),
		new /datum/data/exploration_equipment("Underground Glasses",		/obj/item/clothing/glasses/graviton,								75),
		new /datum/data/exploration_equipment("Mini-Translocator",			/obj/item/device/perfect_tele/one_beacon,							80),
		new /datum/data/exploration_equipment("Space Cash",					/obj/item/weapon/spacecash/c1000,									100),
		new /datum/data/exploration_equipment("NET Gun",					/obj/item/weapon/gun/energy/frontier/locked/netgun,					300),
		new /datum/data/exploration_equipment("Jump Boots",					/obj/item/clothing/shoes/bhop,										150),
		new /datum/data/exploration_equipment("Luxury Shelter Capsule",		/obj/item/device/survivalcapsule/luxury,							150)
		)
///////////////
///FALLOUT13///
///////////////
/obj/item/clothing/under/f13
	icon = 'updates/fluff/ruvorefluff.dmi'
	sprite_sheets = list(
		SPECIES_HUMAN = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_AKULA = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_ALRAUNE = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_NEVREAN = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_PROTEAN = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_RAPALA = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_SERGAL = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_VASILISSAN = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_VULPKANIN = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_XENOCHIMERA = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_XENOHYBRID = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_ZORREN_FLAT = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_ZORREN_HIGH = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_SKRELL = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_TAJ = 'updates/fluff/ruvorefluff.dmi',
		SPECIES_ZADDAT = 'updates/fluff/ruvorefluff.dmi' // Костыль для спрайтов, пока не найдём решения лучше. WarFoxy
		)
	species_restricted = list(
		SPECIES_HUMAN,
		SPECIES_AKULA,
		SPECIES_ALRAUNE,
		SPECIES_NEVREAN,
		SPECIES_PROTEAN,
		SPECIES_RAPALA,
		SPECIES_SERGAL,
		SPECIES_VASILISSAN,
		SPECIES_VULPKANIN,
		SPECIES_XENOCHIMERA,
		SPECIES_XENOHYBRID,
		SPECIES_ZORREN_FLAT,
		SPECIES_ZORREN_HIGH,
		SPECIES_SKRELL,
		SPECIES_TAJ,
		SPECIES_ZADDAT
		)

/obj/item/clothing/suit/f13
	icon = 'updates/fluff/ruvorefluff.dmi'
	sprite_sheets = list(
		SPECIES_HUMAN = 'updates/fluff/f13suits.dmi',
		SPECIES_AKULA = 'updates/fluff/f13suits.dmi',
		SPECIES_ALRAUNE = 'updates/fluff/f13suits.dmi',
		SPECIES_NEVREAN = 'updates/fluff/f13suits.dmi',
		SPECIES_PROTEAN = 'updates/fluff/f13suits.dmi',
		SPECIES_RAPALA = 'updates/fluff/f13suits.dmi',
		SPECIES_SERGAL = 'updates/fluff/f13suits.dmi',
		SPECIES_VASILISSAN = 'updates/fluff/f13suits.dmi',
		SPECIES_VULPKANIN = 'updates/fluff/f13suits.dmi',
		SPECIES_XENOCHIMERA = 'updates/fluff/f13suits.dmi',
		SPECIES_XENOHYBRID = 'updates/fluff/f13suits.dmi',
		SPECIES_ZORREN_FLAT = 'updates/fluff/f13suits.dmi',
		SPECIES_ZORREN_HIGH = 'updates/fluff/f13suits.dmi',
		SPECIES_SKRELL = 'updates/fluff/f13suits.dmi',
		SPECIES_TAJ = 'updates/fluff/f13suits.dmi',
		SPECIES_ZADDAT = 'updates/fluff/f13suits.dmi' // Костыль для спрайтов, пока не найдём решения лучше. WarFoxy
		)
	species_restricted = list(
		SPECIES_HUMAN,
		SPECIES_AKULA,
		SPECIES_ALRAUNE,
		SPECIES_NEVREAN,
		SPECIES_PROTEAN,
		SPECIES_RAPALA,
		SPECIES_SERGAL,
		SPECIES_VASILISSAN,
		SPECIES_VULPKANIN,
		SPECIES_XENOCHIMERA,
		SPECIES_XENOHYBRID,
		SPECIES_ZORREN_FLAT,
		SPECIES_ZORREN_HIGH,
		SPECIES_SKRELL,
		SPECIES_TAJ,
		SPECIES_ZADDAT
		)

/obj/item/clothing/under/f13/vault113
	name = "Vault 113 jumpsuit"
	desc = "TAKE ME HOME, COUNTRY ROADS"
	icon_state = "f13suit"
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/under/f13/schmidt
	name = "Spring clothing"
	desc = "Old fashion. Cool."
	icon_state = "schmidt"
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/under/f13/andropov
	name = "Russian Mafia suit"
	desc = "Profession? Mafioznik!."
	icon_state = "andropov"
	species_restricted = list(SPECIES_HUMAN)

/obj/item/clothing/under/f13/police
	name = "Retro Police suit"
	desc = "STOP RIGHT HERE, CRIMINAL SCUM!!!."
	icon_state = "police"

/obj/item/weapon/reagent_containers/food/drinks/flask/f13
	name = "Vault 113 flask"
	desc = "You shouldn't see this."
	icon = 'updates/fluff/ruvorefluff.dmi'
	icon_state = "v113"
	volume = 60
	center_of_mass = list("x"=17, "y"=7)

////////////////
///PIPBOY BOI///
////////////////

/obj/item/device/pda/f13
	name = "\improper PipBoy 3000"
	desc = "A portable microcomputer by Vault-Tec. Functionality determined by a preprogrammed ROM cartridge."
	icon = 'updates/fluff/ruvorefluff.dmi'
	default_cartridge = /obj/item/weapon/cartridge/captain
	detonate = 0
	ttone = "bzzz"
	lock_code = "CMC3BFF"

////////////////
///Fluff case///
////////////////

/obj/item/weapon/storage/fancy/f13case
	can_hold = list(
		/obj/item/device/pda/f13,
		/obj/item/clothing/under/f13/vault113,
		/obj/item/weapon/reagent_containers/food/drinks/flask/f13
		)

	starts_with = list(
		/obj/item/device/pda/f13 = 1,
		/obj/item/clothing/under/f13/vault113 = 1,
		/obj/item/weapon/reagent_containers/food/drinks/flask/f13 = 1
	)
	w_class = ITEMSIZE_NORMAL
	storage_slots = 3
	icon = 'updates/fluff/ruvorefluff.dmi'
	name = "Blue Case"
	desc = "Blue case with the logo of Vault-TEC on the cover."
	icon_state = "f13casebox"
	icon_type = "f13case"

////////////////////////
///LOW3 resomi skelet///
////////////////////////

/*obj/item/clothing/suit/f13/exoskeletresomi
	name = "Resomi Exoskelet"
	species_restricted = list(SPECIES_TESHARI)
	icon_state = "rsomiskelet"
	icon_override = 'updates/fluff/ruvorefluff.dmi'
	armor = list(melee = 10, bullet = 5, laser = 5, energy = 5, bomb = 20, bio = 0, rad = 0)
*/
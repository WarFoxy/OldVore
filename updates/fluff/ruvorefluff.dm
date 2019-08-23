///////////////
///FALLOUT13///
///////////////
/obj/item/clothing/under/f13
	icon = 'updates/fluff/ruvorefluff.dmi'
	icon_override = 'updates/fluff/ruvorefluff.dmi'
	species_restricted = list("Human", "Promethean")

/obj/item/clothing/suit/f13
	icon = 'updates/fluff/ruvorefluff.dmi'
	icon_override = 'updates/fluff/ruvorefluff.dmi'
	species_restricted = list("Human", "Promethean")

/obj/item/clothing/under/f13/vault113
	name = "Vault 113 jumpsuit"
	desc = "TAKE ME HOME, COUNTRY ROADS"
	icon_state = "f13suit"

/obj/item/clothing/under/f13/schmidt
	name = "Spring clothing"
	desc = "Old fashion. Cool."
	icon_state = "schmidt"

/obj/item/clothing/under/f13/andropov
	name = "Russian Mafia suit"
	desc = "Profession? Mafioznik!."
	icon_state = "andropov"

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
	icon_state = "regular"
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
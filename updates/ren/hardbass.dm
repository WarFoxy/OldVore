//Renard

/obj/item/clothing/head/squatter
	name = "squatter cap"
	desc = "This is squatter cap. Very Slavic. Very stylish."
	icon = 'updates/ren/squatter.dmi'
	icon_state = "squattercap"
	icon_override = 'updates/ren/squatter_onmob.dmi'
	sprite_sheets = list(
		SPECIES_HUMAN = 'updates/ren/squatter_onmob.dmi')
	species_restricted = list("Human")

/obj/item/clothing/under/squatter
	name = "squatter outfit"
	desc = "This squattersuit is ready for hardbass with squarting low. Slavs know how to make cool & comfy clothes."
	icon = 'updates/ren/squatter.dmi'
	icon_state = "squatteroutfit"
	icon_override = 'updates/ren/squatter_onmob.dmi'
	sprite_sheets = list(
		SPECIES_HUMAN = 'updates/ren/squatter_onmob.dmi')
	species_restricted = list("Human")

/obj/item/clothing/shoes/hitops/squatter
	name = "squatter shoes"
	desc = "This squatter shoes is ready for hardbass and moving fast. Slavs know how to make cool & comfy shoes."
	item_state_slots = list(slot_r_hand_str = "jackboots", slot_l_hand_str = "jackboots")
	icon = 'updates/ren/squatter.dmi'
	icon_state = "squattershoes"
	icon_override = 'updates/ren/squatter_onmob.dmi'
	sprite_sheets = list(
		SPECIES_HUMAN = 'updates/ren/squatter_onmob.dmi')
	species_restricted = list("Human")

//Jobs

/obj/item/clothing/under/rank/medical/paramedic
	name = "paramedic's jumpsuit"
	desc = "It's made of a special fiber that provides minor protection against biohazards and radiation. It has a cross on the chest denoting that the wearer is trained medical personnel."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "paramedic"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 15, rad = 15)

/*

/obj/item/clothing/under/rank/head_of_security/hosformal
	desc = "You never asked for anything that stylish."
	name = "head of security's formal uniform"
	icon = 'updates/ren/clothing.dmi'
	icon_state = "hosformal"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	siemens_coefficient = 0.6
*/


// Остальное

		//Одежда гражданской обороны

/obj/item/clothing/under/metrocop
	name = "armored jumpsuit"
	desc = "Strange jumpsuit, seems have many injecting ports and implants."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "mpfuni"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	siemens_coefficient = 0.6

/obj/item/clothing/head/helmet/metrocop
	name = "armored mask"
	desc = "Strange mask, looks can change voice."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "mpfmask"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	body_parts_covered = HEAD|FACE|EYES
	siemens_coefficient = 0.7

		// Какой-то халат

/obj/item/clothing/suit/storage/toggle/labcoat/aeneas_rinil
	name = "aeneasrinil coat"
	desc = "A labcoat with a few markings denoting it as the labcoat of roboticist."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "aeneasrinil"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

		// Бэтмэн

/obj/item/clothing/under/batmansuit
	name = "batsuit"
	desc = "You are the night."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "bmuniform"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/head/batmanhat
	name = "bathat"
	desc = "You are the night."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "bmhead"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	body_parts_covered = HEAD|EYES

/obj/item/clothing/gloves/batmangloves
	name = "batgloves"
	desc = "You are the night."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "bmgloves"
	icon_override = 'updates/ren/clothing_onmob.dmi'

		// Нази

/obj/item/clothing/under/officeruniform
	name = "officer's uniform"
	desc = "Bestraft die Juden fur ihre Verbrechen."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "officeruniform"
	icon_override = 'updates/ren/clothing_onmob.dmi'

/obj/item/clothing/under/soldieruniform
	name = "soldier's uniform"
	desc = "Bestraft die Verbundeten fur ihren Widerstand."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "soldieruniform"
	icon_override = 'updates/ren/clothing_onmob.dmi'

		// Что-то

/obj/item/clothing/under/roman
	name = "roman armor"
	desc = "An ancient Roman armor. Made of metallic strips and leather straps."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "roman"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	armor = list(melee = 25, bullet = 0, laser = 25, energy = 10, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/shoes/roman
	name = "roman sandals"
	desc = "Sandals with buckled leather straps on it."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "roman_sandals"
	icon_override = 'updates/ren/clothing_onmob.dmi'

		// Барни!

/obj/item/clothing/under/blackmesa
	name = "blue security jumpsuit"
	desc = "Strange jumpsuit, there is no mark of NanoTrasen. Lambda sign at the front"
	icon = 'updates/ren/clothing.dmi'
	icon_state = "blueuni"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	armor = list(melee = 80, bullet = 45, laser = 35 ,energy = 35, bomb = 10, bio = 2, rad = 0)
	siemens_coefficient = 0.6

/obj/item/clothing/head/helmet/blackmesa
	name = "Blue helmet"
	desc = "Just a simple blue helmet."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "bluehelmet"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	armor = list(melee = 70, bullet = 40, laser = 30 ,energy = 30, bomb = 10, bio = 2, rad = 0)
	siemens_coefficient = 0.7

/obj/item/clothing/suit/armor/vest/blackmesa
	name = "blue armor"
	desc = "Blue armor, have a strange symbol on front side - Lambda"
	icon = 'updates/ren/clothing.dmi'
	icon_state = "bluevest"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	body_parts_covered = UPPER_TORSO
	armor = list(melee = 80, bullet = 45, laser = 35 ,energy = 35, bomb = 10, bio = 2, rad = 0)
	siemens_coefficient = 0.7

// Звёздные войны: Война Смоллгеев

/obj/item/clothing/suit/armor/vader
	name = "dark-colored suit"
	desc = "A bulky, heavy-duty piece of black armor. Peace is a lie, there is only passion."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "vader"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	w_class = 4
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/gun/energy, /obj/item/weapon/gun/projectile, /obj/item/ammo_casing, /obj/item/weapon/melee/baton,/obj/item/weapon/handcuffs,/obj/item/weapon/melee/energy/sword/red)
	slowdown = 1.5
	armor = list(melee = 65, bullet = 50, laser = 50, energy = 25, bomb = 50, bio = 100, rad = 50)
	cold_protection = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7

/obj/item/clothing/head/helmet/space/vader
	name = "dark-colored vader"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Through passion, I gain strength.."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "vaderhelm"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	body_parts_covered = HEAD|FACE|EYES
	cold_protection = HEAD|FACE|EYES
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	permeability_coefficient = 0.01
	armor = list(melee = 65, bullet = 50, laser = 50,energy = 25, bomb = 50, bio = 100, rad = 50)

		// Мушкетёр, где остальное я хз

/obj/item/clothing/under/musketeer
	name = "musketeer uniform"
	desc = "It's a uniform worned by russian musketeers in XIX century."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "musketeer_uniform"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

		// Остальная одежда от Llegoman007 с Советской Станции

/obj/item/clothing/under/simonpants
	name = "Simon's Pants"
	desc = "Simon's pants, clad with belt and whatever the fuck that thing is around his neck"
	icon = 'updates/ren/clothing.dmi'
	icon_state = "simonpants"
	icon_override = 'updates/ren/clothing_onmob.dmi'

/obj/item/clothing/under/leeunder
	name = "casual uniform with jacket"
	desc = "Good looking uniform with jacket. You see a label 'Made by Rorschash Ind.'."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "lee_short"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	siemens_coefficient = 0.6

/obj/item/clothing/under/leeunder2
	name = "casual uniform"
	desc = "Good looking uniform. You see a label 'Made by Rorschash Ind.'."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "lee_short2"
	icon_override = 'updates/ren/clothing_onmob.dmi'

/obj/item/clothing/under/ajaxunder
	name = "ajax uniform"
	desc = "Black half-uniform. You see a label 'Made by Rorschash Ind.'."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "ajax_wear"
	icon_override = 'updates/ren/clothing_onmob.dmi'

/obj/item/clothing/suit/leejacket
	name = "Black Jacket"
	desc = "Black Jacket. You see a label 'Made by Rorschash Ind.'."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "leejacket"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	siemens_coefficient = 0.6

/obj/item/clothing/suit/storage/toggle/warvest
	name = "Red Jacket"
	desc = "Red Jacket. You see a label 'Made by Rorschash Ind.'."
	icon = 'updates/ren/clothing.dmi'
	icon_state = "warvest"
	icon_override = 'updates/ren/clothing_onmob.dmi'
	body_parts_covered = UPPER_TORSO

/obj/item/clothing/under/blackpants
	name = "black pants"
	icon = 'updates/ren/clothing.dmi'
	icon_state = "blpants"
	icon_override = 'updates/ren/clothing_onmob.dmi'

/obj/item/clothing/under/redpants
	name = "red pants"
	icon = 'updates/ren/clothing.dmi'
	icon_state = "rpants"
	icon_override = 'updates/ren/clothing_onmob.dmi'

/obj/item/clothing/under/bluepants
	name = "blue pants"
	icon = 'updates/ren/clothing.dmi'
	icon_state = "bpants"
	icon_override = 'updates/ren/clothing_onmob.dmi'

/obj/item/clothing/under/greypants
	name = "grey pants"
	icon = 'updates/ren/clothing.dmi'
	icon_state = "gpants"
	icon_override = 'updates/ren/clothing_onmob.dmi'


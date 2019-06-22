//////////////////
///DS MOBS ruvr///
//////////////////

/mob/living/simple_mob/animal/space/dead_space/necromorph
	name = "Slasher"
	desc = "It looks pretty angry!"
	tt_desc = "Necromorph"
	icon = 'updates/deadspace/deadspace_mob.dmi'
	icon_state = "necro3"
	icon_living = "necro3"
	icon_dead = "necro3_dead"
	movement_cooldown = 5
	shock_resist = 0.5
	taser_kill = FALSE

	faction = "necromorph"

	health = 100
	maxHealth = 100

	response_help = "pets the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"

	harm_intent_damage = 15
	melee_damage_lower = 12
	melee_damage_upper = 15
	attacktext = list("slashed")
	attack_sound = 'sound/weapons/bladeslice.ogg'

	has_langs = list("Dog")

	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat

/datum/say_list/dead_space/necromorph
	say_maybe_target = list("машет левиями")
	emote_hear = list("сипит", "дЄграется")

/mob/living/simple_mob/animal/space/dead_space/necromorph/twitcher
	name = "Twitcher"
	desc = "He looks fast..."
	icon = 'updates/deadspace/deadspace_mob.dmi'
	icon_state = "necro2"
	icon_living = "necro2"
	icon_dead = "necro2_dead"
	tt_desc = "Necromorph Fastus"
	melee_damage_lower = 10
	melee_damage_upper = 15
	movement_cooldown = 0
	health = 75
	maxHealth = 75

/datum/say_list/dead_space/necromorph/twitcher
	emote_hear = list("вздрагивает", "дЄграется", "скребется", "сипит")

/mob/living/simple_mob/animal/space/dead_space/necromorph/oldfag
	name = "Slasher"
	desc = "This one looks very old..."
	icon = 'updates/deadspace/deadspace_mob48x48.dmi'
	icon_state = "slasher"
	icon_living = "slasher"
	icon_dead = "slasher_dead"
	tt_desc = "Necromorph Oldfagus"
	melee_damage_lower = 10
	melee_damage_upper = 16
	health = 140
	maxHealth = 140

/mob/living/simple_mob/animal/space/dead_space/necromorph/brute
	name = "Brute"
	desc = "WHAT THE HELL IS THAT!?"
	icon = 'updates/deadspace/deadspace_mob64x64.dmi'
	icon_state = "brute"
	icon_living = "brute"
	icon_dead = "brute_dead"
	tt_desc = "Necromorph Pisosus"
	attacktext = list("stomped")
	melee_damage_lower = 10
	melee_damage_upper = 35
	movement_cooldown = 5
	health = 250
	maxHealth = 250

/mob/living/simple_mob/vore/aggressive/dead_space/necromorph/puker
	name = "Brute"
	desc = "He is fucking weird!"
	icon = 'updates/deadspace/deadspace_mob.dmi'
	icon_state = "puker"
	icon_living = "puker"
	icon_dead = "puker_dead"
	tt_desc = "Necromorph Toxinus"
	melee_damage_lower = 6
	melee_damage_upper = 10
	movement_cooldown = 2
	health = 95
	maxHealth = 95
	projectiletype = /obj/item/projectile/energy/neurotoxin/toxic
	vore_active = TRUE
	vore_capacity = 2
	vore_pounce_chance = 45
	shock_resist = 0.5
	taser_kill = FALSE
	faction = "necromorph"
	vore_stomach_name = "stomach"
	vore_stomach_flavor = "¬ы попали в крайне стрЄмное место. ¬округ вас полно слизи а кислота с самого вашего прибытия сюда работает над вашим телом. ¬ы видите вокруг полупереваренных жертв этого существа."

/datum/say_list/dead_space/necromorph/puker
	emote_hear = list("вздрагивает", "хлюпает", "булькает", "сипит", "дЄграется")

////////////
///MARKER///
////////////

/obj/structure/deadspace/marker
	name = "Red Marker"
	desc = "¬ы видите монолитную структуру, неизвестного предназначения и происхождения. ќн излучает едва заметные волны энергии."
	icon = 'updates/deadspace/marker.dmi'
	icon_state = "redmarker"
	anchored = 1
	density = 1
	light_range = 4
	plane = MOB_PLANE // You know what, let's play it safe.
	layer = ABOVE_MOB_LAYER
	var/shake_animation_degrees = 1
	light_color = "#F31A1A"
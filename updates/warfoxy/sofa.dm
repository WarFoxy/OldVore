/obj/structure/bed/sofa
	name = "leather sofa"
	desc = "A wide and comfy sofa - no one assistant was ate by it due production! It's made of steel and covered with synthetic leather."
	icon = 'updates/warfoxy/sofa.dmi'
	icon_state = "sofa_right"
	buckle_dir = 0
	buckle_lying = 0

/obj/structure/bed/sofa/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/stack) || W.is_wirecutter())
		return
	if(W.is_screwdriver())
		playsound(src, W.usesound, 100, 1)
		if(anchored)
			user.visible_message("[user] begins unsecuring \the [src] from the floor.", "You start unsecuring \the [src] from the floor.")
		else
			user.visible_message("[user] begins securing \the [src] to the floor.", "You start securing \the [src] to the floor.")

		if(do_after(user, 20 * W.toolspeed))
			if(!src) return
			to_chat(user, "<span class='notice'>You [anchored? "un" : ""]secured \the [src]!</span>")
			anchored = !anchored
		return
	..()

/obj/structure/bed/sofa/verb/rotate_clockwise()
	set name = "Rotate Sofa Clockwise"
	set category = "Object"
	set src in oview(1)

	if(!usr || !isturf(usr.loc))
		return
	if(usr.stat || usr.restrained())
		return
	if(ismouse(usr) || (isobserver(usr) && !config.ghost_interaction))
		return
	if(src.anchored)
		usr << "<span class='notice'>It anchored and won't rotate.</span>"
		return

	src.set_dir(turn(src.dir, 270))

/obj/structure/bed/sofa/left
	icon_state = "sofa_left"

/obj/structure/bed/sofa/New(var/newloc)
	base_icon = icon_state
	..(newloc,"leather")

/obj/structure/bed/sofa/post_buckle_mob()
	update_icon()
	return ..()

/obj/structure/bed/sofa/update_icon()
	overlays.Cut()
	var/image/I = image('updates/warfoxy/sofa.dmi', "[base_icon]_over")
	I.plane = MOB_PLANE + 0.1
	I.layer = MOB_LAYER + 0.1
	overlays |= I
	if(has_buckled_mobs())
		var/image/D = image('updates/warfoxy/sofa.dmi', "[base_icon]_armrest")
		D.plane = MOB_PLANE + 0.1
		D.layer = MOB_LAYER + 0.1
		overlays |= D

/obj/structure/bed/sofa/black
	icon_state = "couchblack_middle"

/obj/structure/bed/sofa/black/left
	icon_state = "couchblack_left"

/obj/structure/bed/sofa/black/right
	icon_state = "couchblack_right"

/obj/structure/bed/sofa/black/corner
	icon_state = "couchblack_corner"

/obj/structure/bed/sofa/beige
	icon_state = "couchbeige_middle"

/obj/structure/bed/sofa/beige/left
	icon_state = "couchbeige_left"

/obj/structure/bed/sofa/beige/right
	icon_state = "couchbeige_right"

/obj/structure/bed/sofa/beige/corner
	icon_state = "couchbeige_corner"

/obj/structure/bed/sofa/brown
	icon_state = "couchbrown_middle"

/obj/structure/bed/sofa/brown/left
	icon_state = "couchbrown_left"

/obj/structure/bed/sofa/brown/right
	icon_state = "couchbrown_right"

/obj/structure/bed/sofa/brown/corner
	icon_state = "couchbrown_corner"

/obj/structure/bed/sofa/teal
	icon_state = "couchteal_middle"

/obj/structure/bed/sofa/teal/left
	icon_state = "couchteal_left"

/obj/structure/bed/sofa/teal/right
	icon_state = "couchteal_right"

/obj/structure/bed/sofa/teal/corner
	icon_state = "couchteal_corner"

/material/leather/generate_recipes()
	..()
	recipes += new/datum/stack_recipe_list("sofas", list( \
		new/datum/stack_recipe("beige sofa left", /obj/structure/bed/sofa/beige/left, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("beige sofa middle", /obj/structure/bed/sofa/beige, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("beige sofa right", /obj/structure/bed/sofa/beige/right, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("beige sofa corner", /obj/structure/bed/sofa/beige/corner, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("black sofa left", /obj/structure/bed/sofa/black/left, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("black sofa middle", /obj/structure/bed/sofa/black, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("black sofa right", /obj/structure/bed/sofa/black/right, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("black sofa corner", /obj/structure/bed/sofa/black/corner, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("brown sofa left", /obj/structure/bed/sofa/brown/left, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("brown sofa middle", /obj/structure/bed/sofa/brown, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("brown sofa right", /obj/structure/bed/sofa/brown/right, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("brown sofa corner", /obj/structure/bed/sofa/brown/corner, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("teal sofa left", /obj/structure/bed/sofa/teal/left, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("teal sofa middle", /obj/structure/bed/sofa/teal, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("teal sofa right", /obj/structure/bed/sofa/teal/right, 2, one_per_turf = 1, on_floor = 1), \
		new/datum/stack_recipe("teal sofa corner", /obj/structure/bed/sofa/teal/corner, 2, one_per_turf = 1, on_floor = 1), \
		))
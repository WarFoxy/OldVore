//Food items that are eaten normally and don't leave anything behind.
/obj/item/weapon/reagent_containers/food/renfood
	name = "snack"
	desc = "slavic"
	icon = 'updates/ren/renfood.dmi'
	icon_state = null
	var/bitesize = 1
	var/bitecount = 0
	var/trash = null
	var/slice_path
	var/slices_num
	var/dried_type = null
	var/dry = 0
	var/survivalfood = FALSE
	var/nutriment_amt = 0
	var/list/nutriment_desc = list("food" = 1)
	center_of_mass = list("x"=16, "y"=16)
	w_class = ITEMSIZE_SMALL
	force = 0

/obj/item/weapon/reagent_containers/food/renfood/Initialize()
	. = ..()
	if(nutriment_amt)
		reagents.add_reagent("nutriment",(nutriment_amt*2),nutriment_desc)

	//Placeholder for effect that trigger on eating that aren't tied to reagents.
/obj/item/weapon/reagent_containers/food/renfood/proc/On_Consume(var/mob/M)
	if(!usr)
		usr = M
	if(!reagents.total_volume)
		M.visible_message("<span class='notice'>[M] finishes eating \the [src].</span>","<span class='notice'>You finish eating \the [src].</span>")
		usr.drop_from_inventory(src)	//so icons update :[

		if(trash)
			if(ispath(trash,/obj/item))
				var/obj/item/TrashItem = new trash(usr)
				usr.put_in_hands(TrashItem)
			else if(istype(trash,/obj/item))
				usr.put_in_hands(trash)
		qdel(src)
	return

/obj/item/weapon/reagent_containers/food/renfood/attack_self(mob/user as mob)
	return

/obj/item/weapon/reagent_containers/food/renfood/attack(mob/M as mob, mob/user as mob, def_zone)
	if(reagents && !reagents.total_volume)
		to_chat(user, "<span class='danger'>None of [src] left!</span>")
		user.drop_from_inventory(src)
		qdel(src)
		return 0

	if(istype(M, /mob/living/carbon))
		//TODO: replace with standard_feed_mob() call.

		var/fullness = M.nutrition + (M.reagents.get_reagent_amount("nutriment") * 25)
		if(M == user)								//If you're eating it yourself
			if(istype(M,/mob/living/carbon/human))
				var/mob/living/carbon/human/H = M
				if(!H.check_has_mouth())
					to_chat(user, "Where do you intend to put \the [src]? You don't have a mouth!")
					return
				var/obj/item/blocked = null
				if(survivalfood)
					blocked = H.check_mouth_coverage_survival()
				else
					blocked = H.check_mouth_coverage()
				if(blocked)
					to_chat(user, "<span class='warning'>\The [blocked] is in the way!</span>")
					return

			user.setClickCooldown(user.get_attack_speed(src)) //puts a limit on how fast people can eat/drink things
			//VOREStation Edit Begin
			if (fullness <= 50)
				to_chat(M, "<span class='danger'>You hungrily chew out a piece of [src] and gobble it!</span>")
			if (fullness > 50 && fullness <= 150)
				to_chat(M, "<span class='notice'>You hungrily begin to eat [src].</span>")
			if (fullness > 150 && fullness <= 350)
				to_chat(M, "<span class='notice'>You take a bite of [src].</span>")
			if (fullness > 350 && fullness <= 550)
				to_chat(M, "<span class='notice'>You unwillingly chew a bit of [src].</span>")
			if (fullness > 550 && fullness <= 650)
				to_chat(M, "<span class='notice'>You swallow some more of the [src], causing your belly to swell out a little.</span>")
			if (fullness > 650 && fullness <= 1000)
				to_chat(M, "<span class='notice'>You stuff yourself with the [src]. Your stomach feels very heavy.</span>")
			if (fullness > 1000 && fullness <= 3000)
				to_chat(M, "<span class='notice'>You gluttonously swallow down the hunk of [src]. You're so gorged, it's hard to stand.</span>")
			if (fullness > 3000 && fullness <= 5500)
				to_chat(M, "<span class='danger'>You force the piece of [src] down your throat. You can feel your stomach getting firm as it reaches its limits.</span>")
			if (fullness > 5500 && fullness <= 6000)
				to_chat(M, "<span class='danger'>You barely glug down the bite of [src], causing undigested food to force into your intestines. You can't take much more of this!</span>")
			if (fullness > 6000) // There has to be a limit eventually.
				to_chat(M, "<span class='danger'>Your stomach blorts and aches, prompting you to stop. You literally cannot force any more of [src] to go down your throat.</span>")
				return 0
			/*if (fullness > (550 * (1 + M.overeatduration / 2000)))	// The more you eat - the more you can eat
				to_chat(M, "<span class='danger'>You cannot force any more of [src] to go down your throat.</span>")
				return 0*/
			//VOREStation Edit End

		else if(user.a_intent == I_HURT)
			return ..()

		else
			if(istype(M,/mob/living/carbon/human))
				var/mob/living/carbon/human/H = M
				if(!H.check_has_mouth())
					to_chat(user, "Where do you intend to put \the [src]? \The [H] doesn't have a mouth!")
					return
				var/obj/item/blocked = null
				var/unconcious = FALSE
				blocked = H.check_mouth_coverage()
				if(survivalfood)
					blocked = H.check_mouth_coverage_survival()
					if(H.stat && H.check_mouth_coverage())
						unconcious = TRUE
						blocked = H.check_mouth_coverage()

				if(unconcious)
					to_chat(user, "<span class='warning'>You can't feed [H] through \the [blocked] while they are unconcious!</span>")
					return

				if(blocked)
					to_chat(user, "<span class='warning'>\The [blocked] is in the way!</span>")
					return

				/*if (fullness <= (550 * (1 + M.overeatduration / 1000))) // Vorestation edit
					user.visible_message("<span class='danger'>[user] attempts to feed [M] [src].</span>")
				else
					user.visible_message("<span class='danger'>[user] cannot force anymore of [src] down [M]'s throat.</span>")
					return 0*/
				user.visible_message("<span class='danger'>[user] attempts to feed [M] [src].</span>") // Vorestation edit

				user.setClickCooldown(user.get_attack_speed(src))
				if(!do_mob(user, M)) return

				//Do we really care about this
				add_attack_logs(user,M,"Fed with [src.name] containing [reagentlist(src)]", admin_notify = FALSE)

				user.visible_message("<span class='danger'>[user] feeds [M] [src].</span>")

			else
				to_chat(user, "This creature does not seem to have a mouth!")
				return

		if(reagents)								//Handle ingestion of the reagent.
			playsound(M.loc,'sound/items/eatfood.ogg', rand(10,50), 1)
			if(reagents.total_volume)
				if(reagents.total_volume > bitesize)
					reagents.trans_to_mob(M, bitesize, CHEM_INGEST)
				else
					reagents.trans_to_mob(M, reagents.total_volume, CHEM_INGEST)
				bitecount++
				On_Consume(M)
			return 1

	return 0

/obj/item/weapon/reagent_containers/food/renfood/examine(mob/user)
	if(!..(user, 1))
		return
	if (bitecount==0)
		return
	else if (bitecount==1)
		to_chat(user, "<font color='blue'>\The [src] was bitten by someone!</font>")
	else if (bitecount<=3)
		to_chat(user, "<font color='blue'>\The [src] was bitten [bitecount] times!</font>")
	else
		to_chat(user, "<font color='blue'>\The [src] was bitten multiple times!</font>")

/obj/item/weapon/reagent_containers/food/renfood/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/storage))
		..() // -> item/attackby()
		return

	// Eating with forks
	if(istype(W,/obj/item/weapon/material/kitchen/utensil))
		var/obj/item/weapon/material/kitchen/utensil/U = W
		if(U.scoop_food)
			if(!U.reagents)
				U.create_reagents(5)

			if (U.reagents.total_volume > 0)
				to_chat(user, "<font color='red'>You already have something on your [U].</font>")
				return

			user.visible_message( \
				"[user] scoops up some [src] with \the [U]!", \
				"<font color='blue'>You scoop up some [src] with \the [U]!</font>" \
			)

			src.bitecount++
			U.overlays.Cut()
			U.loaded = "[src]"
			var/image/I = new(U.icon, "loadedfood")
			I.color = src.filling_color
			U.overlays += I

			reagents.trans_to_obj(U, min(reagents.total_volume,5))

			if (reagents.total_volume <= 0)
				qdel(src)
			return

	if (is_sliceable())
		//these are used to allow hiding edge items in food that is not on a table/tray
		var/can_slice_here = isturf(src.loc) && ((locate(/obj/structure/table) in src.loc) || (locate(/obj/machinery/optable) in src.loc) || (locate(/obj/item/weapon/tray) in src.loc))
		var/hide_item = !has_edge(W) || !can_slice_here

		if (hide_item)
			if (W.w_class >= src.w_class || is_robot_module(W))
				return

			to_chat(user, "<span class='warning'>You slip \the [W] inside \the [src].</span>")
			user.drop_from_inventory(W, src)
			add_fingerprint(user)
			contents += W
			return

		if (has_edge(W))
			if (!can_slice_here)
				to_chat(user, "<span class='warning'>You cannot slice \the [src] here! You need a table or at least a tray to do it.</span>")
				return

			var/slices_lost = 0
			if (W.w_class > 3)
				user.visible_message("<span class='notice'>\The [user] crudely slices \the [src] with [W]!</span>", "<span class='notice'>You crudely slice \the [src] with your [W]!</span>")
				slices_lost = rand(1,min(1,round(slices_num/2)))
			else
				user.visible_message("<span class='notice'>\The [user] slices \the [src]!</span>", "<span class='notice'>You slice \the [src]!</span>")

			var/reagents_per_slice = reagents.total_volume/slices_num
			for(var/i=1 to (slices_num-slices_lost))
				var/obj/slice = new slice_path (src.loc)
				reagents.trans_to_obj(slice, reagents_per_slice)
			qdel(src)
			return

/obj/item/weapon/reagent_containers/food/renfood/proc/is_sliceable()
	return (slices_num && slice_path && slices_num > 0)

/obj/item/weapon/reagent_containers/food/renfood/Destroy()
	if(contents)
		for(var/atom/movable/something in contents)
			something.dropInto(loc)
	. = ..()

////////////////////////////////////////////////////////////////////////////////
/// FOOD END
////////////////////////////////////////////////////////////////////////////////
/obj/item/weapon/reagent_containers/food/renfood/attack_generic(var/mob/living/user)
	if(!isanimal(user) && !isalien(user))
		return
	user.visible_message("<b>[user]</b> nibbles away at \the [src].","You nibble away at \the [src].")
	bitecount++
	if(reagents)
		reagents.trans_to_mob(user, bitesize, CHEM_INGEST)
	spawn(5)
		if(!src && !user.client)
			user.custom_emote(1,"[pick("burps", "cries for more", "burps twice", "looks at the area where the food was")]")
			qdel(src)
	On_Consume(user)

//////////////////////////////////////////////////
////////////////////////////////////////////Snacks
//////////////////////////////////////////////////
//Items in the "Snacks" subcategory are food items that people actually eat. The key points are that they are created
//	already filled with reagents and are destroyed when empty. Additionally, they make a "munching" noise when eaten.

//Notes by Darem: Food in the "snacks" subtype can hold a maximum of 50 units Generally speaking, you don't want to go over 40
//	total for the item because you want to leave space for extra condiments. If you want effect besides healing, add a reagent for
//	it. Try to stick to existing reagents when possible (so if you want a stronger healing effect, just use Tricordrazine). On use
//	effect (such as the old officer eating a donut code) requires a unique reagent (unless you can figure out a better way).

//The nutriment reagent and bitesize variable replace the old heal_amt and amount variables. Each unit of nutriment is equal to
//	2 of the old heal_amt variable. Bitesize is the rate at which the reagents are consumed. So if you have 6 nutriment and a
//	bitesize of 2, then it'll take 3 bites to eat. Unlike the old system, the contained reagents are evenly spread among all
//	the bites. No more contained reagents = no more bites.

//Here is an example of the new formatting for anyone who wants to add more food items.
///obj/item/weapon/reagent_containers/food/snacks/xenoburger			//Identification path for the object.
//	name = "Xenoburger"													//Name that displays in the UI.
//	desc = "Smells caustic. Tastes like heresy."						//Duh
//	icon_state = "xburger"												//Refers to an icon in food.dmi
//	New()																//Don't mess with this.
//		..()															//Same here.
//		reagents.add_reagent("xenomicrobes", 10)						//This is what is in the food item. you may copy/paste
//		reagents.add_reagent("nutriment", 2)							//	this line of code for all the contents.
//		bitesize = 3													//This is the amount each bite consumes.

/obj/item/weapon/reagent_containers/food/renfood/semki_pack
	name = "semki pack"
	icon_state = "semki_pack"
	desc = "Taste like a real Slav-gopnik food. Cyka blyat!"
	trash = /obj/item/trash/semki
	filling_color = "#631212"
	center_of_mass = list("x"=15, "y"=4)
	nutriment_amt = 6
	nutriment_desc = list("a normal cyka blyat food" = 6)
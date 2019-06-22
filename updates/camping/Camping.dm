////////////
///ÏÎÑÓÄÀ///
////////////

/obj/item/weapon/reagent_containers/glass/bucket/camping/cookpot
	desc = "It's a cooking pot."
	name = "Cooking Pot"
	icon = 'updates/camping/camping.dmi'
	icon_state = "cookpot"
	matter = list(DEFAULT_WALL_MATERIAL = 200)
	w_class = ITEMSIZE_NORMAL
	amount_per_transfer_from_this = 20
	possible_transfer_amounts = list(10,20,30,60,120)
	volume = 120
	flags = OPENCONTAINER
	unacidable = 0

/obj/item/weapon/reagent_containers/food/drinks/teapot/camping/coffeepot
	name = "Coffee Pot"
	desc = "An elegant coffee pot. It simply oozes class."
	icon = 'updates/camping/camping.dmi'
	icon_state = "coffeepot"
	item_state = "teapot"
	amount_per_transfer_from_this = 10
	volume = 120
	center_of_mass = list("x"=17, "y"=7)

/////////
///ÈÐÏ///
/////////

/obj/item/weapon/storage/fancy/camping
	can_hold = list(
		/obj/singularity/narsie/large
		)
	w_class = ITEMSIZE_NORMAL
	icon = 'updates/camping/camping.dmi'

/obj/item/weapon/storage/fancy/camping/mre/mre_meat
	name = "MRE Meat package"
	desc = "Package with meat food for one person."
	icon_state = "irpmclosed"
	icon_type = "irpm"
	storage_slots = 5

	starts_with = list(
		/obj/item/weapon/storage/fancy/camping/stakeirp = 1,
		/obj/item/weapon/storage/fancy/camping/chocolateirp = 1,
		/obj/item/weapon/reagent_containers/food/drinks/cans/waterbottle = 1,
		/obj/item/weapon/reagent_containers/food/snacks/candy/proteinbar = 1,
		/obj/item/weapon/storage/fancy/camping/spork = 1
	)

/obj/item/weapon/storage/fancy/camping/mre/mre_sweet
	name = "MRE sweet package"
	desc = "Package with sweet food for one person."
	icon_state = "irpclosed"
	icon_type = "irp"
	storage_slots = 5

	starts_with = list(
		/obj/item/weapon/storage/fancy/camping/crackerirp = 1,
		/obj/item/weapon/storage/fancy/camping/chocolateirp = 1,
		/obj/item/weapon/reagent_containers/food/drinks/cans/waterbottle = 1,
		/obj/item/weapon/storage/fancy/camping/cookieirp = 1,
		/obj/item/weapon/storage/fancy/camping/spork = 1
	)

/obj/item/weapon/storage/fancy/camping/mre/mre_russian
	name = "Russian MRE package"
	desc = "Korobka s edoy na dvuh chelovek. Dlya viezda na prirodu."
	icon_state = "irprussianbox"
	icon_type = "irprussian"
	storage_slots = 4

	starts_with = list(
		/obj/item/weapon/reagent_containers/food/snacks/human/kabob = 1,
		/obj/item/weapon/storage/fancy/camping/crackerirp = 1,
		/obj/item/weapon/reagent_containers/food/drinks/cans/camping/kozel = 1,
		/obj/item/weapon/storage/fancy/camping/spork = 1
	)

/////////////////////
///ÈÐÏ íàïîëíèòåëü///
/////////////////////

/obj/item/weapon/storage/fancy/camping/survivalmatches
	name = "Survival Matches"
	desc = "Matches for survival"
	icon_state = "survmatch"
	icon_type = "survmatch"
	storage_slots = 4
	w_class = ITEMSIZE_TINY
	can_hold = list(/obj/item/weapon/flame/match)
	starts_with = list(/obj/item/weapon/flame/match = 4)

/obj/item/weapon/storage/fancy/camping/survivalmatches/attackby(obj/item/weapon/flame/match/W as obj, mob/user as mob)
	if(istype(W) && !W.lit && !W.burnt)
		W.lit = 1
		W.damtype = "burn"
		W.icon_state = "match_lit"
		START_PROCESSING(SSobj, W)
	W.update_icon()
	return

/obj/item/weapon/storage/fancy/camping/stakeirp
	name = "Medium Pouch"
	desc = "Package with something tasty inside!"
	icon_state = "mediumpouchbox1"
	icon_type = "mediumpouch"
	storage_slots = 1
	w_class = ITEMSIZE_TINY
	can_hold = list(
		/obj/singularity/narsie/large
		)
	starts_with = list(
		/obj/item/weapon/reagent_containers/food/snacks/meatsteak = 1
	)

/obj/item/weapon/storage/fancy/camping/crackerirp
	name = "Cracker package"
	desc = "Package with some tasty cracker inside!"
	icon_state = "crackerbox6"
	icon_type = "cracker"
	storage_slots = 6
	w_class = ITEMSIZE_TINY
	can_hold = list(
		/obj/singularity/narsie/large
		)

	starts_with = list(
		/obj/item/weapon/reagent_containers/food/snacks/cracker = 6
	)

/obj/item/weapon/storage/fancy/camping/cookieirp
	name = "Cookie package"
	desc = "Package with some tasty cookie inside!"
	icon_state = "cookie"
	icon_type = "cookie"
	storage_slots = 2
	w_class = ITEMSIZE_TINY
	can_hold = list(
		/obj/singularity/narsie/large
		)

	starts_with = list(
		/obj/item/weapon/reagent_containers/food/snacks/cookie = 2
	)

/obj/item/weapon/storage/fancy/camping/chocolateirp
	name = "Chocolate package"
	desc = "Package with chocolate inside!"
	icon_state = "chocolate_pack"
	icon_type = "chocolate_pack"
	storage_slots = 1
	w_class = ITEMSIZE_TINY
	can_hold = list(
		/obj/singularity/narsie/large
		)

	starts_with = list(
		/obj/item/weapon/reagent_containers/food/snacks/chocolatebar = 1
	)

/obj/item/weapon/storage/fancy/camping/spork
	name = "Spork package"
	desc = "Package with spork inside!"
	icon_state = "sporkbox1"
	icon_type = "spork"
	storage_slots = 1
	w_class = ITEMSIZE_TINY
	can_hold = list(
		/obj/singularity/narsie/large
		)

	starts_with = list(
		/obj/item/weapon/material/kitchen/utensil/fork/spork = 1
	)

///////////////////////
///ÈÐÏ ñîëü è ïåð÷èê///
///////////////////////

/obj/item/weapon/reagent_containers/food/condiment/small/mre
	amount_per_transfer_from_this = 5
	icon = 'updates/camping/camping.dmi'

/obj/item/weapon/reagent_containers/food/condiment/small/mre/afterattack(obj/O as obj, mob/user as mob, proximity)
	if(!(proximity && O.is_open_container()))
		return
	user << "You poured \the [src] into \the [O]."
	reagents.trans_to(O, reagents.total_volume)
	user.drop_from_inventory(src)
	qdel(src)

/obj/item/weapon/reagent_containers/food/condiment/small/mre/salt
	name = "Salt pack"
	desc = "small pack with label SALT."
	icon_state = "saltpack"

/obj/item/weapon/reagent_containers/food/condiment/small/mre/salt/Initialize()
	. = ..()
	reagents.add_reagent("sodiumchloride", 5)

/obj/item/weapon/reagent_containers/food/condiment/small/mre/pepper
	name = "Pepper pack"
	desc = "small pack with label PEPPER."
	icon_state = "pepperpack"

/obj/item/weapon/reagent_containers/food/condiment/small/mre/pepper/Initialize()
	. = ..()
	reagents.add_reagent("blackpepper", 5)

/obj/item/weapon/reagent_containers/food/condiment/small/mre/sugar
	name = "Sugar pack"
	desc = "small pack with label SUGAR."
	icon_state = "sugarpack"

/obj/item/weapon/reagent_containers/food/condiment/small/mre/sugar/Initialize()
	. = ..()
	reagents.add_reagent("sugar", 5)

/obj/item/weapon/reagent_containers/food/condiment/small/mre/ketchup
	name = "Ketchup pack"
	desc = "small pack with label KETCHUP."
	icon_state = "saucepack"

/obj/item/weapon/reagent_containers/food/condiment/small/mre/ketchup/Initialize()
	. = ..()
	reagents.add_reagent("ketchup", 5)

/obj/item/weapon/reagent_containers/food/condiment/small/mre/semen
	name = "ERP pack"
	desc = "small pack with label SEMEN."
	icon_state = "saltpack"

/obj/item/weapon/reagent_containers/food/condiment/small/mre/semen/Initialize()
	. = ..()
	reagents.add_reagent("semen", 5)

/////////////
///CAMPING///
/////////////

/obj/item/weapon/material/kitchen/utensil/fork/spork
	name = "Spork"
	desc = "Best crossover of universe."
	icon_state = "spork"
	icon = 'updates/camping/camping.dmi'

/obj/item/weapon/storage/fancy/camping/survivalpack
	name = "Survival pack"
	desc = "Package with stuff for camping or surviving on wild."
	icon_state = "survivalnabor"
	icon_type = "survivalnabor"
	storage_slots = 3
	w_class = ITEMSIZE_LARGE
	can_hold = list(
		/obj/item/weapon/storage/fancy/camping/mre/mre_meat,
		/obj/item/weapon/storage/fancy/camping/survivalmatches,
		/obj/item/weapon/storage/fancy/camping/sleepingbagbox
		)

	starts_with = list(
		/obj/item/weapon/storage/fancy/camping/mre/mre_meat = 1,
		/obj/item/weapon/storage/fancy/camping/survivalmatches = 1,
		/obj/item/weapon/storage/fancy/camping/sleepingbagbox = 1
	)

/obj/item/weapon/storage/fancy/camping/sleepingbagbox
	name = "Sleeping bag box"
	desc = "Bag with two sleeping bags."
	storage_slots = 1
	w_class = ITEMSIZE_LARGE
	icon_state = "sleepingbagbox1"
	icon_type = "sleepingbag"
	can_hold = list(/obj/item/camping/sleepingbag)
	starts_with = list(/obj/item/camping/sleepingbag = 1)

/obj/item/weapon/storage/fancy/camping/soup
	name = "Box with soup"
	desc = "Large box with soup inside"
	icon_state = "soupboxfull"
	icon_type = "soup"
	storage_slots = 6
	w_class = ITEMSIZE_LARGE
	can_hold = list(/obj/item/weapon/reagent_containers/food/snacks/camping/mre/stew)
	starts_with = list(/obj/item/weapon/reagent_containers/food/snacks/camping/mre/stew = 6,)

/obj/machinery/cooker/camping/stove
	name = "Camping Stove"
	icon = 'updates/camping/camping.dmi'
	icon_state = "campingstove_open"
	density = 1
	anchored = 0
	use_power = 0
	on_icon = "campingstove_anm_1"
	off_icon = "campingstove_open"
	cook_type = "warmed"
	cook_time = 300
	food_color = "#A34719"
	can_burn_food = 1
	output_options = list("Chebupelya" = /obj/item/weapon/reagent_containers/food/snacks/variable/pocket,
	"Borscht" = /obj/item/weapon/reagent_containers/food/snacks/beetsoup)

/obj/machinery/cooker/camping/stove/braizer
	name = "Brazier"
	desc = "VODKA, SHAHLIKI TIME!"
	icon_state = "mangal"
	on_icon = "mangalfire"
	off_icon = "mangal"
	cook_type = "warmed"
	cook_time = 300
	output_options = list("Shashlik" = /obj/item/weapon/reagent_containers/food/snacks/variable/kebab,
	"Steak" = /obj/item/weapon/reagent_containers/food/snacks/meatsteak)

/obj/item/camping/sleepingbag
	name = "sleeping bag"
	desc = "A folded bag designed for sleeping on the wild."
	icon = 'updates/camping/camping.dmi'
	icon_state = "sleepingbag_folded"
	w_class = ITEMSIZE_SMALL

	attack_self(mob/user)
		var/obj/item/camping/sleepingbag/R = new /obj/structure/closet/body_bag/camping/sleeping(user.loc)
		R.add_fingerprint(user)
		qdel(src)

/obj/structure/closet/body_bag/camping/sleeping
	name = "Sleeping Bag"
	desc = "Warm sleeping bag for one or two person. Comfortable."
	icon = 'updates/camping/camping.dmi'
	icon_state = "sleepingbag_closed"
	icon_closed = "sleepingbag_closed"
	icon_opened = "sleepingbag_open"
	item_path = /obj/item/camping/sleepingbag
	storage_capacity = (MOB_MEDIUM * 2) - 2

///////////
///FOOD!///
///////////

/obj/item/weapon/reagent_containers/food/snacks/camping/mre/stew
	name = "Soup"
	desc = "Mmm, soup in tin can."
	filling_color = "#FC6F28"
	icon = 'updates/camping/camping.dmi'
	icon_state = "stew"
	nutriment_amt = 6
	nutriment_desc = list("beans" = 4)
	trash = /obj/item/trash/stew_trash

/obj/item/weapon/reagent_containers/food/snacks/mre/stew/Initialize()
	. = ..()
	bitesize = 2

////////////
///DRINKS///
////////////

/obj/item/weapon/reagent_containers/food/drinks/cans/camping/kozel
	name = "\improper Kozel beer"
	desc = "MELKOPOPOVETSKY KOZEL."
	icon = 'updates/camping/camping.dmi'
	icon_state = "kozel"
	center_of_mass = list("x"=16, "y"=10)

/obj/item/weapon/reagent_containers/food/drinks/cans/camping/kozel/Initialize()
	. = ..()
	reagents.add_reagent("beer", 35)

///////////
///trash///
///////////

/obj/item/trash/stew_trash
	name = "Tin can"
	desc = "Can without food. How sad."
	icon = 'updates/camping/camping.dmi'
	icon_state = "stew0"

////////////
///chairs///
////////////

/obj/structure/bed/chair/wood/camping/stump
	name = "Stump"
	desc = "Just stump."
	base_icon = "peneksuka"
	icon = 'updates/camping/camping.dmi'
	icon_state = "peneksuka"
	anchored = 1
	color = null

/obj/structure/bed/chair/wood/camping/stump/log1
	name = "Log"
	base_icon = "log1"
	desc = "You can sit on this..."
	icon_state = "log1"

/obj/structure/bed/chair/wood/camping/stump/log2
	name = "Log"
	desc = "You can sit on this..."
	base_icon = "log2"
	icon_state = "log2"

/////////////
///vending///
/////////////

/obj/machinery/vending/camping
	icon = 'updates/camping/camping.dmi'
	name = "Camping vending machine"
	desc = "Everything you need for camping"
	icon_state = "camping_vendor"
	product_ads = "Set up your campsite by yourself!;Very nice!;War? Fear? We must be prepared!"
	products = list(/obj/item/weapon/storage/fancy/camping/soup = 5,/obj/item/weapon/storage/fancy/camping/survivalpack = 5)
	contraband = list(/obj/item/weapon/reagent_containers/food/condiment/small/mre/semen = 5,/obj/item/weapon/storage/fancy/camping/mre/mre_russian = 5)
	idle_power_usage = 211

/obj/machinery/vending/camping/vegan
	icon = 'updates/camping/camping.dmi'
	name = "Vegan MRE vending machine"
	desc = "Stop eating yourself!"
	icon_state = "vegan_vendor"
	product_ads = "Taste our new MRE!;Very nice!;War? Fear? We must be prepared!"
	products = list(/obj/item/weapon/storage/fancy/camping/mre/mre_vegan1 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_vegan2 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_vegan3 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_vegan4 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_vegan5 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_vegan6 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_vegan7 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_vegan8 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_vegan9 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_vegan10 = 2)
	contraband = list(/obj/item/weapon/storage/fancy/camping/mre/mre_russian = 5)
	idle_power_usage = 211

/obj/machinery/vending/camping/meat
	icon = 'updates/camping/camping.dmi'
	name = "Meat MRE vending machine"
	desc = "Meat force!"
	icon_state = "meat_vendor"
	product_ads = "Taste our new MRE!;Very nice!;War? Fear? We must be prepared!"
	products = list(/obj/item/weapon/storage/fancy/camping/mre/mre_meat = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_meat2 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_meat3 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_meat4 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_meat5 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_meat6 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_meat7 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_meat8 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_meat9 = 2,/obj/item/weapon/storage/fancy/camping/mre/mre_meat10 = 2)
	contraband = list(/obj/item/weapon/storage/fancy/camping/mre/mre_russian = 5)
	idle_power_usage = 211
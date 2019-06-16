/datum/gear/general/cup //RU Vorestation edit: I fucking stole those from bay =^)
	display_name = "coffee cup selection"
	path = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup

/datum/gear/general/cup/New()
	..()
	var/list/cups = list()
	cups["coffee cup"] = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup
	cups["black coffee cup"] = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/black
	cups["green coffee cup"] = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/green
	cups["heart coffee cup"] = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/heart
	cups["/improper NT coffee cup"] = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/NT
	cups["#1 coffee cup"] = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/one
	cups["rainbow coffee cup"] = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/rainbow
	cups["metal coffee cup"] = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/metal
	cups["pawn coffee cup"] = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/pawn
	cups["diona nymph coffee cup"] = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/diona
	cups["british coffee cup"] = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/britcup
	cups["tall coffee cup"] = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/tall
	cups["teacup"] = /obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/teacup
	gear_tweaks += new/datum/gear_tweak/path(cups)
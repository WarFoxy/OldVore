/obj/item/weapon/reagent_containers/food/drinks/shaker //RU Vorestation edit: Moved to separate file from drinks.dm in same folder
	name = "shaker"
	desc = "A three piece Cobbler-style shaker. Used to mix, cool, and strain drinks." //RU Vorestation edit: Stole desc from bay
	icon_state = "shaker"
	amount_per_transfer_from_this = 10
	volume = 120
	possible_transfer_amounts = list(5,10,15,25,30,60) //RU Vorestation edit: Fucking finally added
	center_of_mass = list("x"=17, "y"=10)
	flags = NOREACT | OPENCONTAINER

/obj/item/weapon/reagent_containers/food/drinks/shaker/attack_self(mob/user as mob)
	if(user.a_intent == I_HELP)
		user.visible_message("<span class='rose'>[user] встряхивает шейкер.</span>")
		mix()
		return
	if(user.a_intent == I_GRAB)
		user.visible_message("<span class='rose'>[user] подбрасывает шейкер в воздух. Вау!</span>")
		mix()
		return
	if(user.a_intent == I_DISARM)
		user.visible_message("<span class='rose'>[user] ловко встряхивает шейкер одной рукой. Ого!</span>")
		mix()
		return
	if(user.a_intent == I_HURT)
		user.visible_message("<span class='rose'>[user] хорошенько взбалтывает содержимое шейкера.</span>")
		mix()
		return

/obj/item/weapon/reagent_containers/food/drinks/shaker/proc/mix()
	if(reagents && reagents.total_volume)
		flags &= ~NOREACT
		reagents.handle_reactions()
		addtimer(CALLBACK(src, .proc/stop_react), SSchemistry.wait)

/obj/item/weapon/reagent_containers/food/drinks/shaker/proc/stop_react()
	flags |= NOREACT

/obj/item/weapon/reagent_containers/food/drinks/shaker/on_reagent_change()
	..()
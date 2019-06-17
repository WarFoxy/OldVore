/obj/item/weapon/reagent_containers/food/drinks/glass2/square
	name = "half-pint glass"
	base_name = "glass"
	base_icon = "square"
	desc = "Your standard drinking glass."
	filling_states = list(20, 40, 60, 80, 100)
	volume = 30
	possible_transfer_amounts = list(5,10,15,30)
	rim_pos = list(23,13,20) // y, x0, x1
	matter = list("glass" = 60)

/obj/item/weapon/reagent_containers/food/drinks/glass2/rocks
	name = "rocks glass"
	desc = "A robust tumbler with a thick, weighted bottom." //RU Vorestation edit: stole desc from bay
	base_name = "glass"
	base_icon = "rocks"
	filling_states = list(25, 50, 75, 100)
	volume = 20
	possible_transfer_amounts = list(5,10,20)
	rim_pos = list(21, 10, 23)
	matter = list("glass" = 40)

/obj/item/weapon/reagent_containers/food/drinks/glass2/shake
	name = "sherry glass" //RU Vorestation edit: milkshake glass => sherry glass
	desc = "Stemware with an untapered conical bowl." //RU Vorestation edit: stole desc from bay
	base_name = "glass"
	base_icon = "shake"
	filling_states = list(25, 50, 75, 100)
	volume = 30
	possible_transfer_amounts = list(5,10,15,30)
	rim_pos = list(25, 13, 21)
	matter = list("glass" = 30)

/obj/item/weapon/reagent_containers/food/drinks/glass2/cocktail
	name = "cocktail glass"
	desc = "Fragile stemware with a stout conical bowl. Don't spill." //RU Vorestation edit: stole desc from bay
	base_name = "glass"
	base_icon = "cocktail"
	filling_states = list(33, 66, 100)
	volume = 15
	possible_transfer_amounts = list(5,10,15)
	rim_pos = list(22, 13, 21)
	matter = list("glass" = 30)

/obj/item/weapon/reagent_containers/food/drinks/glass2/shot
	name = "shot glass"
	desc = "A small glass, designed so that its contents can be consumed in one gulp." //RU Vorestation edit: stole desc from bay
	base_name = "shot"
	base_icon = "shot"
	filling_states = list(33, 66, 100)
	volume = 5
	possible_transfer_amounts = list(1,2,5)
	rim_pos = list(17, 13, 21)
	matter = list("glass" = 10)

/obj/item/weapon/reagent_containers/food/drinks/glass2/pint
	name = "pint glass"
	base_name = "pint"
	base_icon = "pint"
	filling_states = list(16, 33, 50, 66, 83, 100)
	volume = 60
	possible_transfer_amounts = list(5,10,15,30,60)
	rim_pos = list(25, 12, 21)
	matter = list("glass" = 120)

/obj/item/weapon/reagent_containers/food/drinks/glass2/mug
	name = "glass mug"
	desc = "A heavy mug with thick walls." //RU Vorestation edit: stole desc from bay
	base_name = "mug"
	base_icon = "mug"
	filling_states = list(25, 50, 75, 100)
	volume = 40
	possible_transfer_amounts = list(5,10,20,40)
	rim_pos = list(22, 12, 20)
	matter = list("glass" = 80)

/obj/item/weapon/reagent_containers/food/drinks/glass2/wine
	name = "wine glass"
	desc = "A piece of elegant stemware." //RU Vorestation edit: stole desc from bay
	base_name = "glass"
	base_icon = "wine"
	filling_states = list(20, 40, 60, 80, 100)
	volume = 25
	possible_transfer_amounts = list(5, 10, 15, 25)
	rim_pos = list(25, 12, 21)
	matter = list("glass" = 50)

//RU Vorestation edit: stole all those below from bay, adapted them to our code
/obj/item/weapon/reagent_containers/food/drinks/glass2/carafe
	name = "carafe"
	desc = "A handled glass carafe."
	base_name = "carafe"
	base_icon = "carafe"
	filling_states = list(10,20,30,40,50,60,70,80,90,100)
	volume = 120
	possible_transfer_amounts = list(5,10,15,30,60,120)
	rim_pos = list(26, 12, 21)
	center_of_mass = list("x"=16, "y"=7)
	matter = list("glass" = 150)

/obj/item/weapon/reagent_containers/food/drinks/glass2/pitcher
	name = "insulated pitcher"
	desc = "A stainless steel insulated pitcher. Everyone's best friend in the morning."
	base_name = "pitcher"
	base_icon = "pitcher"
	filling_states = list(15,30,50,70,85,100)
	volume = 120
	possible_transfer_amounts = list(5,10,15,30,60,120)
	rim_pos = null
	center_of_mass = list("x"=16, "y"=9)

/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup
	name = "coffee cup"
	desc = "A plain white coffee cup."
	volume = 30
	center_of_mass = list("x"=15, "y"=13)
	filling_states = list(40,80,100)
	possible_transfer_amounts = list(5,10,15,30)
	base_name = "cup"
	base_icon = "coffeecup"
	rim_pos = list(22, 12, 20)
	filling_overlayed = TRUE

/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/black
	name = "black coffee cup"
	desc = "A sleek black coffee cup."
	base_name = "black cup"
	base_icon = "coffeecup_black"

/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/green
	name = "green coffee cup"
	desc = "A pale green and pink coffee cup."
	base_name = "green cup"
	base_icon = "coffeecup_green"

/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/heart
	name = "heart coffee cup"
	desc = "A white coffee cup, it prominently features a red heart."
	base_name = "heart cup"
	base_icon = "coffeecup_heart"

/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/NT
	name = "\improper NT coffee cup"
	desc = "A red NanoTrasen coffee cup."
	base_name = "\improper NT cup"
	base_icon = "coffeecup_NT"

/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/one
	name = "#1 coffee cup"
	desc = "A white coffee cup, prominently featuring a #1."
	base_name = "#1 cup"
	base_icon = "coffeecup_one"

/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/rainbow
	name = "rainbow coffee cup"
	desc = "A rainbow coffee cup. The colors are almost as blinding as a welder."
	base_name = "rainbow cup"
	base_icon = "coffeecup_rainbow"

/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/metal
	name = "metal coffee cup"
	desc = "A metal coffee cup. You're not sure which metal."
	base_name = "metal cup"
	base_icon = "coffeecup_metal"

/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/pawn
	name = "pawn coffee cup"
	desc = "A black coffee cup adorned with the image of a red chess pawn."
	base_name = "pawn cup"
	base_icon = "coffeecup_pawn"

/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/diona
	name = "diona nymph coffee cup"
	desc = "A green coffee cup featuring the image of a diona nymph."
	base_name = "diona cup"
	base_icon = "coffeecup_diona"

/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/britcup
	name = "british coffee cup"
	desc = "A coffee cup with the British flag emblazoned on it."
	base_name = "british cup"
	base_icon = "coffeecup_brit"

/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/tall
	name = "tall coffee cup"
	desc = "An unreasonably tall coffee cup, for when you really need to wake up in the morning."
	icon_state = "coffeecup_tall"
	volume = 60
	center_of_mass = list("x"=15, "y"=19)
	filling_states = list(50,70,90,100)
	base_name = "tall cup"
	base_icon = "coffeecup_tall"

/obj/item/weapon/reagent_containers/food/drinks/glass2/coffeecup/teacup
	name = "teacup"
	desc = "A plain white porcelain teacup."
	volume = 20
	center_of_mass = list("x"=15, "y"=13)
	filling_states = list(100)
	base_name = "teacup"
	base_icon = "teacup"
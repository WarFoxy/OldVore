/obj/effect/decal/cleanable/cum
	name = "cum"
	desc = "It's pie cream from a cream pie. Or not..."
	density = 0
	layer = 2
	icon = 'honk/icons/effects/cum.dmi'
	blood_DNA = list()
	anchored = 1
	random_icon_states = list("cum1", "cum3", "cum4", "cum5", "cum6", "cum7", "cum8", "cum9", "cum10", "cum11", "cum12")

/obj/effect/decal/cleanable/f_lube
	name = "lube"
	desc = "Is it Space Lube?"
	density = 0
	layer = 2
	icon = 'honk/icons/effects/lube.dmi'
	anchored = 1
	var/amount = 5
	random_icon_states = list("mgibbl1", "mgibbl2", "mgibbl3", "mgibbl4", "mgibbl5", "mfloor1", "mfloor2", "mfloor3", "mfloor4", "mfloor5", "mfloor6", "mfloor7")

/obj/effect/decal/cleanable/f_lube/splatter
	random_icon_states = list("mgibbl1", "mgibbl2", "mgibbl3", "mgibbl4", "mgibbl5", "mfloor1", "mfloor2", "mfloor3", "mfloor4", "mfloor5", "mfloor6", "mfloor7")
	amount = 2

/obj/effect/decal/cleanable/f_lube/drip
	name = "drips of female lube"
	desc = "It's transparent."
	gender = PLURAL
	icon = 'honk/icons/effects/l_drip.dmi'
	icon_state = "1"
	random_icon_states = list("1","2","3","4","5")
	amount = 0
	var/list/drips = list()

/obj/effect/decal/cleanable/f_lube/drip/New()
	..()
	drips |= icon_state